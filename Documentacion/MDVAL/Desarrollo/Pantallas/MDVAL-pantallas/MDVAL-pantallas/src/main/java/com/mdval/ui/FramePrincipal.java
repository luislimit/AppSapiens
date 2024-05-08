/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdval.ui;

import com.mdval.ui.menu.MainMenuBar;
import com.mdval.ui.validacionscripts.PanelPrincipal;
import java.awt.BorderLayout;
import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.WindowConstants;

/**
 *
 * @author federico
 */
public class FramePrincipal extends JFrame {

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton anadirGlosario;
    private javax.swing.JButton anadirTodos;
    private javax.swing.JLabel archivoConScript;
    private javax.swing.JButton buscar;
    private javax.swing.JMenu configuracion;
    private javax.swing.JTextField direccionArchivo;
    private javax.swing.JPanel division1;
    private javax.swing.JPanel division2;
    private javax.swing.JPanel elementosCorrectos;
    private javax.swing.JPanel elementosValidar;
    private javax.swing.JPanel errores;
    private javax.swing.JPanel excepciones;
    private javax.swing.JLabel glosario;
    private javax.swing.JTextField glosario1;
    private javax.swing.JTextField glosario2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JButton limpiarTodo;
    private javax.swing.JButton limpiarValidacion;
    private javax.swing.JLabel logotipo;
    private javax.swing.JButton marcar;
    private javax.swing.JTabbedPane menu;
    private javax.swing.JMenuBar menuBar;
    private javax.swing.JTextField modeloProyecto;
    private javax.swing.JPanel noGlosario;
    private javax.swing.JLabel norma;
    private javax.swing.JTextField norma1;
    private javax.swing.JTextField norma2;
    private javax.swing.JPanel panelPrincipal;
    private javax.swing.JLabel resultadoValidacion;
    private javax.swing.JLabel rf;
    private javax.swing.JTextField rfCampo;
    private javax.swing.JLabel script;
    private javax.swing.JTextArea scriptArea;
    private javax.swing.JLabel sd;
    private javax.swing.JTextField sdCampo;
    private javax.swing.JButton seleccionArchivo;
    private javax.swing.JLabel submodelo;
    private javax.swing.JComboBox<String> submodeloLista;
    private javax.swing.JTable tabla;
    // End of variables declaration//GEN-END:variables

