<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="customer.vo.CustomerVO"%>
<%
	String url = request.getContextPath();
	String customer = (String) request.getAttribute("customer");
	if (customer != null) {
		session.setAttribute("userID", customer);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


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
<script src="https://ssl.google-analytics.com/ga.js"
	type="text/javascript" async=""></script>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<link href="https://bootsnipp.com/css/fullscreen.css" rel="stylesheet"
	type="text/css" media="all"> -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/main.css">

<title>ITFORMATION</title>
<script type="text/javascript">
	
</script>
</head>
<body>

	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark "
		id="top_navbar">
		<div class="container">

			<!-- 브랜드 로고 -->
			<a href="/ITformation/index.jsp" class="navbar-brand"> <img
				src="/ITformation/img/IT.png" style="height: 1cm" alt="ITFORMATION">
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
	<!-- 네비끝 -->

	<!-- 네비 2 -->
	<nav class=" navbar-expand-sm bg-dark navbar-dark " id="top_navbar">
		<div class="container col-12">
			<ul class="nav navbar-nav " id="top_navbar-nav">
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#collapse1" aria-expanded="true"
					aria-controls="nav-collapse1">커리어</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#collapse2" aria-expanded="true"
					aria-controls="nav-collapse2">공모전</a></li>
				<li class="nav-item"><a class="nav-link" href="#"> 핫이슈 </a></li>
				<li class="nav-item"><a class="nav-link" href="#"> 통계 </a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#collapse3" aria-expanded="true"
					aria-controls="nav-collapse5"> BBS </a></li>
			</ul>

		</div>
	</nav>
	<!-- 네비 2-1 -->
	<nav class="navbar bg-dark navbar-dark">
		<div class="container col-12">
			<div id="collapse1" class="panel-collapse collapse">
				<ul class="nav-item row">
					<li class="nav-item"><a class="nav-link" href="#">Career_Tree
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Career_Path</a></li>

				</ul>
			</div>
			<div id="collapse2" class="panel-collapse collapse">
				<ul class="nav-item row">
					<li class="nav-item"><a class="nav-link" href="#"> 공모전_일정
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">
							공모전_프로젝트매니저</a></li>
				</ul>
			</div>
			<div id="collapse3" class="panel-collapse collapse">
				<ul class="nav-item row">
					<li class="nav-item"><a class="nav-link" href="#">BBS_공지사항
					</a></li>
					<li class="nav-item li"><a class="nav-link ab" href="#">BBS_Tip</a></li>
					<li class="nav-item ab"><a class="nav-link ab" href="#">BBS_잡담</a></li>
					<li class="nav-item ab"><a class="nav-link li " href="#">BBS_회사정보공유</a></li>
					<li class="nav-item li"><a class="nav-link li" href="#">BBS_질문</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 네비 2 끝-->
	<!-- 메인 1-1,1-2 Career path & Tree -->
	<section class="landingpage">
		<div class="mt-landing row ">
			<div class="col-md-6 front-img"
				style="background-image: url('img/Career_Tree.jpg'); background-position: center center; background-size: cover">
				<div class="overlay-1">
					<div class="content">
						<h1>Career Tree</h1>
						<h2>여러분을 IT의 세계로 안내합니다 뿅 !</h2>
						<a href="#" type="button" class="btn"> <span
							class="flag-icon flag-icon-rs"></span> Step 1
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 front-img"
				style="background-image: url('img/Career_path.jpg'); background-size: cover; background-position: center center">
				<div class="overlay-2">
					<div class="content">
						<h1>Career Path</h1>
						<h2>IT 경력자들의 길로 안내합니다</h2>
						<a href="#" type="button" class="btn"> <span
							class="flag-icon flag-icon-rs"></span> Step 2
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 메인 1-1,1-2 Career path & Tree 끝 -->

	<!-- 메인 2-1 공모전 -->
	<div class="container-fluid"
		style="padding-right: 0px; padding-left: 0px">
		<div class="mt-landing row ">
			<div class="front-img"
				style="background-image: url('img/contest1.png'); background-position: center center; background-size: cover">
				<div class="overlay-1">
					<div class="content">
						<h1>Contest</h1>
						<h2>THE HOTTEST CONTEST in da world !!!!!</h2>
						<a href="#" type="button" class="btn"> <span
							class="flag-icon flag-icon-rs"></span> + more
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 2-1 공모전 끝-->

	<!-- 메인 3-1 issue -->
	<div class="container-fluid"
		style="margin: 0px; padding-right: 0px; padding-left: 0px">
		<div class="mt-landing row ">
			<div class="front-img  "
				style="background-image: url('img/contest.jpg'); background-position: center center; background-size: cover;">
				<div class="overlay-1 ">
					<div class="content" style="position: static;">
						<br>
						<h1>ISSUE</h1>
						<h2>What's hot ?</h2>
					</div>
					<div class=" row" style="padding: 25px;">
						<div class="col">
							<div class="ac card text-top ">
								<img class=" card-img-top" alt="left" src="img/aa.jpg"
									style="height: 180px">
								<div class="card-body">
									<h2 class="card-title" style="color: white">
										<b>Block Chain</b>
									</h2>
									<ul>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 3위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>

									</ul>
									<div class="content">
										<a href="#" type="button" class="btn"> <span
											class="flag-icon flag-icon-rs"> 자세히 보기 </span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="ac card text-top">
								<img class=" card-img-top" alt="left" src="img/ab.jpg"
									style="height: 180px">
								<div class="card-body">
									<h3 class="card-title">AI</h3>
									<ul>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 3위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
									</ul>
									<div class="content">
										<a href="#" type="button" class="btn"> <span
											class="flag-icon flag-icon-rs"> 자세히 보기 </span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class=" ac card text-top">
								<img class=" card-img-top" alt="left" src="img/ac.jpg"
									style="height: 180px">
								<div class="card-body">
									<h3 class="card-title">BIG DATA</h3>
									<ul>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 3위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
									</ul>
									<div class="content">
										<a href="#" type="button" class="btn"> <span
											class="flag-icon flag-icon-rs"> 자세히 보기 </span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class=" ac card text-top">
								<img class=" card-img-top" alt="left" src="img/ad.png"
									style="height: 180px">
								<div class="card-body">
									<h3 class="card-title">IOT</h3>
									<ul>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 3위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
									</ul>
									<div class="content">
										<a href="#" type="button" class="btn"> <span
											class="flag-icon flag-icon-rs"> 자세히 보기 </span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class=" ac card text-top">
								<img class=" card-img-top" alt="left" src="img/ae.png"
									style="height: 180px">
								<div class="card-body">
									<h3 class="card-title">Cloud</h3>
									<ul>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 3위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 1위
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> 2위
										</a></li>
									</ul>
									<div class="content">
										<a href="#" type="button" class="btn"> <span
											class="flag-icon flag-icon-rs"> 자세히 보기 </span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인  3-1 issue 끝-->

	<!-- 메인 4-1 Report -->
	<div class="container-fluid"
		style="margin: 0px; padding-right: 0px; padding-left: 0px">
		<div class="mt-landing row ">
			<div class="front-img  "
				style="background-image: url('img/life.jpg'); background-position: center center; background-size: cover;">
				<div class="overlay-1" align="center">
					<div class="content" style="position: static;">
						<br>
						<h1>REalPORT</h1>
						<h2>Average Programmer's life</h2>
					</div>
					<div class="row" style="padding: 25px">
						<div class="col">
							<div class="card text-center">
								<img class=" card-img-top" alt="left" src="img/a.jpg"
									style="height: 250px">
								<div class="card-body">
									<h3 class="card-title">Realtime Popular Language</h3>
									<p class="card-text">
										지금 가장 많이 쓰이는 프로그램언어요 ? <br> 클릭해보시면 알죠 ! <br>
									</p>
									<br> <a class="btn btn-primary btn-block" href="#">자세히
										보기</a>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card text-center">

								<img class="card-img-top" alt="right" src="img/b.jpg"
									style="height: 250px">
								<div class="card-body">
									<h3 class="card-title">Realtime Demanded Language</h3>
									<p class="card-text">
										지금 회사에서 가장 필요한 프로그램 언어요 ? <br> 여기에요 여기 ! <br>
									</p>
									<br> <a class="btn btn-danger btn-block" href="#">자세히
										보기</a>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card text-center">
								<img class="card-img-top" alt="right" src="img/c.jpg"
									style="height: 250px">
								<div class="card-body">
									<h3 class="card-title">Real Programmer's Life</h3>
									<p class="card-text">
										프로그래머가 되고 싶다구요 ? <br> 우리 이렇게 삽니다 ! <br>
									</p>
									<br> <a class="btn btn-danger btn-block" href="#">자세히
										보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 4-1 Report 끝 -->

	<!-- 메인 5-1 FOOT -->
	<footer class="navbar-expand-sm bg-dark navbar-dark">
		<br>
		<div style="color: rgba(255, 255, 255, .5); text-align: center;">
			<p>
				© 2019. <a style="color: rgba(255, 255, 255, .5);"
					href="contact.jsp">성아와아이들</a>. All rights reserved.
			</p>
		</div>
		<br>
	</footer>


	<!-- 메인 5-1 FOOT 끝-->

</body>
</html>