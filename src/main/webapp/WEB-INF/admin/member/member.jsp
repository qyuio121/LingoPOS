<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="wrapper content-panel">    
   	<div class='row'> 
	   	<h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 회원관리 시스템</h4>
	   	<div class="col-md-2" style="height:50px;line-height: 50px" >
	   		<div class="form-group" style="margin-top:8px" >
				<select id="statusList" class="form-control">
					<option value="user">user</option>
					<option value="owner">owner</option>
					<option value="admin">admin</option>
				</select> 
			</div>
	   	</div>
	   	<div class="col-xs-10">	   	
			<form class="navbar-form navbar-right" id="gtBtn" action="<c:url value='#'/>" method="get">
				<div class="form-group">
					<select id="searchColumn" class="form-control">
						<option value="id">아이디</option>
						<option value="email">Email</option>
					</select> 
					<input type="text" class="form-control" id="searchWord" placeholder="검색">
				</div>
				<button type="submit" id="searchBtn" class="btn btn-default">검색</button>
			</form>
		</div>
		<div id="userinfotable" class="col-xs-12">
		</div>
	</div>    
</div>

<script>
var flag = false;
$(function(){
	showComments('user');
	$('#statusList').change(function(){
		showComments($('#statusList').val());
	});
	$('#searchBtn').click(function(){
		
		$.ajax({
			url:"<c:url value='/Admin/Member.Admin'/>",
			data: "kind="+$('#statusList').val()+"&searchColumn="+$('#searchColumn').val()+"&searchWord="+$('#searchWord').val(),
			dataType:"text",
			type:'post',
			success:displayComments			
		});
		
		return false;
	});
	$('#searchWord').keydown(function(e){
		if(e.keyCode == 13){
			$('#searchBtn').trigger('click');
		}
	});
});

var showComments = function(key){		
	$.ajax({
		url:"<c:url value='/Admin/Member.Admin'/>",
		data: "kind="+key,
		dataType:"text",
		type:'post',
		success:displayComments			
	});
};
var showCommentsPage = function(key,nowPage){		
	$.ajax({
		url:"<c:url value='/Admin/Member.Admin'/>",
		data:"kind="+key+"&nowPage="+nowPage,
		dataType:"text",
		type:'post',
		success:displayComments			
	});
};
var showCommentsPageSearch = function(key,nowPage,searchColumn,searchWord){		
	$.ajax({
		url:"<c:url value='/Admin/Member.Admin'/>",
		data:"kind="+key+"&nowPage="+nowPage+"&searchColumn="+searchColumn+"&searchWord="+searchWord,
		dataType:"text",
		type:'post',
		success:displayComments			
	});
};
//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
var displayComments	 = function(data){
	$('#userinfotable').html(data);
	$('#setBtn').click(function(){
		if($('#statusList').val()=='user'){
			if($('#adminnick').val()==""){
				alert('운영자 닉네임을 입력하세요');
				return false;
			}
			if($('input[name="id"]:checked').length==0){
				alert('승격시킬 아이디를 선택해주세요');
				return false;
			}
			$.ajax({
				url:"<c:url value='/Admin/AddAdmin.Admin'/>",
				data:"id="+$('input[name="id"]:checked').val()+"&adminnick="+$('#adminnick').val(),
				dataType:"text",
				type:'post',
				success:function(){
					showComments('user');
				}			
			});
		}else if($('#statusList').val()=='admin'){
			if($('input[name="id"]:checked').length==0){
				alert('강등시킬 아이디를 선택해주세요');
				return false;
			}
			$.ajax({
				url:"<c:url value='/Admin/RemoveAdmin.Admin'/>",
				data:"id="+$('input[name="id"]:checked').val(),
				dataType:"text",
				type:'post',
				success:function(){
					showComments('admin');
				}			
			});
		}
		return false;
	});
};
function getReview(nowPage){
	showCommentsPage($('#statusList').val(),nowPage);
}
function getReviewSearch(nowPage,searchColumn,searchWord){
	showCommentsPageSearch($('#statusList').val(),nowPage,searchColumn,searchWord);
}
</script>