<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	if(${param.active!=null}){
		$(".menu").removeClass('active');
		$(".menu").eq(${param.active}).addClass('active');
	}else{
		$(".menu").eq(0).addClass('active');
	}
	
	$.ajax({
		url: "<c:url value='/Admin/question/AlertQNA.Admin'/>",
		type: "get",
	    success: function(data) {
	    	if(data!='0'){
	    		$("#qna").append('<span class="label label-theme pull-right mail-info">'+data+'</span>');
	    	}
		}
    });
	
});


</script>
<!--헤더-->
<header class="header black-bg">
<!--토글 키-->    
	  <div class="sidebar-toggle-box">
		<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
	  </div>
<!--토글 키-->    
<!--로고-->	  
      <!--logo start-->
      <a href="<c:url value='/Admin/Index/Index.Admin'/>" class="logo"><b>LingoPOS<span>관리자페이지</span></b></a>
      <!--logo end-->
<!--로고-->	  
<!--로그아웃키-->      
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="<c:url value='/Login/Logout.Lingo'/>">로그아웃</a></li>
        </ul>
      </div>
<!--로그아웃키-->	  
</header>
<!--왼쪽 네비게이션바-->	
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
		  <li class="mt">
            <a class="menu" href="<c:url value='/Admin/Index/Index.Admin?active=0'/>">
              <i class="fa fa-desktop"></i>
              <span>메인페이지</span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="menu" href="#">
              <i class="fa fa-cogs"></i>
              <span>가게</span>
			  <span class="label label-theme pull-right mail-info">2</span>
              </a>
              <ul class="sub">
              	<li><a href="<c:url value='/Admin/shop/apply.Admin?active=1'/>">가게승인</a></li>
              	<li><a href="<c:url value='/Admin/shop/delete.Admin?active=1'/>">가게관리</a></li>
              </ul>
		  </li>
          <li class="sub-menu">
            <a class="menu" href="<c:url value='/Admin/member/member.Admin?active=2'/>">
              <i class="fa fa-tasks"></i>
              <span>회원관리시스템</span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="menu" href="#">
              <i class="fa fa-tasks"></i>
               <span>블랙리스트</span>
               <span class="label label-theme pull-right mail-info">2</span>
              </a>
              <ul class="sub">
               <li><a href="<c:url value='/Admin/blackList/blackApply.Admin?active=3'/>">블랙리스트신청</a></li>
               <li><a href="<c:url value='/Admin/blackList/blackList.Admin?active=3'/>">블랙리스트관리</a></li>
            </ul>
		  </li>
          
        
          <li class="sub-menu">
            <a class="menu" href="#">
              <i class="fa fa-th"></i>
              <span>게시판관리시스템</span>
              </a>
			<ul class="sub">
              <li><a href="<c:url value='/Notice/Notice.Lingo?active=4'/>">공지사항</a></li>
              <li><a href="<c:url value='/Free/Free.Lingo??active=4'/>">자유게시판</a></li>
            </ul>
          </li>
          <li>
            <a id="qna" class="menu" href="<c:url value='/Admin/question/QNA.Admin?active=5'/>">
              <i class="fa fa-envelope"></i>
              <span>1:1문의 응답</span>
            </a>
          </li>
           <li>
            <a class="menu" href="<c:url value='/Admin/FCM/FCM.Admin?active=6'/>">
              <i class="fa fa-envelope"></i>
              <span>FCM</span>
              </a>
          </li>
        </ul>
       
      </div>
    </aside>
<!--왼쪽 네비게이션바-->	