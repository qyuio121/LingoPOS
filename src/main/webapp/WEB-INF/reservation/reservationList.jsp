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
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 예약목록</h2>
		</div>
	</div>		
	<!-- 바디 헤더 끝-->
	<!-- 탭 바 시작-->
	<div class="tabGroup tabGroup2">
		<ul class="swichtab-controller">
	        <li data-swichtab="controller"><a href="#tab1">현재 예약목록</a></li>
	        <li data-swichtab="controller"><a href="#tab2">지난 예약목록들</a></li>
    	</ul>
		<!-- 탭 바 끝-->	
		<!-- 탭 바 내 아코디언 시작-->
		<div class="swichtab-contents">
			  <!-- #faq1 -->	
			  <div id="tab1" class="swichtab-panel" data-swichtab="target">
			  	<h3>현재 예약목록</h3>
			  	<div class="row" style="margin-bottom: 10px;margin-right: 10px">
				  	<div class="text-right">
						<button id="deniedBtn" class="btn btn-danger">일괄거절</button>
					</div>
				</div>
			  	<table class="table table-bordered">
			  		<thead>
						<tr style="text-align: center; font-weight: bold; background-color: #EAEDED">
							<th style="width:15%"><input type="checkbox" id="allCheck" />&nbsp&nbsp가게이름</th>
							<th style="width:30%">가게주소</th>
							<th style="width:17%">가게전화번호</th>
							<th style="width:22%">예약날짜</th>
							<th>예약취소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${reservedList}" >
							<tr>
								<td><input type="checkbox" id="check" />&nbsp&nbsp$ {list.storename }</td>
								<td>${list.address }</td>
								<td>${list.tel }</td>
								<td>${list.startdate }</td>
								<td><button id="cancelBtn"  class="btn btn-danger btn-xs">취소</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				 ${reservedPageString}
			  </div>
			 
			<!-- #faq1 -->
			<!-- #faq2 -->	
			<div id="tab2" class="swichtab-panel" data-swichtab="target">
				<h3>지난 예약목록</h3>
				<div class="row" >
				  	<div class="text-right">
						<form class="navbar-form navbar-right"  action="<c:url value='/Reservation/ReservationList.Lingo'/>" method="get">
							<div class="form-group">
								<select name="searchColumn" class="form-control">
							       <option value="storename">가게이름</option>
							       <option value="visitdate">예약날짜</option>
							    </select>
								<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
							</div>
							<button type="submit" class="btn btn-default" style="margin-left: -3px">검색</button>
						</form>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr style="text-align: center; font-weight: bold; background-color: #EAEDED">
							<th style="width:15%">가게이름</td>
							<th style="width:30%">가게주소</td>
							<th style="width:17%">가게전화번호</td>
							<th style="width:22%">예약날짜</td>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${visitList}" >
							<tr>
								<td>${list.storename }</td>
								<td>${list.address }</td>
								<td>${list.tel }</td>
								<td>${list.visitdate }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table> 
					${visitPageString}
				</div>  
			</div>
			
		<!-- #faq2 -->				
		</div>
	</div >
	<div id="footerBrResult">
		<c:forEach begin="0" step="1" end="13">
			<br/>
		</c:forEach>
	</div>
	<!-- 내용 끝 -->
</div>
<script>
$(function() {
	var count = 0;
	var maxCount = $("input[name=check]").length;
	var selectlist=[];
    //최상단 체크박스 클릭
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
            	var id = $("#blacklistTable tr").eq(i).children('td:eq(1)').html();
        		var storeno = $("#blacklistTable tr").eq(i).children('td:eq(8)').html();
        		selectlist.push({id:id,storeno:storeno});
            }
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
    		var id = $("#blacklistTable tr").eq($(this).val()).children('td:eq(1)').html();
    		var storeno = $("#blacklistTable tr").eq($(this).val()).children('td:eq(8)').html();
    		selectlist.push({id:id,storeno:storeno});
    	}
    	else{
    		count-=1;
    		//console.log(count === 0)
    		if(count < maxCount){
    			$("#checkall").prop('checked',false);
    		}
    		var id = $("#blacklistTable tr").eq($(this).val()).children('td:eq(1)').html();
    		var storeno = $("#blacklistTable tr").eq($(this).val()).children('td:eq(8)').html();
    		selectlist=selectlist.filter(el => el.id != id && el.storeno != storeno);
    	}
    });
    
	$('#deniedBtn').click(function(){
		if(selectlist.length==0){
    		alert('해당예약을 선택해주세요');
    		return false;
    	}else{
    		if(confirm('예약을 일괄취소하시겠습니까?')){
    			$.ajax({
    				url:'<c:url value="/Admin/blackList/blackApplyRemove.Admin"/>',
    				type:'post',
    				dataType:'json',
    				contentType:'application/json',
    				data:JSON.stringify(selectlist),
    				success:function(data){
    					alert(data+"개의 예약이 취소되었습니다.");
    					location.replace("<c:url value='/Admin/blackList/blackApply.Admin'/>")
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
		else if(this.innerHTML == '지난 예약목록들'){
			$('#footerBrResult').html(
				'<c:forEach begin="0" end="20" step="1">'+
					'<br>'	+
				'</c:forEach>'
			)
		}
	});
});
</script>