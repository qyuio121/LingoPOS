<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="wrapper content-panel">    
   	<div class='row'> 
	   	<h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span>회원관리 시스템</h4>
	   	<div class="col-md-12">
			<form class="navbar-form navbar-right" id="gtBtn" action="<c:url value='#'/>" method="get">
				<div class="form-group">
					<select name="searchColumn" class="form-control">
						<option value="id">아이디</option>
						<option value="content">권한상태</option>
					</select> <input type="text" class="form-control" id="searchWord"
						name="searchWord" placeholder="검색">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
		</div>
		<div class="col-xs-12">
			<table class="table table-bordered">
				<tr>
					<th style="width:10%"><input type="checkbox"/> 전체선택</th>
					<th style="width:15%"><span class="glyphicon glyphicon-apple" aria-hidden="true"></span> 아이디</th>
					<th style="width:13%"><span class="glyphicon glyphicon-question-sign" aria-hidden="true" ></span> 이름</th>
					<th style="width:30%"><span class="glyphicon glyphicon-eye-open" aria-hidden="true" ></span> 유저권한 상태</th>
					<th style="width:30%"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" ></span> 
						유저권한 승격여부
						<div class="btn-group">
						  <button type="button" class="btn btn-default">admin</button>
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
						  </button>
						  <ul class="dropdown-menu" role="menu">
						    <li><a href="#">admin</a></li>
						    <li class="divider"></li>
						    <li><a href="#">user</a></li>
						  </ul>
						</div>
					</th>
				</tr>
				<tr>
					<td><input type="checkbox">
					<td>admin</td>
					<td>관리자</td>
					<td>admin</td>
					<td>최고 관리자</td>
				</tr>
			</table>
		</div>
	</div>    
</div>
<script>
$('.btn-group').click(function(){
	
});
</script>