<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아이스마일</title>
	  	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 		<link href="../resources/css/addTableHorizontal.css" rel="stylesheet" />
</head>	


<body>
	<div id ="container">		
	<form action="${pageContext.request.contextPath }/factory/workOrderAddPro" id="registration" name="registration" method="POST">
		<h1>작업 지시 수정</h1>

		<table border="1">
		<tr>
						<!-- <th>지시코드</th> -->
						<th>작업지시자</th>
						<th>라인코드</th>
						<th>라인명</th>
						<th>수주코드</th>
						<th>제품명</th>
						<th>주문량</th>
						<th>생산공정</th>
						<!-- <th>지시날짜</th> -->
						<th>지점코드</th>
		</tr>
	<tr>
						<!-- <td><input type="text" name="work_code" id="work_code"></td>  -->
						<td><input type="text" name="emp_num" id="emp_num" value="${workOrderDTO.emp_num}"></td>  <!-- 사원 정보 가져오기 --> 
						<td><input type="text" name="line_code" id="line_code" value="${workOrderDTO.line_code}"></td>  <!-- 라인 코드(정보) 가져오기 -->
						<td><input type="text" name="line_name" id="line_name" value="${workOrderDTO.line_name}" readonly></td>  <!-- 사원 코드 가져왔을시 자동으로 해당 라인 이름 등록 -->
						<td><input type="text" name="order_code" id="order_code" value="${workOrderDTO.order_code}"></td>  <!-- 수주 코드(정보) 가져오기 -->
						<td><input type="text" name="prod_name" id="prod_name" value="${workOrderDTO.prod_name}" readonly></td>   <!-- 수주 코드 가져왔을시 자동으로 해당 제품명 등록 -->
						<td><input type="text" name="order_amount" id="order_amount" value="${workOrderDTO.order_amount}" readonly></td>  <!-- 수주 코드 가져왔을시 자동으로 해당 지시량 등록 -->
						<td><input type="text" name="line_process" id="line_process" value="${workOrderDTO.line_process}" readonly></td>  <!-- 라인 코드 가져왔을시 자동으로 해당 라인 공정 등록 -->
						<!-- <td><input type="text" name="work_order_date" id="work_odrder_date"></td>  -->
						<td><input type="text" name="branch_code" id="branch_code" value="${workOrderDTO.branch_code}" readonly></td>  <!-- 수주 코드 가져왔을시 자동으로 해당 지점코드 등록 -->
				
		</tr>
		</table>
						<input type="hidden" name="work_code" id="work_code" value="${workOrderDTO.work_code}">
					
				<span id="msg"></span>
			<!-- 등록 버튼 -->
		<div id="bottomContainer">
			<input type="submit" id="btn" value="수정">
			<input type="reset" id="btn" value="취소">
		</div>
		</form>                
    	</div>
            
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  


		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
       	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>

<script>

//정규식 제어함수
$(document).ready(function() {
	        
  	//서브밋 제어
    $('#registration').submit(function(event) {
    	
       	if($('#emp_num').val() == ""){
    		$('#msg').text("작업 지시자를 선택하십시오."); 
    		$('#emp_num').focus();
    		return false;
    	}
    	
    	if($('#line_code').val() == ""){
    		$('#msg').text("라인코드를 선택하십시오.");
    		$('#line_code').focus();
    		return false;
    	}
    	
    	if($('#order_code').val() == ""){
    		$('#msg').text("수주코드를 선택하십시오.");  
    		$('#order_code').focus();
    		return false;
    	}
    	    	
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 event.preventDefault(); // 기본 폼 제출 동작을 막음
		
    	 // 폼 데이터 객체생성
    	 var formData = {
 	 			work_code : $('#work_code').val(),
 	 			emp_num : $('#emp_num').val(),
	 			line_code : $('#line_code').val(),
	 			line_name : $('#line_name').val(),
	 			order_code : $('#order_code').val(),   	
	 			prod_name : $('#prod_name').val(),   	
	 			order_amount : $('#order_amount').val(),   	
	 			line_process : $('#line_process').val(),   	
	 			branch_code : $('#branch_code').val()   	
    	 }
    	 
    	 $.ajax({
 		    type: "POST",
 		    url: "${pageContext.request.contextPath}/factory_ajax/workOrderUpdate",
 		    data: formData,
//  		    contentType: false,
// 		    processData: false,
 		    success: function(response) {
 		        if (response === "true") {
 		            Swal.fire('정보 입력이 완료되었습니다.', '성공', 'success').then(result => {
 		                if (result.isConfirmed) {
 		                    window.opener.location.reload();
 		                    window.close();
 		                }
 		            });
 		        } else {
 		            Swal.fire('정보 입력에 실패했습니다.', '실패', 'error');
 		        }
 		    },
 		    error: function() {
 		        Swal.fire('서버 통신에 문제가 발생했습니다.', '실패', 'error');
 		    }
 		});
 	
 });//submit기능 제어 끝
});

function openUpdate() {
}

//작업 지시자를 선택하면 새창을 여는 이벤트 리스너
$(document).on("click", "input[name='emp_num']", function() {
	window.open('${pageContext.request.contextPath }/member/memberListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
});// end function


//라인 코드를 선택하면 새창을 여는 이벤트 리스너
$(document).on("click", "input[name='line_code']", function() {
	window.open('${pageContext.request.contextPath }/factory/facilityPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
});// end function

//수주 코드를 선택하면 새창을 여는 이벤트 리스너
$(document).on("click", "input[name='order_code']", function() {
	window.open('${pageContext.request.contextPath }/sell/proOrderPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
});// end function

</script>
</body>
</html>