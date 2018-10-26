<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--메인 페이지 -->
	<div class="wrapper content-panel">
		<div class="row">
			<h4><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>블랙리스트 신청</h4>
		</div>
		<!-- 테이블 -->
		<div class="row">
			<div class="row" style="margin-bottom: 10px;margin-right: 30px">
				<div class="text-right">
					<button id="acceptBtn" class="btn btn-primary">일괄승인</button>
					&nbsp&nbsp<button id="deniedBtn" class="btn btn-danger">일괄거절</button>
				</div>
			</div>
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
					<!-- <input type="checkbox" name="check" id="check" value="check">동의합니다. -->
						<tr style="background-color:#D8D8D8">
							<th style="width:5%"><input type="checkbox" id="checkall"></th>
							<th style="width:10%"><span class="glyphicon glyphicon-user"></span>  Id</th>
							<th style="width:10%"><span class="glyphicon glyphicon-send"></span>  Email</th>
							<th style="width:10%"><span class="glyphicon glyphicon-earphone"></span>  Tel</th>
							<th style="width:35%"><span class="glyphicon glyphicon-pencil"></span> 신고사유</th>
							<th style="width:10%"><span class="glyphicon glyphicon-sunglasses"></span> 신고한가게</th>
							<th style="width:10%"><span class="glyphicon glyphicon-calendar"></span> 신고날짜</th>
							<th style="width:7%"><span class="glyphicon glyphicon-ok"> </span>  승인/삭제</th>
						</tr>
					</thead>
					<tbody id="blacklistTable" >
					<c:if test="${not empty list}" var="result">
						<c:forEach var="value" items="${list}" varStatus="loop">
								<tr>																							
								<td><input type="checkbox" name="check" value="${loop.index}"></td>									
									<td>${value.id}</td>														
									<td>${value.email}</td>														
									<td>${value.tel}</td>															
									<td>${value.reason}</td>														
									<td>${value.storename}</td>
									<td>${value.blackdate}</td>
									<td>					
									<button name="accept" value="${loop.index}" type="button" class="btn btn-primary btn-xs" style="margin-left:10px" >
										<span class="glyphicon glyphicon-ok"></span>							
									</button>																						
									<button name="denied" value="${loop.index}" type="button" class="btn btn-danger btn-xs" style="margin-left:10px" >
										<span class="glyphicon glyphicon-trash"></span>							
									</button>																	
									</td>
									<td style="display:none">${value.storeno}</td>																														
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${not result}">
						 <tr>
							<td colspan="8" align="center">
								블랙리스트 신청이 없습니다.
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
    $('#acceptBtn').click(function(){
    	if(selectlist.length==0){
    		alert('사람을 선택해주세요');
    		return false;
    	}else{
    		if(confirm('회원들을 일괄등록하시겠습니까?')){
    			$.ajax({
    				url:'<c:url value="/Admin/blackList/blackApplyAdd.Admin"/>',
    				type:'post',
    				dataType:'json',
    				contentType:'application/json',
    				data:JSON.stringify(selectlist),
    				success:function(data){
    					alert(data+"명이 추가되었습니다.");
    					location.replace("<c:url value='/Admin/blackList/blackApply.Admin'/>")
    				}
    			});
    		}
    	}
    	return false;
    });
	$('#deniedBtn').click(function(){
		if(selectlist.length==0){
    		alert('사람을 선택해주세요');
    		return false;
    	}else{
    		if(confirm('회원들을 일괄거절하시겠습니까?')){
    			$.ajax({
    				url:'<c:url value="/Admin/blackList/blackApplyRemove.Admin"/>',
    				type:'post',
    				dataType:'json',
    				contentType:'application/json',
    				data:JSON.stringify(selectlist),
    				success:function(data){
    					alert(data+"명이 거절되었습니다.");
    					location.replace("<c:url value='/Admin/blackList/blackApply.Admin'/>")
    				}
    			});
    		}
    	}
    	return false;
    });
	$('button[name="accept"]').click(function(){
   		if(confirm('해당 회원을 등록하시겠습니까?')){
   			var select=[];
   			var id = $("#blacklistTable tr").eq($(this).val()).children('td:eq(1)').html();
    		var storeno = $("#blacklistTable tr").eq($(this).val()).children('td:eq(8)').html();
    		select.push({id:id,storeno:storeno});
   			$.ajax({
   				url:'<c:url value="/Admin/blackList/blackApplyAdd.Admin"/>',
   				type:'post',
   				dataType:'json',
   				contentType:'application/json',
   				data:JSON.stringify(select),
   				success:function(data){
   					alert(data+"명이 추가되었습니다.");
   					location.replace("<c:url value='/Admin/blackList/blackApply.Admin'/>")
   				}
   			});
   		}
    	return false;
    });
	$('button[name="denied"]').click(function(){
		
   		if(confirm('해당 회원을 거절하시겠습니까?')){
   			var select=[];
   			var id = $("#blacklistTable tr").eq($(this).val()).children('td:eq(1)').html();
    		var storeno = $("#blacklistTable tr").eq($(this).val()).children('td:eq(8)').html();
    		select.push({id:id,storeno:storeno});
   			$.ajax({
   				url:'<c:url value="/Admin/blackList/blackApplyRemove.Admin"/>',
   				type:'post',
   				dataType:'json',
   				contentType:'application/json',
   				data:JSON.stringify(select),
   				success:function(data){
   					alert(data+"명이 거절되었습니다.");
   					location.replace("<c:url value='/Admin/blackList/blackApply.Admin'/>")
   				}
   			});
   		}
    	
    	return false;
    });
	
});
</script>
