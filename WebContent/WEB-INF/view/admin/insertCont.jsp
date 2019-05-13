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
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

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

			eventSources : [ {
				url : '/ITformation/json/A.json'
			} ],

			//이벤트 클릭 function
			eventClick : function(info) {
				var eventObj = info.event;

				if (eventObj.url) {
					alert('해당 공모전은 ' + eventObj.title + '.\n' + eventObj.url
							+ ' 페이지로 이동합니다아아아아아아아앙아아아아앙아아아아');

					window.open(eventObj.url);

					info.jsEvent.preventDefault(); // 보고있는 페이지 이동 못하도록 한다.
					//url주소 없으면 하단 출력해줌.
				} else {
					alert('제목만있찌렁 ' + eventObj.title);
				}
			},
			customButtons : {
				addEventButton : {
					text : '일정 추가하기',
					click : function() {
						var titleStr = prompt('공모전 이름을 입력하세요');
						var dateStr = prompt('YYYY-MM-DD 형식으로 입력하세요.');
						var date = new Date(dateStr + 'T00:00:00'); // will be in local time          
						if (!isNaN(date.valueOf())) { // valid?
							calendar.addEvent({
								title : titleStr,
								start : date,
								allDay : true
							});
							alert('저장하겠습니다.' + date);
						} else {
							alert('값이 없습니다.');
						}
					} //click : end
				}
			}
		//customButtons : end

		});

		calendar.render();
	});

	//and JSON
	$(document).ready(function() {
		$('#btn1').on('click', function() {
			$.ajax({
				url : "/ITformation/go1.do",
				type : "GET",
				data : "",
				success : function(data) {
					$('#result').text(data);
				},
				error : function() {
					alert("simpleWithObject err");
				}
			});
		});
	});

	/* 	$('#calendar').fullCalendar({
	 events: function(start, end, callback) {
	 $.ajax({
	 url: '/myfeed.json',
	 dataType: 'json',
	 success: function(data, text, request) {
	 var events = eval(data.jsonTxt);
	 callback(events);
	 }
	 });
	 }
	 }); */
</script>
</head>
<body>

	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark "
		id="top_navbar">
		<div class="container">

			<!-- 브랜드 로고 -->
			<a href="/ITformation/index.jsp" class="navbar-brand"> <img
				src="img/play_data_white.png" alt="ITFORMATION">
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
						href="/ITformation/selectAllBbs.do">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">공모전</a></li>
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<%
						if (session.getAttribute("userID") == null) {
					%>

					<li class="nav-item"><a class="nav-link" href=""
						data-toggle="modal" data-target="#myModal"><i
							class="fas fa-sign-in-alt"></i> 로그인</a></li>

					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="/ITformation/myPage.do">MyPage</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/ITformation/logout.do"> 로그 아웃 </a></li>
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
						<form method="get" action="/ITformation/login.do">
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
	<!--  수정 글쓰기 게시판 게시판 게시판 게시판 -->
	<div class="col-md-6 col-md-offset-3">
		<form action="/ITformation/admin/insertCont.do" method="post">
			<h5>관리자 전용 입력창</h5>
			<div class="form-group">
				<label for="inputMobile">공모전 이름</label> <input type="tel"
					class="form-control" name="co_name" placeholder="공모전 이름을 입력하세요">
			</div>
			<div class="form-group">
				<label for="inputMobile">공모전 상세정보</label> <input type="tel"
					class="form-control" name="co_exp" placeholder="공모전 이름을 입력하세요">
			</div>
			<div class="form-group">
				<label for="inputMobile">공모전 시작일</label> <input type="tel"
					class="form-control" name="co_st" placeholder="공모전 이름을 입력하세요">
			</div>
			<div class="form-group">
				<label for="inputMobile">공모전 종료일</label> <input type="tel"
					class="form-control" name="co_end" placeholder="공모전 이름을 입력하세요">
			</div>
			<div class="form-group">
				<label for="inputMobile">공모전 URL</label> <input type="tel"
					class="form-control" name="co_url" placeholder="공모전 이름을 입력하세요">
			</div>
			<div class="form-group text-center">
				<button type="submit" id="join-submit" class="btn btn-primary"
					onclick="finalCheck">
					정보저장<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
		</form>
		<div id='calendar'></div>
	</div>

	


</body>
</html>