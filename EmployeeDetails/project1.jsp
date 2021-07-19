<%@ page import="java.io.*"%>
        <%@ page import="java.sql.*"%>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:8080:XE","sys","satish");
        String nameofproj=request.getParameter("nameofproj");
        String client=request.getParameter("client");
        String discription=request.getParameter("discription");
        String teams=request.getParameter("teams");
        String deadline=request.getParameter("deadline");
        String tools=request.getParameter("tools");
        String profit=request.getParameter("profit");
        String invest=request.getParameter("invest");
    
        PreparedStatement ps=con.prepareStatement("insert into projects values(?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,nameofproj);
        ps.setString(2,client);
        ps.setString(3,discription);
        ps.setString(4,teams);
        ps.setString(5,deadline);
        ps.setString(6,tools);
        ps.setString(7,profit);
        ps.setString(8,invest);
       
        int r=ps.executeUpdate();
        if(r!=0)
	    {%>
        <jsp:forward page="project.html"></jsp:forward>
        <%}
        else
        {
        out.println("data insertion is failed");
        }
        con.close();
        %>