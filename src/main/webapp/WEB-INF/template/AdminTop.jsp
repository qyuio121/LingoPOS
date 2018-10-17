<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
          <li><a class="logout" href="login.html">로그아웃</a></li>
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
            <a class="active" href="<c:url value='/Admin/Index/Index.Admin'/>">
              <i class="fa fa-dashboard"></i>
              <span>메인페이지</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="<c:url value='/Admin/blackList/blackList.Admin'/>">
              <i class="fa fa-desktop"></i>
              <span>블랙리스트</span>
              </a>
		  </li>
          <li class="sub-menu">
            <a href="<c:url value='/Admin/apply/apply.Admin'/>">
              <i class="fa fa-cogs"></i>
              <span>가게승인</span>
			  <span class="label label-theme pull-right mail-info">2</span>
              </a>
		  </li>
          <li class="sub-menu">
            <a href="<c:url value='/Admin/member/member.Admin'/>">
              <i class="fa fa-tasks"></i>
              <span>회원관리시스템</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-th"></i>
              <span>게시판관리시스템</span>
              </a>
			<ul class="sub">
              <li><a href="<c:url value='/Notice/Notice.Lingo'/>">공지사항</a></li>
              <li><a href="<c:url value='/Admin/board/free.Admin'/>">자유게시판</a></li>
            </ul>
          </li>
          <li>
            <a href="<c:url value='/Admin/question/QNA.Admin'/>">
              <i class="fa fa-envelope"></i>
              <span>1:1문의 응답</span>
              <span class="label label-theme pull-right mail-info">2</span>
              </a>
          </li>
        </ul>
       
      </div>
    </aside>
<!--왼쪽 네비게이션바-->		