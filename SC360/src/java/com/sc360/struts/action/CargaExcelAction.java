/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.sc360.struts.dto.Archivo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import java.io.File;
import java.io.FileOutputStream;

import com.sc360.struts.form.CargaArchivosForm;
import com.sc360.struts.dto.Solicitud;
import com.sc360.struts.dto.TipoArchivo;
import com.sc360.struts.dto.Beneficiario;
import com.sc360.struts.dto.SEYCI;
import com.sc360.struts.dto.Nomina;
import com.sc360.struts.jdbc.dao.IfaceSolicitud;
import com.sc360.struts.jdbc.dao.IfaceUtil;
import com.sc360.struts.jdbc.dao.ImpSolicitud;
import com.sc360.struts.jdbc.dao.ImpUtil;

import java.io.ByteArrayInputStream;
import java.util.Iterator;
import org.apache.struts.upload.FormFile;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


import java.io.FileInputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.io.BufferedReader;
import java.util.Vector;
import java.util.stream.Stream;
import java.util.Calendar;
import java.io.PrintWriter;
import java.io.OutputStreamWriter;
import javax.servlet.ServletOutputStream;
import java.util.StringTokenizer;


/**
 *
 * @author Elgar Eduardo Puma Cruz
 */
public class CargaExcelAction extends DispatchAction{
    
 
    public ActionForward inicio(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)
        throws Exception
    {
        System.out.println(" Entro Metodo Inicio ");
        
        
        IfaceUtil daoUtil = new ImpUtil();
        
        List<TipoArchivo> listTipoArchivo = daoUtil.tiposArchivoQry();
        
        CargaArchivosForm forma = (CargaArchivosForm) form;
        forma.setTipoArchivo(null);
        String tipoArchivo = forma.getTipoArchivo();
        String palabra     = "null";
        
        System.out.println(" tipoArchivo " + tipoArchivo);
        
        boolean bError = isnull(tipoArchivo);
        
        if(Boolean.TRUE){
        
           tipoArchivo = "0";
        }
         
        Archivo archivo = new Archivo();
        archivo.setTipoArchivo(Integer.parseInt(tipoArchivo));
        
        List<Archivo> listCarga = daoUtil.ListadoCarga(archivo);
               
        System.out.println(" Tamanio de Archivos Cargados " + listCarga.size());
        
        if (listTipoArchivo != null) {
                    req.setAttribute("listTipoArchivo", listTipoArchivo);
                }
        
        if (listCarga != null) {
                    req.setAttribute("listCarga", listCarga);
        }
        
     
        return mapping.findForward("success");
    } 
    
