<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
					<li class="nav-item"><a class="nav-link" href="/ITformation/selectAllBbs.do">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">공모전</a></li>
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<!-- 본 메뉴 클릭 시 모달창 적용 -->
					<%
					 if(session.getAttribute("userID") == null) {
					%>

					<li class="nav-item"><a class="nav-link" href=""
						data-toggle="modal" data-target="#myModal"><i
							class="fas fa-sign-in-alt"></i> 로그인</a></li>

					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="/ITformation/myPage.do">MyPage</a></li>
					<li class="nav-item"><a class="nav-link" href="/ITformation/logout.do"> 로그 아웃 </a></li>
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
					<a class="btn btn-primary" href="/ITformation/customer/join.do"
						role="button">회원가입</a>
				</div>
			</div>
		</div>
	</div>


	<!--  수정 글쓰기 게시판 게시판 게시판 게시판 -->

			
	<div class="container">
          <div class="col-md-10 col-md-offset-3">
           <h3>게시판</h3>
           
           
          
              <table class="table table-hover" style="border: 1px solid #dddddd; margin-top: 40px;">               
             <tbody>
                  <tr>
                      <td>
                       <label for="bbsTitle">글 제목</label>
                      <input type="text" id="bbsTitle" class="form-control" name="bbsTitle" maxlength="50" readonly="readonly" value=${entity.bbs_tit}></td>
                  </tr> 
                  <!--  세션받아서 readonly로 집어 넣을겨 -->
                   <tr>
                      <td>
                       <label for="UserName">작성자</label>
                      <input type="text" id="bbsTitle" class="form-control" placeholder="작성자" name="bbsTitle" maxlength="50" readonly="readonly" value=${entity.bbs_user}></td>
                  </tr>  
                  <tr>
                      <td>
                      <label for="bbsContents">글 내용</label>
                      <textarea class="form-control" id="bbsContents" placeholder="글 내용" name="bbsContent" maxlength="2048" readonly="readonly" style="height:350px;">${entity.bbs_con}</textarea></td>                
                  </tr>        
               </tbody>
              </table>
              <!-- controller로 보내고 controller에서 Bbs.jsp로 바로 보내준다. -->
               <input type="submit" class="btn btn-primary pull-right" value="글수정">
         
         </div>
         
        <div align="right">
         <a href= BbsUpdate.jsp?bbs_no=${entity.bbs_no}" class="btn btn-primary">수정</a>
          <a href= ?bbs_no=${entity.bbs_no}"  class="btn btn-primary">삭제</a>
         </div>
     </div>



</body>
</html>

