<%@page import="java.util.Random"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang = "en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OTP Verification</title>
</head>
<body>
<form action="otpprocess.jsp" method="post">
<b>Enter OTP:</b><input type="text" name="otpvalue"/>
<br><br>
<b>Enter New Password:</b>
<input type="password" name = "password1"/>
<br><br><br>
<input type="submit" value="submit" />
</form>
</body>
</html>