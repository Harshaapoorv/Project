<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String empid=(String)session.getAttribute("empid");
String email=(String)session.getAttribute("email");
String phone=(String)session.getAttribute("phone");
int otp= (Integer) session.getAttribute("otp");
String password1 = (String)session.getAttribute("password1");
String otpvalue=request.getParameter("otpvalue");
int enterOtp=Integer.parseInt(otpvalue);
if(otp==enterOtp)
{
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/employee", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("update table_name set password = ? where emplid = empid");
i.setString(password1);
<!DOCTYPE html>
<html>
    <body>
        <script>
            window.alert("Password Updated Successfully..")
        </script>
    </body>
</html>
%>
<jsp:forward page = "Login.html"></jsp:forward>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
else
{
<!DOCTYPE html>
<html>
    <body>
        <script>
            window.alert("OTP Not Matched")
        </script>
    </body>
</html>
%>
<jsp:forward page = "Login.html"></jsp:forward>
<%
}
%>