    public ActionForward cargaExcel(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)
        throws Exception
    {
             System.out.println(" Entro Metodo Carga Excel ");
             System.out.println(" Leyendo Excel ");
             HttpSession sesion=req.getSession();
             IfaceSolicitud daoSolicitud = new ImpSolicitud();
             IfaceUtil daoUtil = new ImpUtil();
             String ruta ="";
             CargaArchivosForm forma = (CargaArchivosForm) form;
             FormFile myFile = forma.getArchivo();
             String tipoArchivo = forma.getTipoArchivo();
             System.out.println(" Tipo Archivo  " + tipoArchivo);
             System.out.println(myFile.getFileName());
             byte[] fileData = myFile.getFileData();
             int cantidad = 0;
             int cantidadErrados =0;
             int n = 0;
             String primerApellido  = ""; 
             String segundoApellido = ""; 
             String primerNombre    = "";
             String segundoNombre   = "";
             String cinco = "";
             String seis  = "";
             
             
             //GUARDAR DATOS DEL ARCHIVO
             Archivo archivo = new Archivo();
             
             archivo.setTipoArchivo(Integer.parseInt(tipoArchivo));
             archivo.setNombreArchivo(myFile.getFileName());
             archivo.setEstadoCarga("I");
             archivo.setCantidad(cantidad);
             archivo.setCantidadErrados(0);
             
             daoUtil.insertarDataCarga(archivo);
             
             List<TipoArchivo> listTipoArchivo = daoUtil.tiposArchivoQry();
         
             if (listTipoArchivo != null) {
                    req.setAttribute("listTipoArchivo", listTipoArchivo);
                }
             
             //String ruta=sesion.getServletContext().getRealPath("/")+"/archivos/"+myFile.getFileName();
             //ARCHIVO DE SOLICITUDES
             if(tipoArchivo.equals("1")){
                  
                   System.out.println(" Archivo de Solicitudes  " + tipoArchivo);
             
                    try {
                        //guarda los datos del fichero
                        InputStream stream = myFile.getInputStream();
                        InputStreamReader isr= new InputStreamReader(stream,"ISO-8859-1");
                        //BufferedReader buffer= new BufferedReader(isr);

                        ruta=sesion.getServletContext().getRealPath("/")+"/archivos/"+myFile.getFileName();
                        FileOutputStream os = new FileOutputStream(new File(ruta));
                            byte[] buffer = new byte[8192];
                            int bytesLeidos = 0;
                            while ((bytesLeidos = stream.read(buffer, 0, 8192)) != -1) {
                                os.write(buffer, 0, bytesLeidos );
                            }
                            os.close();
                            os.flush();
                        }catch(Exception e)
                        {
                          e.printStackTrace();
                        }
                    
                    try {
      
                        File file=new File(ruta);
                        //BufferedReader entrada = new BufferedReader( new FileReader( file ) );

                        FileInputStream fis = new FileInputStream(ruta);
                        InputStreamReader is = new InputStreamReader(fis, "ISO-8859-1");
                        BufferedReader entrada = new BufferedReader(is);
                    
                        int numLineas=9;
                        int contador=0;

                        String datos []=new String [numLineas];
                        String[] cad;
                        String cadenaCsv="";

                        String linea = entrada.readLine();
                    
                        while (linea != null && contador<numLineas)
                        {
                          datos[contador]=linea;
                          linea = entrada.readLine();
                          contador++;
                        }
                     
                         contador++;
                     
                        do{
                            try{
                               linea = entrada.readLine();
                               if (linea == null){
                                   break;
                               }    
                                else
                                {
                                 contador++;
                                 System.out.println(String.valueOf(contador)+": "+linea);
                                 cad=linea.split(";");
                                 System.out.println("Tamaño :"+cad.length);

                                 Solicitud solicitud = new Solicitud();
                                
                                    if(cad.length==0 || cad.length==2){

                                       System.out.println("EL Numero de  Linea "+String.valueOf(contador)+ " No se Puede Insertar" + linea);
                                       String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                       archivo.setDescripcionError(mensaje);
                                       daoUtil.insertarLineaError(archivo);
                                       cantidadErrados++;
                                    }
                                
                                    else if(cad.length==96){
                                    String PrimerCampo          = cad[0];
                                    String Cuspp                = cad[1];
                                    solicitud.setCuspp(Cuspp);
                                    String Expediente           = cad[2];
                                    solicitud.setExpediente(Expediente);
                                    String Afiliado             = cad[3];
                                    solicitud.setAfiliado(Afiliado);
                                    
                                    String[] parts = Afiliado.split(" ");
                                    
                                    if(parts.length==3){
                                    
                                    primerApellido  = parts[0]; 
                                    solicitud.setPrimerApellido(primerApellido);
                                    segundoApellido = parts[1]; 
                                    solicitud.setSegundoApellido(segundoApellido);
                                    primerNombre    = parts[2];
                                    solicitud.setPrimerNombre(primerNombre);
                                    segundoNombre   = "";
                                    solicitud.setSegundoNombre(segundoNombre);
                                    }
                                    
                                    else if(parts.length==4){
                                    
                                    primerApellido  = parts[0]; 
                                    solicitud.setPrimerApellido(primerApellido);
                                    segundoApellido = parts[1]; 
                                    solicitud.setSegundoApellido(segundoApellido);
                                    primerNombre    = parts[2];
                                    solicitud.setPrimerNombre(primerNombre);
                                    segundoNombre   = parts[3];
                                    solicitud.setSegundoNombre(segundoNombre);
                                    
                                    }
                                    
                                    else if(parts.length==6){
                                        
                                    StringTokenizer stk=new StringTokenizer(Afiliado,"");
                                    
                                    while(stk.hasMoreTokens()) {
                                        String valor=stk.nextToken();
                                        System.out.println (valor);
                                        int index = Afiliado.indexOf(" ");
                                        primerApellido = valor.substring(0,index);
                                        String nuevaCadena = valor.substring(index+1,valor.length());
                                        int index2 = nuevaCadena.indexOf(" ");
                                        segundoApellido = nuevaCadena.substring(0,index2);
                                        String nuevaCadena1 = nuevaCadena.substring(index2+1,nuevaCadena.length());
                                        int index3 = nuevaCadena1.indexOf(" ");
                                        primerNombre = nuevaCadena1.substring(0,index3);
                                        String nuevaCadena2 = nuevaCadena1.substring(index3+1,nuevaCadena1.length());
                                        int index4 = nuevaCadena2.indexOf(" ");
                                        segundoNombre = nuevaCadena2.substring(0,nuevaCadena2.length());
                                        
                                        String []arreglo = {"LA", "DE", "DE LAS", "DEL", "DE LA", "DE LOS", "VDA", "VIUDA", "VDA DE", "VIUDA DE"};
                                        boolean buu = false;
                                        int n1; 
                                        int n2;
                                        
                                        for(n1 = 0; n1 < arreglo.length; n1++)
                                         { 
                                            if (primerApellido.equals(arreglo[n1]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    primerApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if (segundoApellido.equals(arreglo[n1]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    segundoApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if(primerNombre.equals(arreglo[n1])){
                                        
                                                segundoApellido = segundoApellido + " " + primerNombre;
                                                buu = true;
                                                primerNombre = "";
                                            }
                                         }
                                        
                                          System.out.println(" PA "+ primerApellido + " SA " + segundoApellido + " PN" + primerNombre + " SN " + segundoNombre);
                                        
                                        
                                          String CadenaX = segundoNombre;
                                          int index_1 = CadenaX.indexOf(" ");
                                          primerNombre = CadenaX.substring(0,index_1);
                                          segundoNombre = CadenaX.substring(index_1+1,CadenaX.length());
                                          
                                          System.out.println(" PA "+ primerApellido + " SA " + segundoApellido + " PN" + primerNombre + " SN " + segundoNombre);
                                        

                                          for(n2 = 0; n2 < arreglo.length; n2++)
                                         { 
                                            if (primerApellido.contains(arreglo[n2]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    primerApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if (segundoApellido.contains(arreglo[n2]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    segundoApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                                    primerNombre = "";
                                            }
                                            
                                            if(primerNombre.contains(arreglo[n2])){
                                        
                                                segundoApellido = segundoApellido + " " + primerNombre;
                                                buu = true;
                                            }
                                         }
                                          
                                          String CadenaY = segundoNombre;
                                          int index_2 = CadenaY.indexOf(" ");
                                          primerNombre = CadenaY.substring(0,index_2);
                                          segundoNombre = CadenaY.substring(index_2+1,CadenaY.length());
                                        
                                        /*do{
                                            
                                            if(primerApellido.contains(arreglo.toString())){

                                                primerApellido = segundoApellido + primerNombre;
                                                buu = true;
                                            }
                                            
                                            if(segundoApellido.contains(arreglo.toString())){
                                        
                                               segundoApellido = segundoApellido + primerNombre;
                                               buu = true;
                                            }
                                         
                                            if(primerNombre.contains(arreglo.toString())){
                                        
                                                primerNombre = segundoApellido + primerNombre;
                                                buu = true;
                                            }

                                        }while(buu);*/
                                        
                                        /*if(primerApellido.contains(arreglo.toString())){
                                        
                                            primerApellido = segundoApellido + primerNombre;
                                            
                                        }
                                        
                                         if(segundoApellido.contains(arreglo.toString())){
                                        
                                            segundoApellido = segundoApellido + primerNombre;
                                            
                                        }
                                         
                                          if(primerNombre.contains(arreglo.toString())){
                                        
                                            primerNombre = segundoApellido + primerNombre;
                                            
                                        }*/
                                        
                                    }
                                    
                                    /*primerApellido  = parts[0]; 
                                    segundoApellido = parts[1]; 
                                    primerNombre    = parts[2];
                                    segundoNombre   = parts[3];
                                    cinco           = parts[4];
                                    seis            = parts[5];*/
                                    
                                    /*boolean valor=false;
                                    String []arreglo = {"LA", "DE", "DE LAS", "DEL", "DE LA", "DE LOS", "VDA", "VIUDA", "VDA DE", "VIUDA DE"};*/
                                        
                                    /*do{
                                        
                                        String []arreglo = {"LA", "DE", "DE LAS", "DEL", "DE LA", "DE LOS", "VDA", "VIUDA", "VDA DE", "VIUDA DE"};
                                        
                                        if(primerNombre.contains(arreglo.toString())){
                                        
                                            primerNombre = segundoApellido + primerNombre;
                                            valor = true;
                                        }
                                        
                                    }while(valor);*/
                                    /*int n1;
                                    for(n1 = 0; n1 < arreglo.length; n1++)
                                    { 
                                            if (primerNombre.equals(arreglo[n1]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    primerNombre = segundoApellido + " " + primerNombre;
                                                    valor = true;
                                            }
                                    }
                                    
                                    
                                    */
                                    
                                    solicitud.setPrimerApellido(primerApellido);
                                    solicitud.setSegundoApellido(segundoApellido);
                                    solicitud.setPrimerNombre(primerNombre);
                                    solicitud.setSegundoNombre(segundoNombre);
                                    
                                    }
                                    
                                    
                                    
                                    
                                    String EstadoCuenta         = cad[4];
                                    solicitud.setEstadoCuenta(EstadoCuenta);
                                    String CausalAfiliado       = cad[5];
                                    solicitud.setCausalAfiliado(CausalAfiliado);
                                    String PlanTramite          = cad[6];
                                    solicitud.setPlanTramite(PlanTramite);
                                    String AgenciaInicio        = cad[7];
                                    solicitud.setAgenciaInicio(AgenciaInicio);
                                    String Plan                 = cad[8];
                                    solicitud.setPlan(Plan);
                                    String Beneficio            = cad[9];
                                    solicitud.setBeneficio(Beneficio);
                                    String NroSolicitudFisico   = cad[10];
                                    solicitud.setNroSolicitudFisico(NroSolicitudFisico);
                                    String SolicitudSysde       = cad[11];
                                    solicitud.setSolicitudSysde(SolicitudSysde);
                                    String Etapa                = cad[12];
                                    solicitud.setEtapa(Etapa);
                                    String Estado               = cad[13];
                                    solicitud.setEstado(Estado);
                                    String Cobertura            = cad[14];
                                    solicitud.setCobertura(Cobertura);
                                    String CausalCobertura      = cad[15];
                                    solicitud.setCausalCobertura(CausalCobertura);
                                    String IndicadorTuitiva      = cad[16];
                                    solicitud.setIndicadorTuitiva(IndicadorTuitiva);
                                    String CiaProvisional        = cad[17];
                                    solicitud.setCiaProvisional(CiaProvisional);
                                    String FechaSiniestro        = cad[18];
                                    solicitud.setFechaSiniestro(FechaSiniestro);
                                    String FechaDevengue        = cad[19];
                                    solicitud.setFechaDevengue(FechaDevengue);
                                    String TipoPago             = cad[20];
                                    solicitud.setTipoPago(TipoPago);
                                    String FechaSeccionI        = cad[21];
                                    solicitud.setFechaSeccionI(FechaSeccionI);
                                    String CalculoExcedente     = cad[22];
                                    solicitud.setCalculoExcedente(CalculoExcedente);
                                    String RetiroAPV            = cad[23];
                                    solicitud.setRetiroAPV(RetiroAPV);
                                    String RetiroParcialTotal   = cad[24];
                                    solicitud.setRetiroParcialTotal(RetiroParcialTotal);
                                    String MontoRetiroAPV       = cad[25];
                                    solicitud.setMontoRetiroAPV(MontoRetiroAPV);
                                    String FechaSeccionII       = cad[26];
                                    solicitud.setFechaSeccionII(FechaSeccionII);
                                    String FechaImpSeccionII    = cad[27];
                                    solicitud.setFechaImpSeccionII(FechaImpSeccionII);
                                    String PensionPreliminar    = cad[28];
                                    solicitud.setPensionPreliminar(PensionPreliminar);
                                    String FechaElecMonSeccionII = cad[29];
                                    solicitud.setFechaElecMonSeccionII(FechaElecMonSeccionII);
                                    String MontoTipoActSeccionII = cad[30];
                                    solicitud.setMontoTipoActSeccionII(MontoTipoActSeccionII);
                                    String MontoBDRSeccionII = cad[31];
                                    solicitud.setMontoBDRSeccionII(MontoBDRSeccionII);
                                    String EstadoBDRSeccionII = cad[32];
                                    solicitud.setEstadoBDRSeccionII(EstadoBDRSeccionII);
                                    String DocCompletoSeccionII = cad[33];
                                    solicitud.setDocCompletoSeccionII(DocCompletoSeccionII);
                                    String PensionCalculada = cad[34];
                                    solicitud.setPensionCalculada(PensionCalculada);
                                    String PremAFP = cad[35];
                                    solicitud.setPremAFP(PremAFP);
                                    String PremCIASeguros = cad[36];
                                    solicitud.setPremCIASeguros(PremCIASeguros);
                                    String TipoCambioAA = cad[37];
                                    solicitud.setTipoCambioAA(TipoCambioAA);
                                    String CapitalRequeridoAA = cad[38];
                                    solicitud.setCapitalRequeridoAA(CapitalRequeridoAA);
                                    String ReservaGSAA = cad[39];
                                    solicitud.setReservaGSAA(ReservaGSAA);
                                    String CICInformadaAA = cad[40];
                                    solicitud.setCICInformadaAA(CICInformadaAA);
                                    String PensionDevengada = cad[41];
                                    solicitud.setPensionDevengada(PensionDevengada);
                                    String PensionPagadas = cad[42];
                                    solicitud.setPensionPagadas(PensionPagadas);
                                    String MontoAAMeller = cad[43];
                                    solicitud.setMontoAAMeller(MontoAAMeller);
                                    String FechaValorCuotaAA = cad[44];
                                    solicitud.setFechaValorCuotaAA(FechaValorCuotaAA);
                                    String CuotasAA = cad[45];
                                    solicitud.setCuotasAA(CuotasAA);
                                    String ValorCuotaAA = cad[46];
                                    solicitud.setValorCuotaAA(ValorCuotaAA);
                                    String FechaPagoAA = cad[47];
                                    solicitud.setFechaPagoAA(FechaPagoAA);
                                    String FechaAcreditacionAA = cad[48];
                                    solicitud.setFechaAcreditacionAA(FechaAcreditacionAA);
                                    String MontoBDRMeller = cad[49];
                                    solicitud.setMontoBDRMeller(MontoBDRMeller);
                                    String FechaValorCuotaBdr = cad[50];
                                    solicitud.setFechaValorCuotaBDR(FechaValorCuotaBdr);
                                    String CuotasBDR = cad[51];
                                    solicitud.setCuotasBDR(CuotasBDR);
                                    String ValorCuotaBDR = cad[52];
                                    solicitud.setValorCuotaBDR(ValorCuotaBDR);
                                    String FechaPagoBDR = cad[53];
                                    solicitud.setFechaPagoBDR(FechaPagoBDR);
                                    String FechaAcreditacionBDR = cad[54];
                                    solicitud.setFechaAcreditacionBDR(FechaAcreditacionBDR);
                                    String FechaSeccionIII = cad[55];
                                    solicitud.setFechaSeccionIII(FechaSeccionIII);
                                    String DevengueDefinitivo = cad[56];
                                    solicitud.setDevengueDefinitivo(DevengueDefinitivo);
                                    String CapitalPension = cad[57];
                                    solicitud.setCapitalPension(CapitalPension);
                                    String CICMeller = cad[58];
                                    solicitud.setCICMeller(CICMeller);
                                    String MontoAAMellerActualizado = cad[59];
                                    solicitud.setMontoAAMellerActualizado(MontoAAMellerActualizado);
                                    String MontoBDRMellerActualizado = cad[60];
                                    solicitud.setMontoBDRMellerActualizado(MontoBDRMellerActualizado);
                                    String FechaSeccionIV = cad[61];
                                    solicitud.setFechaSeccionIV(FechaSeccionIV);
                                    String FechaEleccionModalidad = cad[62];
                                    solicitud.setFechaEleccionModalidad(FechaEleccionModalidad);
                                    String CiaAsegurosAFP = cad[63];
                                    solicitud.setCiaAsegurosAFP(CiaAsegurosAFP);
                                    String NroCotizacion = cad[64];
                                    solicitud.setNroCotizacion(NroCotizacion);
                                    String Producto = cad[65];
                                    solicitud.setProducto(Producto);
                                    String MonedaProductoGanador = cad[66];
                                    solicitud.setMonedaProductoGanador(MonedaProductoGanador);
                                    String CaractMoneda = cad[67];
                                    solicitud.setCaractMoneda(CaractMoneda);
                                    String AnioRT = cad[68];
                                    solicitud.setAnioRT(AnioRT);
                                    String PorcRT = cad[69];
                                    solicitud.setPorcRT(PorcRT);
                                    String AnioPG = cad[70];
                                    solicitud.setAnioPG(AnioPG); 
                                    String PorcPG = cad[71];
                                    solicitud.setPorcPG(PorcPG);
                                    String DerechoCrecer = cad[72];
                                    solicitud.setDerechoCrecer(DerechoCrecer);
                                    String Grati = cad[73];
                                    solicitud.setGrati(Grati);
                                    String TasaInteresAFP = cad[74];
                                    solicitud.setTasaInteresAFP(TasaInteresAFP);
                                    String PensionBaseRT = cad[75];
                                    solicitud.setPensionBaseRT(PensionBaseRT);
                                    String TasaInteresCIASeguro = cad[76];
                                    solicitud.setTasaInteresCIASeguro(TasaInteresCIASeguro);
                                    String PensionBaseRVD = cad[77];
                                    solicitud.setPensionBaseRVD(PensionBaseRVD);
                                    String FechaNotificacion = cad[78];
                                    solicitud.setFechaNotificacion(FechaNotificacion);
                                    String FechaEmisionRecalculo = cad[79];
                                    solicitud.setFechaEmisionRecalculo(FechaEmisionRecalculo);
                                    
                                    String FechaRecepcionRecalculo = cad[80];
                                    solicitud.setFechaRecepcionRecalculo(FechaRecepcionRecalculo);
                                    String MontoTrxCiaSeguro = cad[81];
                                    solicitud.setMontoTrxCiaSeguro(MontoTrxCiaSeguro);
                                    String MontoPagoAfpRT = cad[82];
                                    solicitud.setMontoPagoAfpRT(MontoPagoAfpRT);
                                    String NuevaPensionRT = cad[83];
                                    solicitud.setNuevaPensionRT(NuevaPensionRT);
                                    String NuevaPensionBaseRVD = cad[84];
                                    solicitud.setNuevaPensionBaseRVD(NuevaPensionBaseRVD);
                                    String MtoTransPagado = cad[85];
                                    solicitud.setMtoTransPagado(MtoTransPagado);
                                    String FecTransferencia_FechaOperacion = cad[86];
                                    solicitud.setFecTransferencia_FechaOperacion(FecTransferencia_FechaOperacion);
                                    String MontoPagoGS = cad[87];
                                    solicitud.setMontoPagoGS(MontoPagoGS);
                                    String FecPagoGS = cad[88];
                                    solicitud.setFecPagoGS(FecPagoGS);
                                    String FecPrimerPago = cad[89];
                                    solicitud.setFecPrimerPago(FecPrimerPago);
                                    String MontoPrimerPago = cad[90];
                                    solicitud.setMontoPrimerPago(MontoPrimerPago);
                                    String FechaUltimoPago = cad[91];
                                    solicitud.setFechaUltimoPago(FechaUltimoPago);
                                    String IndicadorCargoCuenta = cad[92];
                                    solicitud.setIndicadorCargoCuenta(IndicadorCargoCuenta);
                                    String NumeroPoliza = cad[93];
                                    solicitud.setNumeroPoliza(NumeroPoliza);
                                    String FechaPoliza = cad[94];
                                    solicitud.setFechaPoliza(FechaPoliza);
                                    String IndicadorEndoso = cad[95];
                                    solicitud.setIndicadorEndoso(IndicadorEndoso);

                                    cantidad++;
                                    daoSolicitud.InsertarSolicitud(solicitud);

                                    }    
                           }
                           }catch(Exception e){
				System.out.println("Introduciste un dato erroneo.");
                                String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                archivo.setDescripcionError(mensaje);
                                daoUtil.insertarLineaError(archivo);
				cantidadErrados ++;
			   }
                    }while(true);
                     
                    
                }catch(Exception e)
                {
                    n=101;
                    e.printStackTrace();
                }
             
                //ACTULIZAR ESTADO DE LA CARGA
                archivo.setTipoArchivo(Integer.parseInt(tipoArchivo));
                archivo.setNombreArchivo(myFile.getFileName());
                archivo.setEstadoCarga("F");
                archivo.setCantidad(cantidad);
                archivo.setCantidadErrados(cantidadErrados);
                daoUtil.insertarDataCarga(archivo);

             }
             
             //ARCHIVO DE BENEFICIARIOS
             
             if(tipoArchivo.equals("2")){
                System.out.println(" Archivo de Beneficiarios  " + tipoArchivo);

                try {
                    //guarda los datos del fichero
                    InputStream stream = myFile.getInputStream();
                    InputStreamReader isr= new InputStreamReader(stream,"ISO-8859-1");
                    //BufferedReader buffer= new BufferedReader(isr);

                    ruta=sesion.getServletContext().getRealPath("/")+"/archivos/"+myFile.getFileName();
                    FileOutputStream os = new FileOutputStream(new File(ruta));
                        byte[] buffer = new byte[8192];
                        int bytesLeidos = 0;
                        while ((bytesLeidos = stream.read(buffer, 0, 8192)) != -1) {
                            os.write(buffer, 0, bytesLeidos );
                        }
                        os.close();
                        os.flush();
                     }catch(Exception e)
                     {
                      e.printStackTrace();
                     }
                
                try {
      
                        File file=new File(ruta);
                        //BufferedReader entrada = new BufferedReader( new FileReader( file ) );

                        FileInputStream fis = new FileInputStream(ruta);
                        InputStreamReader is = new InputStreamReader(fis, "ISO-8859-1");
                        BufferedReader entrada = new BufferedReader(is);
                    
                        int numLineas=2;
                        int contador=0;

                        String datos []=new String [numLineas];
                        String[] cad;
                        String cadenaCsv="";

                        String linea = entrada.readLine();
                    
                        while (linea != null && contador<numLineas)
                        {
                          datos[contador]=linea;
                          linea = entrada.readLine();
                          contador++;
                        }
                     
                         contador++;
                     
                        do{
                            try{
                               linea = entrada.readLine();
                               if (linea == null){
                                   break;
                               }    
                                else
                                {
                                 contador++;
                                 System.out.println(String.valueOf(contador)+": "+linea);
                                 cad=linea.split(";");
                                 System.out.println("Tamaño :"+cad.length);

                                 Beneficiario beneficiario = new Beneficiario();
                                
                                    if(cad.length==0){

                                       System.out.println("EL Numero de  Linea "+String.valueOf(contador)+ " No se Puede Insertar" + linea);
                                       String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                       archivo.setDescripcionError(mensaje);
                                       daoUtil.insertarLineaError(archivo);
                                       cantidadErrados++;
                                    }
                                
                                    else if(cad.length==60){
                                    String Cuspp                = cad[0];
                                    beneficiario.setCuspp(Cuspp);
                                    String Expediente           = cad[1];
                                    beneficiario.setExpediente(Expediente);
                                    String CodPersona             = cad[2];
                                    beneficiario.setCodPersona(CodPersona);
                                    String NumeroCuenta         = cad[3];
                                    beneficiario.setNumeroCuenta(NumeroCuenta);
                                    String EstadoCuenta       = cad[4];
                                    beneficiario.setEstadoCuenta(EstadoCuenta);
                                    String CausalAfiliado          = cad[5];
                                    beneficiario.setCausalAfiliado(CausalAfiliado);
                                    String CodMatricula        = cad[6];
                                    beneficiario.setCodMatricula(CodMatricula);
                                    String Afiliado                 = cad[7];
                                    beneficiario.setAfiliado(Afiliado);
                                    String FechaNcmtoAfi            = cad[8];
                                    beneficiario.setFechaNcmtoAfi(FechaNcmtoAfi);
                                    String FechaFallecAfi   = cad[9];
                                    beneficiario.setFechaFallecAfi(FechaFallecAfi);
                                    String SexoAfi       = cad[10];
                                    beneficiario.setSexoAfi(SexoAfi);
                                    String TipDocAfi                = cad[11];
                                    beneficiario.setTipDocAfi(TipDocAfi);
                                    String NumDocAfi               = cad[12];
                                    beneficiario.setNumDocAfi(NumDocAfi);
                                    String DireccionAfi            = cad[13];
                                    beneficiario.setDireccionAfi(DireccionAfi);
                                    String UbigeoAfi      = cad[14];
                                    beneficiario.setUbigeoAfi(UbigeoAfi);
                                    String DepartamentoAfi      = cad[15];
                                    beneficiario.setDepartamentoAfi(DepartamentoAfi);
                                    String ProvinciaAfi        = cad[16];
                                    beneficiario.setProvinciaAfi(ProvinciaAfi);
                                    String DistritoAfi        = cad[17];
                                    beneficiario.setDistritoAfi(DistritoAfi);
                                    String NroSolicitud        = cad[18];
                                    beneficiario.setNroSolicitud(NroSolicitud);
                                    String FechaSolicitud             = cad[19];
                                    beneficiario.setFechaSolicitud(FechaSolicitud);
                                    String TipoDeSolicitud        = cad[20];
                                    beneficiario.setTipoDeSolicitud(TipoDeSolicitud);
                                    String EstadoSol     = cad[21];
                                    beneficiario.setEstadoSol(EstadoSol);
                                    String Agencia1            = cad[22];
                                    beneficiario.setAgencia1(Agencia1);
                                    String Ejecutiva   = cad[23];
                                    beneficiario.setEjecutiva(Ejecutiva);
                                    String CodigoDeBeneficiario       = cad[24];
                                    beneficiario.setCodigoDeBeneficiario(CodigoDeBeneficiario);
                                    String Matricula       = cad[25];
                                    beneficiario.setMatricula(Matricula);
                                    String Beneficiario    = cad[26];
                                    beneficiario.setBeneficiario(Beneficiario);
                                    String Parentesco    = cad[27];
                                    beneficiario.setParentesco(Parentesco);
                                    String FechaNcmtoBnef = cad[28];
                                    beneficiario.setFechaNcmtoBnef(FechaNcmtoBnef);
                                    String SexoBnef = cad[29];
                                    beneficiario.setSexoBnef(SexoBnef);
                                    String EstadoBnef = cad[30];
                                    beneficiario.setEstadoBnef(EstadoBnef);
                                    String IndAfiliado = cad[31];
                                    beneficiario.setIndAfiliado(IndAfiliado);
                                    String TipoDocBnef = cad[32];
                                    beneficiario.setTipoDocBnef(TipoDocBnef);
                                    String NumDocBnef = cad[33];
                                    beneficiario.setNumDocBnef(NumDocBnef);
                                    String Porcentaje = cad[34];
                                    beneficiario.setPorcentaje(Porcentaje);
                                    String Doc = cad[35];
                                    beneficiario.setDoc(Doc);
                                    String Dict = cad[36];
                                    beneficiario.setDict(Dict);
                                    String Inv = cad[37];
                                    beneficiario.setInv(Inv);
                                    String Seci = cad[38];
                                    beneficiario.setSeci(Seci);
                                    String Dep = cad[39];
                                    beneficiario.setDep(Dep);
                                    String Estudios = cad[40];
                                    beneficiario.setEstudios(Estudios);
                                    String CodApoderado = cad[41];
                                    beneficiario.setCodApoderado(CodApoderado);
                                    String Apoderado = cad[42];
                                    beneficiario.setApoderado(Apoderado);
                                    String TipDocApod = cad[43];
                                    beneficiario.setTipDocApod(TipDocApod);
                                    String NumDocApod = cad[44];
                                    beneficiario.setNumDocApod(NumDocApod);
                                    String DieBeneficios = cad[45];
                                    beneficiario.setDieBeneficios(DieBeneficios);
                                    String DireccionApod = cad[46];
                                    beneficiario.setDireccionApod(DireccionApod);
                                    String UbigeoApod = cad[47];
                                    beneficiario.setUbigeoApod(UbigeoApod);
                                    String DepartamentoApod = cad[48];
                                    beneficiario.setDepartamentoApod(DepartamentoApod);
                                    String ProvinciaApod = cad[49];
                                    beneficiario.setProvinciaApod(ProvinciaApod);
                                    String DistritoApod = cad[50];
                                    beneficiario.setDistritoApod(DistritoApod);
                                    String CorreoElectronicoApo = cad[51];
                                    beneficiario.setCorreoElectronicoApo(CorreoElectronicoApo);
                                    String FormaPago = cad[52];
                                    beneficiario.setFormaPago(FormaPago);
                                    String TipoCuenta = cad[53];
                                    beneficiario.setTipoCuenta(TipoCuenta);
                                    String NroCuenta = cad[54];
                                    beneficiario.setNroCuenta(NroCuenta);
                                    String Banco = cad[55];
                                    beneficiario.setBanco(Banco);
                                    String LugarRemBoleta = cad[56];
                                    beneficiario.setLugarRemBoleta(LugarRemBoleta);
                                    String Agencia2 = cad[57];
                                    beneficiario.setAgencia2(Agencia2);
                                    String EjecutivaIngBnef = cad[58];
                                    beneficiario.setEjecutivaIngBnef(EjecutivaIngBnef);
                                    String FechaRegistroBnef = cad[59];
                                    beneficiario.setFechaRegistroBnef(FechaRegistroBnef);
                                    beneficiario.setCodDemandante("");
                                    beneficiario.setDemandante("");
                                    beneficiario.setTipDocDem("");
                                    beneficiario.setNumDocDem("");
                                    beneficiario.setFormaPagoDem("");
                                    beneficiario.setBancoDem("");
                                    beneficiario.setTipoCuentaDem("");
                                    beneficiario.setNumCuentaDem("");
                                    beneficiario.setAgenciaDem("");
                                    beneficiario.setNroOrdenJudicial(""); 
                                    beneficiario.setDescOrganismoRetJud("");
                                    beneficiario.setFechaAprobacionDemandaJud("");
                                    beneficiario.setPersonaDemandada("");
                                    

                                    cantidad++;
                                    daoSolicitud.InsertarBeneficiario(beneficiario);

                                    } 
                                    else if(cad.length==73){
                                    String Cuspp                = cad[0];
                                    beneficiario.setCuspp(Cuspp);
                                    String Expediente           = cad[1];
                                    beneficiario.setExpediente(Expediente);
                                    String CodPersona             = cad[2];
                                    beneficiario.setCodPersona(CodPersona);
                                    String NumeroCuenta         = cad[3];
                                    beneficiario.setNumeroCuenta(NumeroCuenta);
                                    String EstadoCuenta       = cad[4];
                                    beneficiario.setEstadoCuenta(EstadoCuenta);
                                    String CausalAfiliado          = cad[5];
                                    beneficiario.setCausalAfiliado(CausalAfiliado);
                                    String CodMatricula        = cad[6];
                                    beneficiario.setCodMatricula(CodMatricula);
                                    String Afiliado                 = cad[7];
                                    beneficiario.setAfiliado(Afiliado);
                                    String FechaNcmtoAfi            = cad[8];
                                    beneficiario.setFechaNcmtoAfi(FechaNcmtoAfi);
                                    String FechaFallecAfi   = cad[9];
                                    beneficiario.setFechaFallecAfi(FechaFallecAfi);
                                    String SexoAfi       = cad[10];
                                    beneficiario.setSexoAfi(SexoAfi);
                                    String TipDocAfi                = cad[11];
                                    beneficiario.setTipDocAfi(TipDocAfi);
                                    String NumDocAfi               = cad[12];
                                    beneficiario.setNumDocAfi(NumDocAfi);
                                    String DireccionAfi            = cad[13];
                                    beneficiario.setDireccionAfi(DireccionAfi);
                                    String UbigeoAfi      = cad[14];
                                    beneficiario.setUbigeoAfi(UbigeoAfi);
                                    String DepartamentoAfi      = cad[15];
                                    beneficiario.setDepartamentoAfi(DepartamentoAfi);
                                    String ProvinciaAfi        = cad[16];
                                    beneficiario.setProvinciaAfi(ProvinciaAfi);
                                    String DistritoAfi        = cad[17];
                                    beneficiario.setDistritoAfi(DistritoAfi);
                                    String NroSolicitud        = cad[18];
                                    beneficiario.setNroSolicitud(NroSolicitud);
                                    String FechaSolicitud             = cad[19];
                                    beneficiario.setFechaSolicitud(FechaSolicitud);
                                    String TipoDeSolicitud        = cad[20];
                                    beneficiario.setTipoDeSolicitud(TipoDeSolicitud);
                                    String EstadoSol     = cad[21];
                                    beneficiario.setEstadoSol(EstadoSol);
                                    String Agencia1            = cad[22];
                                    beneficiario.setAgencia1(Agencia1);
                                    String Ejecutiva   = cad[23];
                                    beneficiario.setEjecutiva(Ejecutiva);
                                    String CodigoDeBeneficiario       = cad[24];
                                    beneficiario.setCodigoDeBeneficiario(CodigoDeBeneficiario);
                                    String Matricula       = cad[25];
                                    beneficiario.setMatricula(Matricula);
                                    String Beneficiario    = cad[26];
                                    beneficiario.setBeneficiario(Beneficiario);
                                    String Parentesco    = cad[27];
                                    beneficiario.setParentesco(Parentesco);
                                    String FechaNcmtoBnef = cad[28];
                                    beneficiario.setFechaNcmtoBnef(FechaNcmtoBnef);
                                    String SexoBnef = cad[29];
                                    beneficiario.setSexoBnef(SexoBnef);
                                    String EstadoBnef = cad[30];
                                    beneficiario.setEstadoBnef(EstadoBnef);
                                    String IndAfiliado = cad[31];
                                    beneficiario.setIndAfiliado(IndAfiliado);
                                    String TipoDocBnef = cad[32];
                                    beneficiario.setTipoDocBnef(TipoDocBnef);
                                    String NumDocBnef = cad[33];
                                    beneficiario.setNumDocBnef(NumDocBnef);
                                    String Porcentaje = cad[34];
                                    beneficiario.setPorcentaje(Porcentaje);
                                    String Doc = cad[35];
                                    beneficiario.setDoc(Doc);
                                    String Dict = cad[36];
                                    beneficiario.setDict(Dict);
                                    String Inv = cad[37];
                                    beneficiario.setInv(Inv);
                                    String Seci = cad[38];
                                    beneficiario.setSeci(Seci);
                                    String Dep = cad[39];
                                    beneficiario.setDep(Dep);
                                    String Estudios = cad[40];
                                    beneficiario.setEstudios(Estudios);
                                    String CodApoderado = cad[41];
                                    beneficiario.setCodApoderado(CodApoderado);
                                    String Apoderado = cad[42];
                                    beneficiario.setApoderado(Apoderado);
                                    String TipDocApod = cad[43];
                                    beneficiario.setTipDocApod(TipDocApod);
                                    String NumDocApod = cad[44];
                                    beneficiario.setNumDocApod(NumDocApod);
                                    String DieBeneficios = cad[45];
                                    beneficiario.setDieBeneficios(DieBeneficios);
                                    String DireccionApod = cad[46];
                                    beneficiario.setDireccionApod(DireccionApod);
                                    String UbigeoApod = cad[47];
                                    beneficiario.setUbigeoApod(UbigeoApod);
                                    String DepartamentoApod = cad[48];
                                    beneficiario.setDepartamentoApod(DepartamentoApod);
                                    String ProvinciaApod = cad[49];
                                    beneficiario.setProvinciaApod(ProvinciaApod);
                                    String DistritoApod = cad[50];
                                    beneficiario.setDistritoApod(DistritoApod);
                                    String CorreoElectronicoApo = cad[51];
                                    beneficiario.setCorreoElectronicoApo(CorreoElectronicoApo);
                                    String FormaPago = cad[52];
                                    beneficiario.setFormaPago(FormaPago);
                                    String TipoCuenta = cad[53];
                                    beneficiario.setTipoCuenta(TipoCuenta);
                                    String NroCuenta = cad[54];
                                    beneficiario.setNroCuenta(NroCuenta);
                                    String Banco = cad[55];
                                    beneficiario.setBanco(Banco);
                                    String LugarRemBoleta = cad[56];
                                    beneficiario.setLugarRemBoleta(LugarRemBoleta);
                                    String Agencia2 = cad[57];
                                    beneficiario.setAgencia2(Agencia2);
                                    String EjecutivaIngBnef = cad[58];
                                    beneficiario.setEjecutivaIngBnef(EjecutivaIngBnef);
                                    String FechaRegistroBnef = cad[59];
                                    beneficiario.setFechaRegistroBnef(FechaRegistroBnef);
                                    String CodDemandante = cad[60];
                                    beneficiario.setCodDemandante(CodDemandante);
                                    String Demandante = cad[61];
                                    beneficiario.setDemandante(Demandante);
                                    String TipDocDem = cad[62];
                                    beneficiario.setTipDocDem(TipDocDem);
                                    String NumDocDem = cad[63];
                                    beneficiario.setNumDocDem(NumDocDem);
                                    String FormaPagoDem = cad[64];
                                    beneficiario.setFormaPagoDem(FormaPagoDem);
                                    String BancoDem = cad[65];
                                    beneficiario.setBancoDem(BancoDem);
                                    String TipoCuentaDem = cad[66];
                                    beneficiario.setTipoCuentaDem(TipoCuentaDem);
                                    String NumCuentaDem = cad[67];
                                    beneficiario.setNumCuentaDem(NumCuentaDem);
                                    String AgenciaDem = cad[68];
                                    beneficiario.setAgenciaDem(AgenciaDem);
                                    String NroOrdenJudicial = cad[69];
                                    beneficiario.setNroOrdenJudicial(NroOrdenJudicial); 
                                    String DescOrganismoRetJud = cad[70];
                                    beneficiario.setDescOrganismoRetJud(DescOrganismoRetJud);
                                    String FechaAprobacionDemandaJud = cad[71];
                                    beneficiario.setFechaAprobacionDemandaJud(FechaAprobacionDemandaJud);
                                    String PersonaDemandada = cad[72];
                                    beneficiario.setPersonaDemandada(PersonaDemandada);
                                    

                                    cantidad++;
                                    daoSolicitud.InsertarBeneficiario(beneficiario);

                                    } 
                           }
                           }catch(Exception e){
				System.out.println("Introduciste un dato erroneo.");
                                String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                archivo.setDescripcionError(mensaje);
                                daoUtil.insertarLineaError(archivo);
				cantidadErrados ++;
			   }
                    }while(true);
                     
                    
                }catch(Exception e)
                {
                    n=101;
                    e.printStackTrace();
                }
             
                //ACTULIZAR ESTADO DE LA CARGA
                archivo.setTipoArchivo(Integer.parseInt(tipoArchivo));
                archivo.setNombreArchivo(myFile.getFileName());
                archivo.setEstadoCarga("F");
                archivo.setCantidad(cantidad);
                archivo.setCantidadErrados(cantidadErrados);
                daoUtil.insertarDataCarga(archivo);
                
                
             }
             /*
              if (myFile.getFileName().endsWith("xlsx")) {
                   ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData);
                   XSSFWorkbook wb = new XSSFWorkbook(byteArrayInputStream);
                   XSSFSheet sheet = wb.getSheetAt(0); // Hoja
                   //Iterator iterator = sheet.rowIterator(); //recorre las hojas
                   Iterator<Row> iterator = sheet.iterator();
                   
                   int rownum = 1;
                   boolean ultimoRegistro = false;
                   
                   
                   while(iterator.hasNext()) {

                     XSSFRow row = sheet.getRow(rownum);
                     for(int i = 0;i<row.getLastCellNum();i++){
                            XSSFCell cell = row.getCell(i);
                            if (i == 0 && cell.getStringCellValue().isEmpty()) {
                            ultimoRegistro = true;
                            break;
                            }
                                                        
                            //Double exp   = cell.getNumericCellValue();
                            //String afiliado = cell.getStringCellValue();
                            System.out.println(cell.getStringCellValue());

                     }
                      if (ultimoRegistro) {
                        break;
                    } 
                      System.out.println("___________________________");
                      rownum++;
                  }
                  
                   
              }*/
             
        //INICIO ARCHIVO DE SEYCI
        
        //ARCHIVO DE SOLICITUDES
             if(tipoArchivo.equals("3")){
                  System.out.println(" Archivo de SEYCI  " + tipoArchivo);
             
             
             try {
            //guarda los datos del fichero
            InputStream stream = myFile.getInputStream();
            InputStreamReader isr= new InputStreamReader(stream,"ISO-8859-1");
            //BufferedReader buffer= new BufferedReader(isr);
            
            ruta=sesion.getServletContext().getRealPath("/")+"/archivos/"+myFile.getFileName();
            FileOutputStream os = new FileOutputStream(new File(ruta));
                byte[] buffer = new byte[8192];
                int bytesLeidos = 0;
                while ((bytesLeidos = stream.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesLeidos );
                }
                os.close();
                os.flush();
             }catch(Exception e)
             {
              e.printStackTrace();
             }
             
             
             try
                {
      
                    File file=new File(ruta);
                    //BufferedReader entrada = new BufferedReader( new FileReader( file ) );

                    FileInputStream fis = new FileInputStream(ruta);
                    InputStreamReader is = new InputStreamReader(fis, "ISO-8859-1");
                    BufferedReader entrada = new BufferedReader(is);
                    
                    int numLineas=13;
                    int contador=0;
                    

                    String datos []=new String [numLineas];
                    String[] cad;
                    String cadenaCsv="";
                    
                    String linea = entrada.readLine();
                    
                     while (linea != null && contador<numLineas)
                    {
                       datos[contador]=linea;
                       linea = entrada.readLine();
                       contador++;
                    }
                     
                     contador++;
                     
                    do{
                        try{
                           linea = entrada.readLine();
                           if (linea == null){
                               break;
                           }    
                            else
                            {
                             contador++;
                             System.out.println(String.valueOf(contador)+": "+linea);
                             cad=linea.split(";");
                             System.out.println("Tamaño :"+cad.length);
                                
                                SEYCI seyci = new SEYCI();
                                
                                
                                if(cad.length==0){
                                
                                   System.out.println("EL Numero de  Linea "+String.valueOf(contador)+ " No se Puede Insertar" + linea);
                                   String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                   archivo.setDescripcionError(mensaje);
                                   daoUtil.insertarLineaError(archivo);
                                   cantidadErrados++;
                                }
                                
                                else if(cad.length==118){
                                String PrimerCampo   = cad[0];
                                String Cuspp                      = cad[1];
                                seyci.setCuspp(Cuspp);
                                String Exp                        = cad[2];
                                seyci.setExp(Exp);
                                String Afiliado                   = cad[3];
                                seyci.setAfiliado(Afiliado);
                                
                                String[] parts = Afiliado.split(" ");
                                    
                                    if(parts.length==3){
                                    
                                    primerApellido  = parts[0]; 
                                    seyci.setPrimerApellido(primerApellido);
                                    segundoApellido = parts[1]; 
                                    seyci.setSegundoApellido(segundoApellido);
                                    primerNombre    = parts[2];
                                    seyci.setPrimerNombre(primerNombre);
                                    segundoNombre   = "";
                                    seyci.setSegundoNombre(segundoNombre);
                                    }
                                    
                                    else if(parts.length==4){
                                    
                                    primerApellido  = parts[0]; 
                                    seyci.setPrimerApellido(primerApellido);
                                    segundoApellido = parts[1]; 
                                    seyci.setSegundoApellido(segundoApellido);
                                    primerNombre    = parts[2];
                                    seyci.setPrimerNombre(primerNombre);
                                    segundoNombre   = parts[3];
                                    seyci.setSegundoNombre(segundoNombre);
                                    
                                    }
                                    
                                    else if(parts.length==6){
                                        
                                    StringTokenizer stk=new StringTokenizer(Afiliado,"");
                                    
                                    while(stk.hasMoreTokens()) {
                                        String valor=stk.nextToken();
                                        System.out.println (valor);
                                        int index = Afiliado.indexOf(" ");
                                        primerApellido = valor.substring(0,index);
                                        String nuevaCadena = valor.substring(index+1,valor.length());
                                        int index2 = nuevaCadena.indexOf(" ");
                                        segundoApellido = nuevaCadena.substring(0,index2);
                                        String nuevaCadena1 = nuevaCadena.substring(index2+1,nuevaCadena.length());
                                        int index3 = nuevaCadena1.indexOf(" ");
                                        primerNombre = nuevaCadena1.substring(0,index3);
                                        String nuevaCadena2 = nuevaCadena1.substring(index3+1,nuevaCadena1.length());
                                        int index4 = nuevaCadena2.indexOf(" ");
                                        segundoNombre = nuevaCadena2.substring(0,nuevaCadena2.length());
                                        
                                        String []arreglo = {"LA", "DE", "DE LAS", "DEL", "DE LA", "DE LOS", "VDA", "VIUDA", "VDA DE", "VIUDA DE"};
                                        boolean buu = false;
                                        int n1; 
                                        int n2;
                                        
                                        for(n1 = 0; n1 < arreglo.length; n1++)
                                         { 
                                            if (primerApellido.equals(arreglo[n1]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    primerApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if (segundoApellido.equals(arreglo[n1]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    segundoApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if(primerNombre.equals(arreglo[n1])){
                                        
                                                segundoApellido = segundoApellido + " " + primerNombre;
                                                buu = true;
                                                primerNombre = "";
                                            }
                                         }
                                        
                                          System.out.println(" PA "+ primerApellido + " SA " + segundoApellido + " PN" + primerNombre + " SN " + segundoNombre);
                                        
                                        
                                          String CadenaX = segundoNombre;
                                          int index_1 = CadenaX.indexOf(" ");
                                          primerNombre = CadenaX.substring(0,index_1);
                                          segundoNombre = CadenaX.substring(index_1+1,CadenaX.length());
                                          
                                          System.out.println(" PA "+ primerApellido + " SA " + segundoApellido + " PN" + primerNombre + " SN " + segundoNombre);
                                        

                                          for(n2 = 0; n2 < arreglo.length; n2++)
                                         { 
                                            if (primerApellido.contains(arreglo[n2]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    primerApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if (segundoApellido.contains(arreglo[n2]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    segundoApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                                    primerNombre = "";
                                            }
                                            
                                            if(primerNombre.contains(arreglo[n2])){
                                        
                                                segundoApellido = segundoApellido + " " + primerNombre;
                                                buu = true;
                                            }
                                         }
                                          
                                          String CadenaY = segundoNombre;
                                          int index_2 = CadenaY.indexOf(" ");
                                          primerNombre = CadenaY.substring(0,index_2);
                                          segundoNombre = CadenaY.substring(index_2+1,CadenaY.length());
                                        
                                        
                                    }
                                    
                                 
                                    seyci.setPrimerApellido(primerApellido);
                                    seyci.setSegundoApellido(segundoApellido);
                                    seyci.setPrimerNombre(primerNombre);
                                    seyci.setSegundoNombre(segundoNombre);
                                    
                                    }

                                String EstadoCuenta               = cad[4];
                                seyci.setEstadoCuenta(EstadoCuenta);
                                String Causal                     = cad[5];
                                seyci.setCausal(Causal);
                                String TipoDocumento              = cad[6];
                                seyci.setTipoDocumento(TipoDocumento);
                                String NumeroDocumento            = cad[7];
                                seyci.setNumeroDocumento(NumeroDocumento);
                                String DireccionAfi               = cad[8];
                                seyci.setDireccionAfi(DireccionAfi);
                                String UbigeoAfi                  = cad[9];
                                seyci.setUbigeoAfi(UbigeoAfi);                                       
                                String DepartamentoAfi            = cad[10];
                                seyci.setDepartamentoAfi(DepartamentoAfi);
                                String ProvinciaAfi               = cad[11];
                                seyci.setProvinciaAfi(ProvinciaAfi);  
                                String DistritoAfi                = cad[12];
                                seyci.setDistritoAfi(DistritoAfi);
                                String EmailAfi                   = cad[13];
                                seyci.setEmailAfi(EmailAfi); 
                                String TelefonoAfi                   = cad[14];
                                seyci.setTelefonoAfi(TelefonoAfi); 
                                String AgenciaInicioTramite                   = cad[15];
                                seyci.setAgenciaInicioTramite(AgenciaInicioTramite);
                                String EjecutivaAgencia                   = cad[16];
                                seyci.setEjecutivaAgencia(EjecutivaAgencia);
                                String TipoDeTramite                   = cad[17];
                                seyci.setTipoDeTramite(TipoDeTramite);
                                String TipoSolicitud                   = cad[18];
                                seyci.setTipoSolicitud(TipoSolicitud);                                       
                                String NaturalezaDeSolicitud                   = cad[19];
                                seyci.setNaturalezaDeSolicitud(NaturalezaDeSolicitud);                                        
                                String NaturalezaOriginal                   = cad[20];
                                seyci.setNaturalezaOriginal(NaturalezaOriginal); 
                                String GradoOriginal                   = cad[21];
                                seyci.setGradoOriginal(GradoOriginal); 
                                String DjDeBeneficiarios                   = cad[22];
                                seyci.setDjDeBeneficiarios(DjDeBeneficiarios);
                                String IndicadorDeBenficiarios                   = cad[23];
                                seyci.setIndicadorDeBenficiarios(IndicadorDeBenficiarios); 
                                String TipoDeEvaluado                   = cad[24];
                                seyci.setTipoDeEvaluado(TipoDeEvaluado);                                         
                                String Sexo                   = cad[25];
                                seyci.setSexo(Sexo); 
                                String FechaNacEvaluado                   = cad[26];
                                seyci.setFechaNacEvaluado(FechaNacEvaluado);
                                String ApellidosNombresBnef                   = cad[27];
                                seyci.setApellidosNombresBnef(ApellidosNombresBnef); 
                                String ParentescoSolicitanteBnef                   = cad[28];
                                seyci.setParentescoSolicitanteBnef(ParentescoSolicitanteBnef); 
                                String NumeroSolicitud                   = cad[29];
                                seyci.setNumeroSolicitud(NumeroSolicitud); 
                                String Estado1                   = cad[30];
                                seyci.setEstado1(Estado1);                                                                            
                                String SubEstadoMotivo                   = cad[31];
                                seyci.setSubEstadoMotivo(SubEstadoMotivo);  
                                String FechaDeEstado                   = cad[32];
                                seyci.setFechaDeEstado(FechaDeEstado);                                       
                                String Cobertura                   = cad[33];
                                seyci.setCobertura(Cobertura); 
                                String CausalDeCobertura                   = cad[34];
                                seyci.setCausalDeCobertura(CausalDeCobertura);  
                                String Tuitiva                   = cad[35];
                                seyci.setTuitiva(Tuitiva); 
                                String CiaPrevisional                   = cad[36];
                                seyci.setCiaPrevisional(CiaPrevisional);
                                String FechaSeccionI                   = cad[37];
                                seyci.setFechaSeccionI(FechaSeccionI);
                                String FechaSeccionIIISolicitante      = cad[38];
                                seyci.setFechaSeccionIIISolicitante(FechaSeccionIIISolicitante);
                                String FecSecIVMedicoRepAFP            = cad[39];
                                seyci.setFecSecIVMedicoRepAFP(FecSecIVMedicoRepAFP);
                                String CausalDeInvalidez               = cad[40];
                                seyci.setCausalDeInvalidez(CausalDeInvalidez);
                                String FechaEnvioCOMAFP               = cad[41];
                                seyci.setFechaEnvioCOMAFP(FechaEnvioCOMAFP);                                        
                                String FecEnvioEvaluado               = cad[42];
                                seyci.setFecEnvioEvaluado(FecEnvioEvaluado);
                                String FecEvaluadoRecibeNotif         = cad[43];
                                seyci.setFecEvaluadoRecibeNotif(FecEvaluadoRecibeNotif);                                          
                                String FechaEnvioCíaSeguros         = cad[44];
                                seyci.setFechaEnvioCíaSeguros(FechaEnvioCíaSeguros);  
                                String NivelEstudios         = cad[45];
                                seyci.setNivelEstudios(NivelEstudios); 
                                String Grado1         = cad[46];
                                seyci.setGrado1(Grado1);  
                                String Subdisio         = cad[47];
                                seyci.setSubdisio(Subdisio);
                                String FechaInicioSubsidio         = cad[48];
                                seyci.setFechaInicioSubsidio(FechaInicioSubsidio); 
                                String FechaFinSubsidio         = cad[49];
                                seyci.setFechaFinSubsidio(FechaFinSubsidio);     
                                String SituacionLaboralActual         = cad[50];
                                seyci.setSituacionLaboralActual(SituacionLaboralActual);                                       
                                String SeguroComplementario         = cad[51];
                                seyci.setSeguroComplementario(SeguroComplementario);  
                                String FecIniOcurrenciaSCTR         = cad[52];
                                seyci.setFecIniOcurrenciaSCTR(FecIniOcurrenciaSCTR);                                       
                                String FecFinOcurrenciaSCTR         = cad[53];
                                seyci.setFecFinOcurrenciaSCTR(FecFinOcurrenciaSCTR); 
                                String ActividadLaboral         = cad[54];
                                seyci.setActividadLaboral(ActividadLaboral); 
                                String CircunstanciasInvalidez         = cad[55];
                                seyci.setCircunstanciasInvalidez(CircunstanciasInvalidez); 
                                String Diagnostico         = cad[56];
                                seyci.setDiagnostico(Diagnostico); 
                                String DetalleOtrosDocs         = cad[57];
                                seyci.setDetalleOtrosDocs(DetalleOtrosDocs);                                       
                                String ObservacionesSeyci         = cad[58];
                                seyci.setObservacionesSeyci(ObservacionesSeyci); 
                                String MotivoDeCancelacion         = cad[59];
                                seyci.setMotivoDeCancelacion(MotivoDeCancelacion); 
                                String ObservacionesCancelacion         = cad[60];
                                seyci.setObservacionesCancelacion(ObservacionesCancelacion); 
                                String NroDictamenCOMAFP         = cad[61];
                                seyci.setNroDictamenCOMAFP(NroDictamenCOMAFP);  
                                String NroDeEvaluacion1         = cad[62];
                                seyci.setNroDeEvaluacion1(NroDeEvaluacion1);                                      
                                String EntidadEvaluadora1         = cad[63];
                                seyci.setEntidadEvaluadora1(EntidadEvaluadora1);
                                String FechaDeEmision1         = cad[64];
                                seyci.setFechaDeEmision1(FechaDeEmision1);
                                String FechaRecepcion1         = cad[65];
                                seyci.setFechaRecepcion1(FechaRecepcion1);                                        
                                String FechaInicioVigencia1         = cad[66];
                                seyci.setFechaInicioVigencia1(FechaInicioVigencia1);  
                                String FechaFinVigencia1         = cad[67];
                                seyci.setFechaFinVigencia1(FechaFinVigencia1); 
                                String Meses1         = cad[68];
                                seyci.setMeses1(Meses1);                                         
                                String FechaProximaEvaluacion1         = cad[69];
                                seyci.setFechaProximaEvaluacion1(FechaProximaEvaluacion1);
                                String FechaOcurrencia1         = cad[70];
                                seyci.setFechaOcurrencia1(FechaOcurrencia1);                                       
                                String IndicadorDeDefinitivo1         = cad[71];
                                seyci.setIndicadorDeDefinitivo1(IndicadorDeDefinitivo1); 
                                String Estado2         = cad[72];
                                seyci.setEstado2(Estado2); 
                                String Grado2         = cad[73];
                                seyci.setGrado2(Grado2);                                         
                                String Naturaleza1         = cad[74];
                                seyci.setNaturaleza1(Naturaleza1); 
                                String PorcMenoscaboAsignado1         = cad[75];
                                seyci.setPorcMenoscaboAsignado1(PorcMenoscaboAsignado1); 
                                String CalificacionInvalidez1         = cad[76];
                                seyci.setCalificacionInvalidez1(CalificacionInvalidez1);
                                String IndExclusion1         = cad[77];
                                seyci.setIndExclusion1(IndExclusion1);
                                String FecNotifDictAlEvaluado         = cad[78];
                                seyci.setFecNotifDictAlEvaluado(FecNotifDictAlEvaluado);
                                String ObservacionesDictamenCOMAFP         = cad[79];
                                seyci.setObservacionesDictamenCOMAFP(ObservacionesDictamenCOMAFP);
                                String SolApelacion         = cad[80];
                                seyci.setSolApelacion(SolApelacion);
                                String FecSolicitudApelacion         = cad[81];
                                seyci.setSolApelacion(FecSolicitudApelacion);
                                String FecEnvioApelacion         = cad[82];
                                seyci.setFecEnvioApelacion(FecEnvioApelacion);                                        
                                String FecNotificacionApelacion         = cad[83];
                                seyci.setFecNotificacionApelacion(FecNotificacionApelacion);                                        
                                String FecRecepcionDelAfiliado         = cad[84];
                                seyci.setFecRecepcionDelAfiliado(FecRecepcionDelAfiliado);                                         
                                String ObjetoApelacion         = cad[85];
                                seyci.setObjetoApelacion(ObjetoApelacion);
                                String MotivoApelacion         = cad[86];
                                seyci.setMotivoApelacion(MotivoApelacion);                                       
                                String EntidadQueApela         = cad[87];
                                seyci.setEntidadQueApela(EntidadQueApela);                                         
                                String NroDictamenCOMEC         = cad[88];
                                seyci.setNroDictamenCOMEC(NroDictamenCOMEC); 
                                String NroDeEvaluacion2         = cad[89];
                                seyci.setNroDeEvaluacion2(NroDeEvaluacion2);                                        
                                String EntidadEvaluadora2         = cad[90];
                                seyci.setEntidadEvaluadora2(EntidadEvaluadora2);  
                                String FechaDeEmision2         = cad[91];
                                seyci.setFechaDeEmision2(FechaDeEmision2);   
                                String FechaRecepcion2         = cad[92];
                                seyci.setFechaRecepcion2(FechaRecepcion2);                                       
                                String FechaInicioVigencia2         = cad[93];
                                seyci.setFechaInicioVigencia2(FechaInicioVigencia2);  
                                String FechaFinVigencia2         = cad[94];
                                seyci.setFechaFinVigencia2(FechaFinVigencia2);
                                String Meses2         = cad[95];
                                seyci.setMeses2(Meses2); 
                                String FechaProximaEvaluacion2         = cad[96];
                                seyci.setFechaProximaEvaluacion2(FechaProximaEvaluacion2);                                         
                                String FechaOcurrencia2         = cad[97];
                                seyci.setFechaOcurrencia2(FechaOcurrencia2);
                                String IndicadordeDefinitivo2         = cad[98];
                                seyci.setIndicadordeDefinitivo2(IndicadordeDefinitivo2);
                                String Estado3         = cad[99];
                                seyci.setEstado3(Estado3);
                                String Grado3         = cad[100];
                                seyci.setGrado3(Grado3);
                                String Naturaleza2         = cad[101];
                                seyci.setNaturaleza2(Naturaleza2);
                                String PorMenoscaboAsignado2         = cad[102];
                                seyci.setPorMenoscaboAsignado2(PorMenoscaboAsignado2);
                                String IndExclusion2         = cad[103];
                                seyci.setIndExclusion2(IndExclusion2);
                                String CalificacionInvalidez2         = cad[104];
                                seyci.setCalificacionInvalidez2(CalificacionInvalidez2);
                                String FecNotifDictCOMECAFP         = cad[105];
                                seyci.setFecNotifDictCOMECAFP(FecNotifDictCOMECAFP);
                                String ObservacionesDictamenCOMEC         = cad[106];
                                seyci.setObservacionesDictamenCOMEC(ObservacionesDictamenCOMEC);
                                String NroRetiro         = cad[107];
                                seyci.setNroRetiro(NroRetiro);
                                String FechaSolicitudRetiro         = cad[108];
                                seyci.setFechaSolicitudRetiro(FechaSolicitudRetiro);
                                String TramitePensionIniciado         = cad[109];
                                seyci.setTramitePensionIniciado(TramitePensionIniciado); 
                                String CalificacionInvalidez3         = cad[110];
                                seyci.setCalificacionInvalidez3(CalificacionInvalidez3);                                       
                                String SaldoFechaDeRetiro         = cad[111];
                                seyci.setSaldoFechaDeRetiro(SaldoFechaDeRetiro); 
                                String PorcDeRetiro         = cad[112];
                                seyci.setPorcDeRetiro(PorcDeRetiro);
                                String MontoEntregar         = cad[113];
                                seyci.setMontoEntregar(MontoEntregar); 
                                String EstadoDeRetiro         = cad[114];
                                seyci.setEstadoDeRetiro(EstadoDeRetiro); 
                                String FechaDeAcreditacion         = cad[115];
                                seyci.setFechaDeAcreditacion(FechaDeAcreditacion); 
                                String MontoAcreditado         = cad[116];
                                seyci.setMontoAcreditado(MontoAcreditado);
                                String NroSolJA         = cad[117];
                                seyci.setNroSolJA(NroSolJA);
                                seyci.setTipoDeBeneficio("");
                                seyci.setFechaSolJA("");
                                seyci.setStadoSolJA("");
                                cantidad++;
                                daoSolicitud.InsertarSEYCI(seyci);
                                }
                                else{
                                String PrimerCampo   = cad[0];
                                String Cuspp                      = cad[1];
                                seyci.setCuspp(Cuspp);
                                String Exp                        = cad[2];
                                seyci.setExp(Exp);
                                String Afiliado                   = cad[3];
                                seyci.setAfiliado(Afiliado);
                                
                                String[] parts = Afiliado.split(" ");
                                    
                                    if(parts.length==3){
                                    
                                    primerApellido  = parts[0]; 
                                    seyci.setPrimerApellido(primerApellido);
                                    segundoApellido = parts[1]; 
                                    seyci.setSegundoApellido(segundoApellido);
                                    primerNombre    = parts[2];
                                    seyci.setPrimerNombre(primerNombre);
                                    segundoNombre   = "";
                                    seyci.setSegundoNombre(segundoNombre);
                                    }
                                    
                                    else if(parts.length==4){
                                    
                                    primerApellido  = parts[0]; 
                                    seyci.setPrimerApellido(primerApellido);
                                    segundoApellido = parts[1]; 
                                    seyci.setSegundoApellido(segundoApellido);
                                    primerNombre    = parts[2];
                                    seyci.setPrimerNombre(primerNombre);
                                    segundoNombre   = parts[3];
                                    seyci.setSegundoNombre(segundoNombre);
                                    
                                    }
                                    
                                    else if(parts.length==6){
                                        
                                    StringTokenizer stk=new StringTokenizer(Afiliado,"");
                                    
                                    while(stk.hasMoreTokens()) {
                                        String valor=stk.nextToken();
                                        System.out.println (valor);
                                        int index = Afiliado.indexOf(" ");
                                        primerApellido = valor.substring(0,index);
                                        String nuevaCadena = valor.substring(index+1,valor.length());
                                        int index2 = nuevaCadena.indexOf(" ");
                                        segundoApellido = nuevaCadena.substring(0,index2);
                                        String nuevaCadena1 = nuevaCadena.substring(index2+1,nuevaCadena.length());
                                        int index3 = nuevaCadena1.indexOf(" ");
                                        primerNombre = nuevaCadena1.substring(0,index3);
                                        String nuevaCadena2 = nuevaCadena1.substring(index3+1,nuevaCadena1.length());
                                        int index4 = nuevaCadena2.indexOf(" ");
                                        segundoNombre = nuevaCadena2.substring(0,nuevaCadena2.length());
                                        
                                        String []arreglo = {"LA", "DE", "DE LAS", "DEL", "DE LA", "DE LOS", "VDA", "VIUDA", "VDA DE", "VIUDA DE"};
                                        boolean buu = false;
                                        int n1; 
                                        int n2;
                                        
                                        for(n1 = 0; n1 < arreglo.length; n1++)
                                         { 
                                            if (primerApellido.equals(arreglo[n1]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    primerApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if (segundoApellido.equals(arreglo[n1]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    segundoApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if(primerNombre.equals(arreglo[n1])){
                                        
                                                segundoApellido = segundoApellido + " " + primerNombre;
                                                buu = true;
                                                primerNombre = "";
                                            }
                                         }
                                        
                                          System.out.println(" PA "+ primerApellido + " SA " + segundoApellido + " PN" + primerNombre + " SN " + segundoNombre);
                                        
                                        
                                          String CadenaX = segundoNombre;
                                          int index_1 = CadenaX.indexOf(" ");
                                          primerNombre = CadenaX.substring(0,index_1);
                                          segundoNombre = CadenaX.substring(index_1+1,CadenaX.length());
                                          
                                          System.out.println(" PA "+ primerApellido + " SA " + segundoApellido + " PN" + primerNombre + " SN " + segundoNombre);
                                        

                                          for(n2 = 0; n2 < arreglo.length; n2++)
                                         { 
                                            if (primerApellido.contains(arreglo[n2]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    primerApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                            }
                                            
                                            if (segundoApellido.contains(arreglo[n2]))
                                            {
                                                    System.out.println("dato encontrado");
                                                    segundoApellido = segundoApellido + " " + primerNombre;
                                                    buu = true;
                                                    primerNombre = "";
                                            }
                                            
                                            if(primerNombre.contains(arreglo[n2])){
                                        
                                                segundoApellido = segundoApellido + " " + primerNombre;
                                                buu = true;
                                            }
                                         }
                                          
                                          String CadenaY = segundoNombre;
                                          int index_2 = CadenaY.indexOf(" ");
                                          primerNombre = CadenaY.substring(0,index_2);
                                          segundoNombre = CadenaY.substring(index_2+1,CadenaY.length());
                                        
                                        
                                    }
                                    
                                 
                                    seyci.setPrimerApellido(primerApellido);
                                    seyci.setSegundoApellido(segundoApellido);
                                    seyci.setPrimerNombre(primerNombre);
                                    seyci.setSegundoNombre(segundoNombre);
                                    
                                    }
                                
                                String EstadoCuenta               = cad[4];
                                seyci.setEstadoCuenta(EstadoCuenta);
                                String Causal                     = cad[5];
                                seyci.setCausal(Causal);
                                String TipoDocumento              = cad[6];
                                seyci.setTipoDocumento(TipoDocumento);
                                String NumeroDocumento            = cad[7];
                                seyci.setNumeroDocumento(NumeroDocumento);
                                String DireccionAfi               = cad[8];
                                seyci.setDireccionAfi(DireccionAfi);
                                String UbigeoAfi                  = cad[9];
                                seyci.setUbigeoAfi(UbigeoAfi);                                       
                                String DepartamentoAfi            = cad[10];
                                seyci.setDepartamentoAfi(DepartamentoAfi);
                                String ProvinciaAfi               = cad[11];
                                seyci.setProvinciaAfi(ProvinciaAfi);  
                                String DistritoAfi                = cad[12];
                                seyci.setDistritoAfi(DistritoAfi);
                                String EmailAfi                   = cad[13];
                                seyci.setEmailAfi(EmailAfi); 
                                String TelefonoAfi                   = cad[14];
                                seyci.setTelefonoAfi(TelefonoAfi); 
                                String AgenciaInicioTramite                   = cad[15];
                                seyci.setAgenciaInicioTramite(AgenciaInicioTramite);
                                String EjecutivaAgencia                   = cad[16];
                                seyci.setEjecutivaAgencia(EjecutivaAgencia);
                                String TipoDeTramite                   = cad[17];
                                seyci.setTipoDeTramite(TipoDeTramite);
                                String TipoSolicitud                   = cad[18];
                                seyci.setTipoSolicitud(TipoSolicitud);                                       
                                String NaturalezaDeSolicitud                   = cad[19];
                                seyci.setNaturalezaDeSolicitud(NaturalezaDeSolicitud);                                        
                                String NaturalezaOriginal                   = cad[20];
                                seyci.setNaturalezaOriginal(NaturalezaOriginal); 
                                String GradoOriginal                   = cad[21];
                                seyci.setGradoOriginal(GradoOriginal); 
                                String DjDeBeneficiarios                   = cad[22];
                                seyci.setDjDeBeneficiarios(DjDeBeneficiarios);
                                String IndicadorDeBenficiarios                   = cad[23];
                                seyci.setIndicadorDeBenficiarios(IndicadorDeBenficiarios); 
                                String TipoDeEvaluado                   = cad[24];
                                seyci.setTipoDeEvaluado(TipoDeEvaluado);                                         
                                String Sexo                   = cad[25];
                                seyci.setSexo(Sexo); 
                                String FechaNacEvaluado                   = cad[26];
                                seyci.setFechaNacEvaluado(FechaNacEvaluado);
                                String ApellidosNombresBnef                   = cad[27];
                                seyci.setApellidosNombresBnef(ApellidosNombresBnef); 
                                String ParentescoSolicitanteBnef                   = cad[28];
                                seyci.setParentescoSolicitanteBnef(ParentescoSolicitanteBnef); 
                                String NumeroSolicitud                   = cad[29];
                                seyci.setNumeroSolicitud(NumeroSolicitud); 
                                String Estado1                   = cad[30];
                                seyci.setEstado1(Estado1);                                                                            
                                String SubEstadoMotivo                   = cad[31];
                                seyci.setSubEstadoMotivo(SubEstadoMotivo);  
                                String FechaDeEstado                   = cad[32];
                                seyci.setFechaDeEstado(FechaDeEstado);                                       
                                String Cobertura                   = cad[33];
                                seyci.setCobertura(Cobertura); 
                                String CausalDeCobertura                   = cad[34];
                                seyci.setCausalDeCobertura(CausalDeCobertura);  
                                String Tuitiva                   = cad[35];
                                seyci.setTuitiva(Tuitiva); 
                                String CiaPrevisional                   = cad[36];
                                seyci.setCiaPrevisional(CiaPrevisional);
                                String FechaSeccionI                   = cad[37];
                                seyci.setFechaSeccionI(FechaSeccionI);
                                String FechaSeccionIIISolicitante      = cad[38];
                                seyci.setFechaSeccionIIISolicitante(FechaSeccionIIISolicitante);
                                String FecSecIVMedicoRepAFP            = cad[39];
                                seyci.setFecSecIVMedicoRepAFP(FecSecIVMedicoRepAFP);
                                String CausalDeInvalidez               = cad[40];
                                seyci.setCausalDeInvalidez(CausalDeInvalidez);
                                String FechaEnvioCOMAFP               = cad[41];
                                seyci.setFechaEnvioCOMAFP(FechaEnvioCOMAFP);                                        
                                String FecEnvioEvaluado               = cad[42];
                                seyci.setFecEnvioEvaluado(FecEnvioEvaluado);
                                String FecEvaluadoRecibeNotif         = cad[43];
                                seyci.setFecEvaluadoRecibeNotif(FecEvaluadoRecibeNotif);                                          
                                String FechaEnvioCíaSeguros         = cad[44];
                                seyci.setFechaEnvioCíaSeguros(FechaEnvioCíaSeguros);  
                                String NivelEstudios         = cad[45];
                                seyci.setNivelEstudios(NivelEstudios); 
                                String Grado1         = cad[46];
                                seyci.setGrado1(Grado1);  
                                String Subdisio         = cad[47];
                                seyci.setSubdisio(Subdisio);
                                String FechaInicioSubsidio         = cad[48];
                                seyci.setFechaInicioSubsidio(FechaInicioSubsidio); 
                                String FechaFinSubsidio         = cad[49];
                                seyci.setFechaFinSubsidio(FechaFinSubsidio);     
                                String SituacionLaboralActual         = cad[50];
                                seyci.setSituacionLaboralActual(SituacionLaboralActual);                                       
                                String SeguroComplementario         = cad[51];
                                seyci.setSeguroComplementario(SeguroComplementario);  
                                String FecIniOcurrenciaSCTR         = cad[52];
                                seyci.setFecIniOcurrenciaSCTR(FecIniOcurrenciaSCTR);                                       
                                String FecFinOcurrenciaSCTR         = cad[53];
                                seyci.setFecFinOcurrenciaSCTR(FecFinOcurrenciaSCTR); 
                                String ActividadLaboral         = cad[54];
                                seyci.setActividadLaboral(ActividadLaboral); 
                                String CircunstanciasInvalidez         = cad[55];
                                seyci.setCircunstanciasInvalidez(CircunstanciasInvalidez); 
                                String Diagnostico         = cad[56];
                                seyci.setDiagnostico(Diagnostico); 
                                String DetalleOtrosDocs         = cad[57];
                                seyci.setDetalleOtrosDocs(DetalleOtrosDocs);                                       
                                String ObservacionesSeyci         = cad[58];
                                seyci.setObservacionesSeyci(ObservacionesSeyci); 
                                String MotivoDeCancelacion         = cad[59];
                                seyci.setMotivoDeCancelacion(MotivoDeCancelacion); 
                                String ObservacionesCancelacion         = cad[60];
                                seyci.setObservacionesCancelacion(ObservacionesCancelacion); 
                                String NroDictamenCOMAFP         = cad[61];
                                seyci.setNroDictamenCOMAFP(NroDictamenCOMAFP);  
                                String NroDeEvaluacion1         = cad[62];
                                seyci.setNroDeEvaluacion1(NroDeEvaluacion1);                                      
                                String EntidadEvaluadora1         = cad[63];
                                seyci.setEntidadEvaluadora1(EntidadEvaluadora1);
                                String FechaDeEmision1         = cad[64];
                                seyci.setFechaDeEmision1(FechaDeEmision1);
                                String FechaRecepcion1         = cad[65];
                                seyci.setFechaRecepcion1(FechaRecepcion1);                                        
                                String FechaInicioVigencia1         = cad[66];
                                seyci.setFechaInicioVigencia1(FechaInicioVigencia1);  
                                String FechaFinVigencia1         = cad[67];
                                seyci.setFechaFinVigencia1(FechaFinVigencia1); 
                                String Meses1         = cad[68];
                                seyci.setMeses1(Meses1);                                         
                                String FechaProximaEvaluacion1         = cad[69];
                                seyci.setFechaProximaEvaluacion1(FechaProximaEvaluacion1);
                                String FechaOcurrencia1         = cad[70];
                                seyci.setFechaOcurrencia1(FechaOcurrencia1);                                       
                                String IndicadorDeDefinitivo1         = cad[71];
                                seyci.setIndicadorDeDefinitivo1(IndicadorDeDefinitivo1); 
                                String Estado2         = cad[72];
                                seyci.setEstado2(Estado2); 
                                String Grado2         = cad[73];
                                seyci.setGrado2(Grado2);                                         
                                String Naturaleza1         = cad[74];
                                seyci.setNaturaleza1(Naturaleza1); 
                                String PorcMenoscaboAsignado1         = cad[75];
                                seyci.setPorcMenoscaboAsignado1(PorcMenoscaboAsignado1); 
                                String CalificacionInvalidez1         = cad[76];
                                seyci.setCalificacionInvalidez1(CalificacionInvalidez1);
                                String IndExclusion1         = cad[77];
                                seyci.setIndExclusion1(IndExclusion1);
                                String FecNotifDictAlEvaluado         = cad[78];
                                seyci.setFecNotifDictAlEvaluado(FecNotifDictAlEvaluado);
                                String ObservacionesDictamenCOMAFP         = cad[79];
                                seyci.setObservacionesDictamenCOMAFP(ObservacionesDictamenCOMAFP);
                                String SolApelacion         = cad[80];
                                seyci.setSolApelacion(SolApelacion);
                                String FecSolicitudApelacion         = cad[81];
                                seyci.setSolApelacion(FecSolicitudApelacion);
                                String FecEnvioApelacion         = cad[82];
                                seyci.setFecEnvioApelacion(FecEnvioApelacion);                                        
                                String FecNotificacionApelacion         = cad[83];
                                seyci.setFecNotificacionApelacion(FecNotificacionApelacion);                                        
                                String FecRecepcionDelAfiliado         = cad[84];
                                seyci.setFecRecepcionDelAfiliado(FecRecepcionDelAfiliado);                                         
                                String ObjetoApelacion         = cad[85];
                                seyci.setObjetoApelacion(ObjetoApelacion);
                                String MotivoApelacion         = cad[86];
                                seyci.setMotivoApelacion(MotivoApelacion);                                       
                                String EntidadQueApela         = cad[87];
                                seyci.setEntidadQueApela(EntidadQueApela);                                         
                                String NroDictamenCOMEC         = cad[88];
                                seyci.setNroDictamenCOMEC(NroDictamenCOMEC); 
                                String NroDeEvaluacion2         = cad[89];
                                seyci.setNroDeEvaluacion2(NroDeEvaluacion2);                                        
                                String EntidadEvaluadora2         = cad[90];
                                seyci.setEntidadEvaluadora2(EntidadEvaluadora2);  
                                String FechaDeEmision2         = cad[91];
                                seyci.setFechaDeEmision2(FechaDeEmision2);   
                                String FechaRecepcion2         = cad[92];
                                seyci.setFechaRecepcion2(FechaRecepcion2);                                       
                                String FechaInicioVigencia2         = cad[93];
                                seyci.setFechaInicioVigencia2(FechaInicioVigencia2);  
                                String FechaFinVigencia2         = cad[94];
                                seyci.setFechaFinVigencia2(FechaFinVigencia2);
                                String Meses2         = cad[95];
                                seyci.setMeses2(Meses2); 
                                String FechaProximaEvaluacion2         = cad[96];
                                seyci.setFechaProximaEvaluacion2(FechaProximaEvaluacion2);                                         
                                String FechaOcurrencia2         = cad[97];
                                seyci.setFechaOcurrencia2(FechaOcurrencia2);
                                String IndicadordeDefinitivo2         = cad[98];
                                seyci.setIndicadordeDefinitivo2(IndicadordeDefinitivo2);
                                String Estado3         = cad[99];
                                seyci.setEstado3(Estado3);
                                String Grado3         = cad[100];
                                seyci.setGrado3(Grado3);
                                String Naturaleza2         = cad[101];
                                seyci.setNaturaleza2(Naturaleza2);
                                String PorMenoscaboAsignado2         = cad[102];
                                seyci.setPorMenoscaboAsignado2(PorMenoscaboAsignado2);
                                String IndExclusion2         = cad[103];
                                seyci.setIndExclusion2(IndExclusion2);
                                String CalificacionInvalidez2         = cad[104];
                                seyci.setCalificacionInvalidez2(CalificacionInvalidez2);
                                String FecNotifDictCOMECAFP         = cad[105];
                                seyci.setFecNotifDictCOMECAFP(FecNotifDictCOMECAFP);
                                String ObservacionesDictamenCOMEC         = cad[106];
                                seyci.setObservacionesDictamenCOMEC(ObservacionesDictamenCOMEC);
                                String NroRetiro         = cad[107];
                                seyci.setNroRetiro(NroRetiro);
                                String FechaSolicitudRetiro         = cad[108];
                                seyci.setFechaSolicitudRetiro(FechaSolicitudRetiro);
                                String TramitePensionIniciado         = cad[109];
                                seyci.setTramitePensionIniciado(TramitePensionIniciado); 
                                String CalificacionInvalidez3         = cad[110];
                                seyci.setCalificacionInvalidez3(CalificacionInvalidez3);                                       
                                String SaldoFechaDeRetiro         = cad[111];
                                seyci.setSaldoFechaDeRetiro(SaldoFechaDeRetiro); 
                                String PorcDeRetiro         = cad[112];
                                seyci.setPorcDeRetiro(PorcDeRetiro);
                                String MontoEntregar         = cad[113];
                                seyci.setMontoEntregar(MontoEntregar); 
                                String EstadoDeRetiro         = cad[114];
                                seyci.setEstadoDeRetiro(EstadoDeRetiro); 
                                String FechaDeAcreditacion         = cad[115];
                                seyci.setFechaDeAcreditacion(FechaDeAcreditacion); 
                                String MontoAcreditado         = cad[116];
                                seyci.setMontoAcreditado(MontoAcreditado);
                                String NroSolJA         = cad[117];
                                seyci.setNroSolJA(NroSolJA);
                                String TipoDeBeneficio         = cad[118];
                                seyci.setTipoDeBeneficio(TipoDeBeneficio);
                                String FechaSolJA         = cad[119];
                                seyci.setFechaSolJA(FechaSolJA);
                                String StadoSolJA         = cad[120];
                                seyci.setStadoSolJA(StadoSolJA);
                                cantidad++;
                                daoSolicitud.InsertarSEYCI(seyci);
                                }
                                
                                
                                
                                
                           }
                           }catch(Exception e){
				System.out.println("Introduciste un dato erroneo.");
                                String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                archivo.setDescripcionError(mensaje);
                                daoUtil.insertarLineaError(archivo);
				cantidadErrados ++;
			   }
                    }while(true);
                     
                    
                }catch(Exception e)
                {
                    n=101;
                    e.printStackTrace();
                }
             
                //ACTULIZAR ESTADO DE LA CARGA
                archivo.setTipoArchivo(Integer.parseInt(tipoArchivo));
                archivo.setNombreArchivo(myFile.getFileName());
                archivo.setEstadoCarga("F");
                archivo.setCantidad(cantidad);
                archivo.setCantidadErrados(cantidadErrados);

                daoUtil.insertarDataCarga(archivo);

            
             
             }
        
        //FIN DE ARCHIVO DE SEYCI
        
        //INICIO DE ARCHIVO DE NOMINA
             if(tipoArchivo.equals("4")){
                  
            System.out.println(" Archivo de Nomina  " + tipoArchivo);
             
             
             try {
            //guarda los datos del fichero
            InputStream stream = myFile.getInputStream();
            InputStreamReader isr= new InputStreamReader(stream,"ISO-8859-1");
            //BufferedReader buffer= new BufferedReader(isr);
            
            ruta=sesion.getServletContext().getRealPath("/")+"/archivos/"+myFile.getFileName();
            FileOutputStream os = new FileOutputStream(new File(ruta));
                byte[] buffer = new byte[8192];
                int bytesLeidos = 0;
                while ((bytesLeidos = stream.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesLeidos );
                }
                os.close();
                os.flush();
             }catch(Exception e)
             {
              e.printStackTrace();
             }
             
             
             try
                {
      
                    File file=new File(ruta);
                    //BufferedReader entrada = new BufferedReader( new FileReader( file ) );

                    FileInputStream fis = new FileInputStream(ruta);
                    InputStreamReader is = new InputStreamReader(fis, "ISO-8859-1");
                    BufferedReader entrada = new BufferedReader(is);
                    
                    int numLineas=0;
                    int contador=0;
                    

                    String datos []=new String [numLineas];
                    String[] cad;
                    String cadenaCsv="";
                    
                    String linea = entrada.readLine();
                    
                     while (linea != null && contador<numLineas)
                    {
                       datos[contador]=linea;
                       linea = entrada.readLine();
                       contador++;
                    }
                     
                     contador++;
                     
                    do{
                        try{
                           linea = entrada.readLine();
                            if (linea == null){
                               break;
                            }    
                            else
                            {
                             contador++;
                             System.out.println(String.valueOf(contador)+": "+linea);
                             cad=linea.split(";");
                             System.out.println("Tamaño :"+cad.length);
                                
                                Nomina nomina = new Nomina();
                                
                                
                                if(cad.length==0){
                                
                                   System.out.println("EL Numero de  Linea "+String.valueOf(contador)+ " No se Puede Insertar" + linea);
                                   String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                   archivo.setDescripcionError(mensaje);
                                   daoUtil.insertarLineaError(archivo);
                                   cantidadErrados++;
                                }
                                
                                else{
                                
                                    String PrimerCampo                      = cad[0];
                                    String Fecha                            = cad[1];
                                    nomina.setFecha(Fecha);
                                    String NumeroDeSolicitud                = cad[2];
                                    nomina.setNumeroDeSolicitud(NumeroDeSolicitud);
                                    String CUSPP1                           = cad[3];
                                    nomina.setCUSPP1(CUSPP1);
                                    String Afiliado1                        = cad[4];
                                    nomina.setAfiliado1(Afiliado1);
                                    String EjecutivoDeServicioDeAtencion1   = cad[5];
                                    nomina.setEjecutivoDeServicioDeAtencion1(EjecutivoDeServicioDeAtencion1);
                                    String Agencia1                         = cad[6];
                                    nomina.setAgencia1(Agencia1);
                                    String Ejecutiva                        = cad[7];
                                    nomina.setEjecutiva(Ejecutiva);
                                    String TramiteDerivacionPensionistas    = cad[8];
                                    nomina.setTramiteDerivacionPensionistas(TramiteDerivacionPensionistas);
                                    String Comentario                       = cad[9];
                                    nomina.setComentario(Comentario);
                                    String FechaDeValija                    = cad[10];
                                    nomina.setFechaDeValija(FechaDeValija);
                                    String FechaTramite                     = cad[11];
                                    nomina.setFechaTramite(FechaTramite);
                                    String FechaDigitalizacionRecepcion     = cad[12];
                                    nomina.setFechaDigitalizacionRecepcion(FechaDigitalizacionRecepcion);
                                    String FechaDeEntrega                   = cad[13];
                                    nomina.setFechaDeEntrega(FechaDeEntrega);
                                    String CUSPP2                           = cad[14];
                                    nomina.setCUSPP2(CUSPP2);
                                    String Afiliado2                        = cad[15];
                                    nomina.setAfiliado2(Afiliado2);
                                    String TipoTramite                      = cad[16];
                                    nomina.setTipoTramite(TipoTramite);
                                    String Seccion                          = cad[17];
                                    nomina.setSeccion(Seccion);
                                    String Analista                         = cad[18];
                                    nomina.setAnalista(Analista);
                                    String NumeroSolicitud                  = cad[19];
                                    nomina.setNumeroSolicitud(NumeroSolicitud);
                                    String Agencia2                         = cad[20];
                                    nomina.setAgencia2(Agencia2);
                                    String EjecutivoDeServicioDeAtencion2   = cad[21];
                                    nomina.setEjecutivoDeServicioDeAtencion2(EjecutivoDeServicioDeAtencion2);
                                    String ObservacionesDelAnalistaDeAsigna = cad[22];
                                    nomina.setObservacionesDelAnalistaDeAsigna(ObservacionesDelAnalistaDeAsigna);

                                    cantidad++;
                                    daoSolicitud.InsertarNomina(nomina);
                                
                                   }
                            }
                           }catch(Exception e){
				System.out.println("Introduciste un dato erroneo.");
                                String mensaje = "EL Numero de  Linea " +String.valueOf(contador)+ " No se Puede Insertar";
                                archivo.setDescripcionError(mensaje);
                                daoUtil.insertarLineaError(archivo);
				cantidadErrados ++;
			   }
                                
                         }while(true);
                     
                    
                }catch(Exception e)
                {
                    n=101;
                    e.printStackTrace();
                }
             
                //ACTULIZAR ESTADO DE LA CARGA
                archivo.setTipoArchivo(Integer.parseInt(tipoArchivo));
                archivo.setNombreArchivo(myFile.getFileName());
                archivo.setEstadoCarga("F");
                archivo.setCantidad(cantidad);
                archivo.setCantidadErrados(cantidadErrados);

                daoUtil.insertarDataCarga(archivo);
                    
                    
                /*    
                    
                    
                    entrada.readLine();

                    String cadenaCsv="";
                    Vector resultados=new Vector();
                    int contador=1;
                    int contador2=1;
                    int totalregistros=0;
                    String[] cad;
                    
                    if(file.exists())
                    {
                      do 
                      {
                           cadenaCsv = entrada.readLine();
                           if (cadenaCsv == null){
                               break;
                           }    
                            else
                            {
                             System.out.println(String.valueOf(contador)+": "+cadenaCsv);
                             cad=cadenaCsv.split(";");
                             System.out.println("Tamaño :"+cad.length);
                             Nomina nomina = new Nomina();
                                
                                String PrimerCampo                      = cad[0];
                                String Fecha                            = cad[1];
                                nomina.setFecha(Fecha);
                                String NumeroDeSolicitud                = cad[2];
                                nomina.setNumeroDeSolicitud(NumeroDeSolicitud);
                                String CUSPP1                           = cad[3];
                                nomina.setCUSPP1(CUSPP1);
                                String Afiliado1                        = cad[4];
                                nomina.setAfiliado1(Afiliado1);
                                String EjecutivoDeServicioDeAtencion1   = cad[5];
                                nomina.setEjecutivoDeServicioDeAtencion1(EjecutivoDeServicioDeAtencion1);
                                String Agencia1                         = cad[6];
                                nomina.setAgencia1(Agencia1);
                                String Ejecutiva                        = cad[7];
                                nomina.setEjecutiva(Ejecutiva);
                                String TramiteDerivacionPensionistas    = cad[8];
                                nomina.setTramiteDerivacionPensionistas(TramiteDerivacionPensionistas);
                                String Comentario                       = cad[9];
                                nomina.setComentario(Comentario);
                                String FechaDeValija                    = cad[10];
                                nomina.setFechaDeValija(FechaDeValija);
                                String FechaTramite                     = cad[11];
                                nomina.setFechaTramite(FechaTramite);
                                String FechaDigitalizacionRecepcion     = cad[12];
                                nomina.setFechaDigitalizacionRecepcion(FechaDigitalizacionRecepcion);
                                String FechaDeEntrega                   = cad[13];
                                nomina.setFechaDeEntrega(FechaDeEntrega);
                                String CUSPP2                           = cad[14];
                                nomina.setCUSPP2(CUSPP2);
                                String Afiliado2                        = cad[15];
                                nomina.setAfiliado2(Afiliado2);
                                String TipoTramite                      = cad[16];
                                nomina.setTipoTramite(TipoTramite);
                                String Seccion                          = cad[17];
                                nomina.setSeccion(Seccion);
                                String Analista                         = cad[18];
                                nomina.setAnalista(Analista);
                                String NumeroSolicitud                  = cad[19];
                                nomina.setNumeroSolicitud(NumeroSolicitud);
                                String Agencia2                         = cad[20];
                                nomina.setAgencia2(Agencia2);
                                String EjecutivoDeServicioDeAtencion2   = cad[21];
                                nomina.setEjecutivoDeServicioDeAtencion2(EjecutivoDeServicioDeAtencion2);
                                String ObservacionesDelAnalistaDeAsigna = cad[22];
                                nomina.setObservacionesDelAnalistaDeAsigna(ObservacionesDelAnalistaDeAsigna);
                                      
                                resultados.add(contador-1,String.valueOf(n));
                                cantidad++;
                                daoSolicitud.InsertarNomina(nomina);
                            }
                       } while ( true );
                    }
                }catch(Exception e)
                {
                    n=101;
                    e.printStackTrace();
                }
                
             
                        archivo.setTipoArchivo(Integer.parseInt(tipoArchivo));
                        archivo.setNombreArchivo(myFile.getFileName());
                        archivo.setEstadoCarga("F");
                        archivo.setCantidad(cantidad);
                        archivo.setCantidadErrados(cantidadErrados);
                        daoUtil.insertarDataCarga(archivo);
                
                */
             
             }
             
        /*FIN DEL ARCHIVO DE CARGA DE NOMINA*/   
        /*OBTENER LISTA DE CARGA*/

        
        List<Archivo> listCarga = daoUtil.ListadoCarga(archivo);
               
        System.out.println(" Tamanio de Archivos Cargados " + listCarga.size());
        
        if (listCarga != null) {
                    req.setAttribute("listCarga", listCarga);
        }
        
                
        return mapping.findForward("success");
    } 
    
    public ActionForward generarCsvError(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)
        throws Exception
    {
        System.out.println(" Entro Metodo generarCsvError ");
        IfaceUtil daoUtil = new ImpUtil();
        String idArchivo  =  req.getParameter("idArchivo");
        int id= Integer.parseInt(idArchivo);  
        
        Archivo archivo = new Archivo();
        archivo.setTipoArchivo(id);
        
         try {
            
            List<Archivo> listError = daoUtil.ListarErrores(archivo);
            System.out.println("Cantidad de Registros Encontrados: "+listError.size());
            //procesoGeneracionDocumentosXls(listaDocumento,res);  
            procesoGeneracionDocumentosCSV(listError,res, req);  
    
        } catch(Exception e) {
             e.printStackTrace();
        }
  
       return null; 
    }
    
    
   public void procesoGeneracionDocumentosCSV(List lista,HttpServletResponse res, HttpServletRequest req)
  {
      HttpSession sesion    = req.getSession();
      Archivo dto;
      Calendar ahoraCal = Calendar.getInstance();
      ahoraCal.get(Calendar.DATE);
      ahoraCal.get(Calendar.MONTH);
      ahoraCal.get(Calendar.YEAR);
      
      String Formato = "Consulta"+ "" +ahoraCal.get(Calendar.YEAR)+ "" +ahoraCal.get(Calendar.MONTH) + "" +ahoraCal.get(Calendar.DATE)+ ".csv";
      
      
      String path = req.getRealPath("/archivos/")+Formato;
              
       //sesion.getServletContext().getRealPath("/")+"/archivos/"+Formato;
      //String path = sesion.getServletContext().getRealPath("/")+"/archivos/"+myFile.getFileName();
  
      //FileWriter fileWriter=null;
      PrintWriter printWriter =null;
      
      try{   
          printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(path), "ISO-8859-1"));
          printWriter.println("ERROR");
          
          
          
          for(int x=0;x<lista.size();x++) {
            dto = new Archivo();
            
            dto = (Archivo)lista.get(x);
            
            String Error =dto.getDescripcionError()==null ? "" : dto.getDescripcionError();        

            //System.out.println(" Trama :" + DocNroDocumento+","+DescrDocumento+","+DocDestinatarioCodigo+","+Destinatario+","+Direccion+","+Urbanizacion+","+DestinatarioUbigeo+","+Destino+","+Email+","+EstNombre+"," + DocfechaIngresoIni+","+DocfechaIngreso+","+Docfecha3+","+DocLotId+","+Codigo+","+Asesor+","+Agencia+","+Gestor+","+Telefono+","+Categoria+","+Envios+","+Target+"");
            
             printWriter.println(
                   Error+""
             );                               
          }
          
          printWriter.close();
          
         FileInputStream archivo = new FileInputStream(path);
                     
         int longitud = archivo.available(); 
         byte[] datos = new byte[longitud]; 
         archivo.read(datos); 
         archivo.close(); 
         res.setContentType("text/csv;ISO-8859-1"); 
         res.setHeader("Content-Disposition","attachment;filename="+Formato); 
         ServletOutputStream ouputStream = res.getOutputStream(); 
         ouputStream.write(datos); 
         ouputStream.flush();  
         ouputStream.close();
          
         File fichero = new File(path);
         fichero.delete();
         
      }catch(Exception e){      
          e.printStackTrace();      
      }
      
  }  
   
   public boolean isnull(Object a){

  if(a==null){
     return true;
   }
     return false;
   }
    
}
