<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="row">
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
							<img src="<c:url value='/Images/eventImages/event1.jpg'/>" alt="슬라이드1" style="width: 100%; height: 500px">
						</a>
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<a href="http://www.daum.net"> 
							<img src="<c:url value='/Images/eventImages/event2.jpg'/>" alt="슬라이드2" style="width: 100%; height: 500px">
						</a>
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<a href="http://www.nate.com"> 
							<img src="<c:url value='/Images/eventImages/event3.jpg'/>" alt="슬라이드3" style="width: 100%; height: 500px;">
						</a>
						<div class="carousel-caption">
						</div>
					</div>
				</div>
			</div>
		</div><!-- ccarousel -->
		<div class="bs-docs-featurette">
		  <div class="container">
		    <h2 style="text-align: center;font-size: 35px">"링고포스" 는 즐거운식사를 원하는 모든사람과<br/> 모든숨어있는 맛집을 위해 설계되었습니다.</h2>
		    <p class="lead" style="text-align: center">거주지역 및 원하는 지역의 맛집을 보다 손쉽게 찾아줍니다, 모든 링고포스에 등록된 숨어있는 맛집에 손쉽게 예약이 <br/>
		    											가능합니다, 정해진 점심시간에 가장 인기있는 메뉴를 확인하고 미리 예약할수 있습니다, 모든 힘겨운아침을 보내는 <br/>
		    											직장인들에게 즐거운 점심시간에 대한 기대를 제공합니다.
		    <hr class="half-rule">	
		    <div class="row">
		      <div class="col-sm-4">
		        <img src="<c:url value='/Images/RecommendImage.jpg' />" alt="Recommend" style="width:100%;">
		        <h3><a href="#">인기맛집 리스트</a></h3>
		        <p>링고포스는 유저분들이 가장 추천수가 높은 맛집을 추려 <a href="#">인기맛집 top리스트</a>를 제공하여 줍니다.
		      </div>
		      <div class="col-sm-4">
		        <img src="<c:url value='/Images/mapImage.jpg' />" alt="Reservation" style="width:100%;">
		        <h3><a href="<c:url value='/Reservation/Search.Lingo' /> ">지도를 통한 예약</a></h3>
		        <p><a href="<c:url value='/Reservation/Search.Lingo'/>">지도</a>를 통하여 집 주변의 맛집에서부터 원하는 지역의 맛집을 찾아 쉽게 예약할수있게 도와줍니다.</p>
		      </div>
		      <div class="col-sm-4">
		        <img src="<c:url value='/Images/자유게시판.png' />" alt="Components" style="width:100%;">
		        <h3><a href="<c:url value='/Free/Free.Lingo' />" >자유 게시판</a></h3>
		        <p>링고포스를 이용하시는 유저분들이 자유롭게 소통 및 정보를 자세하게 공유할수 있도록 자유 게시판을 운영하고 있습니다.</p>
		      </div>
		    </div>
		  </div>
		</div>
	</div><!-- row -->
</div>
<c:forEach begin="0" end="${10-fn:length(list)}" step="1">
	<br/>
</c:forEach>


