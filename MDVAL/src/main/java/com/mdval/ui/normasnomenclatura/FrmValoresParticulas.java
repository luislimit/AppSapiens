package com.mdval.ui.normasnomenclatura;

import java.awt.Dimension;
import java.awt.Font;
import java.math.BigDecimal;
import java.util.Date;

import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.LayoutStyle;
import javax.swing.ListSelectionModel;
import javax.swing.WindowConstants;
import javax.swing.event.ListSelectionListener;

import com.mdval.bussiness.entities.TipoParticula;
import com.mdval.ui.listener.FrmValoresParticulasListener;
import com.mdval.ui.listener.tables.FrmValoresParticulasTableParticulasListener;
import com.mdval.ui.model.DefinicionTiposParticulaTableModel;
import com.mdval.ui.model.SiNoComboBoxModel;
import com.mdval.ui.model.ValoresParticulaTableModel;
import com.mdval.ui.model.cabeceras.Cabecera;
import com.mdval.ui.renderer.BigDecimalRenderer;
import com.mdval.ui.renderer.DateTimeRenderer;
import com.mdval.ui.renderer.StringRenderer;
import com.mdval.ui.utils.FrameSupport;
import com.mdval.ui.utils.MDValUIHelper;
import com.mdval.ui.utils.TableSupport;
import com.mdval.utils.MDValConstants;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author federico
 */
