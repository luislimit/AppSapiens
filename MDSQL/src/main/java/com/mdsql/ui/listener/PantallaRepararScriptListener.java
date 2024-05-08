package com.mdsql.ui.listener;


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.AbstractButton;
import javax.swing.JOptionPane;

import com.mdsql.bussiness.entities.InputReparaScript;
import com.mdsql.bussiness.entities.Modelo;
import com.mdsql.bussiness.entities.OutputReparaScript;
import com.mdsql.bussiness.entities.Proceso;
import com.mdsql.bussiness.entities.Script;
import com.mdsql.bussiness.entities.Session;
import com.mdsql.bussiness.entities.TextoLinea;
import com.mdsql.bussiness.service.ScriptService;
import com.mdsql.ui.PantallaRepararScript;
import com.mdsql.ui.PantallaSeleccionHistorico;
import com.mdsql.ui.utils.ListenerSupport;
import com.mdsql.ui.utils.MDSQLUIHelper;
import com.mdsql.utils.MDSQLAppHelper;
import com.mdsql.utils.MDSQLConstants;
import com.mdval.exceptions.ServiceException;
import com.mdval.ui.utils.UIHelper;
import com.mdval.utils.AppHelper;

public class PantallaRepararScriptListener extends ListenerSupport implements ActionListener {

	private PantallaRepararScript pantallaRepararScript;
	
	private File archivoReprocesado;
	
	private File archivoReparacion;
	
