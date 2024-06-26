package com.mdval.ui.listener;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JButton;

import com.mdval.bussiness.entities.TipoParticula;
import com.mdval.bussiness.entities.ValorParticula;
import com.mdval.bussiness.service.TipoParticulaService;
import com.mdval.bussiness.service.ValorParticulaService;
import com.mdval.ui.model.DefinicionTiposParticulaTableModel;
import com.mdval.ui.model.ValoresParticulaTableModel;
import com.mdval.ui.normasnomenclatura.FrmValoresParticulas;
import com.mdval.ui.utils.ListenerSupport;
import com.mdval.ui.utils.observer.Observable;
import com.mdval.ui.utils.observer.Observer;
import com.mdval.utils.AppHelper;
import com.mdval.utils.MDValConstants;

/**
 * @author federico
 *
 */
public class FrmValoresParticulasListener extends ListenerSupport implements ActionListener, Observer {

	private FrmValoresParticulas frmValoresParticulas;

	public FrmValoresParticulasListener(FrmValoresParticulas frmValoresParticulas) {
		super();
		this.frmValoresParticulas = frmValoresParticulas;
	}

	/**
	 *
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		JButton jButton = (JButton) e.getSource();

		if (MDValConstants.FRM_VALORES_PARTICULAS_BTN_BUSCAR.equals(jButton.getActionCommand())) {
			eventBtnBuscar();
		}

		if (MDValConstants.FRM_VALORES_PARTICULAS_BTN_ALTA.equals(jButton.getActionCommand())) {
			eventBtnAlta();
		}

		if (MDValConstants.FRM_VALORES_PARTICULAS_BTN_MODIFICACION.equals(jButton.getActionCommand())) {
			eventBtnModificacion();
		}
	}

	/**
	 * 
	 */
	private void eventBtnBuscar() {
		try {
			String sCodigoParticula = frmValoresParticulas.getTxtCodigo().getText();
			BigDecimal codigoParticula = AppHelper.toBigDecimal(sCodigoParticula, literales.getLiteral("codigoParticula.error"));
			
			String descripcionParticula = frmValoresParticulas.getTxtDescripcion().getText();
			
			String mcaProyecto = AppHelper
					.normalizeCmbSiNoValue((String) frmValoresParticulas.getCmbProyecto().getSelectedItem());
			
			String mcaSubproyecto = AppHelper
					.normalizeCmbSiNoValue((String) frmValoresParticulas.getCmbSubproyecto().getSelectedItem());

			List<TipoParticula> tiposParticula = buscar(codigoParticula, descripcionParticula, mcaProyecto,
					mcaSubproyecto);
			populateModel(tiposParticula);
		} catch (Exception e) {
			Map<String, Object> params = buildError(e);
			showPopup(frmValoresParticulas, MDValConstants.CMD_ERROR, params);
		}
	}

	/**
	 * 
	 */
	private void eventBtnAlta() {
		showFrame(frmValoresParticulas, MDValConstants.CMD_ALTA_VALORES_PARTICULAS);
	}

	/**
	 * 
	 */
	private void eventBtnModificacion() {
		Map<String, Object> params = new HashMap<>();
		params.put(MDValConstants.FRM_VALORES_PARTICULAS_SELECCIONADA, frmValoresParticulas.getSeleccionada());

		showFrame(frmValoresParticulas, MDValConstants.CMD_MODIFICACION_VALORES_PARTICULAS, params);
	}

	/**
	 * Busca tipos de partícula
	 * 
	 * @param termino descripcion tipo a buscar
	 * @return lista de tipos que cumple con el termino buscado
	 */
	private List<TipoParticula> buscar(BigDecimal codigo, String sDescripcion, String mcaProyecto, String mcaSubproyecto) {
		TipoParticulaService tipoParticulaService = (TipoParticulaService) getService(MDValConstants.TIPO_PARTICULA_SERVICE);

		List<TipoParticula> tipos = tipoParticulaService.consultarTiposParticula(codigo, sDescripcion, mcaProyecto,
				mcaSubproyecto);
		return tipos;
	}

	/**
	 * Vuelca la lista de tipos encontrados en la tabla
	 * 
	 * @return
	 */
	private void populateModel(List<TipoParticula> tipos) {
		// Obtiene el modelo y lo actualiza
		DefinicionTiposParticulaTableModel tiposParticulasTableModel = (DefinicionTiposParticulaTableModel) frmValoresParticulas
				.getTblTiposParticula().getModel();
		tiposParticulasTableModel.setData(tipos);

		// Como se ha regenerado el contenido de la tabla y se ha perdido la selección,
		// deshabilitar el botón de selección para la próxima.
		frmValoresParticulas.getBtnModificacionElemento().setEnabled(Boolean.FALSE);

		// Borrar la tabla de elementos
		ValoresParticulaTableModel valoresParticulasTableModel = (ValoresParticulaTableModel) frmValoresParticulas
				.getTblValoresParticulas().getModel();
		valoresParticulasTableModel.clearData();
	}

	@Override
	public void update(Observable o, Object arg) {
		String cmd = (String) arg;
		
		if (MDValConstants.DLG_ALTA_MODIFICACION_TIPOS_PARTICULA_BTN_ACEPTAR.equals(cmd)) {
			eventBtnBuscar();
		}
		
		if (MDValConstants.DLG_ALTA_MODIFICACION_VALORES_PARTICULA_BTN_ACEPTAR.equals(cmd)) {
			TipoParticula tipoParticula = frmValoresParticulas.getSeleccionada();
			cargarValores(tipoParticula.getCodigoParticula());
		}
	}
	
	/**
	 * 
	 */
	private void cargarValores(BigDecimal codigoParticula) {
		try {
			List<ValorParticula> valores = cargarValoresParticulas(codigoParticula);
			populateModelValores(valores);
		} catch (Exception e) {
			Map<String, Object> params = buildError(e);
			showPopup(frmValoresParticulas, MDValConstants.CMD_ERROR, params);
		}
	}
	
	/**
	 * @param codigoParticula
	 * @return
	 */
	private List<ValorParticula> cargarValoresParticulas(BigDecimal codigoParticula) {
		ValorParticulaService valorParticulaService = (ValorParticulaService) getService(MDValConstants.VALOR_PARTICULA_SERVICE);
		List<ValorParticula> valores = valorParticulaService.consultarValoresParticula(codigoParticula);
		return valores;
	}

	/**
	 * Vuelca la lista de valores encontrados en la tabla
	 * 
	 * @return
	 */
	private void populateModelValores(List<ValorParticula> valores) {
		// Obtiene el modelo y lo actualiza
		ValoresParticulaTableModel tableModel = (ValoresParticulaTableModel) frmValoresParticulas
				.getTblValoresParticulas().getModel();
		tableModel.setData(valores);
	}
}
