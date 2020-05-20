package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entidad.Alumno;
import util.MySqlDBConexion;

public class AlumnoModel {

	public int insertaAlumno(Alumno obj){
		int salida = -1;
		
		Connection conn= null;
		PreparedStatement pstm = null;
		try {
			
			conn = MySqlDBConexion.getConexion();
			String sql ="insert into alumno values(null,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getApellido());
			pstm.setString(3, obj.getFecha());
			pstm.setString(4, obj.getCorreo());
			//La variable contiene el número de registros en la BD
			salida = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		
		return salida;
	}
}
