<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
 
 <script>
 $(function(){
		 $('#frm').validate({
			 rules:{
				 newpwd:{
					 maxlength : 15
				 },
				 newpwd2:{
					 equalTo : '#newpwd'
				 },
				 email:{required:true, 
					 	email : true
				 },
				 tel:{required:true,
					 maxlength : 15
				 },
				 region:"required"
				 
			 },messages:{
				 newpwd:{
					 maxlength : "비밀번호는 15자 이내로 입력하세요"
				 },
				 newpwd2:{
					 	equalTo : "위 비밀번호와 같아야합니다."
				 },
				 email:{required:"이메일을입력하세요", 
					 	email : "이메일 형식으로 입력하세요"
				 },
				 tel:"번호를입력하세요",
				 region:"지역을 입력하세요"
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
		 $('#valicatePwd').click(function(){
			 	var inputid = $('#id').val();
		 		var inputpwd = $('#pwd').val();
		 		if(inputpwd == ''){
		 			alert('비밀번호를 입력하세요')
		 			return false;
		 		}
		 		$.ajax({
		 			url: "<c:url value='/Login/Update/Valicate.Lingo'/>",
					data: "pwd="+inputpwd+'&id='+inputid,
					type: "get",
				    success: function(data) {
				    	if(data=='0'){
				    		alert('비밀번호가 일치 합니다 수정을 해주세요');
				    		$('#pwd').attr('ReadOnly',true);
				    	}else{
				    		alert('비밀 번호가 틀립니다.');
				 			return false;
				    	}
					}
			    });
		 	});
 })
 </script>
 <h2><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> LingoPOS 회원수정</h2>
<form id="frm" action="<c:url value='/Login/Update/Update.Lingo'/>" method="post">
<div style="margin-top:150px">
	<div class="col-sm-6">
		<div class="form-group">
			<label>아이디</label> 
			<input type="text" readOnly
				class="form-control" name="id" id="id" value="${record.id}">
		</div>
		<div class="form-group">
			<input type="password"
				class="form-control" name="pwd" id="pwd" placeholder="현재비밀번호">
			<label for="pwd" class="error" style="color:red"></label>
			<br/>
			<a class="btn btn-danger" id="valicatePwd">비밀번호 검사</a>
		
		</div>
		<div class="form-group">
			<label>비밀번호 변경</label> 
			<input type="password"
				class="form-control" name="newpwd" id="newpwd" placeholder="새 비밀번호">
			<label for="newpwd" class="error" style="color:red"></label>
			<input type="password"
				class="form-control" name="newpwd2" id="newpwd2" placeholder="새 비밀번호확인">
				<label for="newpwd2" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>이메일</label> 
			<input type="text"
				class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요" value="${record.email}">
				<label for="email" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>휴대전화</label> 
			<input type="text"
				class="form-control" name="tel" id="tel" placeholder="휴대전화를 입력해주세요" value="${record.tel}">
			<label for="tel" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>지역</label> 
			<input type="text"
				class="form-control" name="region" id="region" placeholder="지역을 입력해주세요" value="${record.region}">
			<label for="region" class="error" style="color:red"></label>
		</div>
		<button type="submit" id="submit" class="btn btn-primary">정보수정</button>
		<br/><br/><br/><br/>
	</div>	
</div>
</form>

