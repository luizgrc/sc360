package com.sc360.struts.jdbc.conexion;

import java.io.InputStream;
import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.ResourceBundle;


public class Utils 
{
  
  public static String getValueEntryPropertiesInClassPath(String propertiesFileName, String key) throws Exception
  {
                Properties prop = new Properties();
		InputStream input = null;
		
		input = Utils.class.getClassLoader().getResourceAsStream(propertiesFileName);

		if (input == null) {
                            throw new Exception("El archivo " + propertiesFileName + " no se encuentra en el classpath.");
		}

		// load a properties file
		prop.load(input);
    
    return prop.getProperty(key);
    
  }
  
  public static String getValueEntryFromExternalProperties(String key) throws Exception 
  { 
    String rutaExternalProperties = "";
    String nombreArchivoProperties = "";
    ResourceBundle rb;
    try {
      //rutaExternalProperties = getValueEntryPropertiesInClassPath("sc360.properties", "ruta_carpeta_properties_externo");
      nombreArchivoProperties = getValueEntryPropertiesInClassPath("sc360.properties", "nombre_properties_externo");
      File file = new File(nombreArchivoProperties);
      URL[] urls = {file.toURI().toURL()};
      ClassLoader loader = new URLClassLoader(urls);
      rb = ResourceBundle.getBundle(nombreArchivoProperties, Locale.getDefault(), loader);
    } catch (Exception e) {
      System.out.println("No se encontro el archivo " + rutaExternalProperties + "\\" + nombreArchivoProperties + ".properties");
      throw e;
    }
    return rb.getString(key);
  }
  
  
  
}