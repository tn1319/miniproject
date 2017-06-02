function checkBoardWrite(){
	if(document.forms[0].subject.value=="")
		alert("제목을 입력하세요");
	else if(document.forms[0].content.value=="")
		alert("내용을 입력하세요");
	else
		document.forms[0].submit();
}
