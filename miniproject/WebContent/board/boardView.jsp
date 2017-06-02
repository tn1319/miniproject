<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/home.jsp"/><br>
	<table border="1" cellpadding="3" cellspacing="0" width="100%">
		<tr>
			<th colspan="8"><h2>${dto.subject }</h2></th>
		</tr>
		<tr>
			<th>글번호</th>
			<td>${dto.seq}</td>
			<th>작성자</th>
			<td>${dto.name}</td>
			<th>작성일</th>
			<td>${dto.logtime}</td>
			<th>조회수</th>
			<td>${dto.hit}</td>
		</tr>
		<tr>
			<td colspan="8" height="300px"><pre>${dto.content}</pre></td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=${pg}'">
	<c:if test="${sessionScope.memId==dto.id }">
		<input type="button" value="글수정" onclick="location.href='boardModifyForm.jsp?seq=${dto.seq }&pg=${pg}'">
		<input type="button" value="글삭제" onclick="location.href='boardDelete.jsp?seq=${dto.seq}'">
	</c:if>
</body>
</html>