<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 테이블 css  -->
<link type="text/css" rel="stylesheet" href="../css/easySelectable.css" />
<link rel="stylesheet" href="../css/easySelectablestyle.css">
<link rel="stylesheet" href="../css/sunburst.css">

<!-- 테이블 js -->
<script src="../js/easySelectable.js"></script>

<!-- 영업시간 -->
<link rel="stylesheet" href="../css/wickedpicker.css">
<script type="text/javascript" src="../js/wickedpicker.js"></script>

<!-- 유효성  검사 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>

<script>
$(function() {
	var selectedliTag = [];
	
	//유효성검사
	$('#frm').validate({
		rules:{
			check:"required",
			memberNumber:"required"
		},messages:{	
			check:"가게정보  수집 동의에 체크하세요.",
			memberNumber:"예약 인원 수를 입력하세요."
		}});
	
	//테이블 보여주기
	$('#easySelectable').easySelectable({
		item: 'li',
		state: true,
		onSelecting: function(){
		},
		onSelected: function(){
			
		},
		onUnSelected: function(){
   		}
	});
	
	//내가 만든 선택된 테이블 인덱스 구하기
	$('#easySelectable li').click(function(index){
		var number = $('#easySelectable li').index(this);
		//선택되지 않은것이 선택된경우
		if(selectedliTag.indexOf(number)==-1){
			selectedliTag.push(number);
			console.log("새롭게 선택된 테이블 인덱스"+number);
		}
		//선택되었던 것이 선택된경우
		else{
			selectedliTag = jQuery.grep(selectedliTag, function(value) { 
        		return value != number; });
			console.log("선택 제거된 테이블 인덱스 "+number);
		}
		console.log("현재 선택된 테이블 인덱스들 DB연결시 넘길 값"+selectedliTag);
		$('#selectedTable').val(selectedliTag.toString());
		$('#selectedTable').next().html("");
		console.log("hidden타입으로 넘어갈 값 : "+selectedliTag.toString());
	})
	
	//영업시간
	$('.timepicker').wickedpicker({twentyFour: false,minutesInterval:30,now: "1:00"});
	
	//영업시간 유효성검사 후 재 선택시 유효성 검사 끄기
	$(".time").on('change',function(){
		$('.timeError').html("");	
	})
		
	//validate
	$('#confirm').click(function(){
		if($('#frm').valid() && $('#hiddenFile').val() != "" && $('#reservationTime').val()=="1 : 00 오전"){
			$('#frm').submit();
		}
		if($('#selectedTable').val() == "")
			$('#selectedTable').next().html("테이블을 선택하세요.");
		if($('#reservationTime').val()=="1 : 00 오전")
			$('.timeError').html("예약시간을 선택하세요.");	
	})
});
</script>
<style>
<!-- 테이블 -->
  #feedback { font-size: 1.4em; }
  #selectable .ui-selecting { background: #FECA40; }
  #selectable .ui-selected { background: #F39814; color: white; }
  #selectable { list-style-type: none; margin: 0; padding: 0; width: 450px; }
  #selectable li { margin: 3px; padding: 1px; float: left; width: 100px; height: 80px; font-size: 4em; text-align: center; }
</style>

<div class="container" style="padding-top: 60px; margin-top: 60px;">
	
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />DB연결시 가게 이름<small>예약하기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 예약하기 폼 시작 -->
	<form id="frm" class="form-horizontal" action='#'>
<!-- 예약시간 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">예약시간</label>
			<div class="col-sm-2">
				<input type="text" id="reservationTime" name="reservationTime" class="timepicker form-control time" ><br>
	       		
	       		<label class="timeError" style="color:red"></label>  	
	       	</div>
		</div>
<!-- 예약시간 끝 -->	
<!-- 예약인원 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">예약인원 수</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" placeholder="예약인원 수를 입력해주세요"   name="memberNumber" id="memberNumber">
			    
			    <label for="memberNumber" class="error" style="color:red"></label>
			</div>
		</div>

<!-- 예약인원 끝 -->	
<!-- 테이블 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">테이블선택</label>
			<div class="col-sm-7">
				<ul id="easySelectable">
					<c:forEach begin="1" end="9" var="i" >	
						<li>예약가능(4인)</li>
					</c:forEach>	
				</ul>
				<input type="hidden" name="selectedTable" id="selectedTable" value="" />
				<label  style="color:red"></label>  
			</div>
		</div>		
<!-- 테이블 끝 -->
<!-- 가게정보  수집동의 체크란 시작-->
		<div class="form-group">
		    <label class="col-sm-2 control-label">예약하기 동의</label>
		 	<div class="col-sm-10">
			  	<input type="checkbox" name="check" id="check" value="check">동의합니다.
			  	<h6><small>빈번한 예약취소는 LingoPOS서비스 사용이 제한될 수 있음을 알려드립니다.</small></h6>
				<h6><small>(저희 LingoPOS는 업주님들 편의를 위해 회원님 블랙리스트 서비스를 제공하고 있습니다.)</small></h6>
				<label for="check" class="error" style="color:red"></label>
		    </div>
		 </div>
<!-- 가게정보 수집동의 체크란 시작 끝 -->	
<!-- 버튼 2개 시작 - 문의하기 / 취소  -->
		<div class="form-group">
		  	<div class="col-sm-offset-2 col-sm-10">
		   		<button type="button" value="button타입" class="btn btn-primary" id="confirm">예약하기</button><!-- 문의하기 -->     
		   		<button type="button" value="button타입" class="btn btn-default" id="cancle">취소</button><!-- 취소 -->     
		  	</div>
		</div>
<!-- 버튼 2개 끝 - 문의하기 / 취소  -->	 
	</form>
<!-- 예약하기 폼 끝 -->
<!-- 내용 끝 -->	
</div>
<c:forEach begin="0" end="10" step="1">
	<br/>
</c:forEach>