public class FrmValoresParticulas extends FrameSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8100226088814590344L;

	private JButton btnBuscar;
	
	@Getter
	private JButton btnAltaElemento;
	
	private JButton btnBajaElemento;
	
	@Getter
	private JButton btnModificacionElemento;
	
	private JLabel jLabel1;
	private JLabel jLabel2;
	private JLabel jLabel3;
	private JLabel jLabel4;
	private JLabel jLabel5;
	private JLabel jLabel6;
	private JLabel jLabel7;
	
	private JScrollPane jScrollPane1;
	private JScrollPane jScrollPane2;
	
	@Getter
	private TableSupport tblTiposParticula;
	
	@Getter
	private TableSupport tblValoresParticulas;
	
	@Getter
	private JComboBox<String> cmbProyecto;
	
	@Getter
	private JComboBox<String> cmbSubproyecto;
	
	@Getter
	private JTextField txtCodigo;
	
	@Getter
	private JTextField txtDescripcion;
	
	@Getter
	@Setter
	private TipoParticula seleccionada;
	
	@Getter
	private FrmValoresParticulasListener frmValoresParticulasListener;
	

	/**
	 * Creates new form DlgModificacionNormas
	 */
	public FrmValoresParticulas() {
		super();
	}

	protected void setupComponents() {

		jLabel1 = new JLabel();
        jLabel2 = new JLabel();
        jLabel3 = new JLabel();
        txtCodigo = new JTextField();
        txtDescripcion = new JTextField();
        jLabel4 = new JLabel();
        btnAltaElemento = new JButton();
        btnBajaElemento = new JButton();
        btnModificacionElemento = new JButton();
        jScrollPane1 = new JScrollPane();
        tblTiposParticula = new TableSupport(Boolean.FALSE);
        jLabel5 = new JLabel();
        jScrollPane2 = new JScrollPane();
        tblValoresParticulas = new TableSupport(Boolean.FALSE);
        jLabel6 = new JLabel();
        cmbProyecto = new JComboBox<>();
        jLabel7 = new JLabel();
        cmbSubproyecto = new JComboBox<>();
        btnBuscar = new JButton();

        setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        setMinimumSize(new Dimension(1366, 768));

        panelLogo.setPreferredSize(new Dimension(286, 63));

        GroupLayout panelLogoLayout = new GroupLayout(panelLogo);
        panelLogo.setLayout(panelLogoLayout);
        panelLogoLayout.setHorizontalGroup(
            panelLogoLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGap(0, 286, Short.MAX_VALUE)
        );
        panelLogoLayout.setVerticalGroup(
            panelLogoLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGap(0, 67, Short.MAX_VALUE)
        );

        jLabel1.setFont(new Font("Dialog", 1, 18)); // NOI18N
        txtCodigo.setPreferredSize(new Dimension(4, 27));

        txtDescripcion.setMinimumSize(new Dimension(4, 27));
        txtDescripcion.setPreferredSize(new Dimension(64, 27));

        btnAltaElemento.setPreferredSize(new Dimension(130, 27));

        btnBajaElemento.setPreferredSize(new Dimension(130, 27));

        jScrollPane1.setViewportView(tblTiposParticula);

        jScrollPane2.setViewportView(tblValoresParticulas);

        btnBuscar.setPreferredSize(new Dimension(130, 27));

        GroupLayout layout = new GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGroup(GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnAltaElemento, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnBajaElemento, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnModificacionElemento)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(panelLogo, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel1)
                        .addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel4)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addGap(10, 10, 10))
                            .addComponent(jLabel6))
                        .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                    .addComponent(cmbProyecto, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                    .addComponent(txtCodigo, GroupLayout.PREFERRED_SIZE, 212, GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 29, Short.MAX_VALUE)
                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel7)
                                    .addComponent(jLabel3))
                                .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING, false)
                                    .addComponent(txtDescripcion, GroupLayout.PREFERRED_SIZE, 304, GroupLayout.PREFERRED_SIZE)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(cmbSubproyecto, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(btnBuscar, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)))
                                .addGap(557, 557, 557))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(362, 362, 362)
                                .addComponent(jLabel5)
                                .addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1)
                        .addGap(18, 18, 18)
                        .addComponent(jScrollPane2)
                        .addContainerGap())))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                    .addComponent(panelLogo, GroupLayout.PREFERRED_SIZE, 67, GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtCodigo, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtDescripcion, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, GroupLayout.PREFERRED_SIZE, 27, GroupLayout.PREFERRED_SIZE))
                .addGap(10, 10, 10)
                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(cmbProyecto, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7)
                    .addComponent(cmbSubproyecto, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnBuscar, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5))
                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, GroupLayout.DEFAULT_SIZE, 259, Short.MAX_VALUE)
                    .addComponent(jScrollPane2, GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                    .addComponent(btnModificacionElemento)
                    .addComponent(btnBajaElemento, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnAltaElemento, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
    }
	
	@Override
	protected void setupLiterals() {
		setTitle(literales.getLiteral("frmValoresParticulas.titulo"));
		
		jLabel1.setText(literales.getLiteral("frmValoresParticulas.titulo"));
        jLabel2.setText(literales.getLiteral("frmValoresParticulas.codigo"));
        jLabel3.setText(literales.getLiteral("frmValoresParticulas.descripcion"));
        jLabel4.setText(literales.getLiteral("frmValoresParticulas.tiposParticulas"));
        jLabel5.setText(literales.getLiteral("frmValoresParticulas.valoresPosibles"));
        jLabel6.setText(literales.getLiteral("frmValoresParticulas.proyecto"));
        jLabel7.setText(literales.getLiteral("frmValoresParticulas.subproyecto"));
        
        btnBuscar.setText(literales.getLiteral("frmValoresParticulas.buscar"));
        btnAltaElemento.setText(literales.getLiteral("frmValoresParticulas.alta"));
        btnBajaElemento.setText(literales.getLiteral("frmValoresParticulas.baja"));
        btnModificacionElemento.setText(literales.getLiteral("frmValoresParticulas.modificacion"));
	}

	@Override
	protected void initEvents() {
		frmValoresParticulasListener = new FrmValoresParticulasListener(this);
		ListSelectionListener listSelectionListenerTiposParticula = new FrmValoresParticulasTableParticulasListener(this);
		
		btnBuscar.setActionCommand(MDValConstants.FRM_VALORES_PARTICULAS_BTN_BUSCAR);
		btnAltaElemento.setActionCommand(MDValConstants.FRM_VALORES_PARTICULAS_BTN_ALTA);
		btnModificacionElemento.setActionCommand(MDValConstants.FRM_VALORES_PARTICULAS_BTN_MODIFICACION);
		
		btnBuscar.addActionListener(frmValoresParticulasListener);
		btnAltaElemento.addActionListener(frmValoresParticulasListener);
		btnModificacionElemento.addActionListener(frmValoresParticulasListener);
		
		ListSelectionModel rowSMParticulas = tblTiposParticula.getSelectionModel();
		rowSMParticulas.addListSelectionListener(listSelectionListenerTiposParticula);
	}

	@Override
	protected void initialState() {
		cmbProyecto.setSelectedItem(MDValConstants.NO);
		cmbSubproyecto.setSelectedItem(MDValConstants.NO);	
		btnBajaElemento.setEnabled(Boolean.FALSE);
		btnModificacionElemento.setEnabled(Boolean.FALSE);
	}

	@Override
	protected void initModels() {
		tblTiposParticula.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblTiposParticula.setDefaultRenderer(Date.class, new DateTimeRenderer());
		tblTiposParticula.setDefaultRenderer(BigDecimal.class, new BigDecimalRenderer());
		tblTiposParticula.setDefaultRenderer(String.class, new StringRenderer());
		
		tblValoresParticulas.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblValoresParticulas.setDefaultRenderer(Date.class, new DateTimeRenderer());
		tblValoresParticulas.setDefaultRenderer(BigDecimal.class, new BigDecimalRenderer());
		tblValoresParticulas.setDefaultRenderer(String.class, new StringRenderer());
		
		Cabecera cabeceraTiposParticulas = MDValUIHelper.createCabeceraTabla(MDValConstants.FRM_DEFINICION_TIPOS_PARTICULA_TABLA_TIPOS_CABECERA);
		tblTiposParticula.setModel(new DefinicionTiposParticulaTableModel(cabeceraTiposParticulas.getColumnIdentifiers(), cabeceraTiposParticulas.getColumnClasses()));
		tblTiposParticula.setColumnWidths(cabeceraTiposParticulas);
	
		Cabecera cabeceraValoresParticula = MDValUIHelper.createCabeceraTabla(MDValConstants.FRM_VALORES_PARTICULAS_CABECERA);
		tblValoresParticulas.setModel(new ValoresParticulaTableModel(cabeceraValoresParticula.getColumnIdentifiers(), cabeceraValoresParticula.getColumnClasses()));
		tblValoresParticulas.setColumnWidths(cabeceraValoresParticula);
		
		cmbProyecto.setModel(new SiNoComboBoxModel());
		cmbSubproyecto.setModel(new SiNoComboBoxModel());	
	}

	@Override
	protected void initMenuBar() {
		// TODO Auto-generated method stub
		
	}
}
