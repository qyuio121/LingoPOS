<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(function(){
	$('#cancel').click(function(){
		$('#title').val("");
		$('#message').val("");
	})
})
</script>
<div class="container" >
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> FCM <small>알림 메시지</small></h2>
		</div>
	</div>	    
	<!-- 폼 시작 -->
	 <form id="frm" class="form-horizontal" action="<c:url value='/FCM/FCMPush.Admin'/>" method="post">
	<!-- 제목 시작 -->
			<div class="form-group">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-7">
	   				<input type="text" class="form-control" placeholder="제목을 입력해주세요"  id="title" name="title">
	   				
					<label for="title" class="error" style="color:red"></label>
	  			</div>
			</div>
	<!-- 제목   끝-->
	<!-- 공지 내용 시작  -->
			<div class="form-group">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
				<textarea id="message" name="message" style="width:90%;height:200px" ></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10" >
		 			<input type="submit" class="btn btn-primary col-sm-offset-3" id="confirm" value="등록하기" />     
					<button type="button" class="btn btn-default" id="cancel">취소</button>     
		  		</div>
			</div>
	</form>		
</div>	
