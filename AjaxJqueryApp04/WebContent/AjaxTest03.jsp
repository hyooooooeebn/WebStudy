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
<title>AjaxTest03.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "title=" + $.trim($("#title").val()) + "&content=" + $.trim($("#content").val());
			
			/*혼자한 내용*/
			/* $.ajax(
			{	type : "POST"	
				, url : "AjaxTest03_ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(args)
				{
					var out = "";
							
					$(args).find("records").each(function()
					{
						var item = $(this);
						var id = item.attr("id");
						var title = item.find("title").text();
						var content = item.find("content").text();
								
						out += ">> id =  " + id;
						out += "<br> - title :" + title;
						out += "<br> - content :" + content + "<br>";
								
					});
							
					$("#resultDiv").html(out);
							
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
							
				}
				, beforeSend : showRequest
				, error : function(e)
				{
					alert(e.responseText);
				}
					

			}); */
			
			/* 같이한 내용 */
			$.ajax(
			{	
				type : "POST"	
				, url : "AjaxTest03_ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(xml)
				{
					var str = "";
									
					$(xml).find("records").each(function()
					{
						var records = $(this);
						var id = records.attr("id");
						var title = records.find("title").text();
						var content = records.find("content").text();
										
						str += ">> id =  " + id;
						str += "<br> - title :" + title;
						str += "<br> - content :" + content + "<br>";
										
					});
									
					$("#resultDiv").html(str);
									
									
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
		var flag = true;
		
		if(!$.trim($("#title").val()))
		{
			alert("제목을 입력해야합니다.");
			$("#title").focus();
			
			flag = false;
		}
		
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			flag = false;
		}
		
		return flag;
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
	제목 : <input type="text" id="title" class="txt" /><br>
	내용 : <input type="text" id="content" class="txt"><br>
	<br>
	
	<input type="button" value="등록하기" id="sendBtn">
</div>
<br /><br />

<div id="resultDiv">

</div>


</body>
</html>