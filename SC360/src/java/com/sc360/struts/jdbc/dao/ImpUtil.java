/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.jdbc.dao;


import com.sc360.struts.dto.Archivo;
import com.sc360.struts.dto.Asignacion;
import com.sc360.struts.dto.EstadoSolicitud;
import com.sc360.struts.dto.TipoArchivo;
import com.sc360.struts.dto.TiposDocumento;
import com.sc360.struts.dto.Parametro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import com.sc360.struts.jdbc.conexion.ConectaDb;

/**
 *
 * @author epuma
 */
public class ImpUtil implements IfaceUtil{
    
    private final ConectaDb db;
    private final StringBuilder sql;
    private final StringBuilder sql_;
    private final StringBuilder sql_1;
    private final StringBuilder sql_2;
    private final StringBuilder sql_3;
    private final StringBuilder sql_4;
    private String message;
    
    public ImpUtil() {
        this.db = new ConectaDb();
        this.sql = new StringBuilder();
        this.sql_ = new StringBuilder();
        this.sql_1 = new StringBuilder();
        this.sql_2 = new StringBuilder();
        this.sql_3 = new StringBuilder();
        this.sql_4 = new StringBuilder();
    }

    @Override
    public List<TiposDocumento> tiposDpcumentoQry() {
        
        
        List<TiposDocumento> list = null;
        sql.append("SELECT ")
                .append("codigoTipoDocumento,")
                .append("descripcionTipoDocumento ")
                .append("FROM TIPODOCUMENTO");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql.toString());
                ResultSet rs = ps.executeQuery()) {

            list = new LinkedList<>();
            while (rs.next()) {
                TiposDocumento p = new TiposDocumento();

                p.setCodigoTipoDocumento(rs.getString(1));
                p.setDescripcionTipoDocumento(rs.getString(2));

                list.add(p);
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return list;
        
        
    }
    
    @Override
    public List<EstadoSolicitud> tiposEstadosQry() {
        
         List<EstadoSolicitud> list = null;
        sql_.append("SELECT ")
                .append("codigoTipoEstado,")
                .append("descripcionTipoEstado ")
                .append("FROM ESTADOSOLICITUD");
        
        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql_.toString());
                ResultSet rs = ps.executeQuery()) {

            list = new LinkedList<>();
            while (rs.next()) {
                EstadoSolicitud p = new EstadoSolicitud();

                p.setCodigoTipoEstado(rs.getString(1));
                p.setDescripcionTipoEstado(rs.getString(2));

                list.add(p);
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return list;
    }
    
    
    @Override
    public String insertarDataCarga(Archivo dto) {
        
        
        String query = "{ call SP_INSERTAR_DATOS_CARGA(?,?,?,?,?) }";
        
        try (
                Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(query.toString())
                
                ){
            
                ps.setInt(1, dto.getTipoArchivo());
                ps.setString(2, dto.getNombreArchivo());
                ps.setString(3, dto.getEstadoCarga());
                ps.setInt(4, dto.getCantidad());
                ps.setInt(5,dto.getCantidadErrados());
                
                int cant = ps.executeUpdate();
                System.out.println(" Cantidad Log : " + cant);
                if (cant == 0) {
                throw new SQLException("0 filas afectadas");
            }


        } catch (SQLException e) {
            message = e.getMessage();
        }
        
        return message;
        
        
        
    }
    
    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public List<Archivo> ListadoCarga(Archivo dto) {
        
        
         List<Archivo> listArchivo = null;
         String query = "{ call SP_LISTAR_CARGA_ARCHIVOS(?) }";
        
        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(query.toString());
                ) {
            
                ps.setInt(1, dto.getTipoArchivo());
                ResultSet rs = ps.executeQuery();

            listArchivo = new LinkedList<>();
            while (rs.next()) {
                Archivo p = new Archivo();

                p.setNombreArchivo(rs.getString(1));
                p.setCantidad(rs.getInt(2));
                p.setCantidadErrados(rs.getInt(3));
                p.setFechaInicio(rs.getString(4));
                p.setFechaFin(rs.getString(5));
                p.setEstadoCarga(rs.getString(6));
                p.setTipoArchivo(rs.getInt(7));

                listArchivo.add(p);
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return listArchivo;
        
        
    }

    @Override
    public List<TipoArchivo> tiposArchivoQry() {
        
        List<TipoArchivo> list = null;
        sql_1.append("SELECT ")
                .append("idtipoArchivo,")
                .append("descripcionArchivo ")
                .append("FROM TIPOARCHIVO WHERE ESTADOARCHIVO='A' ");
        
        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql_1.toString());
                ResultSet rs = ps.executeQuery()) {

            list = new LinkedList<>();
            while (rs.next()) {
                TipoArchivo p = new TipoArchivo();

                p.setTipoArchivo(rs.getString(1));
                p.setDescripcion(rs.getString(2));

                list.add(p);
            }
            
            sql_1.delete(0, sql_1.length());

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return list;
   
    }

   @Override
    public List<Parametro> departamentosCbo() {

        List<Parametro> list = null;

        sql.append("SELECT ")
                .append("iddepartamento, departamento ")
                .append("from departamentos ");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql.toString());
                ResultSet rs = ps.executeQuery()) {

            list = new LinkedList<>();

            while (rs.next()) {

                /*Object[] reg = new Object[2];

                reg[0] = rs.getInt(1);
                reg[1] = rs.getString(2);

                list.add(reg);*/
                Parametro parametro =new Parametro();
                parametro.setCodigo(rs.getString("iddepartamento"));
                parametro.setDescripcion(rs.getString("departamento"));
                list.add(parametro);
            }

        } catch (SQLException e) {

            message = e.getMessage();
        }

        return list;
    } 

    @Override
    public List<Parametro> provinciasXdepa(String tipoUbigeo, String idDepartamento,String idProvincia, String idDistrito) {
        
    System.out.println(" Id Departamento " + idDepartamento); 
        
    List<Parametro> list = null;
        sql_2.append("SELECT ")
                .append("idprovincia, ")
                .append("provincia ")
                .append("from provincias ")
                .append("WHERE IDDEPARTAMENTO = ? AND PROVINCIA=? ");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql_2.toString())) {
       
                ps.setString(1, idDepartamento);
                ps.setString(2, idProvincia);
            
            try(ResultSet rs = ps.executeQuery()) {
                
                list = new LinkedList<>();
                
                while (rs.next()) {
                   
                    Parametro p = new Parametro();

                    p.setCodigo(rs.getString(1));
                    p.setDescripcion(rs.getString(2));

                    list.add(p);
                    
                }
                
                
            } catch (SQLException e) {
                message = e.getMessage();
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return list;

    }

    @Override
    public List<Parametro> distritoXprovincia(String tipoUbigeo, String idDepartamento,String idProvincia, String idDistrito) {
        
        List<Parametro> list = null;
        sql_3.append("SELECT ")
                .append("iddistrito, ")
                .append("distrito ")
                .append("from distritos ")
                .append("WHERE idprovincia = ? AND DISTRITO=? ");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql_3.toString())) {
            
            ps.setString(1, idProvincia);
            ps.setString(2, idDistrito);
            
            try(ResultSet rs = ps.executeQuery()) {
                
                list = new LinkedList<>();
                
                while (rs.next()) {
                   
                    Parametro p = new Parametro();

                    p.setCodigo(rs.getString(1));
                    p.setDescripcion(rs.getString(2));

                    list.add(p);
                    
                }
                
                
            } catch (SQLException e) {
                message = e.getMessage();
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return list;
        
        
    }

    @Override
    public List<Archivo> ListarErrores(Archivo dto) {
        
        List<Archivo> listErrores = null;
         String query = "{ call SP_LISTAR_ERRORES(?) }";
        
        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(query.toString());
                ) {
            
                ps.setInt(1, dto.getTipoArchivo());
                ResultSet rs = ps.executeQuery();

            listErrores = new LinkedList<>();
            while (rs.next()) {
                Archivo p = new Archivo();

                p.setDescripcionError(rs.getString(1));

                listErrores.add(p);
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return listErrores;
        
        
        
    }

    @Override
    public String insertarLineaError(Archivo dto) {
        
        
         String query = "{ call SP_INSERTAR_LOG(?,?,?) }";
        
        try (
                Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(query.toString())
                
                ){
            
                ps.setInt(1, dto.getTipoArchivo());
                ps.setString(2, dto.getNombreArchivo());
                ps.setString(3, dto.getDescripcionError());
                
                int cant = ps.executeUpdate();
                System.out.println(" Cantidad Log : " + cant);
                if (cant == 0) {
                throw new SQLException("0 filas afectadas");
            }


        } catch (SQLException e) {
            message = e.getMessage();
        }
        
        return message;
        
        
    }

    @Override
    public List<Asignacion> ListadoAsignacion(Asignacion dto) {
        
        List<Asignacion> listAsignacion = null;
         String query = "{ call SP_LISTAR_NOMINA() }";
        
        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(query.toString());
                ) {
            
                ResultSet rs = ps.executeQuery();

            listAsignacion = new LinkedList<>();
            while (rs.next()) {
                Asignacion p = new Asignacion();

                p.setFecha(rs.getString(1));
                p.setNumeroSolicitud(rs.getString(2));
                p.setCuspp(rs.getString(3));
                p.setAfiliado(rs.getString(4));
                p.setEjecutivoServicioAtencion(rs.getString(5));
                p.setAnalista(rs.getString(6));

                listAsignacion.add(p);
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return listAsignacion;
        
        
        
    }
    
    @Override
    public List<Parametro> provinciasXdepaAjax(String tipoUbigeo, String idDepartamento,String idProvincia, String idDistrito) {
        
    System.out.println(" Id Departamento " + idDepartamento); 
        
    List<Parametro> list = null;
        sql_2.append("SELECT ")
                .append("idprovincia, ")
                .append("provincia ")
                .append("from provincias ")
                .append("WHERE IDDEPARTAMENTO = ? ");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql_2.toString())) {
       
                ps.setString(1, idDepartamento);
            
            try(ResultSet rs = ps.executeQuery()) {
                
                list = new LinkedList<>();
                
                while (rs.next()) {
                   
                    Parametro p = new Parametro();

                    p.setCodigo(rs.getString(1));
                    p.setDescripcion(rs.getString(2));

                    list.add(p);
                    
                }
                
                
            } catch (SQLException e) {
                message = e.getMessage();
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return list;

    }


    @Override
    public List<Parametro> distritoXprovinciaAjax(String tipoUbigeo, String idDepartamento,String idProvincia, String idDistrito) {
        
        List<Parametro> list = null;
        sql_3.append("SELECT ")
                .append("iddistrito, ")
                .append("distrito ")
                .append("from distritos ")
                .append("WHERE idprovincia = ? ");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql_3.toString())) {
            
            ps.setString(1, idProvincia);
            
            try(ResultSet rs = ps.executeQuery()) {
                
                list = new LinkedList<>();
                
                while (rs.next()) {
                   
                    Parametro p = new Parametro();

                    p.setCodigo(rs.getString(1));
                    p.setDescripcion(rs.getString(2));

                    list.add(p);
                    
                }
                
                
            } catch (SQLException e) {
                message = e.getMessage();
            }

        } catch (SQLException e) {
            message = e.getMessage();
        }

        return list;
        
        
    }

    @Override
    public List<Parametro> ListadoEjecutivos() {
        
        List<Parametro> list = null;

        sql.append("SELECT ")
                .append("IDEJECUTIVO, NOMBREEJECUTIVO ")
                .append("from EJECUTIVO ");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql.toString());
                ResultSet rs = ps.executeQuery()) {

            list = new LinkedList<>();

            while (rs.next()) {

                /*Object[] reg = new Object[2];

                reg[0] = rs.getInt(1);
                reg[1] = rs.getString(2);

                list.add(reg);*/
                Parametro parametro =new Parametro();
                parametro.setCodigo(rs.getString("IDEJECUTIVO"));
                parametro.setDescripcion(rs.getString("NOMBREEJECUTIVO"));
                list.add(parametro);
            }

        } catch (SQLException e) {

            message = e.getMessage();
        }

        return list;
        
        
    }

    @Override
    public List<Parametro> ListadoAgencias() {
        
        List<Parametro> list = null;

        sql_4.append("SELECT ")
                .append("CODIGOAGENCIA, NOMBREAGENCIA ")
                .append("from AGENCIAS ");

        try (Connection cn = db.getConnection();
                PreparedStatement ps = cn.prepareStatement(sql_4.toString());
                ResultSet rs = ps.executeQuery()) {

            list = new LinkedList<>();

            while (rs.next()) {

                /*Object[] reg = new Object[2];

                reg[0] = rs.getInt(1);
                reg[1] = rs.getString(2);

                list.add(reg);*/
                Parametro parametro =new Parametro();
                parametro.setCodigo(rs.getString("CODIGOAGENCIA"));
                parametro.setDescripcion(rs.getString("NOMBREAGENCIA"));
                list.add(parametro);
            }

        } catch (SQLException e) {

            message = e.getMessage();
        }

        return list;
        
        
    }
    
   
    
}
