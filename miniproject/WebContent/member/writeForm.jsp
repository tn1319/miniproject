<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function checkWrite(){
			if(document.writeForm.name.value=="") alert("이름을 입력하세요");
			else if(document.writeForm.id.value=="") alert("ID를 입력하세요");
			else if(document.writeForm.pwd.value=="") alert("비밀번호를 입력하세요");
			else if(document.writeForm.pwd.value!=document.writeForm.repwd.value) alert("비밀번호가 맞지않습니다");
			else document.writeForm.submit();
			
		}
	</script>
</head>
<body>
	<form name="writeForm" method="post" action="write.jsp">
		<h3>
			<jsp:include page="../main/home.jsp"/>
			회원가입
		</h3>
		
		<table border="1" cellpadding="3" cellspacing="0">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름입력"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" size="30"></td>
			</tr>
			<tr>
				<td>재확인</td>
				<td><input type="password" name="repwd" size="30"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="0" checked>남 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="1">여
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email1"> @ 
					<select name="email2" style="width:120px">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td>
					<select name="tel1" style="width:70px;">
						<option>010</option>
						<option>011</option>
						<option>019</option>
					</select>&nbsp;-
					<input type="text" name="tel2" size="5">&nbsp;-&nbsp;<input type="text" name="tel3" size="5">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="zipcode" size="5" readonly><br>
					<input type="text" name="addr1" size="50" readonly placeholder="기본주소"><br>
					<input type="text" name="addr2" size="50" placeholder="상세주소"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="javascript:checkWrite()" value="회원가입">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>