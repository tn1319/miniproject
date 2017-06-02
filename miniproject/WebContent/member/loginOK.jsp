<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
String id=null;
String name=null;

//쿠키
//특정 쿠키만 얻는 것은 불가능, 모든 쿠키를 얻어오게 됨
/*Cookie[] cookies=request.getCookies();
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("memName")) name=URLDecoder.decode(cookies[i].getValue(),"UTF-8");
		if(cookies[i].getName().equals("memId"))id=cookies[i].getValue();
	}
}*/

//세션
name=(String)session.getAttribute("memName");
id=(String)session.getAttribute("memId");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../main/home.jsp"/><br>
<%=name%>님이 로그인<br><br>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">

</body>
</html>