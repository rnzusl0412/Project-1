
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String url = request.getContextPath();
	String userID = (String) session.getAttribute("userID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- ========================================================================================= -->




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
<link rel="stylesheet" href="/ITformation/css/schedule-modal.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link href='/ITformation/schedule/core/main.css' rel='stylesheet' />
<link href='/ITformation/schedule/daygrid/main.css' rel='stylesheet' />
<link href='/ITformation/schedule/timegrid/main.css' rel='stylesheet' />
<script src='/ITformation/schedule/core/main.js'></script>
<script src='/ITformation/schedule/interaction/main.js'></script>
<script src='/ITformation/schedule/daygrid/main.js'></script>
<script src='/ITformation/schedule/timegrid/main.js'></script>
<script src='/ITformation/schedule/resource-common/main.js'></script>
<script src='/ITformation/schedule/resource-daygrid/main.js'></script>
<script src='/ITformation/schedule/resource-timegrid/main.js'></script>
<!-- datepicker script -->
<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker script -->
<!-- timePicker -->
<script src="/ITformation/css/timepicker/timepicki.js"></script>
<link rel="stylesheet" href="/ITformation/css/timepicker/timepicki.css">
<!-- timePicker -->




<title>ITFORMATION</title>
<script type="text/javascript">


	$(document).ready(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
			
		});
	});
	 /* $(document).ready(function() {
	$('#modalCookie1').modal('show');
	}); */
	
	
</script>
<script type="text/javascript">


document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    /////////////////////////////////////////////////////////�̺�Ʈ �߰� ////////////////////////////////
    $(document).ready(function() {
			$.ajax({
				url : "/ITformation/ContSchedule2.do",
				type : "GET",
				success : function(data) {
					
					var obj = JSON.parse(data);
					$(obj.resourceData).each(function(index, resourceDatas) { 
						calendar.addResource({
							id: resourceDatas.id,
							title: resourceDatas.title,
							eventColor: resourceDatas.eventColor,
			                
			              });
					});
					$(obj.eventData).each(function(index, eventDatas) { 
						calendar.addEvent({
							id : eventDatas.id,
							resourceId :  eventDatas.resourceId,
							title :  eventDatas.title,
							start : eventDatas.start,
							end : eventDatas.end,
						});
					/*  $('#result').text(Calendars.start + Calendars.end + Calendars.title); */
					});
					
				},
				error : function() {
					alert("simpleWithObject err");
				}
			});
});
/////////////////////////////////////////////////////////�̺�Ʈ �߰� ////////////////////////////////
    
    
    

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'resourceDayGrid', 'resourceTimeGrid' ],
      defaultView: 'resourceTimeGridDay',
      defaultDate: '2019-04-10',
      editable: true,
      
		//�̺�Ʈ ��� //////////////////////////////////////////////////////////////////////      
      eventDrop: function(info) {
    	    alert(info.event.title + " was dropped on " + info.event.start.toISOString());

    	    if (!confirm("Are you sure about this change?")) {
    	      info.revert();
    	    }
    	  },
		eventClick : function(info) {
				
				var eventObj = info.event;
				if (eventObj.url) {
					alert('�ش� �������� ' + eventObj.title + '.\n' + eventObj.url
							+ ' �������� �̵��մϴپƾƾƾƾƾƾƾӾƾƾƾƾӾƾƾƾ�');
					info.jsEvent.preventDefault(); // �����ִ� ������ �̵� ���ϵ��� �Ѵ�.
					//url�ּ� ������ �ϴ� �������.
				} else {
					alert('�ش� ��������  ' + eventObj.title + '�̸� �Ⱓ��' + eventObj.end + '���� �Դϴ�.' +eventObj.id + "id�ȳ���?" );
					DeleteEvent(eventObj.id);
			///////////////////////////////////////////id����	
					
					///////////////////////////////////////////id����	
					/* var win = window.open("", "PopupWin", "width=500,height=600");
					
					win.document.write("<p>��â�� ǥ�õ� ���� �Դϴ�.</p>"); */
				}
			},
      
      
      selectable: true,
      eventLimit: true, // allow "more" link when too many events
      header: {
        left: 'prev,next today addEventButton',
        center: 'title',
        right: 'resourceTimeGridDay,resourceTimeGridTwoDay,timeGridWeek,dayGridMonth'
      },
      views: {
        resourceTimeGridTwoDay: {
          type: 'resourceTimeGrid',
          duration: { days: 2 },
          buttonText: '2 days',
        }
      },

      //// uncomment this line to hide the all-day slot
      //allDaySlot: false,

     /*  resources: [
        { id: 'a', title: 'Room A' },
        { id: 'b', title: 'Room B', eventColor: 'green' },
        { id: 'c', title: 'Room C', eventColor: 'orange' },
        { id: 'd', title: 'Room D', eventColor: 'red' }
      ],
      events: [
        { id: '1', resourceId: 'a', start: '2019-04-06', end: '2019-04-08', title: 'event 1' },
        { id: '2', resourceId: 'a', start: '2019-04-07T09:00:00', end: '2019-04-0714:00:00', title: 'event 2' },
        { id: '3', resourceId: 'b', start: '2019-04-07T12:00:00', end: '2019-04-0806:00:00', title: 'event 3' },
        { id: '4', resourceId: 'c', start: '2019-04-07T07:30:00', end: '2019-04-0709:30:00', title: 'event 4' },
        { id: '5', resourceId: 'd', start: '2019-04-07T10:00:00', end: '2019-04-0715:00:00', title: 'event 5' }
      ], */

      select: function(arg) {
        console.log(
          'select',
          arg.startStr,
          arg.endStr,
          arg.resource ? arg.resource.id : '(no resource)'
        );
      },
      dateClick: function(arg) {
        console.log(
          'dateClick',
          arg.date,
          arg.resource ? arg.resource.id : '(no resource)'
        );
      }
    });

    calendar.render();
  });
  
  
