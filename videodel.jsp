<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head><title>Video delete</title></head>
<body background="G:\Classroom1.jpg" bgcolor="red">
<form action="videodel.jsp" method="post">
    <b>Video Name to Delete: </b><input type="text" value="" name="ppt">
    <input type="submit" value="DELETE">
    
    <table border=2>
    <tr><td><b>SUBJECT</b></td><td><b>Video</b></td></tr>
    <%
    try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection c= DriverManager.getConnection("jdbc:odbc:akb", "root", "root");
        Statement s= c.createStatement();
        
        String ppt=request.getParameter("ppt");
        if(ppt!=null) {
            String sql="delete from video where video='"+ppt+"'";
            s.execute(sql);
        }
        
        String sql="select * from video";
        ResultSet rs= s.executeQuery(sql);
        while( rs.next() ) {
            %><tr><td><% out.println(rs.getString(1)); %></td><td><% out.println(rs.getString(2)); %></td></tr><%
        }
        rs.close(); s.close(); c.close();
    } catch(Exception e) { out.println(e); }
    %>
    </table>
</form>
</body>
</html>