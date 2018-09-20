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
			 pass:"required",
			 pass2:"required",
			 name:"required",
			 phone:"required"
			 
		 },messages:{
			 id:"아이디입력하세요",
			 pass:"비밀번호를입력하세요",
			 pass2:"비밀번호를입력하세요",
			 name:"이름을입력하세요",
			 phone:"번호를입력하세요"
		 }
	 });
 })
 </script>
<div style="margin-top:150px">
<form id="frm" action="">
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
				class="form-control" name="pass" placeholder="비밀번호를 입력해주세요">
			<label for="pass" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>비밀번호 확인</label> 
			<input type="password"
				class="form-control" name="pass2" placeholder="비밀번호를 재입력해주세요">
			<label for="pass2" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>이름</label> 
			<input type="text"
				class="form-control" name="name" placeholder="이름을 입력해주세요">
			<label for="name" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>이메일</label> 
			<input type="text"
				class="form-control" id="email" placeholder="이메일을 입력해주세요">
		</div>
		<div class="form-group">
			<label>휴대전화</label> 
			<input type="text"
				class="form-control" name="phone" placeholder="휴대전화를 입력해주세요">
			<label for="phone" class="error" style="color:red"></label>
		</div>
		<div class="form-group">
			<label>지역</label> 
			<input type="text"
				class="form-control" id="regi" placeholder="지역을 입력해주세요">
		</div>
	
	</div>
	<div class="col-sm-6">
		<label>이용약관</label>
		<legend></legend>
		<div style="overflow-y: scroll; height:400px;">
1.동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세2.남산위에저소나무철갑을두른듯
					바람서리불변함은우리기상일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					3.가을하늘공활한데높고구름없이
					밝은달은우리가슴일편단심일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					4.이기상과이맘으로충성을다하여
					괴로우나즐거우나나라사랑하세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세"1.동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세2.남산위에저소나무철갑을두른듯
					바람서리불변함은우리기상일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					3.가을하늘공활한데높고구름없이
					밝은달은우리가슴일편단심일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					4.이기상과이맘으로충성을다하여
					괴로우나즐거우나나라사랑하세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세"1.동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세2.남산위에저소나무철갑을두른듯
					바람서리불변함은우리기상일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					3.가을하늘공활한데높고구름없이
					밝은달은우리가슴일편단심일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					4.이기상과이맘으로충성을다하여
					괴로우나즐거우나나라사랑하세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세"1.동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세2.남산위에저소나무철갑을두른듯
					바람서리불변함은우리기상일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					3.가을하늘공활한데높고구름없이
					밝은달은우리가슴일편단심일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					4.이기상과이맘으로충성을다하여
					괴로우나즐거우나나라사랑하세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세"
1.동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세2.남산위에저소나무철갑을두른듯
					바람서리불변함은우리기상일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					3.가을하늘공활한데높고구름없이
					밝은달은우리가슴일편단심일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					4.이기상과이맘으로충성을다하여
					괴로우나즐거우나나라사랑하세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세"1.동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세2.남산위에저소나무철갑을두른듯
					바람서리불변함은우리기상일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					3.가을하늘공활한데높고구름없이
					밝은달은우리가슴일편단심일세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세
					4.이기상과이맘으로충성을다하여
					괴로우나즐거우나나라사랑하세
					무궁화삼천리화려강산
					대한사람대한으로길이보전하세"
		</div>
		<input type="checkbox" name="check">위 내용에 동의합니다
		
	</div>
	<button type="submit" class="btn btn-primary">가입하기</button>
</form>
</div>

<!-- ?사장추가폼? -->