<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String url = request.getContextPath();
	String userID = (String) session.getAttribute("userID");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="/ITformation/css/simple-sidebar.css">
<link href='/ITformation/packages/core/main.css' rel='stylesheet' />
<link href='/ITformation/packages/daygrid/main.css' rel='stylesheet' />
<link href='/ITformation/packages/timegrid/main.css' rel='stylesheet' />
<link href='/ITformation/packages/list/main.css' rel='stylesheet' />
<script src='/ITformation/packages/core/main.js'></script>
<script src='/ITformation/packages/interaction/main.js'></script>
<script src='/ITformation/packages/daygrid/main.js'></script>
<script src='/ITformation/packages/timegrid/main.js'></script>
<script src='/ITformation/packages/list/main.js'></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<title>ITFORMATION</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	});
</script>

<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 16px;
}

/* #calendar {
	max-width: 900px;
	margin: 40px auto;
} */
</style>
</head>
<body>

	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark "
		id="top_navbar">
		<div class="container">

			<!-- 브랜드 로고 -->
			<a href="/ITformation/index.jsp" class="navbar-brand"> <img
				src="/ITformation/img/IT.png" style="height: 1cm"  alt="ITFORMATION">
			</a>
			<!-- 햄버거 버튼  -->
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 모바일 환경 적용 옵션 -->
			<div class="collapse navbar-collapse justify-content-end"
				id="myNavbar">
				<!-- 메뉴 목록 -->
				<ul class="nav navbar-nav" id="top_navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/selectAllBbs.do">게시판</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/Cont.do">공모전</a></li>
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<%
						if (session.getAttribute("userID") == null) {
					%>

					<li class="nav-item"><a class="nav-link" href=""
						data-toggle="modal" data-target="#myModal"><i
							class="fas fa-sign-in-alt"></i> 로그인</a></li>

					<%
						} else if (session.getAttribute("userID").equals("bigdata")) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="/ITformation/selectAll.do">회원관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/logout.do"> 로그 아웃 </a></li>

					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/myPage.do">MyPage</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/logout.do"> 로그 아웃 </a></li>
				</ul>
			</div>
			<%
				}
			%>
		</div>
	</nav>

	<!--  로그인 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" align="center">
						<i class="fas fa-key"></i>로그인
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div style="padding-top: 30px;">
						<form method="post" action="/ITformation/login.do">
							<div class="form-group row">
								<div class="col-md-9">
									<input type="text" class="form-control" placeholder="아이디"
										name="userID" maxlength="20"> <br> <input
										type="password" class="form-control" placeholder="비밀번호"
										name="userPassword" maxlength="20">
								</div>
								<!-- 버튼 세로크기 조절좀  -->
								<div class="col-md-3" align="center">
									<button type="submit" class="btn btn-primary btn-lg"
										style="height: 95px">Login</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a class="btn btn-success" href="<%=url%>/customer/find.do"
						role="button">ID찾기</a> <a class="btn btn-warning"
						href="<%=url%>/customer/findPW.do" role="button">PW찾기</a> <a
						class="btn btn-primary" href="<%=url%>/customer/join.do"
						role="button">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<!--  사이드바사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바 사이드바  -->
	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">공 모 전 게 시 판</div>
			<div class="list-group list-group-flush">
				<a href="/ITformation/Cont.do"
					class="list-group-item list-group-item-action bg-light">공모전 달력</a>
				<a href="/ITformation/getTeamBbs.do"
					class="list-group-item list-group-item-action bg-light">팀원모집</a> <a
					href="#" class="list-group-item list-group-item-action bg-light">자유게시판</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">뭔데</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">이건</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">응?</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-primary" id="menu-toggle">게시판 Menu</button>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>


				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">

						<!-- 드랍바 메뉴 -->
						<!-- 	<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Dropdown </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div></li> -->
					</ul>
				</div>
			</nav>

			<div class="container-fluid">
				<div class="container" style="margin-top: 40px;">
					<div class="row">
						<!-- 콘텐츠 내용이 와야한다/////////////// -->
						<!--  게시판게시판게시판게시판게시판게시판게시판게시판게시판게시판게시판게시판게시판게시판게시판게시판 -->

						<!--  공모전 팀원모집 게시판안안안안안안ㅇ낭낭나안 -->


						<div class="container">
							<div class="col-md-10 col-md-offset-3">
								<h3>공모전 팀원 모집 글쓰기 게시판</h3>
								<form method="post" action="<%=url%>/projectManager/updateProject.do?pm_no=${PmEntity.pm_no}">
									<table class="table table-hover"
										style="border: 1px solid #dddddd; margin-top: 40px;">
										<tbody>
											<tr>
												<td colspan="4"><label for="bbsTitle"
													class="font-weight-bold">프로젝트 주제(간략히)</label> <input
													type="text" id="con_title" class="form-control"
													name="pm_team" value="${PmEntity.pm_team}" maxlength="50"></td>
											</tr>
											<!--  세션받아서 readonly로 집어 넣을겨 -->
											<tr>
												<td><label for="UserName" class="font-weight-bold">작성자</label>
													<input type="text" id="bbsTitle" class="form-control"
													placeholder=<%=userID%> readonly="readonly" name="bbsTitle"
													maxlength="50"></td>

												<td><label for="personNo" class="font-weight-bold">참여인원</label>
													<select class="browser-default custom-select"
													name="pm_limitm">
														<option selected value="0">참여가능 인원수</option>
														<option value="1">1명</option>
														<option value="2">2명</option>
														<option value="3">3명</option>
														<option value="4">4명</option>
														<option value="5">5명</option>
														<option value="6">6명</option>
												</select></td>
												<td><label for="personNo" class="font-weight-bold">공모전을
														선택하세요</label> <select class="browser-default custom-select"
													name="pm_cono">

														<option selected value="0">공모전</option>
														<c:forEach var="se" items="${requestScope.contestList}">
															<option value="${se.co_no}">${se.co_name}</option>
														</c:forEach>

												</select></td>
												<td><label for="UserName" class="font-weight-bold">등록일</label>
													<input type="text" id="bbsTitle" class="form-control"
													placeholder="<%=today%>" readonly="readonly" maxlength="50"></td>

											</tr>

											<tr>
												<td colspan="4"><label for="bbsContents"
													class="font-weight-bold">프로젝트개요(소개 및 제안 배경)</label> <textarea
														class="form-control" id="bbsContents"
														name="pm_primary" maxlength="2048" style="height: 350px;">${PmEntity.pm_primary}</textarea></td>
											</tr>
											<tr>
												<td colspan="4"><label for="bbsContents"
													class="font-weight-bold">주요기능 및 예상 결과물</label> <textarea
														class="form-control" id="bbsContents"
														name="pm_function" maxlength="1000" style="height: 150px;">${PmEntity.pm_function}</textarea></td>
											</tr>
											<tr>
												<td colspan="4"><label for="bbsContents"
													class="font-weight-bold">기대효과 및 활용분야</label> <textarea
														class="form-control" id="bbsContents"
														name="pm_effect" maxlength="1000" style="height: 150px;">${PmEntity.pm_effect}</textarea></td>
											</tr>
											<tr>
												<td colspan="4"><label for="bbsContents"
													class="font-weight-bold">필요 기술/역량</label> <textarea
														class="form-control" id="bbsContents"
														name="pm_reqSkill" maxlength=" 1000"
														style="height: 150px;">${PmEntity.pm_reqSkill}</textarea></td>
											</tr>
											<tr>
												<td colspan="4"><label for="bbsContents"
													class="font-weight-bold">적용 기술</label> <textarea
														class="form-control" id="bbsContents"
														name="pm_accSkill" maxlength=" 1000"
														style="height: 150px;">${PmEntity.pm_accSkill}</textarea></td>
											</tr>
											<tr>
												<td colspan="4"><label for="bbsFile">첨부 파일</label> <input
													type="text" id="bbsFile" class="form-control"
													placeholder="첨부 파일" name="pm_file" value="${PmEntity.pm_file}" maxlength="50"></td>
											</tr>
										</tbody>
									</table>
									<!-- controller로 보내고 controller에서 Bbs.jsp로 바로 보내준다. -->

									<div align="right">
										<input type="submit" class="btn btn-primary pull-right"
											value="작성완료">
										<!-- 누르면 작성을 완료하시겠습니까? 나오게끔 -->
									</div>
								</form>
							</div>
						</div>
						<!-- 콘텐츠 내용이 와야한다/////////////// -->
						<!-- /#page-content-wrapper -->
					</div>
				</div>
			</div>
</body>
</html>