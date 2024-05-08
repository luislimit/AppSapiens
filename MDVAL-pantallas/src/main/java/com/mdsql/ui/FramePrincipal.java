/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdsql.ui;

/**
 *
 * @author federico
 */
public class FramePrincipal extends javax.swing.JFrame {

    /**
     * Creates new form Principal
     */
    public FramePrincipal() {
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

        jToolBar1 = new javax.swing.JToolBar();
        btnLoadScript = new javax.swing.JButton();
        jSeparator1 = new javax.swing.JToolBar.Separator();
        btnCargarScriptObjetos = new javax.swing.JButton();
        jSeparator2 = new javax.swing.JToolBar.Separator();
        btnProcesarScript = new javax.swing.JButton();
        btnSave = new javax.swing.JButton();
        btnExecute = new javax.swing.JButton();
        btnEntregarProcesado = new javax.swing.JButton();
        btnLimpiarScripts = new javax.swing.JButton();
        btnLimpiarSesion = new javax.swing.JButton();
        jSeparator4 = new javax.swing.JToolBar.Separator();
        btnProcesadoEnCurso = new javax.swing.JButton();
        btnRefrescarFichero = new javax.swing.JButton();
        btnInformacionModelo = new javax.swing.JButton();
        jSplitPane1 = new javax.swing.JSplitPane();
        frmSQLScript = new javax.swing.JInternalFrame();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtSQLCode = new javax.swing.JTextArea();
        jToolBar2 = new javax.swing.JToolBar();
        btnUndo = new javax.swing.JButton();
        btnRedo = new javax.swing.JButton();
        jSeparator3 = new javax.swing.JToolBar.Separator();
        btnCopy = new javax.swing.JButton();
        btnCut = new javax.swing.JButton();
        btnPaste = new javax.swing.JButton();
        jPanel1 = new javax.swing.JPanel();
        tabPanel = new javax.swing.JTabbedPane();
        panelVigente = new javax.swing.JPanel();
        ifrmSQLModificado = new javax.swing.JInternalFrame();
        jScrollPane3 = new javax.swing.JScrollPane();
        txtSQLModificado = new javax.swing.JTextArea();
        ifrmPDC = new javax.swing.JInternalFrame();
        jScrollPane4 = new javax.swing.JScrollPane();
        txtPDC = new javax.swing.JTextArea();
        ifrmLanzaSQLModificado = new javax.swing.JInternalFrame();
        jScrollPane5 = new javax.swing.JScrollPane();
        txtLanzaSQLModificado = new javax.swing.JTextArea();
        ifrmLanzaPDC = new javax.swing.JInternalFrame();
        jScrollPane6 = new javax.swing.JScrollPane();
        txtLanzaPDC = new javax.swing.JTextArea();
        panelHistorico = new javax.swing.JPanel();
        ifrmSQLH = new javax.swing.JInternalFrame();
        jScrollPane7 = new javax.swing.JScrollPane();
        txtSQLH = new javax.swing.JTextArea();
        ifrmPDCH = new javax.swing.JInternalFrame();
        jScrollPane8 = new javax.swing.JScrollPane();
        txtPDCH = new javax.swing.JTextArea();
        ifrmLanzaSQLH = new javax.swing.JInternalFrame();
        jScrollPane9 = new javax.swing.JScrollPane();
        txtLanzaSQLH = new javax.swing.JTextArea();
        ifrmLanzaPDCH = new javax.swing.JInternalFrame();
        jScrollPane10 = new javax.swing.JScrollPane();
        txtLanzaPDCH = new javax.swing.JTextArea();
        panelTypes = new javax.swing.JPanel();
        ifrmListaObjetos = new javax.swing.JInternalFrame();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblListaObjetos = new javax.swing.JTable();
        ifrmTYS = new javax.swing.JInternalFrame();
        jScrollPane12 = new javax.swing.JScrollPane();
        txtScriptTYS = new javax.swing.JTextArea();
        ifrmTYB = new javax.swing.JInternalFrame();
        jScrollPane13 = new javax.swing.JScrollPane();
        txtScriptTYB = new javax.swing.JTextArea();
        ifrmLanzador = new javax.swing.JInternalFrame();
        jScrollPane11 = new javax.swing.JScrollPane();
        txtScriptLanza = new javax.swing.JTextArea();
        internalFramePDC = new javax.swing.JInternalFrame();
        jScrollPane14 = new javax.swing.JScrollPane();
        txtScriptPDC = new javax.swing.JTextArea();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem5 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jToolBar1.setRollover(true);
        jToolBar1.setMargin(new java.awt.Insets(3, 3, 3, 3));

        btnLoadScript.setIcon(new javax.swing.ImageIcon(getClass().getResource("/script.png"))); // NOI18N
        btnLoadScript.setToolTipText("Cargar script");
        btnLoadScript.setFocusable(false);
        btnLoadScript.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnLoadScript.setMaximumSize(new java.awt.Dimension(60, 60));
        btnLoadScript.setMinimumSize(new java.awt.Dimension(60, 60));
        btnLoadScript.setPreferredSize(new java.awt.Dimension(60, 60));
        btnLoadScript.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnLoadScript);
        jToolBar1.add(jSeparator1);

