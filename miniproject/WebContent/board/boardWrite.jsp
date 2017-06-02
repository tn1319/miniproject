<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>    
<%    
request.setCharacterEncoding("UTF-8");
String name=(String)session.getAttribute("memName");
String id=(String)session.getAttribute("memId");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

BoardDTO dto=new BoardDTO();
dto.setName(name);
dto.setId(id);
dto.setSubject(subject);
dto.setContent(content);


BoardDAO dao=BoardDAO.getInstance();
dao.boardWrite(dto);
    
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	alert("작성하신 글을 저장하였습니다");
	location.href='boardList.jsp?pg=1'
}
</script>
</head>
<body>
</body>
</html>