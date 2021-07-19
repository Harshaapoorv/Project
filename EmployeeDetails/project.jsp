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
<td><b>Project Name</b></td>
<td><b>Client Name</b></td>
<td><b>Description</b></td>
<td><b>Team Members</b></td>
<td><b>Deadline</b></td>
<td><b>Tools</b></td>
<td><b>Expected Profit</b></td>
<td><b>Investment</b></td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from projects where empid="empid""";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<tr bgcolor="#DEB887">
<td><%=resultSet.getString("nameofproj")%></td>
<td><%=resultSet.getString("client")%></td>
<td><%=resultSet.getString("discription") %></td>
<td><%=resultSet.getString("teams") %></td>
<td><%=resultSet.getString("deadline") %></td>
<td><%=resultSet.getString("tools") %></td>
<td><%=resultSet.getString("profit") %></td>
<td><%=resultSet.getString("invest") %></td>

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