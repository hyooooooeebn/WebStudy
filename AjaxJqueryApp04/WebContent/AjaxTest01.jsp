<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//data 구성
			var params = "name=" + $.trim($("#name").val()) 
				+ "&content=" + $.trim($("#content").val());
			
			// check
			// jQuery의 ajax() 함수 사용(호출)
			$.ajax(
			{
				type : "POST"
				, url : "AjaxTest01_ok.jsp"
				, data : params 				//
				, success : function(args)
				{
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
					
				}
				, beforeSend : showRequest // true / false
				, error : function(e)
				{
					alert(e.responseText);
				}
				
			});
			
		});
	});
	
	
	function showRequest()
	{
		if(!$.trim($("#name").val()))
		{
			alert("이름을 입력해야합니다.");
			$("#name").focus();
			
			return false;
		}
		
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습 </h1>
	<hr>
</div>

<div>
	이름 : <input type="text" id="name" class="txt" /><br><br>
	내용 
	<textarea rows="3" cols="50" id="content"></textarea>
	<br /><br />
	
	<button type="button" id="sendBtn">등록하기</button>
	<div id="resultDiv">
	</div>
</div>

</body>
</html>