<%@ page import="java.sql.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
Connection con=null;
Statement st = null;
ResultSet rs = null;
String email = request.getParameter("email");
String password = request.getParameter("password");
session.setAttribute("email",email);
session.setAttribute("password",password);
String status="Allow";

try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root","root");
	st = con.createStatement();
	String qry ="select * from profile where email='"+email+"' AND password='"+password+"' AND status='"+status+"' "; 
	rs = st.executeQuery(qry);

	if(!rs.next()){
		out.println("<br><br><br><h3><font color=red><center>Enter correct username, password or you are Restricted<br></center></h3>");
%>
		<a href="index.html">Login Again</a>
<%	}
	else
		response.sendRedirect("userpage.jsp");
	
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