function DeleteEvent(eventId) {
	$.ajax({
		url : "/ITformation/ContSchedule2.do",
		type : "GET",
		data : eventId,
		success : function(data) {
		
			var obj = JSON.parse(data);
			$(obj.resourceData).each(function(index, resourceDatas) { 
				calendar.addResource({
					id: resourceDatas.id,
					title: resourceDatas.title,
					eventColor: resourceDatas.eventColor     
	              });
			});
			$(obj.eventData).each(function(index, eventDatas) { 
				calendar.addEvent({
					id : eventDatas.id,
					resourceId :  eventDatas.resourceId,
					title :  eventDatas.title,
					start : eventDatas.start,
					end : eventDatas.end,
				});
			/*  $('#result').text(Calendars.start + Calendars.end + Calendars.title); */
			});
			
		},
		error : function() {
			alert("simpleWithObject err");
		}
	});
};

	
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

	<!-- �׺���̼� �� -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark "
		id="top_navbar">
		<div class="container">

			<!-- �귣�� �ΰ� -->
			<a href="/ITformation/index.jsp" class="navbar-brand"> <img
				src="img/play_data_white.png" alt="ITFORMATION">
			</a>
			<!-- �ܹ��� ��ư  -->
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- ����� ȯ�� ���� �ɼ� -->
			<div class="collapse navbar-collapse justify-content-end"
				id="myNavbar">
				<!-- �޴� ��� -->
				<ul class="nav navbar-nav" id="top_navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/selectAllBbs.do">�Խ���</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/Cont.do">������</a></li>
					<!-- �� �޴� Ŭ�� �� ���â ���� -->
					<!-- �� �޴� Ŭ�� �� ���â ���� -->
					<%
						if (session.getAttribute("userID") == null) {
					%>

					<li class="nav-item"><a class="nav-link" href=""
						data-toggle="modal" data-target="#myModal"><i
							class="fas fa-sign-in-alt"></i> �α���</a></li>

					<%
						} else if (session.getAttribute("userID").equals("bigdata")) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="/ITformation/selectAll.do">ȸ������</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/logout.do"> �α� �ƿ� </a></li>

					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/myPage.do">MyPage</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=url%>/logout.do"> �α� �ƿ� </a></li>
				</ul>
			</div>
			<%
				}
			%>
		</div>
	</nav>

	<!--  �α��� ��� -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" align="center">
						<i class="fas fa-key"></i>�α���
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
									<input type="text" class="form-control" placeholder="���̵�"
										name="userID" maxlength="20"> <br> <input
										type="password" class="form-control" placeholder="��й�ȣ"
										name="userPassword" maxlength="20">
								</div>
								<!-- ��ư ����ũ�� ������  -->
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
						role="button">IDã��</a> <a class="btn btn-warning"
						href="<%=url%>/customer/findPW.do" role="button">PWã��</a> <a
						class="btn btn-primary" href="<%=url%>/customer/join.do"
						role="button">ȸ������</a>
				</div>
			</div>
		</div>
	</div>




	<!--  ���̵�ٻ��̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵�� ���̵��  -->
	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">�� �� �� �� �� ��</div>
			<div class="list-group list-group-flush">
				<a href="/ITformation/Cont.do"
					class="list-group-item list-group-item-action bg-light">������ �޷�</a>
				<a href="/ITformation/getTeamBbs.do"
					class="list-group-item list-group-item-action bg-light">��������</a> <a
					href="#" class="list-group-item list-group-item-action bg-light">�����Խ���</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">����</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">�̰�</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">��?</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-outline-primary waves-effect"
					id="menu-toggle">�Խ��� Menu</button>

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
							href="<%=url%>/admin/insertCont.do">������ ���� ����</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=url%>/admin/listCont.do">������ ��������</a></li>
						<%
							} else {
						%>
						<li class="nav-item"><button type="button"
								class="btn btn-outline-danger waves-effect" data-toggle="modal"
								data-target="#sem-reg">������ �߰�</button></li>
						<%
							}
						%>
						<!-- ����� �޴� -->
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

	<!--  ������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸�� -->
	<div class="modal fade seminor-login-modal" data-backdrop="static"
		id="sem-reg">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal body -->
				<div class="modal-body seminor-login-modal-body">
					<h5 class="modal-title text-center">������Ʈ �Է�</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
					</button>


					<form class="seminor-login-form" action="<%=url%>/ContSchedule3.do">
						<label class="select-form-control-placeholder" for="sel1">������̸�</label>
						<div class="form-group">
							<select class="form-control" id="sel1" name="Name">
								<option value="Yeongjun">Yeongjun</option>
								<option value="Kyung sun">Kyung sun</option>
								<option value="sung a">sung a</option>
								<option value="gook hyun">gook hyun</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" required
								autocomplete="off" name="ProjectName"> <label
								class="form-control-placeholder" for="ProjectName">������Ʈ��</label>
						</div>
						<!-- <div class="form-group">
							<label class="select-form-control-placeholder" for="sel1">ǥ�õɻ� ����</label> 
							<select class="form-control" id="sel1" name="Color">
								<option value="Green">Green</option>
								<option value="Yellow">Yellow</option>
								<option value="Red">Red</option>
								<option value="Blue">Blue</option>
							</select>
						</div> -->
						<div class="form-group">
							<table>
								<tbody>
									<tr>
										<td><label class="select-form-control-placeholder"
											for="name">������</label> <input type="text"
											class="form-control" required autocomplete="off"
											id="startDate" name="startDate"></td>
										<td><label class="select-form-control-placeholder"
											for="name">���۽ð�</label> <input type="text"
											class="form-control" required autocomplete="off"
											id="startTime" name="startTime"	></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="form-group">
							<table>
								<tbody>
									<tr>
										<td><label class="select-form-control-placeholder"
											for="name">������</label> <input type="text"
											class="form-control"  id="endDate"
											name="endDate"></td>
										<td><label class="select-form-control-placeholder"
											for="name">����ð�</label> <input type="text"
											class="form-control"  id="endTime"
											name="endTime"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
            $("#startDate,#endDate").datepicker({
            	dateFormat: "yy-mm-dd",
            	monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"],
                dayNamesMin:["��","��","ȭ","��","��","��","��"], 
            		});   
            
            $("#startTime,#endTime").timepicki({
            	increase_direction: 'up',
            	custom_classes: '',
            	min_hour_value: 1,
            	max_hour_value: 12,
            	show_meridian: true,
            	step_size_hours: '1',
            	step_size_minutes: '30',
            	overflow_minutes: false,
            	disable_keyboard_mobile: false,
            	reset: false,
            	on_change: null,
            	input_writable: false
            });

      </script>


						<div class="btn-check-log">
							<button type="submit" class="btn-check-login">���� �����ϱ�</button>
						</div>
						<!-- <div class="create-new-fau text-center pt-3">
							<a href="#" class="text-primary-fau"><span
								data-toggle="modal" data-target="#sem-login"
								data-dismiss="modal">Already Have An Account</span></a>
						</div> -->
					</form>

				</div>
			</div>
		</div>
	</div>

	<!--  ������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸��������Ʈ�Է¸�޸�� -->




</body>
</html>