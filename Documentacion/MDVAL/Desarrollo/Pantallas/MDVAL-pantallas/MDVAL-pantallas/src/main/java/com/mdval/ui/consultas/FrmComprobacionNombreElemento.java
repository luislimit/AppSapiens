/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdval.ui.consultas;

/**
 *
 * @author federico
 */
public class FrmComprobacionNombreElemento extends javax.swing.JFrame {

    /**
     * Creates new form DlgModificacionNormas
     */
    public FrmComprobacionNombreElemento() {
        super();
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelLogo = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtModeloProyecto = new javax.swing.JTextField();
        txtNombreComprobar = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        cmbSubmodelo = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        cmbElemento = new javax.swing.JComboBox<>();
        btnBuscar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txtCodNorma = new javax.swing.JTextField();
        txtDescNorma = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        txtCodGlosario = new javax.swing.JTextField();
        txtDescGlosario = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblValoresPosibles = new javax.swing.JTable();
        txtTamMaximo = new javax.swing.JTextField();
        txtExpresionRegular = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        btnComprobar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        panelLogo.setPreferredSize(new java.awt.Dimension(286, 63));

        javax.swing.GroupLayout panelLogoLayout = new javax.swing.GroupLayout(panelLogo);
        panelLogo.setLayout(panelLogoLayout);
        panelLogoLayout.setHorizontalGroup(
            panelLogoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 286, Short.MAX_VALUE)
        );
        panelLogoLayout.setVerticalGroup(
            panelLogoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 67, Short.MAX_VALUE)
        );

        jLabel2.setText("Modelo o Proyecto:");

        jLabel3.setText("Nombre a Comprobar:");

        txtModeloProyecto.setPreferredSize(new java.awt.Dimension(4, 27));
        txtModeloProyecto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtModeloProyectoActionPerformed(evt);
            }
        });

        txtNombreComprobar.setMinimumSize(new java.awt.Dimension(4, 27));
        txtNombreComprobar.setPreferredSize(new java.awt.Dimension(64, 27));
        txtNombreComprobar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtNombreComprobarActionPerformed(evt);
            }
        });

        jLabel5.setText("Resultado de la Comprobación:");

        jLabel6.setText("Submodelo");

        cmbSubmodelo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Submodelo 1", "Submodelo 2", "Submodelo 3", "Submodelo 4" }));

        jLabel7.setText("Elemento:");

        cmbElemento.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Elemento 1", "Elemento 2", "Elemento 3", "Elemento 4" }));

        btnBuscar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/loupe.png"))); // NOI18N

        jLabel1.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jLabel1.setText("Comprobación del Nombre de un Elemento");

        jLabel4.setText("Norma:");

        txtCodNorma.setEditable(false);
        txtCodNorma.setEnabled(false);
        txtCodNorma.setPreferredSize(new java.awt.Dimension(4, 27));
        txtCodNorma.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCodNormaActionPerformed(evt);
            }
        });

        txtDescNorma.setEditable(false);
        txtDescNorma.setEnabled(false);
        txtDescNorma.setMinimumSize(new java.awt.Dimension(4, 27));
        txtDescNorma.setPreferredSize(new java.awt.Dimension(64, 27));
        txtDescNorma.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtDescNormaActionPerformed(evt);
            }
        });

        jLabel8.setText("Glosario:");

        txtCodGlosario.setEditable(false);
        txtCodGlosario.setEnabled(false);
        txtCodGlosario.setPreferredSize(new java.awt.Dimension(4, 27));
        txtCodGlosario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCodGlosarioActionPerformed(evt);
            }
        });

        txtDescGlosario.setEditable(false);
        txtDescGlosario.setEnabled(false);
        txtDescGlosario.setMinimumSize(new java.awt.Dimension(4, 27));
        txtDescGlosario.setPreferredSize(new java.awt.Dimension(64, 27));
        txtDescGlosario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtDescGlosarioActionPerformed(evt);
            }
        });

        tblValoresPosibles.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"Valor", "Valor", "..."},
                {"Valor", "Valor", "..."},
                {"...", "...", "..."}
            },
            new String [] {
                "Campo 1", "Campo 2", "..."
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblValoresPosibles);

        txtTamMaximo.setEditable(false);
        txtTamMaximo.setEnabled(false);
        txtTamMaximo.setPreferredSize(new java.awt.Dimension(4, 27));
        txtTamMaximo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtTamMaximoActionPerformed(evt);
            }
        });

        txtExpresionRegular.setEditable(false);
        txtExpresionRegular.setEnabled(false);
        txtExpresionRegular.setMinimumSize(new java.awt.Dimension(4, 27));
        txtExpresionRegular.setPreferredSize(new java.awt.Dimension(64, 27));
        txtExpresionRegular.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtExpresionRegularActionPerformed(evt);
            }
        });

        jLabel9.setText("Tamaño Máximo:");

        jLabel10.setText("Expresión Regular:");

        jPanel1.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.CENTER, 15, 15));

        btnComprobar.setText("COMPROBAR");
        btnComprobar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnComprobarActionPerformed(evt);
            }
        });
        jPanel1.add(btnComprobar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane1))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(panelLogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 418, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 722, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addGroup(layout.createSequentialGroup()
                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                                    .addComponent(jLabel7)
                                                    .addComponent(jLabel3)
                                                    .addComponent(jLabel2)
                                                    .addComponent(jLabel4)
                                                    .addComponent(jLabel8)
                                                    .addComponent(jLabel9)
                                                    .addComponent(jLabel10))
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                    .addGroup(layout.createSequentialGroup()
                                                        .addComponent(txtModeloProyecto, javax.swing.GroupLayout.PREFERRED_SIZE, 212, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                        .addComponent(btnBuscar)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jLabel6)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                        .addComponent(cmbSubmodelo, javax.swing.GroupLayout.PREFERRED_SIZE, 198, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                    .addComponent(cmbElemento, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                    .addComponent(txtNombreComprobar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                    .addGroup(layout.createSequentialGroup()
                                                        .addComponent(txtCodNorma, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                        .addComponent(txtDescNorma, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                                    .addGroup(layout.createSequentialGroup()
                                                        .addComponent(txtCodGlosario, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                        .addComponent(txtDescGlosario, javax.swing.GroupLayout.PREFERRED_SIZE, 435, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                    .addComponent(txtExpresionRegular, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                    .addComponent(txtTamMaximo, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))))
                                        .addGap(1, 1, 1))))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(35, 35, 35)
                                .addComponent(jLabel5)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1)
                    .addComponent(panelLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 67, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnBuscar)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtModeloProyecto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel2))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel6)
                        .addComponent(cmbSubmodelo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(cmbElemento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtNombreComprobar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtCodNorma, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtDescNorma, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(txtCodGlosario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtDescGlosario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtTamMaximo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtExpresionRegular, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 293, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtModeloProyectoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtModeloProyectoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtModeloProyectoActionPerformed

    private void txtNombreComprobarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtNombreComprobarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtNombreComprobarActionPerformed

    private void txtCodNormaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCodNormaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtCodNormaActionPerformed

    private void txtDescNormaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtDescNormaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtDescNormaActionPerformed

    private void txtCodGlosarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCodGlosarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtCodGlosarioActionPerformed

    private void txtDescGlosarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtDescGlosarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtDescGlosarioActionPerformed

    private void btnComprobarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnComprobarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnComprobarActionPerformed

    private void txtTamMaximoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTamMaximoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtTamMaximoActionPerformed

    private void txtExpresionRegularActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtExpresionRegularActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtExpresionRegularActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmComprobacionNombreElemento.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmComprobacionNombreElemento.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmComprobacionNombreElemento.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmComprobacionNombreElemento.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                FrmComprobacionNombreElemento dialog = new FrmComprobacionNombreElemento();
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBuscar;
    private javax.swing.JButton btnComprobar;
    private javax.swing.JComboBox<String> cmbElemento;
    private javax.swing.JComboBox<String> cmbSubmodelo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPanel panelLogo;
    private javax.swing.JTable tblValoresPosibles;
    private javax.swing.JTextField txtCodGlosario;
    private javax.swing.JTextField txtCodNorma;
    private javax.swing.JTextField txtDescGlosario;
    private javax.swing.JTextField txtDescNorma;
    private javax.swing.JTextField txtExpresionRegular;
    private javax.swing.JTextField txtModeloProyecto;
    private javax.swing.JTextField txtNombreComprobar;
    private javax.swing.JTextField txtTamMaximo;
    // End of variables declaration//GEN-END:variables
}