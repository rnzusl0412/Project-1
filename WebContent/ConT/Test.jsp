<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		$('#btn1').on('click', function() {
			var form = {
				name : "jamong",
				age : 23
			}
			$.ajax({
				url : "/ITformation/go.do",
				type : "GET",
				data : form,
				success : function(data) {
					$('#result').text(data);
				},
				error : function() {
					alert("simpleWithObject err");
				}
			});
		});
});
</script>
</head>
<body>

	<button id="btn1">simpleAJAX</button>
	<div id="result"></div>
	
	<form action="/ITformation/go.do">
	<input id="btn2" type="submit" value="go.do">
	</form>
	

	



</body>
</html>