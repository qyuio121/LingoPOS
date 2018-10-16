<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 유효성검사 -->	
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
 <script>
 $(function(){
	 
		 $('#frm').validate({
			 rules:{
				 id:{required:true,
					 maxlength : 15
				 },
				 pwd:{required:true,
					 maxlength : 15
				 },
				 pass2:{required:true,
					 equalTo : '#pwd'
				 },
				 email:{required:true, 
					 	email : true
				 },
				 tel:{required:true,
					 maxlength : 15
				 },
				 region:"required",
				 ownerno:"required",
				 storename:"required",
				 storedoc:"required"
				 
			 },messages:{
				 id:{required:"아이디입력하세요",
					 maxlength : "아이디는 15자 이내로 입력하세요"
				 },
				 pwd:{required:"비밀번호입력하세요",
					 maxlength : "비밀번호는 15자 이내로 입력하세요"
				 },
				 pass2:{required:"비밀번호를 다시입력하세요",
					 	equalTo : "위 비밀번호와 같아야합니다."
				 },
				 email:{required:"이메일을입력하세요", 
					 	email : "이메일 형식으로 입력하세요"
				 },
				 tel:"번호를입력하세요",
				 region:"지역을 입력하세요",
				 ownerno:"사업자 번호를 입력하세요",
				 storename:"가게이름을입력하세요",
				 storedoc:"사업자 등록증을 입력해주세요"
			 }
		 });
	 	$('#duplicate').click(function(){
	 		var inputid = $('#id').val();
	 		if(inputid == ''){
	 			alert('아이디를 입력하세요')
	 			return false;
	 		}
	 		$.ajax({
	 			url: "<c:url value='/Login/Signup/Duplicate.Lingo'/>",
				data: "id="+inputid,
				type: "GET",
			    success: function(data) {
			    	if(data=='0'){
			    		alert('아이디를 사용하실수 있습니다!');
			    		$('#id').attr('ReadOnly',true);
			    	}else{
			    		alert('중복된 아이디입니다. 다른값을 넣어주세요');
			 			return false;
			    	}
				}
		    });
	 	});
	 	$("#submit").click(function(){
	 		if($('#id').attr('ReadOnly')==null){
	 			alert('아이디 중복 검사를 통과하셔야 합니다.');
	 			return false;
	 		}else{
	 			$('#frm').submit();
	 		}
	 	});
	 	
 })
 </script>
<div style="margin-top:150px;padding-bottom:150px">
<form id="frm" action="<c:url value='/Login/Signup/Signup.Lingo'/>" method="post">
	<h1>LingoPOS 회원가입</h1>
	<div class="col-sm-6">
		<div class="form-group">
			<label>아이디</label> 
			<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
			<label for="id" class="error" style="color:red"></label>
			<br/>
			<a class="btn btn-danger" id="duplicate">아이디 중복검사</a>
		</div>
		<div class="form-group">
			<label>비밀번호</label> 
			<input type="password"
				class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
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
		<button type="submit" class="btn btn-primary" id="submit">가입하기</button>
		<br/><br/><br/><br/>
	</div>
</form>

</div>
