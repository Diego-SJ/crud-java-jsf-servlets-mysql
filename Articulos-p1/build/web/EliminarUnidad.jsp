<%-- 
    Document   : Delete
    Created on : 02/02/2018, 03:34:00 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String id = request.getParameter("id");
        PreparedStatement ps = Conexion.Conexion.openConection().prepareStatement("DELETE FROM unidad_medida WHERE id = '"+id+"'");
        ps.executeUpdate();  
       
       response.sendRedirect("unidadDeMedida.jsp");
       
       %>
    </body>
</html>
