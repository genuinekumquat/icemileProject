<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
   <head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
    </head>
    <body class="sb-nav-fixed">  
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
        <div id="layoutSidenav">
<!-- 사이드바 -->
<jsp:include page="../include/sidebar.jsp"></jsp:include>
<!-- 사이드바 -->
            <div id="layoutSidenav_content">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
<!--                         <h1 class="mt-4">아이스마일</h1> -->
                        <img src="../resources/assets/img/icemilelogo.png" width="250" style="margin-top: 1rem;">
                        <ol class="breadcrumb mb-4">
<!--                      <li class="breadcrumb-item active">Dashboard</li> -->
                        </ol>
                        
<!--                         <div class="row"> -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-primary text-white mb-4"> -->
<!--                                     <div class="card-body">사원정보</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<%--                                         <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/member/memberList">바로가기</a> --%>
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-warning text-white mb-4"> -->
<!--                                     <div class="card-body">발주</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<%--                                         <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/buyOrder/rawOrderList">바로가기</a> --%>
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-success text-white mb-4"> -->
<!--                                     <div class="card-body">작업지시</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<%--                                         <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/factory/workOrderList">바로가기</a> --%>
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-danger text-white mb-4"> -->
<!--                                     <div class="card-body">수주</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<%--                                         <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/sell/proOrderList">바로가기</a> --%>
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <div><i class="fas fa-chart-area me-1"></i>&nbsp;월별 판매 실적</div>
                                    </div>
                                    <div class="card-body"><canvas id="monthlySale" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <div><i class="fa-solid fa-chart-column"></i>&nbsp;월별 생산 실적</div>
                                    </div>
                                    <div class="card-body"><canvas id="monthlyProd" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-14">
                                <div class="card mb-4">
                                    <div class="card-header">
                                   	 	<div><i class="fa-regular fa-calendar-days"></i>&nbsp;월간 일정</div>   
                                    </div>
                                    <div id="calendar" style=""></div>
                                </div>
                            </div>
                        </div>
<!--                             <div class="col-xl-6"> -->
<!--                                 <div class="card mb-4"> -->
<!--                                     <div class="card-header"> -->
<!--                                         <i class="fas fa-chart-bar me-1"></i> -->
<!--                                         month agenda -->
<!--                                     </div> -->
<!--                                     <div class="card-body"><canvas id="calendar" width="100%" height="40"></canvas></div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                     </div> -->
                <!-- 내용들어가는곳 -->	    
                </main>

<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../resources/assets/demo/chart-area-demo.js"></script>
        <script src="../resources/assets/demo/chart-bar-demo.js"></script>
        <script src="../resources/assets/demo/calendar.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
       <!-- J쿼리 호출 -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
<!-- 모달 alert를 위한 sweetalert 호출 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        <!-- fullcalendar css -->
<!--  <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">  -->
	<link rel="stylesheet" type="text/css" href="../resources/css/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	<link rel="stylesheet" type="text/css" href="../resources/css/calendar.css">


<script>
//날짜 계산 함수
function getDate() {
	// 현재 날짜를 변수에 담는다
	const currentDate = new Date();
	// 년도를 구한다 Date을 String으로 변환하여 변수에 저장한다
	const currentYear = currentDate.getFullYear().toString();
	// 달을 구한다 Date형식은 0부터 시작하므로 올바른 월을 구하기위해 +1을 해줘야한다 이후 LPAD로 2자리를 명시하고 나머지부분은 0으로 채운다
	const currentMonth = (currentDate.getMonth() + 1).toString().padStart(2, '0');
	// 일을 구한다 LPAD로 2자리를 명시하고 나머지부분은 0으로 채운다
	const currentDateVal = currentDate.getDate().toString().padStart(2, '0');
	
	// 포맷된 날짜를 변수에 저장한다 YY-MM-DD의 형식이다
	const formattedDate = currentYear + '-' + currentMonth + '-' + currentDateVal;
	// 포맷된 날짜를 리턴한다
	return formattedDate;
}// end function

function createCalendar(json) {
    var calendarSelector = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarSelector, {
        initialView: 'dayGridMonth',
        initialDate: getDate(),
        events: json,
        locale: 'ko',
        
        // 이벤트 렌더링 시간 레이블 숨기기
        eventRender: function(info) {
            var eventEl = info.el;
            var timeEl = eventEl.querySelector('.fc-event-time');
            if (timeEl) {
                timeEl.style.display = 'none';
            }
        },
        
        eventContent: function(info) {
            var eventEl = document.createElement('div');
            eventEl.textContent = info.event.title;
            
            if (info.event.title === '수주') {
            	eventEl.style.backgroundColor = '#C6BFDA';
            	eventEl.style.border = '!important 2px solid #C6BFDA';
            } else if (info.event.title === '발주') {
                eventEl.style.backgroundColor = '#A0BFDA';
                eventEl.style.border = '2px solid #A0BFDA';
            } else if (info.event.title === '작업지시') {
                eventEl.style.backgroundColor = '#B4C7A9';
                eventEl.style.border = '2px solid #B4C7A9'; 
            } else {
                eventEl.style.backgroundColor = '#828282'; 
                eventEl.style.border = '2px solid #828282'; 
            }


            return { domNodes: [eventEl] };
        }
		,
        
        nowIndicator: true, 
        
        // 캘린더 높이 설정 (옵션)
        height: 600,
        aspectRatio: 1,
        
        // 이벤트 클릭 시 동작 설정 (팝업, 페이지 이동 등)
        eventClick: function(info) {
            console.log(info);
            var title = info.event.title;
            var eventDate = moment(info.event.start);
            var eventDate2 = moment(info.event.end);
			console.log(eventDate);
			console.log(eventDate2);
            
                var start = eventDate.format("YYYY-MM-DD");
                var end = eventDate2.format("YYYY-MM-DD");
				console.log(start);
				console.log(end);
                
                if (end == 'Invalid date') {
                    var message = '<div style="text-align:left; padding-left:15%;">' + title + ' 기간 <br>: ' + start + ' ~ ' + start + '<br>' + '</div>';
                } else {
                    var message = '<div style="text-align:left; padding-left:20%;">' + title + ' 기간 <br>: ' + start + ' ~ ' + end + '<br>' + '</div>';
                }

		    Swal.fire({
		        html: message,
		        confirmButtonText: title + '페이지 이동',
		        showCancelButton: true, // "닫기" 버튼을 표시합니다.
		        cancelButtonText: '닫기' 
		    }).then((result) => {
		        if (result.isConfirmed) {
		            if (title === '수주') {
		                // 수주 페이지로 이동
		                window.location.href = '${pageContext.request.contextPath}/sell/proOrderList'; 
		            } else if (title === '발주') {
		                // 발주 페이지로 이동
		                window.location.href = '${pageContext.request.contextPath}/buyOrder/rawOrderList'; 
		            }else if (title === '작업지시') {
		                // 작업지시 페이지로 이동
		                window.location.href = '${pageContext.request.contextPath}/factory/workOrderList'; 
		            }
		        }
		    });

        }
    });

    
    calendar.render();
}

