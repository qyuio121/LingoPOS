<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 유효성검사 -->	
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
 
<script>
$(function(){
//유효성검사
	$('#frm').validate({
		rules:{
			select1:"required",
			title:"required",
			content:"required",
			check:"required"
		},messages:{
			select1:"상담유형 선택하세요",
			title:"제목을 입력하세요",
			content:"내용을 입력하세요",
			check:"개인정보 수집 동의를 체크하세요"
			
		}});
		
	//문의등록 시  문의리스트로	
	$('#confirm').click(function(){
		if($('#frm').valid())
			$('#frm').submit();
	})
	
	//문의취소 시 전페이지로	
	$('#cancle').click(function(){
		history.back();
	})
});
</script> 

<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="page-header">
		<h1>QNA<small>1:1문의 등록창</small></h1>
	</div>
	<div>
			<img alt="asdf" src="../Images/apple.png" style="width: 100%;height: 150px;">
	</div>
<!-- 바디 헤더 끝-->
<!-- 폼 시작 -->
 	<form id="frm" class="form-horizontal" action='<c:url value="/Lingo/MTMList.lingo"/>'><!-- 폼 시작 -->
<!-- 상담분류 시작 -->	
		<div class="form-group">
			<label  class="col-sm-2 control-label">상담분류</label>
			<div class="col-sm-10">
				<select class="form-control col-sm-4" style="width: 20%" id="select1" name="select1">
					<option value="" >상담유형선택</option>
				     <option value="uni">회원정보</option>
				     <option value="high">주문/결제</option>
				     <option value="middle">취소/환불</option>
				     <option value="ele">배송</option>
				</select>
				<label for="select1" class="error" style="color:red"></label>
				<label for="select2" class="error" style="color:red"></label>
	 		</div>
		</div>  
<!-- 상담분류   끝 -->
<!--문의 제목 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
   				<input type="text" class="form-control" placeholder="제목을 입력해주세요"  style="width: 70%"  name="title">
   				
				<label for="title" class="error" style="color:red"></label>
  			</div>
		</div>
<!-- 문의 제목   끝-->
<!-- 문의 내용 시작  -->
		<div class="form-group">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
		  		<textarea class="form-control" rows="15" placeholder="내용을 입력해주세요"  style="width: 70%" name="content"></textarea>
		
				<label for="content" class="error" style="color:red"></label>
		  </div>
		</div>
<!-- 문의 내용 끝  -->		
<!-- 개인정보 수집동의 체크란 시작-->
	<div class="form-group">
		<label class="col-sm-2 control-label">개인정보 수집 동의</label>
		<div class="col-sm-10">
		 	<input type="checkbox" name="check">동의합니다.
		 	<h6><small>입력하시는 문의 정보는 문의 접수 및 고객 불만 해결을 위해 수집하여 5년간 보관합니다.</small></h6>
			<h6><small>(문의 종류에 따라 증빙서류 및 기타 정보가 수집될 수 있음)</small></h6>
	 
	 		<label for="check" class="error" style="color:red"></label>
	 	</div>
	</div>
<!-- 개인정보 수집동의 체크란 시작 끝 -->
<!-- 버튼 3개 시작 - 문의하기 / 취소  -->
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10" >
 			<button type="button" value="button타입" class="btn btn-primary col-sm-offset-3" id="confirm">문의하기</button><!-- 문의하기 -->     
			<button type="button" value="button타입" class="btn btn-default" id="cancle">취소</button><!-- 취소 -->     
  		</div>
	</div>
<!-- 버튼 3개 끝 - 문의하기 / 취소  -->
</form>
<!-- 폼 시작 -->    
<!-- 내용 끝 -->   
</div>
