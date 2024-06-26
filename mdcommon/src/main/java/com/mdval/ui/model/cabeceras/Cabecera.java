package com.mdval.ui.model.cabeceras;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.mdval.utils.LiteralesSingleton;
import com.mdval.utils.LogWrapper;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

/**
 * @author federico
 *
 */
@Slf4j
public abstract class Cabecera {
	
	protected LiteralesSingleton literales;
	
	@Getter
	protected List<String> columnIdentifiers;
	
	@Getter
	protected List<Class<?>> columnClasses;
	
	@Getter
	protected List<Integer> columnSizes;
	
	/**
	 * 
	 */
	public Cabecera() {
		super();
		
		initialize();
	}
	
	/**
	 * 
	 */
	private void initialize() {
		try {
			literales = LiteralesSingleton.getInstance();
			
			columnIdentifiers = new ArrayList<>();
			columnClasses = new ArrayList<>();
			columnSizes = new ArrayList<>();
			
			setupCabecera();
		} catch (IOException e) {
			LogWrapper.error(log,  "ERROR:", e);
		}
	}
	
	/**
	 * 
	 */
	public abstract void setupCabecera();
	
	/**
	 * @param index
	 * @return
	 */
	public String getIdentifierAt(Integer index) {
		return columnIdentifiers.get(index);
	}
	
	/**
	 * @param index
	 * @return
	 */
	public Class<?> getClassAt(Integer index) {
		return columnClasses.get(index);
	}
	
	/**
	 * @param index
	 * @return
	 */
	public Integer getSizeColumn(Integer index) {
		return columnSizes.get(index);
	}
}
