<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 탭css -->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/swichTab.css">

<!-- 탭 js -->
<script src="../js/jquery.swichTab.js" charset="utf-8"></script>
<div class="container" style="padding-top: 60px; margin-top: 60px;">
	<!-- 내용 시작 -->
	<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-10">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 예약목록</h2>
		</div>
	</div>		
	<!-- 바디 헤더 끝-->
	<!-- 탭 바 시작-->
	<div class="tabGroup tabGroup2">
		<ul class="swichtab-controller">
	        <li data-swichtab="controller"><a href="#tab1">현재 예약목록</a></li>
	        <li data-swichtab="controller"><a href="#tab2">지난 예약목록</a></li>
    	</ul>
		<!-- 탭 바 끝-->	
		<!-- 탭 바 내 아코디언 시작-->
	<div class="swichtab-contents">
			<div id="tab1" class="swichtab-panel" data-swichtab="target">
			  	<h3>현재 예약목록</h3>
			  	<div class="row" style="margin-bottom: 10px;margin-right: 10px">
				  	<div class="text-right">
						<button id="deniedBtn" class="btn btn-danger">일괄거절</button>
					</div>
				</div>
				<div id="currentTable">
				</div>			
			</div>
			<div id="tab2" class="swichtab-panel" data-swichtab="target">
				<h3>지난 예약목록</h3>
				  	<div class="text-right">
						<form class="navbar-form navbar-right"  action="#" method="get">
							<div class="form-group">
								<select id="searchColumn" name="searchColumn" class="form-control">
							       <option value="storename">가게이름</option>
							       <option value="address">가게주소</option>
							    </select>
								<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
							</div>
							<button id="searchBtn" class="btn btn-default" style="margin-left: -3px">검색</button>
						</form>
					</div>
					<div id="visitTable">
					</div>	
			</div>

	</div >
	<div id="footerBrResult">
		<c:forEach begin="0" step="1" end="13">
			<br/>
		</c:forEach>
	</div>
	<!-- 내용 끝 -->
	</div>
</div>
<script>
var selectlist=[];
$(function() {

	$('#deniedBtn').click(function(){
		if(selectlist.length==0){
    		alert('해당예약을 선택해주세요');
    		return false;
    	}else{
    		if(confirm('예약을 일괄취소하시겠습니까?')){
    			$.ajax({
    				url:'<c:url value="/Reservation/RemoveReservation.Lingo"/>',
    				type:'post',
    				dataType:'json',
    				contentType:'application/json',
    				data:JSON.stringify(selectlist),
    				success:function(data){
    					alert(data+"개의 예약이 취소되었습니다.");
    					location.replace("<c:url value='/Reservation/ReservationList.Lingo'/>")
    				}
    			});
    		}
    	}
    	return false;
    });

	//탭
	$('.tabGroup2').swichTab({
     cahngePanel: 'fade',
     swiper: true,
     index: 0,
   });
	//테이블 <br/처리>
	$('.swichtab-controller li a').click(function(){
		$('#footerBrResult').empty();
		if(this.innerHTML == '현재 예약목록'){
			$('#footerBrResult').html(
				'<c:forEach begin="0" end="13" step="1">'+
					'<br>'	+
				'</c:forEach>'
			)
		}
		else if(this.innerHTML == '지난 예약목록'){
			$('#footerBrResult').html(
				'<c:forEach begin="0" end="20" step="1">'+
					'<br>'	+
				'</c:forEach>'
			)
		}
	});
	
	showVisit();
	showCurrent();
	$('#searchBtn').click(function(){
		var searchColumn = $("#searchColumn").val();
		var searchWord = $("#searchWord").val();
		showVisitSearch(searchColumn,searchWord);
		return false;
	});
});
var showCurrent = function(){		
	$.ajax({
		url:"<c:url value='/Reservation/CurrentReservationList.Lingo'/>",
		dataType:"text",
		type:'post',
		success:displayCurrent			
	});
};

var showCurrentPage = function(nowPage){		
	$.ajax({
		url:"<c:url value='/Reservation/CurrentReservationList.Lingo'/>",
		dataType:"text",
		type:'post',
		data:"nowPage="+nowPage,
		success:displayCurrent			
	});
};
var displayCurrent = function(data){
	var count = 0;
	
	
	$('#currentTable').html(data);
	var maxCount = $("input[name=check]").length;
	$("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            count = maxCount;
            //console.log(maxCount)
            //클릭이 안되있으면
            selectlist=[];
            for(var i=0;i<maxCount;i++){
            	var reserveno = $("#reserve tr").eq(i).children('td:eq(0)').html();
        		selectlist.push({reserveno:reserveno});
            }
            console.log(selectlist);
        }
        else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
            count = 0;
            selectlist=[];
        }
    })
   	$('input[name=check]').click(function(){
    	if(this.checked){
   			//console.log(count)
   			count+=1;
    		if(count === maxCount){
    			$("#checkall").prop('checked',true);
    		}
    		var reserveno = $("#reserve tr").eq($(this).val()).children('td:eq(0)').html();
    		selectlist.push({reserveno:reserveno});
    		 console.log(selectlist);
    	}
    	else{
    		count-=1;
    		//console.log(count === 0)
    		if(count < maxCount){
    			$("#checkall").prop('checked',false);
    		}
    		var reserveno = $("#reserve tr").eq($(this).val()).children('td:eq(0)').html();
    		selectlist=selectlist.filter(el => el.reserveno != reserveno);
    		 console.log(selectlist);
    	}
    });
    $("button[name=cancelBtn]").click(function(){
    	var select = [];
    	var reserveno = $("#reserve tr").eq($(this).val()).children('td:eq(0)').html();
    	select.push({reserveno:reserveno});
    	if(confirm('해당 예약을 취소하시겠습니까?')){
			$.ajax({
				url:'<c:url value="/Reservation/RemoveReservation.Lingo"/>',
				type:'post',
				dataType:'json',
				contentType:'application/json',
				data:JSON.stringify(select),
				success:function(data){
					alert(data+"개의 예약이 취소되었습니다.");
					location.replace("<c:url value='/Reservation/ReservationList.Lingo'/>")
				}
			});
		}
    });
}
var showVisit = function(){		
	$.ajax({
		url:"<c:url value='/Reservation/VisitList.Lingo'/>",
		dataType:"text",
		type:'post',
		success:function(data){
			$('#visitTable').html(data);
		}			
	});
};
var showVisitSearch = function(searchColumn,searchWord){		
	$.ajax({
		url:"<c:url value='/Reservation/VisitList.Lingo'/>",
		dataType:"text",
		data:"searchColumn="+searchColumn+"&searchWord="+searchWord,
		type:'post',
		success:function(data){
			$('#visitTable').html(data);
		}			
	});
};
var showVisitPageSearch = function(nowPage,searchColumn,searchWord){		
	$.ajax({
		url:"<c:url value='/Reservation/VisitList.Lingo'/>",
		data:"nowPage="+nowPage+"&searchColumn="+searchColumn+"&searchWord="+searchWord,
		dataType:"text",
		type:'post',
		success:function(data){
			$('#visitTable').html(data);
		}			
	});
};

function getReview(nowPage){
	showCurrentPage(nowPage);
}
function getReviewSearch(nowPage,searchColumn,searchWord){
	showVisitPageSearch(nowPage,searchColumn,searchWord);
}

</script>