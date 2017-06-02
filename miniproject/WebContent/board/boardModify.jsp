<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="board.dao.BoardDAO"/>
<%
request.setCharacterEncoding("UTF-8"); 
int pg=Integer.parseInt(request.getParameter("pg"));
int seq=Integer.parseInt(request.getParameter("seq"));
String subject=request.getParameter("subject");
String content=request.getParameter("content");

dao.boardModify(seq,subject,content);

request.setAttribute("pg", pg);
request.setAttribute("seq", seq);

RequestDispatcher dispatcher =request.getRequestDispatcher("boardModifyView.jsp");
dispatcher.forward(request, response);
%>