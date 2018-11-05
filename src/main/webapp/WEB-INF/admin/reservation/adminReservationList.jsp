<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!--메인 페이지 -->
	<div class="wrapper content-panel">
		<div class="row">
			<h4><span class="glyphicon glyphicon-user" aria-hidden="true" ></span> 예약목록 관리</h4>
		</div>
		<!-- 테이블 -->
		<div class="row">
			<div class="row" style="margin-bottom: 10px;margin-right: 30px">
				<div class="text-right">
					<form class="navber-form navbar-left" style="margin-left:30px;margin-top:10px" action="#" method="get">
						<button id="deniedBtn" class="btn btn-danger">일괄예약취소</button>
					</form>
					<form class="navbar-form navbar-right"  action="<c:url value='/Admin/reservation/reservationList.Admin'/>" method="get">
						<div class="form-group">
							<select name="searchColumn" class="form-control">
						       <option value="id">예약아이디</option>
						       <option value="storename">가게이름</option>
						    </select>
							<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
						</div>
						<button type="submit" class="btn btn-default" id="searchBtn" style="margin-left: -3px">검색</button>
					</form>
				</div>
			</div>
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr style="background-color:#D8D8D8">
							<th style="width:2%"><input type="checkbox" id="checkall"></th>
							<th style="width:10%"><span class="glyphicon glyphicon-user"></span>  예약아이디</th>
							<th style="width:15%"><span class="glyphicon glyphicon-home"></span>  가게이름</th>
							<th style="width:20%"><span class="glyphicon glyphicon-earphone"></span> 가게전화번호</th>
							<th style="width:20%"><span class="glyphicon glyphicon-calendar"></span> 예약날짜</th>
							<th style="width:10%"><span class="glyphicon glyphicon-ok"> </span>  예약취소</th>
						</tr>
					</thead>
					<tbody id="adminReservedTable" >
					<c:if test="${not empty list}" var="result">
						<c:forEach var="value" items="${list}" varStatus="loop">
							<tr>		
								<td style="display:none">${value.reserveno}</td>																					
								<td><input type="checkbox" name="check" value="${loop.index}"></td>									
								<td>${value.id}</td>														
								<td>${value.storename}</td>														
								<td>${value.tel}</td>															
								<td>${value.startdate}</td>														
								<td>																								
								<button name="cancelBtn" value="${loop.index}" type="button" class="btn btn-danger btn-xs" style="margin-left:10px" >
									<span class="glyphicon glyphicon-trash"></span>취소			
								</button>																	
								</td>																														
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not result}">
					 <tr>
						<td colspan="8" align="center">
							현재 예약이 없습니다.
						</td>
					 </tr>
					</c:if>
				</tbody>
			</table>
			
		</div>
	</div>
	<!-- 검색창 끝-->
	<div class="row">
		<div>${pageString}</div>
	</div>
</div>
		
<c:forEach begin="0" end="${25-fn:length(list)}" step="1">
	<br/>
</c:forEach>
<!--메인 페이지 -->
<script>
$(function() {
	var selectlist=[];
	var count = 0;
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
            	var reserveno = $("#adminReservedTable tr").eq(i).children('td:eq(0)').html();
        		selectlist.push({reserveno:reserveno});
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
    		var reserveno = $("#adminReservedTable tr").eq($(this).val()).children('td:eq(0)').html();
    		selectlist.push({reserveno:reserveno});
    	}
    	else{
    		count-=1;
    		//console.log(count === 0)
    		if(count < maxCount){
    			$("#checkall").prop('checked',false);
    		}
    		var reserveno = $("#adminReservedTable tr").eq($(this).val()).children('td:eq(0)').html();
    		selectlist=selectlist.filter(el => el.reserveno != reserveno);
    	}
    });
    $("button[name=cancelBtn]").click(function(){
    	var select = [];
    	var reserveno = $("#adminReservedTable tr").eq($(this).val()).children('td:eq(0)').html();
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
					location.replace("<c:url value='/Admin/reservation/reservationList.Admin'/>")
				}
			});
		}
    });
    
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
    					location.replace("<c:url value='/Admin/reservation/reservationList.Admin'/>")
    				}
    			});
    		}
    	}
    	return false;
    });
    $('#searchWord').keydown(function(e){
    	if(e.keyCode == 13){
    		$('#searchBtn').trigger('click');
    	}
    });
})
</script>