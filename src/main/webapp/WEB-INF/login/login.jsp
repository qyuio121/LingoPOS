<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    $(function(){
    	$('button').click(function(){
    		if($("#id").val().trim()==""){
    			alert("아이디를입력하세요");
    		}
    	});
    })
    </script>
<div style="margin-top:150px" align="center">
	<h2>서비스를 이용하기 위해서는 <strong style="color:red">로그인</strong>이 필요합니다.</h2>
	<p>
	<strong>로그인 후 서비스를 이용해 주세요.</strong><br>
	아직,회원이 아니시라면 <a href="<c:url value='/Login/Signup/Signup.Lingo'/>">회원가입</a>을 진행해 주세요.
	</p>
</div>    
<div class="container"  style="margin-top:80px">
	<div class="row">
		<div class="col-xs-9 col-xs-offset-3" >
			<div class="row">
				<label class="col-xs-2">아이디</label>
				<div class="col-xs-6">
					<input type="text" maxlength="10"
						class="form-control" id="id" placeholder="아이디를 입력하세요">
				</div>
				<div class="col-xs-2">
				<input type="checkbox">(저장)
				</div>
			</div>
			<div class="row">
				<label class="col-xs-2">비밀번호</label>
				<div class="col-xs-6">
					<input type="password" maxlength="20"
						class="form-control" id="pass" placeholder="비밀번호">
				</div>
				<button type="submit" class="btn btn-lg btn-default col-xs-2">로그인</button>
			</div>
			<p>아이디 찾기 | 비밀번호 찾기 | <a href="<c:url value='/Login/Signup/Signup.Lingo'/>">회원가입</a>
			</p>
		</div>
	</div>
	
</div>