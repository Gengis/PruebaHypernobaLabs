
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.lang.*,java.util.*,java.net.*,java.util.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page language="java" import="java.sql.*" %>

<%@ page import="database.*"%>
<%
    /*conexion sera nuestra conexion a la bd*/
    Connection conexion = null;
	ResultSet rs = null;

    String mensaje = "";
 	
    GetConnection conn = new GetConnection();
    
    /*procedimiento de la conexion*/
    try{
		
    	conexion = conn.Connection();
		rs =  conn.GetResultSet(conexion);

        /*guardando la conexion en la session*/
        session.setAttribute("conexion",conexion);

        mensaje="conectado";

        if( conexion.isClosed() ){

            mensaje="desconectado";

        }
        
    } catch (Exception ex){
    	
        mensaje = ex.toString();
    
    }
    
%>


<!DOCTYPE html>

<html>
<head>

<meta charset="ISO-8859-1">
<title>Prueba Hypernova Labs</title>
</head>

<body>

    <center>
        <h1>Reporte de Gastos</h1>
    </center>
    
	
	
        <form action="desconectar.jsp" method="post">
            <input name="estado" type="text" value="Estado: <%= mensaje %>"/>
            <input type="submit" value="Desconectar"/>
        </form>
   
    
<center>
	<table>
		<thead>              
			<th align="center">CONCEPTO</th>
			<th align="center">DESDE</th>
			<th align="center">HASTA</th>
			<th align="center">NOMBRE</th>
			<th align="center">POSICION</th>
			<th align="center">DEPARTAMENTO</th>
			<th align="center">SUPERVISOR</th>
			<th align="center">FECHA</th>
			<th align="center">CUENTA</th>
			<th align="center">DESCRIPCION</th>
			<th align="center">TOTAL</th>
			<th align="center">MONTO FINAL</th>
			<th align="center">APROBADO POR</th>
         </thead>
         <tbody>
         <%
          while (rs.next()) {
          %>
			<tr class="fila">
				<td> <%= rs.getString(2)%></td>
				<td> <%= rs.getString(3)%></td>
				<td> <%= rs.getString(4)%></td>
				<td> <%= rs.getString(5)%></td>
				<td> <%= rs.getString(6)%></td>
				<td> <%= rs.getString(7)%></td>
				<td> <%= rs.getString(8)%></td>
				<td> <%= rs.getString(9)%></td>
				<td> <%= rs.getString(10)%></td>
				<td> <%= rs.getString(11)%></td>
				<td> <%= rs.getString(12)%></td>
				<td> <%= rs.getString(13)%></td>
				<td> <%= rs.getString(14)%></td>
			</tr>
		<%
		}
		%>
		</tbody>
	</table>
</center>
	
</body>
</html>