<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="customer.vo.CustomerVO, java.util.*" %>
<%
	List<CustomerVO> all = (List<CustomerVO>)request.getAttribute("all");
	
%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<table>
		<thead>
			<tr>
				<th>ID</th><th>c_nic_name</th><th>c_name</th><th>c_email</th><th>c_phone</th><th>c_pw</th><th>c_birth</th><th>c_sex</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="se" items="${requestScope.all}">
				<tr>
					<td>${se.c_id}</td><td>${se.c_nic_name}</td><td>${se.c_name}</td><td>${se.c_email}</td><td>${se.c_phone}</td><td>${se.c_pw}</td><td>${se.c_sex}</td>
					<td><a href="delete.do?del_name=${se.c_id}">삭제</a></td>
					<td><a href="find.do?find_name=${se.c_id}">수정</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>