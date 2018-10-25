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
					<button id="acceptBtn" class="btn btn-primary">승인</button>
					&nbsp&nbsp<button id="deniedBtn" class="btn btn-danger">거절</button>
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
							<th style="width:30%"><span class="glyphicon glyphicon-pencil"></span> 신고사유</th>
							<th style="width:10%"><span class="glyphicon glyphicon-sunglasses"></span> 신고한가게</th>
						</tr>
					</thead>
					<tbody id="blacklistTable" >
					<c:if test="${not empty list}" var="result">
						<c:forEach var="value" items="${list}">
								<tr>																							
								<td><input type="checkbox" name="check"></td>									
									<td>${value.id}</td>														
									<td>${value.email}</td>														
									<td>${value.tel}</td>															
									<td>${value.reason}</td>														
									<td>${value.storename}</td>																														
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${not result}">
							<td colspan="6" align="center">
								블랙리스트 신청이 없습니다.
							</td>
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
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            count = maxCount;
            //console.log(maxCount)
            //클릭이 안되있으면
        }
        else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
            count = 0;
        }
    })
   	$('input[name=check]').click(function(){
    	if(this.checked){
   			//console.log(count)
   			count+=1;
    		if(count === maxCount){
    			$("#checkall").prop('checked',true);
    		}
    	}
    	else{
    		count-=1;
    		//console.log(count === 0)
    		if(count === maxCount-1){
    			$("#checkall").prop('checked',false);
    		}
    	}
    });
});
</script>
