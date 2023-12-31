<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
  <link href="../resources/css/cardHeaderDefault.css" rel="stylesheet" />
    </head>           
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
 <body class="sb-nav-fixed">
        <div id="layoutSidenav">
<!-- 사이드바 -->
<jsp:include page="../include/sidebar.jsp"></jsp:include>
<!-- 사이드바 -->
        
            <div id="layoutSidenav_content">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">지점 관리</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        
                       <div>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
                       <input type="button" value="지점 등록" onclick="branchReg()">
                        </c:if>
                        
                        </div>
                        
                        </div>

                        <div class="card mb-4">
                            <div class="card-header">
                             	<div class="cardHeaderFirstLine">
                             	  	<!-- 지점 검색 기능 -->
                             	 	
										<select id="category">
  											<option value="branch_code">지점코드</option>
  											<option value="branch_name">지점명</option>
  											<option value="branch_phone">지점 연락처</option>
										</select>&nbsp;
								    <input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content">&nbsp;
									<input type="button" name="search" value="조회" onclick="branchSearch()">&nbsp;
									<input type="button" name="allList" value="전체목록" onclick="location.reload();">
                           			<!-- 지점 검색 기능 -->
                             	</div>

                            </div>
                            <div class="card-body">
                            
                            
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                            <th>코드</th>
                                            <th>지점명</th>
                                            <th>사업자번호</th>
                                            <th>대표자</th>
                                            <th>연락처</th>
                                            <th>우편번호</th>
                                            <th>주소</th>
                                            <th>이메일</th>
                                            <th>담당자</th>
                                            <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
											<th data-sortable="false">관리</th>
											</c:if>

                                        </tr>
                                    </thead>
                                    <tbody id= "tbody">
                                    <c:forEach var="sellDTO" items="${branchList }">
                                        <tr>
                                            <td>${sellDTO.branch_code }</td> 
                                            <td>${sellDTO.branch_name }점</td>
                                            <td>${sellDTO.branch_reg }</td>
                                            <td>${sellDTO.branch_ceo }</td>
                                            <td>${sellDTO.branch_phone }</td>
                                            <td>${sellDTO.branch_post }</td>
                                            <td>${sellDTO.branch_add }</td>
                                            <td>${sellDTO.branch_email }</td>
                                            <td><a href="#" class="emp-num-link" data-emp-num="${sellDTO.emp_num}">${sellDTO.emp_num}</a></td>
                                            <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
											<td><input type="button" value="수정"
												onclick="branchUpdate('${sellDTO.branch_code}')" id="branchUpdate1">
												<input type="button" value="삭제"
												onclick="branchDelete('${sellDTO.branch_code}')" id="branchDelete1">
											</td>
											</c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>                        
                    </div>
                <!-- 내용 들어가는 곳 -->
                </main>
                
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
                
            </div>
        </div>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
<!-- 	<script src="../resources/js/branchList_im.js"></script> -->
<script type="text/javascript">
//테이블 초기화를 위한 전역변수 선언
var simpleDataTableInstance;

// branch_phone 형식을 변경하는 함수
function formatBranchPhone() {
    var branchPhones = document.querySelectorAll("#datatablesSimple td:nth-child(5)");
    branchPhones.forEach(function (branchPhoneCell) {
        var branchPhone = branchPhoneCell.textContent.trim();
        var formattedPhone = branchPhone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        branchPhoneCell.textContent = formattedPhone;
    });
}

// branch_reg 형식을 변경하는 함수
function formatBranchReg() {
    var branchRegs = document.querySelectorAll("#datatablesSimple td:nth-child(3)");
    branchRegs.forEach(function (branchRegCell) {
        var branchReg = branchRegCell.textContent.trim();
        var formattedBranchReg = branchReg.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');
        branchRegCell.textContent = formattedBranchReg;
    });
}

// 테이블 내용 형식화 함수
function formatTableContent() {
    formatBranchPhone();
    formatBranchReg();
}

// 테이블 초기화 함수
function simpleDataTable() {
    const datatablesSimple = document.getElementById('datatablesSimple');

    // 테이블 객체를 생성하고 전역변수에 저장합니다
    simpleDataTableInstance = new simpleDatatables.DataTable(datatablesSimple, {
        // 페이지 표시 버튼 삭제
        perPageSelect: false,
        // 검색창 삭제
        searchable: false,
        // 페이지당 목록 10개
        perPage: 10,
        // 라벨 수정
        labels: {
            placeholder: "검색",
            noResults: "검색 결과가 없습니다",
            noRows: "데이터가 없습니다",
            info: ""
        }
    });

    // 페이지 변경 이벤트를 수신하기 위한 리스너 추가
    simpleDataTableInstance.on('datatable.page', function () {
        formatTableContent(); // 페이지를 변경할 때 형식을 다시 적용합니다
    });
}

