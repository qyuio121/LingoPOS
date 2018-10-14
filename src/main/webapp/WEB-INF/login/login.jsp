<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    $(function(){
    	 	var userInputId = localStorage.userId;
    	    $("#id").val(userInputId); 
    	     
    	    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    	        $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    	    }
    	$("#submit").click(function(e) {
    		e.preventDefault();
    		if($("#id").val().trim()==""){
    			alert("아이디를입력하세요");
    			return false;
    		}else if($("#pwd").val().trim()==""){
    			alert("비밀번호를 입력하세요");
    			return false;
    		}
    		if($("#saveId").is(":checked")){
    	        var userId = $("#id").val();
    	        localStorage.userId = userId;
    	        $("#loginform").submit();
    		}else{
    			localStorage.clear();
    			$("#loginform").submit();
    		}
    	});	
    });
    </script>
<div style="margin-top:150px" align="center">
	<h2>서비스를 이용하기 위해서는 <strong style="color:red">로그인</strong>이 필요합니다.</h2>
	<p>
	<strong>로그인 후 서비스를 이용해 주세요.</strong><br>
	아직,회원이 아니시라면 <a href="<c:url value='/Login/Signup/Terms.Lingo'/>">회원가입</a>을 진행해 주세요.
	</p>
	<h2 style="color:red">${notcorrect}</h2>
</div>    
<div class="container"  style="margin-top:80px">
	<div class="row">
		<div class="col-xs-9 col-xs-offset-3" >
			<form id="loginform" action="<c:url value='/Login/LoginProcess.Lingo'/>" method="get">
			<div class="row">
				<label class="col-xs-2">아이디</label>
				<div class="col-xs-6">
					<input type="text" maxlength="15"
						class="form-control" name='id' id="id" placeholder="아이디를 입력하세요">
				</div>
				<div class="col-xs-2">
				 <input type="checkbox" id="saveId">(저장)
				</div>
			</div>
			<div class="row">
				<label class="col-xs-2">비밀번호</label>
				<div class="col-xs-6">
					<input type="password" maxlength="15"
						class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요">
				</div>
				</div>
			</form>
			<Button id="submit" class="btn btn-lg btn-default col-xs-2">로그인</button>
		</div>
	</div>
	<br/><br/><br/><br/>
</div>