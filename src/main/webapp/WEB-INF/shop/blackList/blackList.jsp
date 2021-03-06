<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!--메인 페이지 -->
<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-10">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 내 가게 <small>블랙리스트 추가요청</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 게시판 -->	
		<div class="row">
			<div class="col-md-12">
				
				<form class="navbar-form navbar-right" id="gtBtn" action="<c:url value='/Shop/BlackList.Lingo'/>" method="get">
					<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="아이디 검색">
					<button type="submit" id="searchBtn" class="btn btn-default" >검색</button>
				</form>
			</div>
		</div>
		<!-- 검색창 -->
		<!-- 테이블 -->
		<div class="row">
			<div class="col-md-12">
				<table class="tablesorter table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr style="background-color:#D8D8D8">
							<th>아이디</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>방문날짜</th>
							<th>방문여부</th>
							<th>승인요청</th>
						</tr>
					</thead>
					<tbody id="tablesort" >
					<c:forEach var="value" items="${list}" varStatus="loop">
						<c:set var="loop_flag" value="false"/> 
						<tr>																					
							<td>${value.id}</td>														
							<td>${value.email}</td>														
							<td>${value.tel}</td>															
							<td>${value.visitdate}</td>	
							<th>${value.isvisited?'방문':'미방문'}</th>													
							<td>
								<c:forEach var="black" items="${blacklist}" varStatus="status">
									   <c:if test="${not loop_flag }">
									        <c:if test="${black.id == value.id}">
									        	<c:if test="${black.added}">
									            	블랙리스트 등록됨  <button name="calcelBtn" value='${loop.index}' class="btn btn-danger btn-xs">해제</button>
									        	</c:if>
									        	<c:if test="${not black.added}">
									            	블랙리스트 기신청  <button name="calcelBtn" value='${loop.index}'  class="btn btn-danger btn-xs">취소</button>
									        	</c:if>
									        	<c:set var="loop_flag" value="true"/>
									        </c:if>
									   </c:if>
								</c:forEach>
								<c:if test="${not loop_flag}">
									<p data-placement="top" data-toggle="tooltip" title="Delete">
										<button name="blackBtn" class="btn btn-primary btn-xs" value='${loop.index}' data-title="Delete" data-toggle="modal" data-target="#delete">
											<span class="glyphicon glyphicon-ok"></span>
										</button>
									</p>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 검색창 끝-->
		<!-- 승인버튼 모달 -->
		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title custom_align" id="Heading"></h4>
					</div>
					
					<div class="modal-body">
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span>
							해당 회원을 블랙리스트 신청하시겠습니까?
						</div>
						<form id="frm" class="form-horizontal" action='<c:url value="/Shop/BlackAdd.Lingo"/>' method="post" accept-charset="UTF-8">	
							<div class="form-group">
								<label class="col-sm-2 control-label">신청사유</label>
								<div class="col-sm-10"><input type="text" class="form-control" placeholder="신청사유를 입력해주세요" name="reason" id="reason">
								</div>
								<div class="col-md-8">
								<input type="hidden" id="reasonConfirm" name="reasonConfirm"/>
								<label class="col-sm-offset-3" style="color:red"></label>
								</div>
								<div id="hidden" class="form-group">
								</div>
							</div>
						</form>
					</div>
					
					<div class="modal-footer ">
						<button type="button" class="btn btn-success" id="confirm">
							<span class="glyphicon glyphicon-ok-sign"></span> 신청요청
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 신청취소
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
<!-- 페이징  시작-->
	<div class="row">
		<div>${pageString}</div>
	</div>
<!-- 페이징  끝-->
<!-- 내용 끝 -->   
</div>
<c:forEach begin="0" end="${25-fn:length(list)}" step="1">
	<br/>
</c:forEach>
<script>
$(function() {
	if(${empty sessionScope.loginDTO.ownerno}){
		alert('로그인후 접속 가능합니다.');
		location.replace("<c:url value='/Login/Login.Lingo'/>");
	}
    //모달에서 버튼 클릭시 이벤트 처리
    $('#searchWord').keydown(function(e){
		if(e.keyCode == 13){
			$('#searchBtn').trigger('click');
		}
	});
	$('button[name="blackBtn"]').click(function(){
		var htmlString ='<input type="hidden" name="id" value="'+$("#tablesort tr").eq($(this).val()).children("td:eq(0)").html()+'"/>';
		$('#hidden').html(htmlString);
		$('#confirm').click(function(){
	    	if($('#reason').val() !=""){$('#frm').submit();}
	    	else{
	    		$('#reasonConfirm').next().html("신청사유를 작성해주세요.");
	    		return false;
	    	}
	    });
	    $("#reason").on('input',function(){
			$('#reasonConfirm').next().html("");	
		});
	});
	$('button[name="calcelBtn"]').click(function(){
		if(confirm("해당 회원을 해제 하시겠습니까?")){
		var id = $("#tablesort tr").eq($(this).val()).children("td:eq(0)").html();
			$.ajax({
				url:"<c:url value='/Shop/BlackRemove.Lingo'/>",
				data:"id="+id,
				dataType:"text",
				type:'post',
				success:function(data){
					location.replace("<c:url value='/Shop/BlackList.Lingo'/>")
				}			
			});
		}
	});
});
</script>