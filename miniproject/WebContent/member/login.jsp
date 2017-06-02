<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO"%>
<%@page import="java.net.URLEncoder"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

MemberDAO dao=MemberDAO.getInstance();
String name=dao.login(id, pwd);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(name==null){ 
	response.sendRedirect("loginFail.jsp");
}
else{ 
	//쿠키 - 사생활 침해 우려가 있어 사용x
	/*
	Cookie cookie = new Cookie("memName",URLEncoder.encode(name,"UTF-8"));
	cookie.setMaxAge(30*60);//초단위
	response.addCookie(cookie);//클라이언트에게 쿠키 보내기
	
	Cookie cookie2 =new Cookie("memId",id);
	cookie2.setMaxAge(30*60);//초단위
	response.addCookie(cookie2);
	*/

	//세션
	//HttpSession session=request.getSession(); - 세션 생성
	session.setAttribute("memName", name);
	session.setAttribute("memId", id);
	
	response.sendRedirect("loginOK.jsp");
}
%>
</body>
</html>