    /**
     * Creates new form FramePrincipal
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

        panelPrincipal = new javax.swing.JPanel();
        menu = new javax.swing.JTabbedPane();
        elementosCorrectos = new javax.swing.JPanel();
        division1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tabla = new javax.swing.JTable();
        division2 = new javax.swing.JPanel();
        marcar = new javax.swing.JButton();
        anadirGlosario = new javax.swing.JButton();
        anadirTodos = new javax.swing.JButton();
        noGlosario = new javax.swing.JPanel();
        errores = new javax.swing.JPanel();
        excepciones = new javax.swing.JPanel();
        elementosValidar = new javax.swing.JPanel();
        limpiarValidacion = new javax.swing.JButton();
        limpiarTodo = new javax.swing.JButton();
        modeloProyecto = new javax.swing.JTextField();
        buscar = new javax.swing.JButton();
        submodelo = new javax.swing.JLabel();
        submodeloLista = new javax.swing.JComboBox<>();
        rf = new javax.swing.JLabel();
        sd = new javax.swing.JLabel();
        sdCampo = new javax.swing.JTextField();
        rfCampo = new javax.swing.JTextField();
        logotipo = new javax.swing.JLabel();
        glosario = new javax.swing.JLabel();
        glosario1 = new javax.swing.JTextField();
        glosario2 = new javax.swing.JTextField();
        norma = new javax.swing.JLabel();
        norma1 = new javax.swing.JTextField();
        norma2 = new javax.swing.JTextField();
        archivoConScript = new javax.swing.JLabel();
        direccionArchivo = new javax.swing.JTextField();
        seleccionArchivo = new javax.swing.JButton();
        resultadoValidacion = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        scriptArea = new javax.swing.JTextArea();
        script = new javax.swing.JLabel();
        menuBar = new javax.swing.JMenuBar();
        configuracion = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(1366, 768));
        setResizable(false);

        panelPrincipal.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        elementosCorrectos.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        division1.setLayout(new java.awt.BorderLayout());

        tabla.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null}
            },
            new String [] {
                "num_validacion", "num_elem_valid", "des_elemento", "nom_elemento", "tip_dato", "num_longitud", "num_decimales", "descripcion"
            }
        ));
        jScrollPane1.setViewportView(tabla);

        division1.add(jScrollPane1, java.awt.BorderLayout.CENTER);

        elementosCorrectos.add(division1, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 5, 710, 250));

        marcar.setText("Marcar como E");

        anadirGlosario.setText("Añadir a Glosario");

        anadirTodos.setText("Añadir Todos");

        javax.swing.GroupLayout division2Layout = new javax.swing.GroupLayout(division2);
        division2.setLayout(division2Layout);
        division2Layout.setHorizontalGroup(
            division2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, division2Layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addGroup(division2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(marcar, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(anadirTodos, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(anadirGlosario))
                .addGap(26, 26, 26))
        );
        division2Layout.setVerticalGroup(
            division2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(division2Layout.createSequentialGroup()
                .addGap(58, 58, 58)
                .addComponent(marcar)
                .addGap(18, 18, 18)
                .addComponent(anadirGlosario)
                .addGap(18, 18, 18)
                .addComponent(anadirTodos)
                .addContainerGap())
        );

        elementosCorrectos.add(division2, new org.netbeans.lib.awtextra.AbsoluteConstraints(720, 0, 150, 250));

        menu.addTab("Elementos correctos", elementosCorrectos);
        menu.addTab("Elementos que no están en el glosario", noGlosario);
        menu.addTab("Elementos con errores", errores);
        menu.addTab("Excepciones", excepciones);
        menu.addTab("Elementos a Validar", elementosValidar);

        panelPrincipal.add(menu, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 370, 870, 280));

        limpiarValidacion.setText("Limpiar Validación");
        panelPrincipal.add(limpiarValidacion, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 660, -1, -1));

        limpiarTodo.setText("Limpiar Todo");
        panelPrincipal.add(limpiarTodo, new org.netbeans.lib.awtextra.AbsoluteConstraints(920, 660, -1, -1));
        panelPrincipal.add(modeloProyecto, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 60, 180, -1));
        panelPrincipal.add(buscar, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 60, 40, 20));

        submodelo.setText("Submodelo");
        panelPrincipal.add(submodelo, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 60, -1, -1));

        panelPrincipal.add(submodeloLista, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 60, 120, -1));

        rf.setText("RF");
        panelPrincipal.add(rf, new org.netbeans.lib.awtextra.AbsoluteConstraints(650, 60, -1, -1));

        sd.setText("SD");
        panelPrincipal.add(sd, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 60, -1, -1));
        panelPrincipal.add(sdCampo, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 60, -1, -1));
        panelPrincipal.add(rfCampo, new org.netbeans.lib.awtextra.AbsoluteConstraints(670, 60, -1, -1));

        logotipo.setText("Logotipo");
        panelPrincipal.add(logotipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 20, -1, -1));

        glosario.setText("Glosario");
        panelPrincipal.add(glosario, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 100, -1, -1));
        panelPrincipal.add(glosario1, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 100, 40, -1));
        panelPrincipal.add(glosario2, new org.netbeans.lib.awtextra.AbsoluteConstraints(184, 100, 120, -1));

        norma.setText("Norma");
        panelPrincipal.add(norma, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 100, -1, -1));
        panelPrincipal.add(norma1, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 100, 40, -1));
        panelPrincipal.add(norma2, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 100, 120, -1));

        archivoConScript.setText("Archivo con el script");
        panelPrincipal.add(archivoConScript, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 140, -1, -1));
        panelPrincipal.add(direccionArchivo, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 140, 540, -1));
        panelPrincipal.add(seleccionArchivo, new org.netbeans.lib.awtextra.AbsoluteConstraints(690, 140, 40, 20));

        resultadoValidacion.setText("Resultado Validación");
        panelPrincipal.add(resultadoValidacion, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 330, 140, 30));

        scriptArea.setColumns(20);
        scriptArea.setRows(5);
        jScrollPane2.setViewportView(scriptArea);

        panelPrincipal.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 200, 540, 100));

        script.setText("Script");
        panelPrincipal.add(script, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 200, -1, -1));

        getContentPane().add(panelPrincipal, java.awt.BorderLayout.CENTER);

        configuracion.setText("Configuración");
        menuBar.add(configuracion);

        setJMenuBar(menuBar);

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
            for (UIManager.LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    UIManager.setLookAndFeel(info.getClassName());
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

        /* Create and display the form */
        EventQueue.invokeLater(() -> {
            new FramePrincipal().setVisible(true);
        });
    }
}