<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!--메인 페이지 -->
	<div class="wrapper content-panel">
		<div class="row">
			<h4><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>블랙리스트 신청</h4>
		</div>
		<!-- 검색창 -->
		<div class="row">
			<div class="col-md-12">
				<form class="navbar-form navbar-right" id="gtBtn" action="<c:url value='#'/>" method="get">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="content">신고한 가게</option>
						</select> <input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
					</div>
					<button type="submit" class="btn btn-default" >검색</button>
				</form>
			</div>
		</div>
		<!-- 검색창 -->
		<!-- 테이블 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
					<!-- <input type="checkbox" name="check" id="check" value="check">동의합니다. -->
						<tr style="background-color:#D8D8D8">
							<th style="width:5%"><input type="checkbox" id="checkall"></th>
							<th style="width:15%"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  Id</th>
							<th><span class="glyphicon glyphicon-send" aria-hidden="true"></span>  Email</th>
							<th><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>  Tel</th>
							<th><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 신고사유</th>
							<th><i class=" fa fa-list-alt"></i>  신고한가게</th>
							<th><span class="glyphicon glyphicon-ok" aria-hidden="true"> </span>  승인</th>
						</tr>
					</thead>
					<tbody id="blackApplyTable" >
					<%-- <c:forEach var="value" items="${records}">
							<tr>																							
							<td><input type="checkbox" name="check"></td>									
								<td>'+value.id+'</td>														
								<td>'+value.email+'</td>														
								<td>'+value.tel+'</td>															
								<td>'+value.reason+'</td>														
								<td>'+value.storename+'</td>													
								<td data-placement="top" data-toggle="tooltip" title="Delete">					
									<button type="button" class="btn btn-primary btn-xs" style="margin-left:10px" > 
										승인 																		
									</button>																	
									<button type="button" class="btn btn-danger btn-xs" style="margin-left:20px" > 
										<span  class="glyphicon glyphicon-trash"></span>
									</button>																	
								</td>																			
							</tr>
						</c:forEach> --%>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 검색창 끝-->
	</div>
		<!-- 삭제버튼 모달 -->
		<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title custom_align" id="Heading"></h4>
					</div>
					
					<div class="modal-body">
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span>
							해당 회원을 블랙리스트로 지정하시겠습니까?
						</div>
					</div>
					
					<div class="modal-footer " >
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button  type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
<c:forEach begin="0" end="${25-fn:length(list)}" step="1">
	<br/>
</c:forEach>
<!--메인 페이지 -->
<script>
$(function() {
	var count = 0;
	var tableList = [{'id':'nagasaki' , 'email':'1234@gmail.com','tel':'010-1234-5678','reason':'폭주','storename':'나가사키'},
					 {'id':'nagasaki' , 'email':'1234@gmail.com','tel':'010-1234-5678','reason':'폭주','storename':'나가사키'}];
	//테이블 뿌려주기
	$.each(tableList,function(index,value){
		$('#blackApplyTable').append(
				'<tr>																				'+			
				'	<td><input type="checkbox" name="check"></td>									'+
				'	<td>'+value.id+'</td>															'+
				'	<td>'+value.email+'</td>														'+
				'	<td>'+value.tel+'</td>															'+
				'	<td>'+value.reason+'</td>														'+
				'	<td>'+value.storename+'</td>													'+
				'	<td data-placement="top" data-toggle="tooltip" title="Delete">					'+
				'		<button type="button" class="btn btn-primary btn-xs" style="margin-left:10px" > '+
				'			승인 																		'+
				'		</button>																	'+
				'		<button type="button" class="btn btn-danger btn-xs" style="margin-left:20px" > '+
				'			<span  class="glyphicon glyphicon-trash"></span>'+
				'		</button>																	'+
				'	</td>																			'+
				'</tr>																				'
		);
	});
	var maxCount = $("input[name=check]").length ;
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
