<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>

<jsp:useBean id="dao" class="board.dao.BoardDAO"/>    

<%
int seq = Integer.parseInt(request.getParameter("seq"));
int pg=Integer.parseInt(request.getParameter("pg"));

dao.hitUpdate(seq);
BoardDTO dto=dao.getBoard(seq);

request.setAttribute("dto", dto);
request.setAttribute("pg", pg);

RequestDispatcher dispatcher =request.getRequestDispatcher("boardView.jsp");
dispatcher.forward(request, response);
%>
