package com.mdsql.ui.listener;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;

import com.mdsql.ui.PantallaMantenimientoEntornosPrueba;
import com.mdsql.ui.utils.ListenerSupport;
import com.mdsql.utils.MDSQLConstants;
import com.mdval.ui.utils.OnLoadListener;

public class PantallaMantenimientoEntornosPruebaListener extends ListenerSupport implements ActionListener, OnLoadListener {
	private PantallaMantenimientoEntornosPrueba pantallaMantenimientoEntornosPrueba;
	
	public PantallaMantenimientoEntornosPruebaListener(PantallaMantenimientoEntornosPrueba pantallaMantenimientoEntornosPrueba) {
		super();
		this.pantallaMantenimientoEntornosPrueba = pantallaMantenimientoEntornosPrueba;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		JButton jButton = (JButton) e.getSource();
		
		if (MDSQLConstants.PANTALLA_PERMISOS_GENERALES_POR_MODELO_POR_TIPO_OBJETO_INFORME.equals(jButton.getActionCommand())) {
			eventBtnGuardar();
		}

		if (MDSQLConstants.PANTALLA_PERMISOS_GENERALES_POR_MODELO_POR_TIPO_OBJETO_CANCELAR.equals(jButton.getActionCommand())) {
			pantallaMantenimientoEntornosPrueba.dispose();
		}
	}
	
	private void eventBtnGuardar() {
		
	}

	@Override
	public void onLoad() {
		
	}
	
}
