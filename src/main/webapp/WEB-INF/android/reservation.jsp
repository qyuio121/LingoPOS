<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- datepicker -->
<script src="../js/calendar.js"></script>
<link rel="stylesheet" href="../css/calendar.css">

<!-- 테이블 css  -->
<link type="text/css" rel="stylesheet" href="../css/easySelectable.css" />
<link rel="stylesheet" href="../css/easySelectablestyle.css">
<link rel="stylesheet" href="../css/sunburst.css">
 
<!-- 테이블 js -->
<script src="../js/easySelectable.js"></script>
 
<!-- 영업시간 -->
<link rel="stylesheet" href="../css/wickedpicker.css">
<script type="text/javascript" src="../js/wickedpicker.js"></script>





<script>
$(function() {
	var selectedliTag = [];
	var getReservation = function(){		
		$.ajax({
			url:"<c:url value='/Reservation/GetReservation.Lingo'/>",
			data:{storeno:${store.storeno},startdate:$('#startdate').val()},
			dataType:'json',
			type:'post',
			success:function(data){
				var currentDate = new Date($('#startdate').val()+' '+$('#starttime').val()+":00").getTime();
			
				$.each(data,function(index,value){
					var valuetime=new Date(value.startdate).getTime();
					if(valuetime-(60*30*1000)<=currentDate && valuetime+(60*60*1000)>=currentDate){
						if($('li[name="table"]').eq((value.tableno)-1).hasClass('es-selected')){
							$('li[name="table"]').eq((value.tableno)-1).removeClass('es-selected');
							$('li[name="table"]').html('예약가능(4인)');
						}
						$('li[name="table"]').eq((value.tableno)-1).addClass("create-used").html('선 예약중');;
					}
				});
			}		
		});
	};
	var getUsed = function(){		
		$.ajax({
			url:"<c:url value='/Reservation/GetUsed.Lingo'/>",
			data:{storeno:${store.storeno},startdate:$('#startdate').val()},
			dataType:'json',
			type:'post',
			success:function(data){
				var currentDate = new Date($('#startdate').val()+' '+$('#starttime').val()+":00").getTime();
				
				$.each(data,function(index,value){
					var valuetime=new Date(value.startdate).getTime();
					if(valuetime<=currentDate && valuetime+(60*60*1000)>=currentDate){
						if($('li[name="table"]').eq((value.tableno)-1).hasClass('es-selected')){
							$('li[name="table"]').eq((value.tableno)-1).removeClass('es-selected');
							$('li[name="table"]').html('예약가능(4인)');
						}
						$('li[name="table"]').eq((value.tableno)-1).addClass("create-used").html('사용중');
					}
				});
			}		
		});
	};
	var datevalidate = function(){
		if(!$('li[name="table"]').hasClass('es-selected')){
			$('li[name="table"]').removeClass('create-used');
			$('li[name="table"]').html('예약가능(4인)');
		}
		getReservation();
		getUsed();
	}
	
	//테이블 보여주기
	$('#easySelectable').easySelectable();
	
	//내가 만든 선택된 테이블 인덱스 구하기
	$('#easySelectable li').click(function(index){
		if(!$(this).hasClass('create-used')){
			var number = $('#easySelectable li').index(this);
			//선택되지 않은것이 선택된경우
			if(selectedliTag.indexOf(number)==-1){
				selectedliTag.push(number);
			}
			//선택되었던 것이 선택된경우
			else{
				selectedliTag = jQuery.grep(selectedliTag, function(value) { 
	        		return value != number; });
			}
			$('#tableno').val(selectedliTag.toString());
			$('#tableno').next().html("");
		}	
	})
	
	//영업시간
	$('.timepicker').wickedpicker({twentyFour: true,now:"00:00"});
	
	var now = new Date();
	var myDate = new Date();
	myDate.setMonth(myDate.getMonth() + 1);
	//datepicker
    $('#two').calendar({
    	onSelected: function (view, date, data) {
    		$('#startdate').next().html("");
    		function getFormatDate(date){
    			var year = date.getFullYear();                                 //yyyy
    			var month = (1 + date.getMonth());                     //M
    			month = month >= 10 ? month : '0' + month;     // month 두자리로 저장
    			var day = date.getDate();                                        //d
    			day = day >= 10 ? day : '0' + day;                            //day 두자리로 저장
    			return  year + '-' + month + '-' + day;
    		}
    		date = getFormatDate(date);
    		$('#startdate').val(date);
    	},
    	 selectedRang: [now,myDate],
    });
    $('#startdate').val(new Date().format("yyyy-mm-dd"));
	setInterval(datevalidate,500)
	$('#confirm').click(function(){
		$('#frm').submit();
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
  
<!--날짜 -->
html {
            font: 500 14px "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
            height: 100%;
        }

        body {
            height: 100%;
            margin: 0;
        }

        a {
            text-decoration: none;
        }

        ul,
        ol,
        li {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        p {
            margin: 0;
        }

        input {
            margin: 10px 0;
            height: 28px;
            width: 200px;
            padding: 0 6px;
            border: 1px solid #ccc;
            outline: none;
        }
</style>

<div class="container">
	
<!-- 이 페이지 설명 -->
<!-- 	
	form으로 파라메터 전달 - 모든값 저장 완료
	예약날짜/예약시간/예약테이블 - 플러그인 사용 
	유효성검사완료
	작성 후 연결 컨트롤러 따로 만들지는 않음

	웹페이지 콘솔보면 좀 더 자세한 파라미터값들을 알 수 있음

	예약인원 파라메타명 (하나) : people 
	예약날짜 파라메타명 (하나) : startdate - 파라미터가 2018-10-26 형식으로 저장될 수 있게 바꿈  - function getFormatDate(date){}
	예약시간 파라메타명 (하나) : starttime 
	예약테이블 파라메타명 (배열) : tableno - 파라미터가 5,4,2,8,7,1,3 형식으로 저장될 수 있게 바꿈 - $('#easySelectable li').click(function(index){}
	
	※테이블 사용중/예약중 기능 만듬
		<li class="create-used">사용중</li>
	※테이블 사용가능
		<li class="serviceable">예약가능(4인)</li>
 -->	
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-12">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />${store.storename}<small>예약하기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 예약하기 폼 시작 -->
	<form id="frm" class="form-horizontal" action='<c:url value="/Android/ReserveOk.Lingo"/>'>
<!-- 예약인원 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">예약인원 수</label>
			<div class="col-sm-3">
				<select class="form-control col-sm-4" id="people" name="people">
					<option value="" >인원을 선택해 주세요</option>
				     <option value="1">1</option>
				     <option value="2">2</option>
				     <option value="3">3</option>
				     <option value="4">4</option>
				</select>
			    <label for="people" class="error" style="color:red"></label>
			</div>
		</div>
<!-- 예약인원 끝 -->	
<!-- 예약날짜 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">예약날짜</label>
			<div class="col-sm-2">
			<div id="two"></div>
	       		
	       	<input type="hidden" class="form-control" name="startdate" id="startdate" value="">	
	       	<label class="dateError" style="color:red"></label>  	
	       	</div>
		</div>
<!-- 예약날짜 끝 -->	
<!-- 예약시간 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">예약시간</label>
			<div class="col-sm-2">
				<input type="text" id="starttime" name="starttime" class="timepicker form-control time" ><br>
	       		
	       		<label class="timeError" style="color:red"></label>  	
	       	</div>
		</div>
<!-- 예약시간 끝 -->	
<!-- 테이블 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">테이블선택</label>
			<div class="col-sm-7">
				<ul id="easySelectable">
					<c:forEach begin="1" end="${store.tablenum}" var="i" >	
						<li name ="table" class="serviceable">예약가능(4인)</li>
					</c:forEach>	
						<!--li class="create-used">사용중</li-->
				</ul>
				<input type="hidden" name="tableno" id="tableno" value="" />
				<label  style="color:red"></label>  
			</div>
		</div>		
<!-- 테이블 끝 -->
		<div class="form-group">
		  	<div class="col-sm-offset-2 col-sm-10">
		  	<input type="hidden" name="storeno" id="tableno" value="${store.storeno}" />
		   		<button type="button" value="button타입" class="btn btn-primary" id="confirm">예약하기</button>     
		   	</div>
		</div>
	</form>
<!-- 예약하기 폼 끝 -->
<!-- 내용 끝 -->	
</div>
<c:forEach begin="0" end="10" step="1">
	<br/>
</c:forEach>