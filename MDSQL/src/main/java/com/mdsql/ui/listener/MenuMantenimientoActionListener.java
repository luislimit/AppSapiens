package com.mdsql.ui.listener;

import com.mdsql.bussiness.entities.*;
import com.mdsql.ui.*;
import com.mdsql.ui.utils.ListenerSupport;
import com.mdsql.ui.utils.MDSQLUIHelper;
import com.mdsql.utils.MDSQLConstants;
import com.mdval.ui.utils.DialogSupport;
import com.mdval.ui.utils.FrameSupport;
import lombok.extern.slf4j.Slf4j;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author federico
 *
 */
@Slf4j
public class MenuMantenimientoActionListener extends ListenerSupport implements ActionListener {

	private FrameSupport framePrincipal;

	private PantallaProcesarScript pantallaProcesarScript;

	private DialogSupport pantallaEjecutar;

	/**
	 * @param framePrincipal
	 */
	public MenuMantenimientoActionListener(FrameSupport framePrincipal) {
		this.framePrincipal = framePrincipal;
	}

	/**
	 *
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		JMenuItem item = (JMenuItem) e.getSource();
		String actionCommand = item.getActionCommand();

		if (MDSQLConstants.MNU_PERMISOS_GENERALES.equals(actionCommand)) {
			evtPermisosGenerales();
		}

		if (MDSQLConstants.MNU_CONSULTA_PERMISOS.equals(actionCommand)) {
			evtPermisosObjeto();
		}

		if (MDSQLConstants.MNU_MANTENIMIENTO_HISTORICO.equals(actionCommand)) {
			evtMntoHistorico();
		}

		if (MDSQLConstants.MNU_NOTAS_MODELOS.equals(actionCommand)) {
			evtNotasModelos();
		}

		if (MDSQLConstants.MNU_ENTORNOS.equals(actionCommand)) {
			evtMntoEntornos();
		}

		if (MDSQLConstants.MNU_VARIABLES.equals(actionCommand)) {
			evtMntoVariables();
		}
	}

	private void evtMntoVariables() {
		Map<String, Object> params = new HashMap<>();
		params.put("opcion", "mntoVariables");
		Modelo seleccionado = getModelo(params);

		if (!Objects.isNull(seleccionado)) {
			params = new HashMap<>();

			params.put("modelo", seleccionado);

			PantallaMantenimientoVariables pantallaMantenimientoVariables = (PantallaMantenimientoVariables) MDSQLUIHelper.createDialog(framePrincipal,
					MDSQLConstants.CMD_MNTO_VARIABLES, params);
			MDSQLUIHelper.show(pantallaMantenimientoVariables);
		}
	}

	private void evtMntoEntornos() {
		Map<String, Object> params = new HashMap<>();

		PantallaMantenimientoEntornos pantallaMantenimientoEntornos = (PantallaMantenimientoEntornos) MDSQLUIHelper.createDialog(framePrincipal,
				MDSQLConstants.CMD_MNTO_ENTORNOS, params);
		MDSQLUIHelper.show(pantallaMantenimientoEntornos);
	}

	private void evtNotasModelos() {
		Map<String, Object> params = new HashMap<>();
		PantallaMantenimientoNotasModelos pantallaMantenimientoNotasModelos = (PantallaMantenimientoNotasModelos) MDSQLUIHelper.createDialog(framePrincipal,
					MDSQLConstants.CMD_MNTO_NOTAS, params);
		MDSQLUIHelper.show(pantallaMantenimientoNotasModelos);
	}

	private void evtMntoHistorico() {
		Map<String, Object> params = new HashMap<>();

		PantallaMantenimientoHistorico pantallaMantenimientoHistorico = (PantallaMantenimientoHistorico) MDSQLUIHelper.createDialog(framePrincipal,
				MDSQLConstants.CMD_MNTO_HISTORICO, params);
		MDSQLUIHelper.show(pantallaMantenimientoHistorico);
	}

	/**
	 * 
	 */
	private void evtPermisosGenerales() {
		Map<String, Object> params = new HashMap<>();
		params.put("opcion", "mntoPermisosGenerales");
		Modelo seleccionado = getModelo(params);

		if (!Objects.isNull(seleccionado)) {
			params = new HashMap<>();
			params.put("modelo", seleccionado);

			PantallaPermisosGeneralesporModeloporTipoObjeto pantallaPermisosGeneralesporModeloporTipoObjeto = (PantallaPermisosGeneralesporModeloporTipoObjeto) MDSQLUIHelper.createDialog(framePrincipal,
					MDSQLConstants.CMD_PERMISOS_GENERALES, params);
			MDSQLUIHelper.show(pantallaPermisosGeneralesporModeloporTipoObjeto);
		}
	}

	private void evtPermisosObjeto() {
		/*
		Modelo seleccionado = getModelo();
		Map<String, Object> params = new HashMap<>();

		params.put("modelo", seleccionado);

		PantallaDetallePermisosPorObjeto pantallaDetallePermisosPorObjeto = (PantallaDetallePermisosPorObjeto) MDSQLUIHelper.createDialog(framePrincipal,
				MDSQLConstants.CMD_PERMISOS_OBJETO, params);
		MDSQLUIHelper.show(pantallaDetallePermisosPorObjeto);
		 */
	}

	private Modelo getModelo(Map<String, Object> params) {
		PantallaSeleccionModelos pantallaSeleccionModelos = (PantallaSeleccionModelos) MDSQLUIHelper.createDialog(framePrincipal,
				MDSQLConstants.CMD_SEARCH_MODEL, params);
		MDSQLUIHelper.show(pantallaSeleccionModelos);
		Modelo seleccionado = pantallaSeleccionModelos.getSeleccionado();
		return seleccionado;
	}
}
