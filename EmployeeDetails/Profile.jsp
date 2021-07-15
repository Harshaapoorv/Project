<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String empid = request.getParameter("empid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:8888/";
String database = "test";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
		<title>Profile</title>
        <link rel="stylesheet" href="Profile.css">
    </head>
<body>
    <header>
        <a href = "Profile.jsp" style = "display:inline-block"><b>Profile</b></a>
        <a href = "Attendance.html" style = "display:inline-block"><b>Attendance</b></a>
        <a href = "Statistics.html" style = "display:inline-block; margin-left:2%"><b>Statistics</b></a>
        <a href = "PaySlip.html" style = "display:inline-block"><b>PaySlip</b></a>
        <a href = "Projects.html" style = "display:inline-block"><b>Projects</b></a>
        <a href = "Health.html" style = "display:inline-block"><b>Health</b></a>
        <a href = "MainPage.html" style = "display:inline-block; margin-left:50%" id = "main"><b>Back</b></a>
    </header>
    <img src="profile.png" style="width:15%;height:15%;margin:5%;margin-left:14%;margin-bottom:0%">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#A52A2A">
<td><b>Name</b></td>
<td><b>DOB</b></td>
<td><b>EMPID</b></td>
<td><b>EMAIL</b></td>
<td><b>MOBILENO</b></td>
<td><b>DEGREE</b></td>
<td><b>MARITAL_STATUS</b></td>
<td><b>AGE</b></td>
<td><b>PLACE</b></td>
<td><b>GENDER</b></td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from _____";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<tr bgcolor="#DEB887">
<td><%=resultSet.getString("NAME")%></td>
<td><%=resultSet.getString("DOB")%></td>
<td><%=resultSet.getString("EMPID") %></td>
<td><%=resultSet.getString("EMAIL") %></td>
<td><%=resultSet.getString("MOBILENO") %></td>
<td><%=resultSet.getString("DEGREE") %></td>
<td><%=resultSet.getString("MARITAL_STATUS") %></td>
<td><%=resultSet.getString("AGE") %></td>
<td><%=resultSet.getString("PLACE") %></td>
<td><%=resultSet.getString("GENDER") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>