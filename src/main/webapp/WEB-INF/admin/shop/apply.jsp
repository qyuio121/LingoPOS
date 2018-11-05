<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<div class="wrapper content-panel">
	<div class="row">
		<h4><span class="glyphicon glyphicon-th-list" aria-hidden="true" ></span> 가게승인</h4>
		<br/>
		<br/>
	</div>
		<!-- 검색창 -->
		<div class="row" style="margin-bottom: 10px;margin-right: 10px">
			<div class="text-right">
				<button id="acceptBtn" class="btn btn-primary">일괄승인</button>
				&nbsp&nbsp<button id="deniedBtn" class="btn btn-danger">일괄거절</button>
			</div>
		</div>
		<!-- 테이블 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr style="background-color:#D8D8D8">
							<th style="width:12%"><input type="checkbox" id="checkall">&nbsp&nbsp가게이름</th>
							<th style="width:13%"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  Id</th>
							<th style="width:15%"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>  Tel</th>
							<th style="width:17%"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>  사업자번호</th>
							<th style="width:14%"> 사업자등록증</th>
							<th style="width:15"><i class=" fa fa-list-alt"></i>  등록된 날짜</th>
							<th style="width:10%"><span class="glyphicon glyphicon-ok" aria-hidden="true"> </span>  수락/제외</th>
						</tr>
					</thead>
					<tbody id="applyTable" >
						<c:forEach var="value" items="${list}" varStatus="loop">
							<tr>																																	
								<td><input type="checkbox" name="check" value="${loop.index}"/>&nbsp&nbsp${value.storename}</td>															
								<td>${value.id}</td>														
								<td>${value.tel}</td>															
								<td>${value.ownerno}</td>														
								<td>
								<button name="view" value="${value.storedoc}" type="button" class="btn btn-primary btn-xs" style="margin-left:10px" >
										<span class="glyphicon glyphicon-align-justify"></span> 보기						
								</button>
								</td>													
								<td>${value.regidate}</td>													
								<td data-placement="top" data-toggle="tooltip" title="Delete">					
									<button name="accept" value="${loop.index}" type="button" class="btn btn-primary btn-xs" style="margin-left:10px" >
										<span class="glyphicon glyphicon-ok"></span> 승인							
									</button>																						
									<button name="denied" value="${loop.index}" type="button" class="btn btn-danger btn-xs" style="margin-left:10px" >
										<span class="glyphicon glyphicon-trash"></span> 거절						
									</button>																										
								</td>																			
							</tr>			
						</c:forEach>
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
<div id="dialog" title="사업자 등록증">
</div>
<script>
$(function() {
	var count = 0;
	var maxCount = $("input[name=check]").length;
	var selectlist=[];
	
    $( "#dialog" ).dialog({
        autoOpen: false,
        resizable: false,
        height: "auto",
        width: "auto",
        position: { my: "center", at: "center", of: window},
        modal: true,
        show: {
          effect: "blind",
          duration: 1000
        },
        hide: {
          effect: "blind",
          duration: 1000
        }
      });
    $('button[name="view"]').click(function(){
    	 $("#dialog").html('<img src="'+$(this).val()+'" style="width:400px;height:600px"/>');
    	 $("#dialog").dialog( "open" );
    });
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
            	var id = $("#applyTable tr").eq(i).children('td:eq(1)').html();
        		selectlist.push({id:id});
        	
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
    		var id = $("#applyTable tr").eq($(this).val()).children('td:eq(1)').html();
    		selectlist.push({id:id});
    	
    	}
    	else{
    		count-=1;
    		//console.log(count === 0)
    		if(count < maxCount){
    			$("#checkall").prop('checked',false);
    		}
    		var id = $("#applyTable tr").eq($(this).val()).children('td:eq(1)').html();
    		selectlist=selectlist.filter(el => el.id != id);
    		
    	}
    });
    $('#acceptBtn').click(function(){
    	if(selectlist.length==0){
    		alert('사람을 선택해주세요');
    		return false;
    	}else{
    		if(confirm('회원들을 일괄수락하시겠습니까?')){
    			$.ajax({
    				url:'<c:url value="/Admin/Shop/ApplyAdd.Admin"/>',
    				type:'post',
    				dataType:'json',
    				contentType:'application/json',
    				data:JSON.stringify(selectlist),
    				success:function(data){
    					alert(data+"명이 추가되었습니다.");
    					location.replace("<c:url value='/Admin/shop/apply.Admin'/>")
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
    				url:'<c:url value="/Admin/Shop/ApplyRemove.Admin"/>',
    				type:'post',
    				dataType:'json',
    				contentType:'application/json',
    				data:JSON.stringify(selectlist),
    				success:function(data){
    					alert(data+"명이 거절되었습니다.");
    					location.replace("<c:url value='/Admin/shop/apply.Admin'/>")
    				}
    			});
    		}
    	}
    	return false;
    });
	$('button[name="accept"]').click(function(){
   		if(confirm('해당 회원을 수락하시겠습니까?')){
   			var select=[];
   			var id = $("#applyTable tr").eq($(this).val()).children('td:eq(1)').html();
    		select.push({id:id});
    		console.log(select);
   			$.ajax({
   				url:'<c:url value="/Admin/Shop/ApplyAdd.Admin"/>',
   				type:'post',
   				dataType:'json',
   				contentType:'application/json',
   				data:JSON.stringify(select),
   				success:function(data){
   					alert(data+"명이 추가되었습니다.");
   					location.replace("<c:url value='/Admin/shop/apply.Admin'/>")
   				}
   			});
   		}
    	return false;
    });
	$('button[name="denied"]').click(function(){
		
   		if(confirm('해당 회원을 거절하시겠습니까?')){
   			var select=[];
   			var id = $("#applyTable tr").eq($(this).val()).children('td:eq(1)').html();
    		select.push({id:id});
   			$.ajax({
   				url:'<c:url value="/Admin/Shop/ApplyRemove.Admin"/>',
   				type:'post',
   				dataType:'json',
   				contentType:'application/json',
   				data:JSON.stringify(select),
   				success:function(data){
   					alert(data+"명이 거절되었습니다.");
   					location.replace("<c:url value='/Admin/shop/apply.Admin'/>")
   				}
   			});
   		}
    	
    	return false;
    });
	
});
</script>
		