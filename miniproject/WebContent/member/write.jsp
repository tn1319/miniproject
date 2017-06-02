<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO,member.bean.MemberDTO"%>

<%
request.setCharacterEncoding("UTF-8");//post방식일 경우 인코딩 설정을 해야한다
String name=request.getParameter("name");
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String gender=request.getParameter("gender");
String email1=request.getParameter("email1");
String email2=request.getParameter("email2");
String tel1=request.getParameter("tel1");
String tel2=request.getParameter("tel2");
String tel3=request.getParameter("tel3");
String zipcode=request.getParameter("zipcode");
String addr1=request.getParameter("addr1");
String addr2=request.getParameter("addr2");

MemberDTO dto=new MemberDTO();
dto.setAddr1(addr1);
dto.setAddr2(addr2);
dto.setEmail1(email1);
dto.setEmail2(email2);
dto.setGender(gender);
dto.setId(id);
dto.setName(name);
dto.setPwd(pwd);
dto.setTel1(tel1);
dto.setTel2(tel2);
dto.setTel3(tel3);
dto.setZipcode(zipcode);

MemberDAO dao=MemberDAO.getInstance();//접속할 때마다 생성되므로 한번만 생성되도록 해야함 (싱글톤, heap stack static 중 static영역에 할당하는 것)
int su=dao.write(dto);


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su==1){%>
	회원가입 성공<br><br>
	<input type="button" value="로그인" onclick="javascript:location.href='loginForm.jsp'">
<%}
else{%>
	회원가입 실패<br><br>
	<input type="button" value="뒤로가기" onclick="javascript:history.back()">
<%}%>
</body>
</html>