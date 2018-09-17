<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="margin-top:150px">
	<h1>LingoPOS 회원수정</h1>
	<legend></legend>
	<div class="col-sm-6">
		<div class="form-group">
			<label>아이디</label> 
			<input type="text" disabled="disabled"
				class="form-control" id="id" value=${id}>
		</div>
		<div class="form-group">
			<label>비밀번호 변경</label> 
			<input type="password"
				class="form-control" id="pass" placeholder="현재비밀번호">
		</div>
		<div class="form-group">
			<input type="password"
				class="form-control" id="newpass" placeholder="새 비밀번호">
			<input type="password"
				class="form-control" id="newpass2" placeholder="새 비밀번호확인">
		</div>
		<div class="form-group">
			<label>이름</label> 
			<input type="text" disabled="disabled"
				class="form-control" id="name" value="${name}">
		</div>
		<div class="form-group">
			<label>이메일</label> 
			<input type="text"
				class="form-control" id="email" placeholder="이메일을 입력해주세요">
		</div>
		<div class="form-group">
			<label>휴대전화</label> 
			<input type="text"
				class="form-control" id="email" placeholder="휴대전화를 입력해주세요">
		</div>
		<div class="form-group">
			<label>지역</label> 
			<input type="text"
				class="form-control" id="regi" placeholder="지역을 입력해주세요">
		</div>
		<button type="submit" class="btn btn-primary">정보수정</button>
	</div>
	
</div>