	public PantallaRepararScriptListener(PantallaRepararScript pantallaRepararScript) {
		super();
		this.pantallaRepararScript = pantallaRepararScript;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		AbstractButton jButton = (AbstractButton) e.getSource();
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_BTN_ACEPTAR.equals(jButton.getActionCommand())) {
			aceptar();
		}
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_BTN_CANCELAR.equals(jButton.getActionCommand())) {
			pantallaRepararScript.dispose();
		}
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_RBTN_REPROCESAR_SCRIPT.equals(jButton.getActionCommand())) {
			enablePreprocesarScript(Boolean.TRUE);
		}
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_RBTN_NO_REPROCESAR_SCRIPT.equals(jButton.getActionCommand())) {
			enablePreprocesarScript(Boolean.FALSE);
		}
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_RBTN_SCRIPT_PROCESADO.equals(jButton.getActionCommand())) {
			enableScriptReparacion(Boolean.FALSE);
		}
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_RBTN_SCRIPT_REPARACION.equals(jButton.getActionCommand())) {
			enableScriptReparacion(Boolean.TRUE);
		}
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_BTN_ABRIR_FICHERO.equals(jButton.getActionCommand())) {
			abrirScript();
		}
		
		if (MDSQLConstants.PANTALLA_REPARAR_SCRIPT_BTN_ABRIR_FICHERO_REPARACION.equals(jButton.getActionCommand())) {
			abrirScriptReparacion();
		}
	}

	/**
	 * 
	 */
	private void abrirScript() {
		Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
		String rutaInicial = session.getSelectedRoute();
	
		archivoReprocesado = MDSQLUIHelper.abrirScript(rutaInicial, pantallaRepararScript.getTxtScript(),
				pantallaRepararScript.getFrameParent());	
	}
	
	/**
	 * 
	 */
	private void abrirScriptReparacion() {
		Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
		String rutaInicial = session.getSelectedRoute();
	
		archivoReparacion = MDSQLUIHelper.abrirScript(rutaInicial, pantallaRepararScript.getTxtScriptReparacion(),
				pantallaRepararScript.getFrameParent());		
	}

	/**
	 * @param value
	 */
	private void enableScriptReparacion(Boolean value) {
		pantallaRepararScript.getBtnAbrirFicheroReparacion().setEnabled(value);
		pantallaRepararScript.getTxtScriptReparacion().setEnabled(value);
	}

	/**
	 * @param value
	 */
	private void enablePreprocesarScript(Boolean value) {
		pantallaRepararScript.getBtnAbrirFichero().setEnabled(value);
		pantallaRepararScript.getTxtScript().setEnabled(value);
	}

	/**
	 * 
	 */
	private void aceptar() {
		try {
			Integer response = UIHelper.showConfirm(literales.getLiteral("confirmacion.mensaje"),
					literales.getLiteral("confirmacion.titulo"));

			if (response == JOptionPane.YES_OPTION) {
			
				Proceso proceso = (Proceso) pantallaRepararScript.getParams().get("proceso");
				Modelo modelo = proceso.getModelo();
				
				Script script = (Script) pantallaRepararScript.getParams().get("script");
				
				// El modelo tiene histórico
				String tieneHistorico = modelo.getMcaHis();
				if (MDSQLConstants.S.equals(tieneHistorico)) {
					Map<String, Object> params = new HashMap<>();
					params.put("codigoProyecto", modelo.getCodigoProyecto());
					
					// Obtiene las líneas del script y se las pasa al selector de histórico en un parámetro
					params.put("script", script.getLineasScript());
					
					PantallaSeleccionHistorico pantallaSeleccionHistorico = (PantallaSeleccionHistorico) MDSQLUIHelper.createDialog(pantallaRepararScript.getFrameParent(),
							MDSQLConstants.CMD_SELECCION_HISTORICO, params);
					MDSQLUIHelper.show(pantallaSeleccionHistorico);
					
					Boolean continuarProcesado = (Boolean) pantallaSeleccionHistorico.getReturnParams().get("procesado");
					if (continuarProcesado) {
						repararScript(proceso, script);
					}
					else {
						JOptionPane.showMessageDialog(pantallaRepararScript.getFrameParent(), "Operación cancelada");
					}
				}
				else {
					repararScript(proceso, script);
				}
			}

		} catch (ServiceException e) {
			Map<String, Object> params = MDSQLUIHelper.buildError(e);
			MDSQLUIHelper.showPopup(pantallaRepararScript.getFrameParent(), MDSQLConstants.CMD_ERROR, params);
		}
	}

	/**
	 * @param proceso 
	 * @param script 
	 * @throws ServiceException
	 */
	private void repararScript(Proceso proceso, Script script) throws ServiceException {
		ScriptService scriptService = (ScriptService) getService(MDSQLConstants.SCRIPT_SERVICE);
		
		Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
		String codigoUsuario = session.getCodUsr();
		
		InputReparaScript inputReparaScript = new InputReparaScript();
		inputReparaScript.setNumeroOrden(script.getNumeroOrden());
		inputReparaScript.setIdProceso(proceso.getIdProceso());
		inputReparaScript.setCodigoUsuario(codigoUsuario);
		
		String nombreBBDD = proceso.getModelo().getNombreBbdd();
		inputReparaScript.setNombreBBDD(nombreBBDD);
		String nombreEsquema = proceso.getModelo().getNombreEsquema();
		inputReparaScript.setNombreEsquema(nombreEsquema);
		String mcaHis = proceso.getModelo().getMcaHis();
		inputReparaScript.setPMcaHis(mcaHis);
		
		Boolean reprocesa = pantallaRepararScript.getRbtnReprocesar().isSelected();
		if (reprocesa) {
			String mcaReprocesa = AppHelper.normalizeValueToCheck(reprocesa);
			inputReparaScript.setMcaReprocesa(mcaReprocesa);	
			
			// Leer el script y pasarlo a líneas
			List<TextoLinea> lineasScriptReprocesar = MDSQLUIHelper.toTextoLineas(archivoReprocesado, MDSQLConstants.DEFAULT_CHARSET);
			inputReparaScript.setScriptNew(lineasScriptReprocesar);
		}
		else { // Se ha seleccionado script de reparación
			
		}
		
		Boolean mismoScript = pantallaRepararScript.getRbtnEjecutarScriptProcesado().isSelected();
		if (mismoScript) {
			String mcaMismoScript = AppHelper.normalizeValueToCheck(mismoScript);
			inputReparaScript.setMcaMismoScript(mcaMismoScript);
		}
		else {
			
		}
		
		String txtComentario = pantallaRepararScript.getJTextArea1().getText();
		inputReparaScript.setTxtComentario(txtComentario);
		
		OutputReparaScript repararScript = scriptService.repararScript(inputReparaScript);
		
		if (reprocesa) {
			renombrarFicheros(repararScript);
			
			List<Script> scripts = repararScript.getListaScript();
			pantallaRepararScript.getReturnParams().put("scripts", scripts);
			pantallaRepararScript.dispose();
		}
		else { // Se ha seleccionado script de reparación
			
		}
	}

	/**
	 * @param repararScript
	 */
	private void renombrarFicheros(OutputReparaScript repararScript) {
		// TODO Preguntar a Mario donde vienen los nuevos nombres
		
	}

}
