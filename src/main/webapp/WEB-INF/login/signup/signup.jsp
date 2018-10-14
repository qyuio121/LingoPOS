<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 유효성검사 -->	
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
 <script>
 $(function(){
	 
		 $('#frm').validate({
			 rules:{
				 id:"required",
				 pwd:"required",
				 pass2:"required",
				 email:"required",
				 tel:"required",
				 region:"required",
				 ownerno:"required",
				 storename:"required",
				 storedoc:"required"
				 
			 },messages:{
				 id:"아이디입력하세요",
				 pwd:"비밀번호를입력하세요",
				 pass2:"비밀번호를입력하세요",
				 email:"이메일을입력하세요",
				 tel:"번호를입력하세요",
				 region:"지역을 입력하세요",
				 ownerno:"사업자 번호를 입력하세요",
				 storename:"가게이름을입력하세요",
				 storedoc:"사업자 등록증을 등록해주세요"
			 }
		 });
	 
 })
 </script>
<div style="margin-top:150px;padding-bottom:150px">
<form id="frm" action="<c:url value='/Login/Signup/SignupProcess.Lingo'/>">
	<h1>LingoPOS 회원가입</h1>
	<legend></legend>
	<div class="col-sm-6">
		<div class="form-group">
			<label>아이디</label> 
			<input type="text"
				class="form-control" name="id" placeholder="아이디를 입력해 주세요">
			<label for="id" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>비밀번호</label> 
			<input type="password"
				class="form-control" name="pwd" placeholder="비밀번호를 입력해주세요">
			<label for="pwd" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>비밀번호 확인</label> 
			<input type="password"
				class="form-control" name="pass2" placeholder="비밀번호를 재입력해주세요">
			<label for="pass2" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>이메일</label> 
			<input type="text"
				class="form-control" name="email" placeholder="이메일을 입력해주세요">
			<label for="email" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>휴대전화</label> 
			<input type="text"
				class="form-control" name="tel" placeholder="휴대전화를 입력해주세요">
			<label for="tel" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>지역</label> 
			<input type="text"
				class="form-control" name="region" placeholder="지역을 입력해주세요">
			<label for="region" class="error" style="color:red"></label>
		</div>
		<c:if test="${kind == 'owner'}">
		<div class="form-group">
			<label>사업자 번호</label> 
			<input type="text"
				class="form-control" name="ownerno" placeholder="사업자 번호를 입력해주세요">
			<label for="ownerno" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>가게명</label> 
			<input type="text"
				class="form-control" name="storename" placeholder="가게 이름을 입력해주세요">
		<label for="storename" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>사업자 등록증</label> 
			<input type="text"
				class="form-control" name="storedoc" placeholder="사업자 등록증을 등록해주세요">
		<label for="storedoc" class="error" style="color:red"></label>
		</div>
		</c:if>
		<button type="submit" class="btn btn-primary">가입하기</button>
	</div>
</form>

</div>
