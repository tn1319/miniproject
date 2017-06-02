<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>

<jsp:useBean id="dao" class="board.dao.BoardDAO"/>    

<%
int seq=Integer.parseInt(request.getParameter("seq"));
int pg=Integer.parseInt(request.getParameter("pg"));

BoardDTO dto=dao.getBoard(seq);

request.setAttribute("seq", seq);
request.setAttribute("pg", pg);
request.setAttribute("dto", dto);

RequestDispatcher dispatcher =request.getRequestDispatcher("boardModifyFormView.jsp");
dispatcher.forward(request, response);

%>