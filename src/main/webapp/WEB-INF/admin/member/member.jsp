<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="wrapper content-panel">    
   	<div class='row'> 
	   	<h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span>회원관리 시스템</h4>
	   	<div class="col-md-1" style="height:50px;line-height: 50px" >
	   		<div class="form-group" style="margin-top:8px" >
				<select name="StatusList" class="form-control">
					<option value="user">user</option>
					<option value="owner">owner</option>
					<option value="admin">admin</option>
				</select> 
			</div>
	   	</div>
	   	<div class="col-md-11">	   	
			<form class="navbar-form navbar-right" id="gtBtn" action="<c:url value='#'/>" method="get">
				<div class="form-group">
					<select name="searchColumn" class="form-control">
						<option value="id">아이디</option>
						<option value="email">Email</option>
					</select> 
					<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
				</div>
				<button type="submit" id="searchBtn" class="btn btn-default">검색</button>
			</form>
		</div>
		<div class="col-xs-12">
			<table class="table table-bordered">
				<thead>
					<tr style="background-color:#D8D8D8">
						
						<th style="width:15%"><span class="glyphicon glyphicon-apple" aria-hidden="true"></span> 아이디</th>
						<th style="width:13%"><span class="glyphicon glyphicon-question-send" aria-hidden="true"> Email</span> </th>
						<th style="width:30%"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 유저권한 상태</th>
						<th style="width:30%"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 
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
								<form class="form-inline" id="adminNic" action="<c:url value='#'/>" method="get" style="height:10px;display:inline-block;">
									<div class="form-group btn-xs" >								 
										<input type="text" class="form-control" id="adminSearchText" name="adminSearchText" style="height:20px;width:100px;margin-top:0px" placeholder="NicName">
										<button type="submit" id="searchBtn" class="btn btn-default btn-xs">부여</button>
									</div>
									
								</form>
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
<!-- <br/>처리 -->
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