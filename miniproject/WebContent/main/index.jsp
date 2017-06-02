<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
</head>
<body>
<h3>***메인화면***<br>


<c:if test="${sessionScope.memId ==null}">
	<a href="/miniproject/member/writeForm.jsp">회원가입</a><br>
	<a href="../member/loginForm.jsp">로그인</a><br>
</c:if>	

<c:if test="${memId !=null}">
	<a href="../member/logout.jsp">로그아웃</a><br>
	<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
</c:if>
<a href="../board/boardList.jsp?pg=1">목록</a><br>

</h3>
</body>
</html>