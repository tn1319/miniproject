<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>

<jsp:useBean id="dao" class="board.dao.BoardDAO"/>
    
<%
//데이터 가져오기
int pg=Integer.parseInt(request.getParameter("pg"));


//페이징처리 - 1페이지당 5개씩
int endNum=pg*5;
int startNum=endNum-4;


List<BoardDTO> list=dao.getBoardList(startNum,endNum);
int totalPage=(dao.pageNum()+4)/5;


/*
int startPage=(현재페이지-1)/블럭*블럭+1;
int endPage=시작페이지+블럭-1;
*/
int startPage=(pg-1)/3*3+1;
int endPage=startPage+3-1;
if(endPage>totalPage) endPage=totalPage;



request.setAttribute("pg", pg);
request.setAttribute("list", list);
request.setAttribute("totalPage", totalPage);
request.setAttribute("startPage", startPage);
request.setAttribute("endPage", endPage);

RequestDispatcher dispatcher =request.getRequestDispatcher("boardListView.jsp");
dispatcher.forward(request, response);
%>