window.addEventListener('DOMContentLoaded', event => {
	createCalendar();
});

var calendar_compare = null; // 전역변수용



// ajax 갱신 까지 
// 캘린더정보 처음 로드될 때 데이터를 가져옴
			loadCalendar();

			function loadCalendar() {
				$.ajax({
					url : '${pageContext.request.contextPath}/calendar_ajax/calendarList',
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						createCalendar(result);
					}
				});
			}
			
			
// 라인 차트 생성 함수 
function monthlySaleChart(data) {

	var context = document.getElementById('monthlySale').getContext('2d');

	if (data && data.length > 0) { 

		var labels = data.map(function(item) { return item.label; });
		var data   = data.map(function(item) { return item.data; });

		var monthlySale = new Chart(context, {
			type: 'line',
			data: {
			labels: labels,
			datasets: [{
			label:'',
			data:data,
			lineTension: 0.3,
			backgroundColor: "rgba(182, 207, 182,0.2)",
			borderColor: "rgba(182, 207, 182,1)",
			pointRadius: 5,
			pointBackgroundColor: "rgba(182, 207, 182,1)",
			pointBorderColor: "rgba(182, 207, 182,0.8)",
			pointHoverRadius: 5,
			pointHoverBackgroundColor: "rgba(182, 207, 182,1)",
			pointHitRadius: 50,
			pointBorderWidth: 2
		}]
	},
			options: {
			   scales: {
			   xAxes: [{
			   time: {
			   unit: 'date'
			 },
			   gridLines: {
			   display: false
			 },
			   ticks: {
			   maxTicksLimit: 7
			}
		}],
			  yAxes: [{
			  ticks: {
			  min: 0,
			  max: 400000,
			  maxTicksLimit: 5
			},
			  gridLines: {
			  color: "rgba(0, 0, 0, .125)",
			}
		}],
		},
			  legend: {
			  display: false
			}
		} //options
			     });
			   } else {
			     console.error('데이터가 없습니다.');
			   }
			}



	//AJAX 요청을 통해 서버에서 데이터 가져오기 및 차트 생성 시작하기
	$.ajax({
	url: '${pageContext.request.contextPath}/chart_ajax/monthlySale',
	type: 'GET',
	}).done(function(data){
	monthlySaleChart(data);
	}).fail(function(xhr, status, error){
	console.error('데이터를 가져오지 못했습니다.', error);
	});



// 바 차트 생성 함수 
function monthlyProdChart(data) {
	
	var context = document.getElementById('monthlyProd').getContext('2d');

	if (data && data.length > 0) { 

	var labels = data.map(function(item) { return item.label; });
	var gData   = data.map(function(item) { return item.data; });// good_prod 데이터 추출
 	var fData   = data.map(function(item) { return item.data1; }); // faulty_prod 데이터 추출

	var monthlyProd = new Chart(context, {
	  type: 'bar',
	  data: {
	  labels: labels,
	  datasets: [{
	  label:'양품',
	  data: gData ,
	  backgroundColor: "rgba(198, 219, 218, 1.0)",
	  borderColor: "rgba(198, 219, 218, 1.0)"
      },
      {
        label: '불량품',
        data: fData,
        backgroundColor: "rgba(236, 213, 227, 1)",
        borderColor: "rgba(236, 213, 227, 1)"
	}]
	},
	  options: {
		scales: {
		xAxes: [{
		time: {
		unit: 'date'
		},
		gridLines: {
		display: false
		},
		ticks: {
		maxTicksLimit: 6
		}
	}],
		yAxes: [{
		ticks: {
		min: 0,
		max: 300,
		maxTicksLimit: 5
	},
		gridLines: {
			display: true
		}
		}],
		},
			legend: {
			display: true
		},
		barThickness: 4, // 막대의 두께를 20픽셀로 설정
	} //options
		});
		} else {
			console.error('데이터가 없습니다.');
		}
		}


		//AJAX 요청을 통해 서버에서 데이터 가져오기 및 차트 생성 시작하기
		$.ajax({
		url: '${pageContext.request.contextPath}/chart_ajax/monthlyProd',
		type: 'GET',
		}).done(function(data){
		monthlyProdChart(data);
		}).fail(function(xhr, status, error){
			console.error('데이터를 가져오지 못했습니다.', error);
		});
			
	</script>
    </body>
</html>