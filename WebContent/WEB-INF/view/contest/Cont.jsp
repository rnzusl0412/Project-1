
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String url = request.getContextPath();
	String userID = (String) session.getAttribute("userID");
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

	//새로운 공지 띄워줄때 사용.
	$(document).ready(function() {
		$("#ConTModal").modal();
	});
</script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		$.ajax({
			url : "/ITformation/ContAccess.do",
			type : "GET",
			success : function(data) {
				var obj = JSON.parse(data);
				$(obj.Calendar).each(function(index, Calendars) {
					calendar.addEvent({
						title : Calendars.title,
						start : Calendars.start,
						end : Calendars.end,
					});
				});
			},
			error : function() {
				alert("simpleWithObject err");
			}
		});

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid' ],
			timeZone : 'UTC',
			defaultView : 'dayGridMonth',
			eventLimit : 3,
			eventLimitText : "더보기",
			eventLimitClick : "popover",
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'addEventButton'
			},

			eventClick : function(info) {

				var eventObj = info.event;
				if (eventObj.url) {
					alert('해당 공모전은 ' + eventObj.title + '.\n' + eventObj.url
							+ ' 페이지로 이동합니다아아아아아아아앙아아아아앙아아아아');
					info.jsEvent.preventDefault(); // 보고있는 페이지 이동 못하도록 한다.
					//url주소 없으면 하단 출력해줌.
				} else {
					alert('해당 공모전은  ' + eventObj.title + '이며 기간은'
							+ eventObj.end + '까지 입니다.');
					var win = window.open("", "PopupWin",
							"width=500,height=600");

					win.document.write("<p>새창에 표시될 내용 입니다.</p>");

				}
			}

		///////////////////////////////////////////////////////////////////////////////////////
		});

		calendar.render();
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

	<!-- 모달-->
	<div class="modal fade" id="ConTModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!--  공모전 사진 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- 공모전 사진 -->
				<div>
					<table>
						<tbody>
							<tr>
								<td><img src="빅데이타.jpg" width="100%" id="ConTimg"></td>
							</tr>
					</table>
					<!--  공모전 사진 -->

				</div>
				<div class="modal-body">
					<div>
						<table>
							<tbody>
								<tr>
									<td><img src="빅데이터상세.png" width="100%" id="ConTimg"></td>
								</tr>
						</table>
						<!--  공모전 사진 -->

					</div>
					<!--  파티원 모집 게시판 -->
					<div class="modal-footer">

						<table class="table table-striped table-responsive-md btn-table">

							<thead>
								<tr>
									<th>No.</th>
									<th>공모전</th>
									<th>필요 역량</th>
									<th>참가인원</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>빅데이터</td>
									<td><a href=""> Backend,Frontend,DB...</a></td>
									<td>4/2</td>

								</tr>
								<tr>
									<th scope="row">2</th>
									<td>빅데이터</td>
									<td>Backend,Frontend,DB...</td>
									<td>4/2</td>

								</tr>
								<tr>
									<th scope="row">3</th>
									<td>빅데이터</td>
									<td>Backend,Frontend,DB...</td>
									<td>4/2</td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td>빅데이터</td>
									<td>Backend,Frontend,DB...</td>
									<td>4/2</td>
								</tr>
							</tbody>
						</table>
					</div>
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
					href="<%=url%>/selectAllBbs.do" class="list-group-item list-group-item-action bg-light">자유게시판</a>
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
						<%
							if (userID != null && userID.equals("bigdata") == true) {
						%>
						<li class="nav-item active"><a class="nav-link"
							href="<%=url%>/admin/insertCont.do">공모전 일정 추가</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=url%>/admin/listCont.do">공모전 일정변경</a></li>
						<%
							} else {
						%>
						<li class="nav-item"><a class="nav-link"
							href="<%=url%>/admin/listCont.do">머야 왜안돼</a></li>
						<%
							}
						%>
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
						<div id='calendar'></div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->


	</div>






</body>
</html>