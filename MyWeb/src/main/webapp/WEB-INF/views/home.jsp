<%@page import="com.web.dto.member.MemberInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%
	MemberInfo userInfo = (MemberInfo) request.getAttribute("userInfo");
%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<%
	if(userInfo != null) {
%>
		<p>아이디: <%=userInfo.getId() %></p>
		<p>패스워드: <%=userInfo.getPassword() %></p>
<%
	}
%>
</body>
</html>
