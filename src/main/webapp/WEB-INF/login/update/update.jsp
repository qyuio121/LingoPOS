<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
 $(function(){
		 $('#frm').validate({
			 rules:{
				 newpwd:{required:true,
					 maxlength : 15
				 },
				 newpwd2:{required:true,
					 equalTo : '#pwd'
				 },
				 email:{required:true, 
					 	email : true
				 },
				 tel:{required:true,
					 maxlength : 15
				 },
				 region:"required",
				 
			 },messages:{
				 newpwd:{required:"비밀번호입력하세요",
					 maxlength : "비밀번호는 15자 이내로 입력하세요"
				 },
				 newpwd2:{required:"비밀번호를 다시입력하세요",
					 	equalTo : "위 비밀번호와 같아야합니다."
				 },
				 email:{required:"이메일을입력하세요", 
					 	email : "이메일 형식으로 입력하세요"
				 },
				 tel:"번호를입력하세요",
				 region:"지역을 입력하세요",
			 }
		 });
		 $("#submit").click(function(){
		 		if($('#pwd').attr('ReadOnly')==null){
		 			alert('비밀번호를 정확히 입력하셔야 수정 가능 합니다.');
		 			return false;
		 		}else{
		 			$('#frm').submit();
		 		}
		 });
 })
 </script>
<form id="frm" action="<c:url value='/Login/Signup/Signup.Lingo'/>" method="post">
<div style="margin-top:150px">
	<h1>LingoPOS 회원수정</h1>
	<legend></legend>
	<div class="col-sm-6">
		<div class="form-group">
			<label>아이디</label> 
			<input type="text" readOnly
				class="form-control" id="id" value="${record.id}">
		</div>
		<div class="form-group">
			<input type="password"
				class="form-control" id="pwd" placeholder="현재비밀번호">
			<br/>
			<a class="btn btn-danger" id="valicatePwd">비밀번호 검사</a>
		
		</div>
		<div class="form-group">
			<label>비밀번호 변경</label> 
			<input type="password"
				class="form-control" id="newpwd" placeholder="새 비밀번호">
			<input type="password"
				class="form-control" id="newpwd2" placeholder="새 비밀번호확인">
		</div>
		<div class="form-group">
			<label>이메일</label> 
			<input type="text"
				class="form-control" id="email" placeholder="이메일을 입력해주세요" value="${record.email}">
		</div>
		<div class="form-group">
			<label>휴대전화</label> 
			<input type="text"
				class="form-control" id="tel" placeholder="휴대전화를 입력해주세요" value="${record.tel}">
		</div>
		<div class="form-group">
			<label>지역</label> 
			<input type="text"
				class="form-control" id="region" placeholder="지역을 입력해주세요" value="${record.region}">
		</div>
		<button type="submit" class="btn btn-primary">정보수정</button>
	</div>	
</div>
</form>

