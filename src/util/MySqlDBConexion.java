package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlDBConexion {
	static{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConexion(){
		Connection con=null;
		try {
			
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sedenorte?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","mysql");           
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
		
}
