<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../script/board.js"></script>
</head>
<body>
<h3><jsp:include page="../main/home.jsp"/>글수정</h3>
	<form name="boardModifyForm" method="post" action="boardModify.jsp">
		<table border="1" cellpadding="3" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value="${dto.subject }" size="49">
					<input type="hidden" name="seq" value="${seq}">
					<input type="hidden" name="pg" value="${pg}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" cols="50" name="content">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="javascript:checkBoardWrite()" value="수정">
					<input type="button" onclick="location.href='board.jsp?seq=${seq}&pg=${pg }'" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>