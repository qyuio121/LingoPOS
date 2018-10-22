<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
						<option value="userStatus">Email</option>
					</select> 
					<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
				</div>
				<button type="submit" id="searchBtn" class="btn btn-default">검색</button>
			</form>
		</div>
		<div class="col-xs-12">
			<table class="table table-bordered">
				<thead>
					<tr style="background-color:#D8D8D8;">
						
						<th style="width:15%"><span class="glyphicon glyphicon-apple" aria-hidden="true"></span> 아이디</th>
						<th style="width:13%"><span class="glyphicon glyphicon-question-sign" aria-hidden="true" > Email</span> </th>
						<th style="width:30%"><span class="glyphicon glyphicon-eye-open" aria-hidden="true" ></span> 유저권한 상태</th>
						<th style="width:30%"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" ></span> 
							유저권한 승격여부
							<div class="btn-group" id="userStatusBtn">
							  <button type="button" id="userStatusView" class="btn btn-default btn-xs" style="width:100px">admin</button>
							  <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							    <span class="caret"></span>
							    <span class="sr-only"></span>
							  </button>
							  <ul class="dropdown-menu" id="userStatus" role="menu">
							    <li><a href="#" id="admin" value="admin">admin</a></li>
							    <li class="divider"></li> 
							    <li><a href="#" id="user" value="user">user</a></li>
							  </ul>
							  	<div class="btn-group btn-group-xs" role="group" style="display:inline">
							  		<input type="text" id="adminSearchText" style="width:100px;height:20px;margin-left: 3px;display:inline" class="form-control"  >
							  		<button type="submit" class="btn btn-default"  >버튼</button>
							  	</div>
							</div>
						</th>
					</tr>
				</thead>
				<tbody id="tableBody" >
					
				</tbody>
			</table>
		</div>
	</div>    
</div>
<c:forEach begin="0" end="${25-fn:length(list)}" step="1">
	<br/>
</c:forEach>
<script>
var flag = false;
$(function(){
	//유저 권한상태 테이블 textView
	if(!flag){
		$('#userStatus li a').click(function(){
			console.log(this)
			if(this.innerText == "admin"){
				//console.log('sdfs')
				$('#userStatusView').html('admin');
			}
			else{
				//console.log('xczvc')
				$('#userStatusView').html('user');
			}
		});
		flag = true;
	}
	var member = [{'id':'kim','email':'asd@gmail.com','adminno':1,'ownerno':1},
				  {'id':'lee','email':'lee@gmail.com','adminno':0,'ownerno':0}
				 ];
	console.log(member.id)
	//테이블을 그리기위한 로직
	$.each(member,function(index,value){
		$('#tableBody').append(
				'<tr>'+
				'	<td><input type="radio" name="userCheck" > '+value.id+'</td>'+
				'	<td>'+value.email+'</td>'+
				'	<td>'+(value.adminno != 1 ?"user":"admin") +'</td>'+
				'	<td>'+(value.adminno != 1 ? value.ownerno != 1 ? "가능" : "불가능": "불가능")+'</td>'+
				'</tr>'
		)
	})
	//권한  승격여부 드랍박스에 의한 정렬을 위한 로직
	var $searchBtn = $('#searchBtn')
	$searchBtn.click(function(){
		if($('select[name=searchColumn]').val() === 'id'){
			
		}
		
	});
});
</script>