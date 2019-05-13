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
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
	
</script>
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
					<li class="nav-item"><a class="nav-link" href="<%=url%>/selectAllBbs.do">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/Cont.do">공모전</a></li>
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<%
					 if(session.getAttribute("userID") == null) {
					%>

					<li class="nav-item"><a class="nav-link" href=""
						data-toggle="modal" data-target="#myModal"><i
							class="fas fa-sign-in-alt"></i> 로그인</a></li>

					<%
						} else if(session.getAttribute("userID").equals("bigdata")){
							
					%>	
						<li class="nav-item"><a class="nav-link" href="/ITformation/selectAll.do">회원관리</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=url%>/logout.do"> 로그 아웃 </a></li>
						
					<%	
					}else {
					%>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/myPage.do">MyPage</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/logout.do"> 로그 아웃 </a></li>
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
						role="button">ID찾기</a>
					<a class="btn btn-warning" href="<%=url%>/customer/findPW.do"
						role="button">PW찾기</a>
					<a class="btn btn-primary" href="<%=url%>/customer/join.do"
						role="button">회원가입</a>	
				</div>
			</div>
		</div>
	</div>
	<!--  로그인 모달 -->

<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">MYPAGE</div>
			<div class="list-group list-group-flush">
				<a href="<%=url%>/myPage.do" class="list-group-item list-group-item-action bg-light">회원 정보 관리</a>
				<a href="<%=url%>/carrerPath/myProject.do" class="list-group-item list-group-item-action bg-light">진행 중인 프로젝트</a>
				<a href="<%=url%>/ContSchedule.do" class="list-group-item list-group-item-action bg-light">프로젝트 관리</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->		
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-primary" id="menu-toggle">Menu</button>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>
			
					<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>${CustomInfo.getC_name()}님의 회원정보 수정</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form role="form" action="/ITformation/updateCustomer.do" method="post">
				<div class="form-group">
					<label for="inputName">성명</label> <input type="text"
						class="form-control" id="inputName" name="c_name" readonly="readonly"
						value="${CustomInfo.getC_name()}">
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="form-group">
					<label for="inputId">아이디</label>
					<div class="form-inline">
						<div class="form-group">
							<input type="text" class="form-control" id="inputId" name="c_id"
								readonly="readonly" value="${CustomInfo.getC_id()}">
							<button type="button" class="btn btn-primary" onclick="IdCheck()">사용가능ID확인</button>
							<div class="check_font" id="id_check"></div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="inputNicName">NicName</label> <input type="text"
						class="form-control" id="inputNicName" name="c_nic_name" 
						value="${CustomInfo.getC_nic_name()}">
					<div class="check_font" id="name_check"></div>
				</div>
				
				<div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input type="email"
						class="form-control" id="InputEmail" name="c_email"
						value="${CustomInfo.getC_email()}">
					<div class="check_font" id="email_check"></div>
				</div>
				<div class="form-group">
					<label for="inputPassword">비밀번호</label> <input type="password"
						class="form-control" id="inputPassword" name="c_pw" onkeyup="CheckPassword()" value="${CustomInfo.getC_pw()}"
						placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="inputPasswordCheck">비밀번호 확인</label> <input
						type="password" class="form-control" id="inputPasswordCheck" 
						onkeyup="CheckPassword()" value="${CustomInfo.getC_pw()}" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
					<div class="check_font" id="pw_check"></div>
				</div>
				<!-- 폰번호 양식확인 유효성검사 -->
				<div class="form-group">
					<label for="inputMobile">휴대폰 번호</label> <input type="tel"
						class="form-control" id="inputMobile" name="c_phone"
						value="${CustomInfo.getC_phone()}">
					<div class="check_font" id="phone_check"></div>
				</div>
				<!--  생일 양식확인 유효성 검사 -->
				<div class="form-group">
					<label for="inputtelNO">생일</label> <input type="text"
						class="form-control" id="inputtelNO" name="c_birth" readonly="readonly"
						value="${CustomInfo.getC_birth()}">
				</div>

				<!--  성별확인란  체크 했는지 안했는지 유효성 검사-->
				<div class="container">
					<label for="inlineRadio1">성별</label> </label> <br> <label
						class="radio-inline"> <input type="radio"
						name="c_sex" id="inlineRadio1" value="Check_Man">
						남자
					</label> <label class="radio-inline"> <input type="radio"
						name="c_sex" id="inlineRadio1" value="Check_Female">
						여자
					</label>
				</div>

				<!--  스크롤형 controlBox -->
				<!-- <select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select> -->
				<div class="form-group text-center" >
					<button type="submit" id="join-submit" class="btn btn-primary" 
						onclick="finalCheck">
						수정 완료<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-warning">
						수정 취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>	


			
			</div>
			<!-- /#page-content-wrapper -->
		</div>


	

</body>
</html>