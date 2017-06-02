<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>

<jsp:useBean id="dao" class="board.dao.BoardDAO"/>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
<script type="text/javascript">
function isLogin(seq){
	if('${memId}'==""){
		alert("먼저 로그인 하세요");
		location.href='../member/loginForm.jsp';
	}
	else
		location.href='board.jsp?seq='+seq+'&pg=${pg}';
}
</script>
</head>
<body>
<jsp:include page="../main/home.jsp"/>
<c:if test="${list!=null }">
	<table border="1" cellpadding="3" cellspacing="0" width="100%">
		<tr>
			<th width="50">글번호</th>
			<th>제목</th>
			<th width="100">작성자</th>
			<th width="50">조회수</th>
			<th width="150">작성일</th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.seq }</td>
				<td><a href="#" onclick="isLogin(${dto.seq})">${dto.subject }</a></td>
				<td>${dto.name }</td>
				<td>${dto.hit }</td>
				<td>${dto.logtime }</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<br>
<div style="border:1px red solid; text-align:center;">
	<c:if test="${startPage>3}">
		<a href="boardList.jsp?pg=${startPage-1}" id="paging">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<c:if test="${pg==i }">
			<a class="currentPaging" href="boardList.jsp?pg=${i }">[${i }]</a>
		</c:if>
		<c:if test="${pg!=i }">
			<a class="paging" href="boardList.jsp?pg=${i }">[${i }]</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage<totalPage}">
		<a href="boardList.jsp?pg=${endPage+1}" id="paging">[다음]</a>
	</c:if>
</div>
</body>
</html>