// DOM이 로드될 때 테이블 초기화 함수를 호출
window.addEventListener('DOMContentLoaded', event => {
    simpleDataTable();
});



// 직원 팝업 관련 함수
$(document).ready(function() {
	
	$(document).on("click", ".emp-num-link", function(event) {
        event.preventDefault();
        var empNum = $(this).data("emp-num"); // 클릭한 링크의 emp_num 값을 가져옵니다.

        // 팝업 창 크기 및 위치 설정
        var width = 590;
        var height = 705;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        // 팝업 창 열기
        var url = '${pageContext.request.contextPath}/member/managerInfo?emp_num=' + empNum; // 팝업에 필요한 데이터를 URL에 포함
        var popupWindow = window.open(url, '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);

        // 팝업 창 포커스
        popupWindow.focus();
    });
});


$(document).ready(function() {
    $("#emp_num").click(function() {
        // 업체코드 입력란의 값을 가져옵니다.
        // var emp_num = $("input[name='emp_num']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 업체코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#emp_num").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/member/memberList'; // 업체 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});
   
   
   
// 검색관련 함수
   function branchSearch() {
   		
   	   // 원래 매개변수로 전달할려했으나 처음에 언디파인드가 뜨는 문제가 있음 따라서 변수선언
    	  var role = '${sessionScope.emp_role}';
    		
   	   // 값 전달 하기위한 JSON 타입 변수선언
   	   var json = {
           			category: $('#category').val(),
           			content: $('#content').val()
          			  };
   	
   	   // 검색 결과값을 받아오기 위한 ajax 호출
    	   $.ajax({
    			  url : '${pageContext.request.contextPath}/sell_ajax/search',
    			  data: JSON.stringify(json),
    	          contentType: 'application/json',
    			  type : 'POST',
    			  dataType: 'json',
   			  
    			  success:function(json){
    				  
    				// 아무것도 출력할게 없을때 선택자가 삭제되어 테이블을 더이상 초기화하지 못하는 문제가 있음
   				   	// 따라서 조건문으로 0개가 아닐때만 테이블을 삭제함
   				 	if(json.length !== 0){
  				    	simpleDataTableInstance.destroy();
   				 	}
    				  
    				    // tbody 내용을 초기화
    				    $('tbody').empty();
   					
    				    // 배열 크기만큼 반복
    				    json.forEach(function (data) {
    				    	// tr 태그 생성
    				        var $tr = $('<tr>');
    				    	//tr 에 내용추가
    				    	
    				    	// 권한이있으면 수정 삭제 버튼도 같이 출력
    				    	if(role.charAt(1) === '1'){
    				        	$tr.append(
    				        			
    				           	"<td>"+data.branch_code+"</td>",
    				           	"<td>"+data.branch_name+"</td>",
    				         	"<td>"+data.branch_reg+"</td>",
    				         	"<td>"+data.branch_ceo+"</td>",
    				         	"<td>"+data.branch_phone+"</td>",
    				         	"<td>"+data.branch_post+"</td>",
    				         	"<td>"+data.branch_add+"</td>",
    				         	"<td>"+data.branch_email+"</td>",
    				         	'<td><a href="#" class="emp-num-link" data-emp-num="' + data.emp_num + '">' + data.emp_num + '</a></td>',
    				         	"<td>" +
    				         	'<input type="button" value="수정" onclick="branchUpdate(\'' + data.branch_code + '\')" id="branchUpdate1">' +
    				         	'&nbsp'+
    				            '<input type="button" value="삭제" onclick="branchDelete(\'' + data.branch_code + '\')" id="branchDelete1">' +
    				            "</td>"

    				        	);
    				    	} else {
    				    		 $tr.append(
    				           	"<td>"+data.branch_code+"</td>",
    		 				    "<td>"+data.branch_name+"</td>",
    				         	"<td>"+data.branch_reg+"</td>",
    				         	"<td>"+data.branch_ceo+"</td>",
    				         	"<td>"+data.branch_phone+"</td>",
    				         	"<td>"+data.branch_post+"</td>",
    				         	"<td>"+data.branch_add+"</td>",
    				         	"<td>"+data.branch_email+"</td>",
    				         	'<td><a href="#" class="emp-num-link" data-emp-num="' + data.emp_num + '">' + data.emp_num + '</a></td>'	            
    				    	);}
    				        // 생성한 <tr> 요소를 tbody에 추가
    				        $('tbody').append($tr);
    				    });
    				    
    				 	   // 테이블 재생성 마찬가지로 데이터가있는 경우에만 객체 재생성
    	 				   if(json.length !== 0){
    	 					   formatBranchPhone();
    	 		               formatBranchReg();
    	 				       simpleDataTable();
    	 				   // 그렇지않은경우 기존 객체를 유지하고 페이징만 삭제
    	 				   } else if(json.length === 0){
    	 	 				    // 페이징을 삭제
    	 	 				   	$('.datatable-pagination-list').remove();
    	 	 			   }
    				    
    		      }// 콜백함수 종료지점
         });// end_of_ajax
   }// end function



// 지점 추가관련 함수
   function branchReg(){
   	window.open('${pageContext.request.contextPath }/sell/branchReg', '_blank', 'width=615px, height=526px, left=600px, top=300px');
   } //end function

   function branchUpdate(branch_code){
   	window.open('${pageContext.request.contextPath }/sell/branchUpdate?branch_code='+branch_code, '_blank', 'width=550px, height=526px, left=600px, top=300px');
   }
   
// 지점 삭제관련 함수
   function branchDelete(branch_code) {
   	
   	// sweetalert2 호출
   	Swal.fire({
   		   title:'지점 삭제',
   		   text: '정말로 해당 지점을 삭제 하시겠습니까?',
   		   icon: 'warning',
   		   
   		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
   		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
   		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
   		   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
   		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
   		   
   		   reverseButtons: true, // 버튼 순서 거꾸로
   		
   		// 람다식 alert 창이 닫히면 호출
   		}).then(result => {
   		   // 만약 Promise리턴을 받으면,
   		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
   			   
   			   // 멤버 삭제하는 ajax 호출
   			   $.ajax({
   					  url : '${pageContext.request.contextPath}/sell_ajax/delete',
   					  data: {"branch_code": branch_code},
   					  type : 'POST',
   					  success:function(data){
   							const result = $.trim(data);
   							
   							if(result == "true"){
   							Swal.fire('삭제가 완료되었습니다.', '성공', 'success').then(result => {
   								if(result.isConfirmed)
   									// 완료 창을 닫으면 새로고침
   									location.reload();
   							});
   							} else {
   							Swal.fire('삭제에 실패헀습니다.', '실패', 'error');
   							}
   				      }// 콜백함수 종료지점
   		       });// end_of_ajax
   		  }// end_of_if(컨펌확인)
   	  });// end_of_function(alert 콜백함수 종료지점)
   }// end_of_function
   

  // branch_phone 형식을 000-0000-0000으로 변경하는 함수
   function formatBranchPhone() {
       var branchPhones = document.querySelectorAll("#datatablesSimple td:nth-child(5)");
       branchPhones.forEach(function (branchPhoneCell) {
           var branchPhone = branchPhoneCell.textContent.trim();
           var formattedPhone = branchPhone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
           branchPhoneCell.textContent = formattedPhone;
       });
   }

   // 페이지 로드 시 호출하여 전체 테이블의 branch_phone 형식 변경
   window.addEventListener("load", function () {
       formatBranchPhone();
   });

// branch_reg 형식을 XXX-XX-XXXXX로 변경하는 함수
   function formatBranchReg() {
       var branchRegs = document.querySelectorAll("#datatablesSimple td:nth-child(3)");
       branchRegs.forEach(function (branchRegCell) {
           var branchReg = branchRegCell.textContent.trim();
           var formattedBranchReg = branchReg.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');
           branchRegCell.textContent = formattedBranchReg;
       });
   }

   // 페이지 로드 시 호출하여 전체 테이블의 branch_reg 형식 변경
   window.addEventListener("load", function () {
       formatBranchReg();
   });

   
 //엔터키 입력시 검색되게 이벤트 리스너 활성화
   document.addEventListener("keyup", function(event) {
       if (event.key === 'Enter') {
       	branchSearch();
       }// end if
   });// end function
   </script>
   
    </body>
</html>
