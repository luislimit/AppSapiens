package com.mdsql.ui.listener;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.swing.AbstractButton;

import org.apache.commons.collections.CollectionUtils;

import com.mdsql.bussiness.entities.InputDescartarScript;
import com.mdsql.bussiness.entities.OutputDescartarScript;
import com.mdsql.bussiness.entities.Proceso;
import com.mdsql.bussiness.entities.Script;
import com.mdsql.bussiness.entities.Session;
import com.mdsql.bussiness.service.ScriptService;
import com.mdsql.ui.PantallaAjustarLogEjecucion;
import com.mdsql.ui.PantallaDescartarScript;
import com.mdsql.ui.utils.ListenerSupport;
import com.mdsql.ui.utils.MDSQLUIHelper;
import com.mdsql.utils.MDSQLAppHelper;
import com.mdsql.utils.MDSQLConstants;
import com.mdval.exceptions.ServiceException;

public class PantallaDescartarScriptListener extends ListenerSupport implements ActionListener {

	private PantallaDescartarScript pantallaDescartarScript;

	private File archivo;

	private File archivoReparacion;

	public PantallaDescartarScriptListener(PantallaDescartarScript pantallaDescartarScript) {
		this.pantallaDescartarScript = pantallaDescartarScript;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		AbstractButton jButton = (AbstractButton) e.getSource();

		if (MDSQLConstants.PANTALLA_DESCARTAR_SCRIPT_BTN_ABRIR_PROCESAR.equals(jButton.getActionCommand())) {
			abrirScriptProcesar();
		}

		if (MDSQLConstants.PANTALLA_DESCARTAR_SCRIPT_BTN_ABRIR_PARCHE.equals(jButton.getActionCommand())) {
			abrirScriptParche();
		}

		if (MDSQLConstants.PANTALLA_DESCARTAR_SCRIPT_BTN_ACEPTAR.equals(jButton.getActionCommand())) {
			aceptar();
		}

		if (MDSQLConstants.PANTALLA_DESCARTAR_SCRIPT_BTN_CANCELAR.equals(jButton.getActionCommand())) {
			pantallaDescartarScript.dispose();
			
		}

		if (MDSQLConstants.PANTALLA_DESCARTAR_SCRIPT_RBTN_REDUCIR.equals(jButton.getActionCommand())) {
			enableLoadParche(Boolean.FALSE);
		}

		if (MDSQLConstants.PANTALLA_DESCARTAR_SCRIPT_RBTN_AMPLIAR.equals(jButton.getActionCommand())) {
			enableLoadParche(Boolean.TRUE);
		}

	}

	private void abrirScriptParche() {
		Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
		String rutaInicial = session.getSelectedRoute();
		
		archivoReparacion = MDSQLUIHelper.abrirScript(rutaInicial, pantallaDescartarScript.getTxtScriptParche(),
				pantallaDescartarScript.getFrameParent());
	}

	private void abrirScriptProcesar() {
		Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
		String rutaInicial = session.getSelectedRoute();
		
		archivo = MDSQLUIHelper.abrirScript(rutaInicial, pantallaDescartarScript.getTxtScriptProcesar(),
				pantallaDescartarScript.getFrameParent());
	}

	/**
	 * @param value
	 */
	private void enableLoadParche(Boolean value) {
		pantallaDescartarScript.getBtnAbrirScriptParche().setEnabled(value);
		pantallaDescartarScript.getTxtScriptParche().setEnabled(value);
	}

	/**
	 * 
	 */
	private void aceptar() {
		try {
			Map<String, Object> params = new HashMap<>();
			
			Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
			Proceso proceso = session.getProceso();
			
			params.put("proceso", proceso);
			Script script = (Script) pantallaDescartarScript.getParams().get("script");
			params.put("script", script);
			params.put("consulta", Boolean.FALSE);

			PantallaAjustarLogEjecucion pantallaAjustarLogEjecucion = (PantallaAjustarLogEjecucion) MDSQLUIHelper
					.createDialog(pantallaDescartarScript.getFrameParent(), MDSQLConstants.CMD_AJUSTAR_LOG_EJECUCION, params);
			MDSQLUIHelper.show(pantallaAjustarLogEjecucion);
			
			ScriptService scriptService = (ScriptService) getService(MDSQLConstants.SCRIPT_SERVICE);

			String comentario = pantallaDescartarScript.getTxtComentario().getText();
			InputDescartarScript inputDescartarScript = createInputDescartarScript(session, proceso, script, comentario);
			OutputDescartarScript outputDescartarScript = scriptService.descartarScript(inputDescartarScript);
			
			saveScriptsNew(outputDescartarScript);
			
			// Iniciar la ejecución del parche (si lo hay)
			if (!Objects.isNull(archivoReparacion)) {
				saveScriptsParches(outputDescartarScript);
			}
			else {
				if ("Ejecutado".equals(proceso.getDescripcionEstadoProceso())) {
					pantallaDescartarScript.getReturnParams().put("estado", proceso.getDescripcionEstadoProceso());
				}
				
				pantallaDescartarScript.dispose();
			}

		} catch (ServiceException e) {
			Map<String, Object> params = MDSQLUIHelper.buildError(e);
			MDSQLUIHelper.showPopup(pantallaDescartarScript.getFrameParent(), MDSQLConstants.CMD_ERROR, params);
		}
	}

	private void saveScriptsParches(OutputDescartarScript outputDescartarScript) throws ServiceException {
		List<Script> parches = outputDescartarScript.getListaParches();
		if (CollectionUtils.isNotEmpty(parches)) {
			for (Script scr : parches) {
				saveScript(scr);
			}
		}
	}

	private void saveScriptsNew(OutputDescartarScript outputDescartarScript) throws ServiceException {
		List<Script> scriptsNew = outputDescartarScript.getListaScriptNew();
		if (CollectionUtils.isNotEmpty(scriptsNew)) {
			for (Script scr : scriptsNew) {
				saveScript(scr);
			}
		}
	}

	private InputDescartarScript createInputDescartarScript(Session session, Proceso proceso, Script script, String txtComentario) {
		InputDescartarScript inputDescartarScript = new InputDescartarScript();
		
		inputDescartarScript.setNombreScript(archivo.getName());
		inputDescartarScript.setScript(script.getLineasScript());
		inputDescartarScript.setIdProceso(proceso.getIdProceso());
		inputDescartarScript.setCodigoUsuario(session.getCodUsr());
		inputDescartarScript.setTxtComentario(txtComentario);
		
		return inputDescartarScript;
	}
	
	private void saveScript(Script scr) throws ServiceException {
		try {
			Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
			String selectedRoute = session.getSelectedRoute();
			String ruta = selectedRoute.concat(File.separator);
			
			MDSQLAppHelper.dumpLinesToFile(scr.getLineasScript(), Paths.get(ruta.concat(scr.getNombreScript())).toFile());
		} catch (IOException e) {
			throw new ServiceException(e);
		}
	}
}
