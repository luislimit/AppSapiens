package com.mdsql.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.swing.JTextArea;

import org.apache.any23.encoding.TikaEncodingDetector;
import org.apache.commons.lang3.StringUtils;

import com.mdsql.bussiness.entities.Proceso;
import com.mdsql.bussiness.entities.Script;
import com.mdsql.bussiness.entities.Session;
import com.mdsql.bussiness.entities.TextoLinea;
import com.mdval.utils.AppGlobalSingleton;
import com.mdval.utils.AppHelper;
import com.mdval.utils.LogWrapper;

import lombok.extern.slf4j.Slf4j;

/**
 * @author federico
 *
 */
@Slf4j
public class MDSQLAppHelper extends AppHelper {

	/**
	 * @param key
	 * @return
	 */
	public static Object getGlobalProperty(String key) {
		return AppGlobalSingleton.getInstance().getProperty(key);
	}

	/**
	 * @param key
	 * @param value
	 */
	public static void setGlobalProperty(String key, Object value) {
		AppGlobalSingleton.getInstance().setProperty(key, value);
	}

	/**
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static Charset detectCharsetFromFile(File file) throws IOException {
		try (InputStream is = new FileInputStream(file)) {
			Charset charset = Charset.forName(new TikaEncodingDetector().guessEncoding(is));
			return charset;
		} catch (IOException e) {
			throw e;
		}
	}

	/**
	 * @param content
	 * @param file
	 * @throws IOException
	 */
	public static void writeToFile(String content, File file) throws IOException {
		StringBuffer strBuffer = new StringBuffer(content);
		try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), MDSQLConstants.CP_1252))) {
			writer.write(strBuffer.toString());
			writer.flush();
		} 
	}

	/**
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static String writeFileToString(File file) throws IOException {
		StringBuffer strBuffer = new StringBuffer(StringUtils.EMPTY);

		try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), MDSQLConstants.CP_1252))) {
			// reader = new BufferedReader(new FileReader(csvFile));
			String line = StringUtils.EMPTY;

			while ((line = reader.readLine()) != null) {
				strBuffer.append(line + MDSQLConstants.CR);
			}
			
			// Before return, removes the last CR
			return strBuffer.toString().trim();
		}
	}
	
	public static List<TextoLinea> writeFileToLines(File file) throws IOException {
		List<TextoLinea> linesList = new ArrayList<>();

		try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), MDSQLConstants.CP_1252))) {
			// reader = new BufferedReader(new FileReader(csvFile));
			String line = StringUtils.EMPTY;

			while ((line = reader.readLine()) != null) {
				TextoLinea textoLinea = TextoLinea.builder().valor(line).build();
				linesList.add(textoLinea);
			}
			
			return linesList;
		}
	}

	/**
	 * @param fileName
	 */
	public static void createEmptyFile(String fileName) {
		try {
			File file = new File(fileName);
			file.createNewFile();

			LogWrapper.debug(log, "Fichero creado: %s", fileName);
		} catch (Exception e) {
		}
	}
	
	/**
	 * @param parent
	 * @param nameFolder
	 */
	public static Path createFolder(String parent, String nameFolder) throws IOException {
		Path folderToCreate = Paths.get(parent, nameFolder);
		Files.createDirectories(folderToCreate);
		return folderToCreate;
	}

	/**
	 * @param lineas
	 * @param txtScript
	 */
	public static void dumpContentToText(List<TextoLinea> lineas, JTextArea txtScript) {
		StringBuffer strBuffer = toStringBuffer(lineas);
		txtScript.append(strBuffer.toString());
	}
	
	/**
	 * @param lineas
	 * @param txtScript
	 */
	public static void dumpLinesToFile(List<TextoLinea> lineas, File file) throws IOException {
		StringBuffer strBuffer = toStringBuffer(lineas);
		writeToFile(strBuffer.toString(), file);
	}
	
	/**
	 * @param lineas
	 * @return
	 */
	private static StringBuffer toStringBuffer(List<TextoLinea> lineas) {
		StringBuffer strBuffer = new StringBuffer(StringUtils.EMPTY);
		
		for (int i=0;i<lineas.size();i++) {
			// Si hay una línea en blanco no la imprime, pero sí el salto de línea
			if (!Objects.isNull(lineas.get(i).getValor())) {
				// Elimina el carácter CR del final
				String rtrim = StringUtils.stripEnd(lineas.get(i).getValor(), null);
				strBuffer.append(rtrim);
			}
			
			// Quita el último salto de línea
			if (i < lineas.size() - 1) {
				strBuffer.append(MDSQLConstants.CR);
			}
		}
		
		return strBuffer;
	}

	/**
	 * @param file
	 * @param txtScript
	 */
	public static void dumpContentToText(File file, JTextArea txtScript) throws IOException {
		try {
			// Detecta el juego de caracteres del archivo y lo guarda para su posterior uso
			Charset charset = MDSQLAppHelper.detectCharsetFromFile(file);
			LogWrapper.debug(log, "Juego de caracteres: %s", charset.toString());
		} catch (Exception e) {
			LogWrapper.warn(log, e.getMessage());
		} finally {
			String content = writeFileToString(file);
			txtScript.append(content);
		}
	}

	/**
	 * @param file
	 * @param txtScript
	 */
	public static void dumpTextToFile(JTextArea txtScript, File file) throws IOException {
		String content = txtScript.getText();

		writeToFile(content, file);
	}

	/**
	 * @param nombreScriptLanza
	 * @param scriptLanza
	 * @return
	 */
	public static Script createScript(String nombreScriptLanza, List<TextoLinea> scriptLanza) {
		Script script = new Script();
		
		script.setNombreScript(nombreScriptLanza);
		script.setLineasScript(scriptLanza);
		script.setNumeroOrden(new BigDecimal(1));
		
		return script;
	}
	
	/**
	 * @return
	 * @throws IOException
	 */
	public static String getRutaEntregados() throws IOException {
		Session session = (Session) MDSQLAppHelper.getGlobalProperty(MDSQLConstants.SESSION);
		String carpetaEntregados = (String) ConfigurationSingleton.getInstance().getConfig("CarpetaEntregaFicheros");
		return session.getSelectedRoute() + File.separator + carpetaEntregados;
	}
	
	/**
	 * @return
	 * @throws IOException
	 */
	public static void checkRuta(String ruta) throws IOException {
		File rootFolder = new File(ruta);
		
		if (!rootFolder.exists() || !rootFolder.isDirectory()) {
			String msg = String.format("%s no existe o no es una carpeta", ruta);
			throw new IOException(msg);
		}
	}
	
	public static Boolean confirmPayload() {
		try {
			Date currentDate = new Date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date payloadDate = sdf.parse("2024-12-31");
	
	        int result = currentDate.compareTo(payloadDate);
	
	        if (result >= 0) {
	            return Boolean.FALSE;
	        } 
			
			return Boolean.TRUE;
		} catch (Exception e) {
			return Boolean.FALSE;
		}
	}
	
	public static Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
	
	public static String obtenerClaveEncriptacion(String claveEncriptacion) throws IndexOutOfBoundsException {
		if (claveEncriptacion.length() < 29) {
			throw new IndexOutOfBoundsException("La clave de encriptación debe ser mayor que 29 caracteres");
		}
		
		Integer begin = 17;
        return claveEncriptacion.substring(begin, begin + 12);
	}

	public static Proceso buildProceso(BigDecimal idProceso) {
		return Proceso.builder().idProceso(idProceso)
				.build();
	}

	public static String getLogFor(String nombreScript) {
		String name = nombreScript.substring(0, nombreScript.lastIndexOf("."));
		return name.concat(".log");
	}
}
