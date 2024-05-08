/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdsql.ui;

import java.util.Map;

import com.mdsql.ui.listener.PantallaMantenimientoEntornosPruebaListener;
import com.mdsql.utils.MDSQLConstants;
import com.mdval.ui.utils.DialogSupport;
import com.mdval.ui.utils.FrameSupport;
import com.mdval.ui.utils.TableSupport;

import lombok.Getter;

/**
 *
 * @author federico
 */
public class PantallaMantenimientoEntornosPrueba extends DialogSupport {

	 	private static final long serialVersionUID = 1L;

	 	// Variables declaration - do not modify//GEN-BEGIN:variables
	    private javax.swing.JLabel jLabel1;
	    private javax.swing.JLabel jLabel13;
	    private javax.swing.JLabel jLabel14;
	    private javax.swing.JLabel jLabel2;
	    private javax.swing.JLabel jLabel3;
	    private javax.swing.JLabel jLabel5;
	    private javax.swing.JLabel jLabel6;
	    private javax.swing.JLabel jLabel7;
	    private javax.swing.JScrollPane jScrollPane1;
	    private javax.swing.JScrollPane jScrollPane2;
	    
	    @Getter
	    private javax.swing.JTable tblMantenimientoHistorico;
	    
	    @Getter
	    private javax.swing.JTextField txtBBDD;
	    
	    @Getter
	    private javax.swing.JTextArea txtDescripcion;
	    
	    @Getter
	    private javax.swing.JTextField txtEsquema;
	    
	    @Getter
	    private javax.swing.JTextField txtGradoparal;
	    
	    @Getter
	    private javax.swing.JTextField txtNombreEntorno;
	    
	    @Getter
	    private javax.swing.JTextField txtTablespace;
	    
	    @Getter
	    private javax.swing.JButton btnCancelar;
	    
	    @Getter
	    private javax.swing.JButton btnGuardar;
	    
	    @Getter
	    private javax.swing.JCheckBox chkHabilitada;
	    // End of variables declaration//GEN-END:variables

	    public PantallaMantenimientoEntornosPrueba(FrameSupport parent, Boolean modal) {
			 super(parent, modal);
		 }

		public PantallaMantenimientoEntornosPrueba(FrameSupport parent, Boolean modal, Map<String, Object> params) {
			super(parent, modal, params);
		}
		 