        btnCargarScriptObjetos.setIcon(new javax.swing.ImageIcon(getClass().getResource("/folder.png"))); // NOI18N
        btnCargarScriptObjetos.setText("TYPE");
        btnCargarScriptObjetos.setToolTipText("Cargar script Objetos");
        btnCargarScriptObjetos.setFocusable(false);
        btnCargarScriptObjetos.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnCargarScriptObjetos.setMaximumSize(new java.awt.Dimension(60, 60));
        btnCargarScriptObjetos.setMinimumSize(new java.awt.Dimension(60, 60));
        btnCargarScriptObjetos.setPreferredSize(new java.awt.Dimension(60, 60));
        btnCargarScriptObjetos.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnCargarScriptObjetos);
        jToolBar1.add(jSeparator2);

        btnProcesarScript.setIcon(new javax.swing.ImageIcon(getClass().getResource("/play.png"))); // NOI18N
        btnProcesarScript.setToolTipText("Procesar script");
        btnProcesarScript.setFocusable(false);
        btnProcesarScript.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnProcesarScript.setMaximumSize(new java.awt.Dimension(60, 60));
        btnProcesarScript.setMinimumSize(new java.awt.Dimension(60, 60));
        btnProcesarScript.setPreferredSize(new java.awt.Dimension(60, 60));
        btnProcesarScript.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnProcesarScript);

        btnSave.setIcon(new javax.swing.ImageIcon(getClass().getResource("/floppy-disk.png"))); // NOI18N
        btnSave.setToolTipText("Guardar archivo");
        btnSave.setFocusable(false);
        btnSave.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnSave.setMaximumSize(new java.awt.Dimension(60, 60));
        btnSave.setMinimumSize(new java.awt.Dimension(60, 60));
        btnSave.setPreferredSize(new java.awt.Dimension(60, 60));
        btnSave.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnSave);

        btnExecute.setIcon(new javax.swing.ImageIcon(getClass().getResource("/checking.png"))); // NOI18N
        btnExecute.setToolTipText("Ejecutar script");
        btnExecute.setFocusable(false);
        btnExecute.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnExecute.setMaximumSize(new java.awt.Dimension(60, 60));
        btnExecute.setMinimumSize(new java.awt.Dimension(60, 60));
        btnExecute.setPreferredSize(new java.awt.Dimension(60, 60));
        btnExecute.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnExecute);

        btnEntregarProcesado.setIcon(new javax.swing.ImageIcon(getClass().getResource("/execution.png"))); // NOI18N
        btnEntregarProcesado.setToolTipText("Entregar procesado");
        btnEntregarProcesado.setFocusable(false);
        btnEntregarProcesado.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnEntregarProcesado.setMaximumSize(new java.awt.Dimension(60, 60));
        btnEntregarProcesado.setMinimumSize(new java.awt.Dimension(60, 60));
        btnEntregarProcesado.setPreferredSize(new java.awt.Dimension(60, 60));
        btnEntregarProcesado.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnEntregarProcesado);

        btnLimpiarScripts.setIcon(new javax.swing.ImageIcon(getClass().getResource("/clean.png"))); // NOI18N
        btnLimpiarScripts.setToolTipText("Limpar scripts");
        btnLimpiarScripts.setFocusable(false);
        btnLimpiarScripts.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnLimpiarScripts.setMaximumSize(new java.awt.Dimension(60, 60));
        btnLimpiarScripts.setMinimumSize(new java.awt.Dimension(60, 60));
        btnLimpiarScripts.setPreferredSize(new java.awt.Dimension(60, 60));
        btnLimpiarScripts.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnLimpiarScripts);

        btnLimpiarSesion.setIcon(new javax.swing.ImageIcon(getClass().getResource("/trash.png"))); // NOI18N
        btnLimpiarSesion.setToolTipText("Limpiar sesión");
        btnLimpiarSesion.setFocusable(false);
        btnLimpiarSesion.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnLimpiarSesion.setMaximumSize(new java.awt.Dimension(60, 60));
        btnLimpiarSesion.setMinimumSize(new java.awt.Dimension(60, 60));
        btnLimpiarSesion.setPreferredSize(new java.awt.Dimension(60, 60));
        btnLimpiarSesion.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnLimpiarSesion);
        jToolBar1.add(jSeparator4);

        btnProcesadoEnCurso.setIcon(new javax.swing.ImageIcon(getClass().getResource("/info.png"))); // NOI18N
        btnProcesadoEnCurso.setToolTipText("Procesado en curso");
        btnProcesadoEnCurso.setFocusable(false);
        btnProcesadoEnCurso.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnProcesadoEnCurso.setMaximumSize(new java.awt.Dimension(60, 60));
        btnProcesadoEnCurso.setMinimumSize(new java.awt.Dimension(60, 60));
        btnProcesadoEnCurso.setPreferredSize(new java.awt.Dimension(60, 60));
        btnProcesadoEnCurso.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnProcesadoEnCurso);

        btnRefrescarFichero.setIcon(new javax.swing.ImageIcon(getClass().getResource("/file.png"))); // NOI18N
        btnRefrescarFichero.setToolTipText("Refrescar fichero");
        btnRefrescarFichero.setFocusable(false);
        btnRefrescarFichero.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnRefrescarFichero.setMaximumSize(new java.awt.Dimension(60, 60));
        btnRefrescarFichero.setMinimumSize(new java.awt.Dimension(60, 60));
        btnRefrescarFichero.setPreferredSize(new java.awt.Dimension(60, 60));
        btnRefrescarFichero.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnRefrescarFichero);

        btnInformacionModelo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/information.png"))); // NOI18N
        btnInformacionModelo.setToolTipText("Información del modelo");
        btnInformacionModelo.setFocusable(false);
        btnInformacionModelo.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnInformacionModelo.setMaximumSize(new java.awt.Dimension(60, 60));
        btnInformacionModelo.setMinimumSize(new java.awt.Dimension(60, 60));
        btnInformacionModelo.setPreferredSize(new java.awt.Dimension(60, 60));
        btnInformacionModelo.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar1.add(btnInformacionModelo);

        getContentPane().add(jToolBar1, java.awt.BorderLayout.PAGE_START);

        frmSQLScript.setVisible(true);

        txtSQLCode.setColumns(20);
        txtSQLCode.setRows(5);
        jScrollPane1.setViewportView(txtSQLCode);

        frmSQLScript.getContentPane().add(jScrollPane1, java.awt.BorderLayout.CENTER);

        jToolBar2.setFloatable(false);
        jToolBar2.setRollover(true);

        btnUndo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/undo.png"))); // NOI18N
        btnUndo.setToolTipText("Deshacer");
        btnUndo.setFocusable(false);
        btnUndo.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnUndo.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar2.add(btnUndo);

        btnRedo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/redo.png"))); // NOI18N
        btnRedo.setToolTipText("Rehacer");
        btnRedo.setFocusable(false);
        btnRedo.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnRedo.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar2.add(btnRedo);
        jToolBar2.add(jSeparator3);

        btnCopy.setIcon(new javax.swing.ImageIcon(getClass().getResource("/copy.png"))); // NOI18N
        btnCopy.setToolTipText("Copiar");
        btnCopy.setFocusable(false);
        btnCopy.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnCopy.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar2.add(btnCopy);

        btnCut.setIcon(new javax.swing.ImageIcon(getClass().getResource("/cut.png"))); // NOI18N
        btnCut.setToolTipText("Cortar");
        btnCut.setFocusable(false);
        btnCut.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnCut.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar2.add(btnCut);

        btnPaste.setIcon(new javax.swing.ImageIcon(getClass().getResource("/paste.png"))); // NOI18N
        btnPaste.setToolTipText("Pegar");
        btnPaste.setFocusable(false);
        btnPaste.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnPaste.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        jToolBar2.add(btnPaste);

        frmSQLScript.getContentPane().add(jToolBar2, java.awt.BorderLayout.PAGE_START);

        jSplitPane1.setLeftComponent(frmSQLScript);

        jPanel1.setLayout(new javax.swing.BoxLayout(jPanel1, javax.swing.BoxLayout.LINE_AXIS));

        panelVigente.setLayout(new java.awt.GridLayout(2, 2));

        ifrmSQLModificado.setVisible(true);

        txtSQLModificado.setEditable(false);
        txtSQLModificado.setColumns(20);
        txtSQLModificado.setRows(5);
        jScrollPane3.setViewportView(txtSQLModificado);

        ifrmSQLModificado.getContentPane().add(jScrollPane3, java.awt.BorderLayout.CENTER);

        panelVigente.add(ifrmSQLModificado);

        ifrmPDC.setVisible(true);

        txtPDC.setEditable(false);
        txtPDC.setColumns(20);
        txtPDC.setRows(5);
        jScrollPane4.setViewportView(txtPDC);

        ifrmPDC.getContentPane().add(jScrollPane4, java.awt.BorderLayout.CENTER);

        panelVigente.add(ifrmPDC);

        ifrmLanzaSQLModificado.setVisible(true);

        txtLanzaSQLModificado.setEditable(false);
        txtLanzaSQLModificado.setColumns(20);
        txtLanzaSQLModificado.setRows(5);
        jScrollPane5.setViewportView(txtLanzaSQLModificado);

        ifrmLanzaSQLModificado.getContentPane().add(jScrollPane5, java.awt.BorderLayout.CENTER);

        panelVigente.add(ifrmLanzaSQLModificado);

        ifrmLanzaPDC.setVisible(true);

        txtLanzaPDC.setEditable(false);
        txtLanzaPDC.setColumns(20);
        txtLanzaPDC.setRows(5);
        jScrollPane6.setViewportView(txtLanzaPDC);

        ifrmLanzaPDC.getContentPane().add(jScrollPane6, java.awt.BorderLayout.CENTER);

        panelVigente.add(ifrmLanzaPDC);

        tabPanel.addTab("Vigente", panelVigente);

        panelHistorico.setLayout(new java.awt.GridLayout(2, 2));

        ifrmSQLH.setVisible(true);

        txtSQLH.setEditable(false);
        txtSQLH.setColumns(20);
        txtSQLH.setRows(5);
        jScrollPane7.setViewportView(txtSQLH);

        ifrmSQLH.getContentPane().add(jScrollPane7, java.awt.BorderLayout.CENTER);

        panelHistorico.add(ifrmSQLH);

        ifrmPDCH.setVisible(true);

        txtPDCH.setEditable(false);
        txtPDCH.setColumns(20);
        txtPDCH.setRows(5);
        jScrollPane8.setViewportView(txtPDCH);

        ifrmPDCH.getContentPane().add(jScrollPane8, java.awt.BorderLayout.CENTER);

        panelHistorico.add(ifrmPDCH);

        ifrmLanzaSQLH.setVisible(true);

        txtLanzaSQLH.setEditable(false);
        txtLanzaSQLH.setColumns(20);
        txtLanzaSQLH.setRows(5);
        jScrollPane9.setViewportView(txtLanzaSQLH);

        ifrmLanzaSQLH.getContentPane().add(jScrollPane9, java.awt.BorderLayout.CENTER);

        panelHistorico.add(ifrmLanzaSQLH);

        ifrmLanzaPDCH.setVisible(true);

        txtLanzaPDCH.setEditable(false);
        txtLanzaPDCH.setColumns(20);
        txtLanzaPDCH.setRows(5);
        jScrollPane10.setViewportView(txtLanzaPDCH);

        ifrmLanzaPDCH.getContentPane().add(jScrollPane10, java.awt.BorderLayout.CENTER);

        panelHistorico.add(ifrmLanzaPDCH);

        tabPanel.addTab("Histórico", panelHistorico);

        ifrmListaObjetos.setVisible(true);

        tblListaObjetos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null}
            },
            new String [] {
                "Orden", "Objeto"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane2.setViewportView(tblListaObjetos);

        ifrmListaObjetos.getContentPane().add(jScrollPane2, java.awt.BorderLayout.CENTER);

        ifrmTYS.setVisible(true);

        txtScriptTYS.setEditable(false);
        txtScriptTYS.setColumns(20);
        txtScriptTYS.setRows(5);
        jScrollPane12.setViewportView(txtScriptTYS);

        ifrmTYS.getContentPane().add(jScrollPane12, java.awt.BorderLayout.CENTER);

        ifrmTYB.setVisible(true);

        txtScriptTYB.setEditable(false);
        txtScriptTYB.setColumns(20);
        txtScriptTYB.setRows(5);
        jScrollPane13.setViewportView(txtScriptTYB);

        ifrmTYB.getContentPane().add(jScrollPane13, java.awt.BorderLayout.CENTER);

        ifrmLanzador.setVisible(true);

        txtScriptLanza.setEditable(false);
        txtScriptLanza.setColumns(20);
        txtScriptLanza.setRows(5);
        jScrollPane11.setViewportView(txtScriptLanza);

        ifrmLanzador.getContentPane().add(jScrollPane11, java.awt.BorderLayout.CENTER);

        internalFramePDC.setVisible(true);

        txtScriptPDC.setEditable(false);
        txtScriptPDC.setColumns(20);
        txtScriptPDC.setRows(5);
        jScrollPane14.setViewportView(txtScriptPDC);

        internalFramePDC.getContentPane().add(jScrollPane14, java.awt.BorderLayout.CENTER);

        javax.swing.GroupLayout panelTypesLayout = new javax.swing.GroupLayout(panelTypes);
        panelTypes.setLayout(panelTypesLayout);
        panelTypesLayout.setHorizontalGroup(
            panelTypesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelTypesLayout.createSequentialGroup()
                .addGroup(panelTypesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ifrmListaObjetos, javax.swing.GroupLayout.DEFAULT_SIZE, 665, Short.MAX_VALUE)
                    .addComponent(ifrmLanzador))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(panelTypesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ifrmTYB)
                    .addComponent(ifrmTYS, javax.swing.GroupLayout.DEFAULT_SIZE, 759, Short.MAX_VALUE)
                    .addComponent(internalFramePDC)))
        );
        panelTypesLayout.setVerticalGroup(
            panelTypesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelTypesLayout.createSequentialGroup()
                .addComponent(ifrmTYS)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(ifrmTYB)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(internalFramePDC))
            .addGroup(panelTypesLayout.createSequentialGroup()
                .addComponent(ifrmListaObjetos, javax.swing.GroupLayout.DEFAULT_SIZE, 279, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(ifrmLanzador, javax.swing.GroupLayout.DEFAULT_SIZE, 356, Short.MAX_VALUE))
        );

        tabPanel.addTab("Types", panelTypes);

        jPanel1.add(tabPanel);

        jSplitPane1.setRightComponent(jPanel1);

        getContentPane().add(jSplitPane1, java.awt.BorderLayout.CENTER);

        jMenu1.setText("Permisos");

        jMenuItem1.setText("Permisos generales");
        jMenu1.add(jMenuItem1);

        jMenu3.setText("Permisos personalizados");

        jMenuItem2.setText("Consulta de permisos");
        jMenu3.add(jMenuItem2);

        jMenuItem3.setText("Mantenimiento de permisos personalizados por modelo");
        jMenu3.add(jMenuItem3);

        jMenuItem4.setText("Generar permisos personalizados");
        jMenu3.add(jMenuItem4);

        jMenu1.add(jMenu3);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Variables");

        jMenuItem5.setText("Variables");
        jMenu2.add(jMenuItem5);

        jMenuBar1.add(jMenu2);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

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
            java.util.logging.Logger.getLogger(FramePrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FramePrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FramePrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FramePrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FramePrincipal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCargarScriptObjetos;
    private javax.swing.JButton btnCopy;
    private javax.swing.JButton btnCut;
    private javax.swing.JButton btnEntregarProcesado;
    private javax.swing.JButton btnExecute;
    private javax.swing.JButton btnInformacionModelo;
    private javax.swing.JButton btnLimpiarScripts;
    private javax.swing.JButton btnLimpiarSesion;
    private javax.swing.JButton btnLoadScript;
    private javax.swing.JButton btnPaste;
    private javax.swing.JButton btnProcesadoEnCurso;
    private javax.swing.JButton btnProcesarScript;
    private javax.swing.JButton btnRedo;
    private javax.swing.JButton btnRefrescarFichero;
    private javax.swing.JButton btnSave;
    private javax.swing.JButton btnUndo;
    private javax.swing.JInternalFrame frmSQLScript;
    private javax.swing.JInternalFrame ifrmLanzaPDC;
    private javax.swing.JInternalFrame ifrmLanzaPDCH;
    private javax.swing.JInternalFrame ifrmLanzaSQLH;
    private javax.swing.JInternalFrame ifrmLanzaSQLModificado;
    private javax.swing.JInternalFrame ifrmLanzador;
    private javax.swing.JInternalFrame ifrmListaObjetos;
    private javax.swing.JInternalFrame ifrmPDC;
    private javax.swing.JInternalFrame ifrmPDCH;
    private javax.swing.JInternalFrame ifrmSQLH;
    private javax.swing.JInternalFrame ifrmSQLModificado;
    private javax.swing.JInternalFrame ifrmTYB;
    private javax.swing.JInternalFrame ifrmTYS;
    private javax.swing.JInternalFrame internalFramePDC;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane10;
    private javax.swing.JScrollPane jScrollPane11;
    private javax.swing.JScrollPane jScrollPane12;
    private javax.swing.JScrollPane jScrollPane13;
    private javax.swing.JScrollPane jScrollPane14;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JScrollPane jScrollPane6;
    private javax.swing.JScrollPane jScrollPane7;
    private javax.swing.JScrollPane jScrollPane8;
    private javax.swing.JScrollPane jScrollPane9;
    private javax.swing.JToolBar.Separator jSeparator1;
    private javax.swing.JToolBar.Separator jSeparator2;
    private javax.swing.JToolBar.Separator jSeparator3;
    private javax.swing.JToolBar.Separator jSeparator4;
    private javax.swing.JSplitPane jSplitPane1;
    private javax.swing.JToolBar jToolBar1;
    private javax.swing.JToolBar jToolBar2;
    private javax.swing.JPanel panelHistorico;
    private javax.swing.JPanel panelTypes;
    private javax.swing.JPanel panelVigente;
    private javax.swing.JTabbedPane tabPanel;
    private javax.swing.JTable tblListaObjetos;
    private javax.swing.JTextArea txtLanzaPDC;
    private javax.swing.JTextArea txtLanzaPDCH;
    private javax.swing.JTextArea txtLanzaSQLH;
    private javax.swing.JTextArea txtLanzaSQLModificado;
    private javax.swing.JTextArea txtPDC;
    private javax.swing.JTextArea txtPDCH;
    private javax.swing.JTextArea txtSQLCode;
    private javax.swing.JTextArea txtSQLH;
    private javax.swing.JTextArea txtSQLModificado;
    private javax.swing.JTextArea txtScriptLanza;
    private javax.swing.JTextArea txtScriptPDC;
    private javax.swing.JTextArea txtScriptTYB;
    private javax.swing.JTextArea txtScriptTYS;
    // End of variables declaration//GEN-END:variables
}