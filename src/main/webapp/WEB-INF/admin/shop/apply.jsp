<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<div class="wrapper content-panel">
	<div class="row">
		<h4><span class="glyphicon glyphicon-th-list" aria-hidden="true" ></span>가게승인</h4>
		<br/>
		<br/>
	</div>
		<!-- 검색창 -->
		<!-- 테이블 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
					<!-- <input type="checkbox" name="check" id="check" value="check">동의합니다. -->
						<tr style="background-color:#D8D8D8">
							<th style="width:12%"><input type="checkbox" id="checkall">  가게이름</th>
							<th style="width:13%"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  Id</th>
							<th style="width:15%"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>  Tel</th>
							<th style="width:17%"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>  가게주소</th>
							<th style="width:14%"> 사업등록증</th>
							<th style="width:15"><i class=" fa fa-list-alt"></i>  등록된 날짜</th>
							<th style="width:10%"><span class="glyphicon glyphicon-ok" aria-hidden="true"> </span>  수락/제외</th>
						</tr>
					</thead>
					<tbody id="applyTable" >
					<%-- <c:forEach var="value" items="${list}">
							<tr>																							
								<input type="checkbox" name="check" value="${loop.index}">									
								<td>${value.storename}</td>															
								<td>${value.id}</td>														
								<td>${value.tel}</td>															
								<td>${value.address}</td>														
								<td>${value.ownerno}</td>													
								<td>${value.startdate}</td>													
								<td data-placement="top" data-toggle="tooltip" title="Delete">					
									<button name="accept" value="${loop.index}" type="button" class="btn btn-primary btn-xs" style="margin-left:10px" >
										<span class="glyphicon glyphicon-ok"></span>승인							
									</button>																						
									<button name="denied" value="${loop.index}" type="button" class="btn btn-danger btn-xs" style="margin-left:10px" >
										<span class="glyphicon glyphicon-trash"></span>거절						
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
							해당회원의 가게를 등록을 하시겠습니까?
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
	var tableList = [{'storename':'왕착한 만두','id':'만찐두빵','tel':'010-8032-1313','address':'가좌동','ownerno':'37190002','startdate':'1990-03-22'},
					 {'storename':'악덕만두','id':'뚜루룯두','tel':'010-8032-1313','address':'우츠동','ownerno':'371901230','startdate':'2030-01-01'}];
	//테이블 뿌려주기
	$.each(tableList,function(index,value){
		$('#applyTable').append(				
				'<tr>																														'+																							
				'	<td><input type="checkbox" name="check" value="${loop.index}"> '+value.storename+'</td>																							'+
				'	<td>'+value.id+'</td>																									'+
				'	<td>'+value.tel+'</td>																									'+
				'	<td>'+value.address+'</td>																								'+
				'	<td>'+value.ownerno+'</td>																								'+
				'	<td>'+value.startdate+'</td>																							'+
				'	<td data-placement="top" data-toggle="tooltip" title="Delete">															'+
				'		<button name="accept" value="${loop.index}" type="button" class="btn btn-primary btn-xs" style="margin-left:10px" >	'+
				'			<span class="glyphicon glyphicon-ok"></span>승인																	'+
				'		</button>																											'+
				'		<button name="denied" value="${loop.index}" type="button" class="btn btn-danger btn-xs" style="margin-left:10px" >	'+
				'			<span class="glyphicon glyphicon-trash"></span>거절																'+
				'		</button>																											'+
				'	</td>																													'+
				'</tr>																														'
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
		