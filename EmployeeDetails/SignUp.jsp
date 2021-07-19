<%@ page import="java.io.*"%>
        <%@ page import="java.sql.*"%>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:8080:XE","sys","satish");
        String name=request.getParameter("name");
        String DOB=request.getParameter("DOB");
        String place=request.getParameter("place");
        String mail=request.getParameter("mail");
        String mobile=request.getParameter("mobile");
        String empid=request.getParameter("empid");
        String password=request.getParameter("password");
        String gender=request.getParameter("gender");
        String married=request.getParameter("married");
        String age=request.getParameter("age");
        String degree=request.getParameter("degree");
        PreparedStatement ps=con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,name);
        ps.setString(2,DOB);
        ps.setString(3,place);
        ps.setString(4,mail);
        ps.setString(5,mobile);
        ps.setString(6,empid);
        ps.setString(7,password);
        ps.setString(8,gender);
        ps.setString(9,married);
        ps.setString(10,age);
        ps.setString(11,degree);
        int r=ps.executeUpdate();
        if(r!=0)
	    {%>
        <jsp:forward page="Login.html"></jsp:forward>
        <%}
        else
        {
        out.println("data insertion is failed");
        }
        con.close();
        %>