<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Bootstrap core CSS -->
  
  
  <!--external css-->
  <link href="<c:url value="/lib/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<c:url value="/css/adminstyle.css"/>" rel="stylesheet">
  <link href="<c:url value="/css/style-responsive.css"/>" rel="stylesheet">


<div style="margin-top: 150px" id="login-page">
	<div class="container">
	
		<div  class="form-login" >
			
			<h2 class="form-login-heading">sign in</h2>
			<div class="login-wrap">
				<form id="loginform" action="<c:url value='/Login/LoginProcess.Lingo'/>" method="post">
					<input type="text" name='id' id="id" class="form-control" placeholder="User ID" autofocus> <br> 
					<input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password"> 
					아이디저장 <input id="saveId" type="checkbox" value="remember-me"> 
					<h4 style="color: red">${notcorrect}</h4>
				</form>
				<button id="submit" class="btn btn-theme btn-block">
					<i class="fa fa-lock"></i> 로그인
				</button>

				<div class="registration">
					회원이 아니신가요?<br /> <a
						href="<c:url value='/Login/Signup/Terms.Lingo'/>"> 회원가입 </a>
				</div>
				
			</div>
		</div>
		
	</div>
</div>
<div style="margin-top:450px"></div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="<c:url value="/lib/jquery/jquery.min.js"/>"></script>
  
  
  <!--BACKSTRETCH-->
  <script src="<c:url value="/lib/jquery.backstretch.min.js"/>"></script>
  <script>
	  $(function(){
		 	var userInputId = localStorage.userId;
		    $("#id").val(userInputId); 
		     
		    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		    $('#loginform').keydown(function(e){
		    	if(e.keyCode == 13){
		    		$('#submit').trigger('click');
		    	}
		    });
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
	  
    $.backstretch("https://www.lingopos.co.kr/Images/login.jpg", {
      speed: 1000
    });
  </script>