		@Override
		protected void setupComponents() {
			jLabel3 = new javax.swing.JLabel();
	        txtNombreEntorno = new javax.swing.JTextField();
	        btnCancelar = new javax.swing.JButton();
	        jLabel14 = new javax.swing.JLabel();
	        btnGuardar = new javax.swing.JButton();
	        jScrollPane1 = new javax.swing.JScrollPane();
	        tblMantenimientoHistorico = new javax.swing.JTable();
	        chkHabilitada = new javax.swing.JCheckBox();
	        jLabel5 = new javax.swing.JLabel();
	        txtEsquema = new javax.swing.JTextField();
	        jLabel6 = new javax.swing.JLabel();
	        txtTablespace = new javax.swing.JTextField();
	        jLabel7 = new javax.swing.JLabel();
	        txtBBDD = new javax.swing.JTextField();
	        jLabel13 = new javax.swing.JLabel();
	        txtGradoparal = new javax.swing.JTextField();
	        jScrollPane2 = new javax.swing.JScrollPane();
	        txtDescripcion = new javax.swing.JTextArea();
	        jLabel1 = new javax.swing.JLabel();
	        jLabel2 = new javax.swing.JLabel();
	        
	        setBounds(1366, 768);
	        
	        jScrollPane1.setViewportView(tblMantenimientoHistorico);
	        
	        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
	        getContentPane().setLayout(layout);
	        layout.setHorizontalGroup(
	            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
	            .addGroup(layout.createSequentialGroup()
	                .addGap(91, 91, 91)
	                .addComponent(jLabel14)
	                .addGap(0, 1187, Short.MAX_VALUE))
	            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
	                .addGap(24, 24, 24)
	                .addComponent(jLabel3)
	                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
	                .addComponent(txtNombreEntorno)
	                .addGap(462, 462, 462))
	            .addGroup(layout.createSequentialGroup()
	                .addGap(52, 52, 52)
	                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
	                    .addComponent(jLabel7)
	                    .addComponent(jLabel1))
	                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
	                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
	                    .addGroup(layout.createSequentialGroup()
	                        .addComponent(txtBBDD, javax.swing.GroupLayout.PREFERRED_SIZE, 301, javax.swing.GroupLayout.PREFERRED_SIZE)
	                        .addGap(80, 80, 80)
	                        .addComponent(jLabel5)
	                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
	                        .addComponent(txtEsquema, javax.swing.GroupLayout.PREFERRED_SIZE, 301, javax.swing.GroupLayout.PREFERRED_SIZE))
	                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
	                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
	                            .addGroup(layout.createSequentialGroup()
	                                .addComponent(jLabel13)
	                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
	                                .addComponent(txtGradoparal, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
	                                .addGap(174, 174, 174)
	                                .addComponent(chkHabilitada))
	                            .addComponent(jScrollPane2))
	                        .addGap(462, 462, 462))))
	            .addGroup(layout.createSequentialGroup()
	                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
	                    .addGroup(layout.createSequentialGroup()
	                        .addGap(583, 583, 583)
	                        .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 118, javax.swing.GroupLayout.PREFERRED_SIZE))
	                    .addGroup(layout.createSequentialGroup()
	                        .addGap(56, 56, 56)
	                        .addComponent(jLabel6)
	                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
	                        .addComponent(txtTablespace, javax.swing.GroupLayout.PREFERRED_SIZE, 301, javax.swing.GroupLayout.PREFERRED_SIZE))
	                    .addGroup(layout.createSequentialGroup()
	                        .addGap(568, 568, 568)
	                        .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 135, javax.swing.GroupLayout.PREFERRED_SIZE))
	                    .addGroup(layout.createSequentialGroup()
	                        .addGap(28, 28, 28)
	                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
	                            .addComponent(jLabel2)
	                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1276, javax.swing.GroupLayout.PREFERRED_SIZE))))
	                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
	        );
	        layout.setVerticalGroup(
	            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
	            .addGroup(layout.createSequentialGroup()
	                .addGap(22, 22, 22)
	                .addComponent(jLabel14)
	                .addGap(18, 18, 18)
	                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
	                    .addComponent(jLabel3)
	                    .addComponent(txtNombreEntorno, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
	                .addGap(18, 18, 18)
	                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
	                    .addComponent(txtBBDD, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
	                    .addComponent(jLabel7)
	                    .addComponent(jLabel5)
	                    .addComponent(txtEsquema, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
	                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
	                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
	                    .addComponent(jLabel1)
	                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE))
	                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
	                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
	                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
	                        .addComponent(txtTablespace, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
	                        .addComponent(jLabel6))
	                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
	                        .addComponent(jLabel13)
	                        .addComponent(txtGradoparal, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
	                        .addComponent(chkHabilitada)))
	                .addGap(30, 30, 30)
	                .addComponent(btnGuardar)
	                .addGap(21, 21, 21)
	                .addComponent(jLabel2)
	                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
	                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 293, javax.swing.GroupLayout.PREFERRED_SIZE)
	                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 49, Short.MAX_VALUE)
	                .addComponent(btnCancelar)
	                .addGap(23, 23, 23))
	        );
		}
	    
		@Override
		protected void initEvents() {
			PantallaMantenimientoEntornosPruebaListener actionListener = new PantallaMantenimientoEntornosPruebaListener(this);
			
			btnGuardar.setActionCommand(MDSQLConstants.PANTALLA_MANTENIMIENTO_ENTORNOS_PRUEBA_GUARDAR);
			btnCancelar.setActionCommand(MDSQLConstants.PANTALLA_MANTENIMIENTO_ENTORNOS_PRUEBA_CANCELAR);
			
			btnGuardar.addActionListener(actionListener);
			btnCancelar.addActionListener(actionListener);
		}
	    
		@Override
		protected void initModels() {
			
		}
	    
		@Override
		protected void initialState() {
			
		}
	    
		@Override
		protected void setupLiterals() {
			 setTitle(literales.getLiteral("PantallaPermisosGeneralesporModeloporTipoObjeto.title"));

			 jLabel3.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.label3"));
			 btnCancelar.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.btnCancelar"));
			 btnGuardar.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.btnGuardar"));
			 chkHabilitada.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.chkHabilitada"));
			 jLabel5.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.label5"));
			 jLabel6.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.label6"));
			 jLabel7.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.label7"));
			 jLabel13.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.label13"));
			 jLabel1.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.label1"));
			 jLabel2.setText(literales.getLiteral("PantallaMantenimientoEntornosPrueba.label2"));
		}
	    
		/**
			 * 
			 */
		public void enableButtons(Boolean val) {
			btnGuardar.setEnabled(val);
			btnCancelar.setEnabled(val);
		}
}
