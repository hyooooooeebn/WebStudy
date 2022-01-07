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
<title>AjaxTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("확인");
			
			var params = "name=" + $.trim($("#name").val()) + "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type : "POST"	
				, url : "AjaxTest02_ok.jsp"
				, data : params
				//, async : false --동기  ※ 동기 방식으로 사용하지 않는다 그냥 가지고 있는 속성값
				, dataType : "xml"		//--check~!!!
				, success : function(args)
				{
					var out = "";
					out = ">> 게시물 갯수 : " + $(args).find("total_dataCount").text() + "<br>";
					
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var num = item.attr("num");
						var name = item.find("name").text();
						var content = item.find("content").text();
						
						out += "<br>=================";
						out += "<br> 번호 :" + num;
						out += "<br> 이름 :" + name;
						out += "<br> 내용 :" + content;
						out += "<br>=================<br>";
						
					});
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
					
				}
			, beforeSend : showRequest
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
	<p>xml control</p>
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