<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="customer.vo.CustomerVO"%>
<%
	CustomerVO customer = (CustomerVO) request.getAttribute("customer");
	if (customer != null) {
		session.setAttribute("userID", customer.getC_id());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
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
<link href='../packages/core/main.css' rel='stylesheet' />
<link href='../packages/daygrid/main.css' rel='stylesheet' />
<link href='../packages/timegrid/main.css' rel='stylesheet' />
<link href='../packages/list/main.css' rel='stylesheet' />
<script src='../packages/core/main.js'></script>
<script src='../packages/interaction/main.js'></script>
<script src='../packages/daygrid/main.js'></script>
<script src='../packages/timegrid/main.js'></script>
<script src='../packages/list/main.js'></script>
<script>

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid' ],
      timeZone: 'UTC',
      defaultView: 'dayGridMonth',
      eventLimit: 3,
      eventLimitText: "더보기",
      eventLimitClick: "popover",
      header: {
          left: 'prev,next',
          center: 'title',
          right: 'addEventButton'
        },
        Boolean, default: true,
      
       
       
       events: [
           {
                 title : "한이음 공모전"
               , url : "http://www.naver.com/"
               , start : "2019-03-25"
               , end : "2019-03-27"
           },
           {
               title : "SK 공모전"
             , url : "http://www.naver.com/"
             , start : "2019-03-25"
             , end : "2019-03-27"
         },
           {
               title : "삼성 공모전"
             , url : "http://www.naver.com/"
             , start : "2019-03-25"
             , end : "2019-03-27"
         },
         {
             title : "naver 공모전"
           , url : "http://www.naver.com/"
           , start : "2019-03-25"
           , end : "2019-03-27"
       }
       ],
       
       //이벤트 클릭 function
       eventClick: function(info) {
           var eventObj = info.event;

           if (eventObj.url) {
             alert(
               '해당 공모전은 ' + eventObj.title + '.\n' +
               eventObj.url + ' 페이지로 이동합니다아아아아아아아앙아아아아앙아아아아'
             );

             window.open(eventObj.url);

            info.jsEvent.preventDefault(); // 보고있는 페이지 이동 못하도록 한다.
           //url주소 없으면 하단 출력해줌.
           } else {
             alert('제목만있찌렁 ' + eventObj.title);
           }
         },
         
         events:	function(start, end, timezone, callback){//이벤트 출력부분
       	  $.ajax({
       	  url:"/go.do",
       	  type:'GET',
       	  dataType: 'json',
       	  data:{
       	  start:month,
       	  end:year
       	  },
       	  success:function(data){

       	  var events=[];
       	  $(data).each(function(index){
       	  //alert(val.start);
       	  events.push({
       	  id: data[index].day_pk,
       	  title: data[index].title,
       	  start: data[index].start,
       	  end: data[index].end,
       	  textColor:'white',
       	  backgroundColor:'#'+data[index].css,
       	  url:'day_md_popup/'+data[index].day_pk
       	  });
       	    });
       	    callback(events);
       	  },
       	  errorr:function(status, request, error){
       	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error"+error);
       	  }
       	  });//ajax
       	  },
         
         
         
         
         
         customButtons: {
             addEventButton: {
               text: '일정 추가하기',
               click: function() {
            	   var titleStr = prompt('공모전 이름을 입력하세요');
                 var dateStr = prompt('YYYY-MM-DD 형식으로 입력하세요.');
                 var date = new Date(dateStr + 'T00:00:00'); // will be in local time
                 if (!isNaN(date.valueOf())) { // valid?
                   calendar.addEvent({
                     title: titleStr,
                     start: date,
                     allDay: true
                   });
                   alert('저장하겠습니다.' + date);
                 } else {
                   alert('값이 없습니다.');
                 }
                 
                 
               } //click : end
             }
           } //customButtons : end
      
    });

    calendar.render();
  });
  
$('#calendar').fullCalendar({
    events: function(start, end, timezone, callback) {
        $.ajax({
            url: 'myxmlfeed.php',
            dataType: 'xml',
            data: {
                // our hypothetical feed requires UNIX timestamps
                start: start.unix(),
                end: end.unix()
            },
            success: function(doc) {
                var events = [];
                $(doc).find('event').each(function() {
                    events.push({
                        title: $(this).attr('title'),
                        start: $(this).attr('start') // will be parsed
                    });
                });
                callback(events);
            }
        });
    }
});

  
  
</script>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 40px auto;
}
</style>

</head>
<body>

	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark "
		id="top_navbar">
		<div class="container">

			<!-- 브랜드 로고 -->
			<a href="http://naver.com" class="navbar-brand"> <img
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
					<a class="btn btn-primary" href="/ITformation/customer/join.do"
						role="button">회원가입</a>
				</div>
			</div>
		</div>
	</div>


	<div id='calendar'></div>



</body>
</html>