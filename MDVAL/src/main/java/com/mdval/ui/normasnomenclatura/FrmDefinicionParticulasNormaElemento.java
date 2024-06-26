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
import javax.swing.LayoutStyle;
import javax.swing.ListSelectionModel;
import javax.swing.WindowConstants;

import com.mdval.bussiness.entities.Norma;
import com.mdval.bussiness.entities.TipoElemento;
import com.mdval.ui.listener.FrmDefinicionParticulasNormaElementoListener;
import com.mdval.ui.model.DefinicionParticulasNormaTableModel;
import com.mdval.ui.model.cabeceras.Cabecera;
import com.mdval.ui.renderer.BigDecimalRenderer;
import com.mdval.ui.renderer.DateTimeRenderer;
import com.mdval.ui.renderer.NormaRenderer;
import com.mdval.ui.renderer.StringRenderer;
import com.mdval.ui.renderer.TipoElementoRenderer;
import com.mdval.ui.utils.FrameSupport;
import com.mdval.ui.utils.MDValUIHelper;
import com.mdval.ui.utils.TableSupport;
import com.mdval.utils.MDValConstants;

import lombok.Getter;

/**
 *
 * @author federico
 */
public class FrmDefinicionParticulasNormaElemento extends FrameSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2110354253097934526L;

	private JButton btnBuscar;
	
	private JLabel jLabel1;
	private JLabel jLabel2;
	private JLabel jLabel3;
	
	private JScrollPane jScrollPane1;
	
	@Getter
	private TableSupport tblParticulas;
	
	@Getter
	private JComboBox<TipoElemento> cmbElemento;
	
	@Getter
	private JComboBox<Norma> cmbNorma;

	/**
	 * Creates new form DlgDefinicionNormas
	 */
	public FrmDefinicionParticulasNormaElemento() {
		super();
	}

	/**
	 *
	 */
	protected void setupComponents() {

		jLabel1 = new JLabel();
		jLabel2 = new JLabel();
		btnBuscar = new JButton();
		jScrollPane1 = new JScrollPane();
		tblParticulas = new TableSupport(Boolean.FALSE);
		cmbNorma = new JComboBox<>();
		jLabel3 = new JLabel();
		cmbElemento = new JComboBox<>();

		setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);

		panelLogo.setPreferredSize(new Dimension(286, 63));

		GroupLayout panelLogoLayout = new GroupLayout(panelLogo);
		panelLogo.setLayout(panelLogoLayout);
		panelLogoLayout.setHorizontalGroup(
				panelLogoLayout.createParallelGroup(GroupLayout.Alignment.LEADING).addGap(0, 286, Short.MAX_VALUE));
		panelLogoLayout.setVerticalGroup(
				panelLogoLayout.createParallelGroup(GroupLayout.Alignment.LEADING).addGap(0, 63, Short.MAX_VALUE));

		jLabel1.setFont(new Font("Dialog", 1, 18)); // NOI18N

		jScrollPane1.setViewportView(tblParticulas);

		cmbNorma.setPreferredSize(new Dimension(67, 27));

		cmbElemento.setPreferredSize(new Dimension(67, 27));

		GroupLayout layout = new GroupLayout(getContentPane());
		getContentPane().setLayout(layout);
		layout.setHorizontalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
				.addGroup(layout.createSequentialGroup().addContainerGap()
						.addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING).addComponent(jScrollPane1)
								.addGroup(layout.createSequentialGroup()
										.addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
												.addGroup(layout.createSequentialGroup()
														.addComponent(panelLogo, GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
														.addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
														.addComponent(jLabel1))
												.addGroup(layout.createSequentialGroup().addGap(25, 25, 25)
														.addComponent(jLabel2)
														.addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
														.addComponent(cmbNorma, GroupLayout.PREFERRED_SIZE, 250,
																GroupLayout.PREFERRED_SIZE)
														.addGap(111, 111, 111).addComponent(jLabel3)
														.addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
														.addComponent(cmbElemento, GroupLayout.PREFERRED_SIZE, 250,
																GroupLayout.PREFERRED_SIZE)))
										.addGap(0, 245, Short.MAX_VALUE))
								.addGroup(GroupLayout.Alignment.TRAILING,
										layout.createSequentialGroup().addGap(0, 0, Short.MAX_VALUE).addComponent(
												btnBuscar, GroupLayout.PREFERRED_SIZE, 108,
												GroupLayout.PREFERRED_SIZE)))
						.addContainerGap()));
		layout.setVerticalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
				.addGroup(layout.createSequentialGroup().addContainerGap()
						.addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
								.addComponent(panelLogo, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
										GroupLayout.PREFERRED_SIZE)
								.addComponent(jLabel1))
						.addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
						.addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE).addComponent(jLabel2)
								.addComponent(cmbNorma, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
										GroupLayout.PREFERRED_SIZE)
								.addComponent(jLabel3).addComponent(cmbElemento, GroupLayout.PREFERRED_SIZE,
										GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
						.addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED).addComponent(btnBuscar)
						.addGap(18, 18, 18).addComponent(jScrollPane1, GroupLayout.DEFAULT_SIZE, 447, Short.MAX_VALUE)
						.addContainerGap()));
	}
	
	@Override
	protected void setupLiterals() {
		setTitle(literales.getLiteral("frmDefinicionParticulasNormaElemento.titulo"));
		
		jLabel1.setText(literales.getLiteral("frmDefinicionParticulasNormaElemento.titulo"));
		jLabel2.setText(literales.getLiteral("frmDefinicionParticulasNormaElemento.norma"));
		jLabel3.setText(literales.getLiteral("frmDefinicionParticulasNormaElemento.elemento"));

		btnBuscar.setText(literales.getLiteral("frmDefinicionParticulasNormaElemento.buscar"));
	}

	@Override
	protected void initEvents() {
		FrmDefinicionParticulasNormaElementoListener listener = new FrmDefinicionParticulasNormaElementoListener(this);
		
		btnBuscar.setActionCommand(MDValConstants.FRM_DEFINICION_PARTICULAS_NORMA_BTN_BUSCAR);
		
		btnBuscar.addActionListener(listener);
		
		this.addOnLoadListener(listener);
	}

	@Override
	protected void initialState() {}

	@Override
	protected void initModels() {
		tblParticulas.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tblParticulas.setDefaultRenderer(Date.class, new DateTimeRenderer());
		tblParticulas.setDefaultRenderer(BigDecimal.class, new BigDecimalRenderer());
		tblParticulas.setDefaultRenderer(String.class, new StringRenderer());
		
		Cabecera cabeceraElementos = MDValUIHelper.createCabeceraTabla(MDValConstants.FRM_DEFINICION_PARTICULAS_NORMA_CABECERA);
		tblParticulas.setModel(new DefinicionParticulasNormaTableModel(cabeceraElementos.getColumnIdentifiers(), cabeceraElementos.getColumnClasses()));
	
		cmbElemento.setRenderer(new TipoElementoRenderer());
		cmbNorma.setRenderer(new NormaRenderer());
	}

	@Override
	protected void initMenuBar() {
		// TODO Auto-generated method stub
		
	}
}
