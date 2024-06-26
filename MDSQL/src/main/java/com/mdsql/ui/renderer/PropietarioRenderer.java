package com.mdsql.ui.renderer;

import java.awt.Component;
import java.util.Objects;

import javax.swing.JList;
import javax.swing.plaf.basic.BasicComboBoxRenderer;

import org.apache.commons.lang3.StringUtils;

import com.mdsql.bussiness.entities.Propietario;

public class PropietarioRenderer extends BasicComboBoxRenderer {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3517770689739103773L;

	@SuppressWarnings("rawtypes")
	public Component getListCellRendererComponent(JList list, Object value, int index, boolean isSelected,
			boolean cellHasFocus) {
		super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);

		Propietario propietario = (Propietario) value;

		if (Objects.isNull(propietario)) {
			setText(StringUtils.EMPTY);
		} else {
			setText(propietario.getDesPropietario());
		}
		return this;
	}
}
