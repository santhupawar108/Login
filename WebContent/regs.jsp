<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* " import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String uname=request.getParameter("email");
String psw=request.getParameter("psw");
String rpsw=request.getParameter("psw-repeat");
String mobile=request.getParameter("mbl");
PrintWriter pw = response.getWriter();

if(psw != rpsw) {
	out.println("Password not matching");
}
try {
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// System.out.println("hiii hello");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","pawar");
	PreparedStatement ps = con.prepareStatement("insert into regis1 values(?,?,?,?)");
	ps.setString(1, uname);
	ps.setString(2, psw);
	ps.setString(3, rpsw);
	ps.setString(4, mobile);
	
	
	int i = ps.executeUpdate();
	if(i>0) {
		pw.println("Sucessfully Register");
		%>
		<script>
		  alert("Hello\nHow are you?");

		</script>
		<%
		 response.sendRedirect("login.jsp");
	
	}
}catch(Exception e){System.out.println(e);}

%>
</body>
</html>