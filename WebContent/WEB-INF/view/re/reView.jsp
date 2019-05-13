<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="bbs.entity.BbsEntity"%>
<%@ page import="re.entity.ReEntity, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String url = request.getContextPath();
	String userID = (String) session.getAttribute("userID");
	BbsEntity entity = (BbsEntity) request.getAttribute("entity");
	int bbsno = entity.getBbs_no();
	List<ReEntity> rentity = (List<ReEntity>) request.getAttribute("rentity");
%>
<!DOCTYPE html>
<table class="table table-hover"
	style="border: 1px solid #dddddd; margin-top: 40px;">
	<tbody>
		<c:forEach var="re" items="${rentity}" begin="0" end="100" step="1">
			<tr>
				<td>${re.re_exp}</td>
				<td>${re.re_id}</td>
				<td>${re.re_day}</td>
				<td><c:if test="${userID eq re.re_id}">
						<!-- <div onclick="updateReply()" class="btn btn-primary pull-right"
						value="update" >수정</div> -->
						<div onclick="deleteReply(${re.re_no})"
							class="btn btn-primary pull-right" id="re_del" value="delete">삭제
						</div>
					</c:if></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
	