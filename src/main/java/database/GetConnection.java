package database;



import com.mysql.cj.jdbc.MysqlDataSource;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.logging.Logger;  

public class GetConnection {
	
	public GetConnection() {
		// TODO Auto-generated constructor stub
	}
	
	public static Connection Connection() throws SQLException {
		Connection conn = null;
	 
	    
		/*parametros para la conexion*/
	    String driver = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/pruebas";
	    String usuario = "root";
	    String clave = "089320";
	    
	    try {
	    	
			Class.forName(driver);
			conn = DriverManager.getConnection(url,usuario,clave);
						
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static ResultSet GetResultSet(Connection conn) throws Exception {
		ResultSet rs = null;

	    
	    try {
	    	
			Statement stmt = conn.createStatement();
			
			String sql = "Select * from pruebas.reporte_gastos";
			rs =  stmt.executeQuery(sql);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		return rs;
	}
   
   
}