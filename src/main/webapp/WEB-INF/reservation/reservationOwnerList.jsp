<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container" style="padding-top: 60px; margin-top: 60px;">
	<!-- 내용 시작 -->
	<div class="row">
		<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 예약목록</h2>
	</div>
			  
  	<div class="row" style="margin-bottom: 10px;margin-right: 10px">
	  	<div class="text-right">
			<button id="deniedBtn" class="btn btn-danger">일괄거절</button>
		</div>
	</div>
  	<table class="table table-bordered">
  		<thead>
			<tr style="text-align: center; font-weight: bold; background-color: #EAEDED">
				<th style="width:3%"><input type="checkbox" id="allCheck" /></th>
				<th style="width:20%">아이디</th>
				<th style="width:13%">예약인원</th>
				<th style="width:13%">테이블번호</th>
				<th style="width:30%">예약날짜</th>
				<th>예약취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="value">
				<tr>
					<td><input type="checkbox" name="check" value="${loop.index}"></td>
					<td>${value.id}</td>
					<td>${value.people}</td>
					<td>${value.tableno}</td>
					<td>${value.startdate}</td>
					<td><button id="cancelBtn"  class="btn btn-danger btn-xs">취소</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
  ${pageString}
	<!-- #faq1 -->
	<c:forEach begin="${fn:length(list)}" end="20" step="1">
		<br>
	</c:forEach>
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
	
})
</script>