<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="carousel" id="carousels">
		<div class="carousel slide" data-ride="carousel" style="margin: 0px -15px">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousels" data-slide-to="0" class="active"></li>
				<li data-target="#carousels" data-slide-to="1"></li>
				<li data-target="#carousels" data-slide-to="2"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<a href="http://www.naver.com"> 
						<img src="<c:url  value='/Images/Lingo로고.png'/>" alt="슬라이드1" style="width: 100%; height: 500px">
					</a>
					<div class="carousel-caption">
						<h2>메인</h2>
					</div>
				</div>
				<div class="item">
					<a href="http://www.daum.net"> 
						<img src="<c:url value='/Images/event.jpg'/>" alt="슬라이드2" style="width: 100%; height: 500px">
					</a>
					<div class="carousel-caption">
						<h2>이벤트 첫번째</h2>
					</div>
				</div>
				<div class="item">
					<a href="http://www.nate.com"> 
						<img src="<c:url value='/Images/event2.jpg'/>" alt="슬라이드3" style="width: 100%; height: 500px;">
					</a>
					<div class="carousel-caption">
						<h2>이벤트 두번째</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ccarousel -->
	<div class=" col-xs-3">
		<table class="table table-hover" style="margin-top: 15px">
			<tr>
				<th class="active" style="background-color: white;">간략매출&즐겨찾기</th>
			</tr>
			<c:forEach var="i" begin="1" end="10">
				<tr>
					<a href="#"><td class="success">매출현황${i}</td></a>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="col-xs-offset-1 col-xs-7">
		<table class="table table-hover" style="margin-top: 15px">
			<tr>
				<th class="active" style="background-color: white;">검색순위 top10</th>
			</tr>
			<c:forEach begin="1" end="10" var="i">
				<tr>
					<a href="http://www.nate.com"><td class="success">JMT${i}</td></a>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


