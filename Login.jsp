<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.,java.util."%>
<%
String empid=request.getParameter("empid");
session.putValue("empid",empid);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8888/empdt","root","");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where empid='"+empid+"' and password='"+password+"'");
try{
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("empid").equals(empid))
{
%>
<jsp:forward page = "Profile.jsp"></jsp:forward>
<%
}
else{
out.println("Invalid password or username.");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>