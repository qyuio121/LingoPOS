<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<img src="<c:url  value='/Images/Lingo로고.png'/>" alt="슬라이드1" style="width: 100%; height: 500px">
						</a>
						<div class="carousel-caption">
							<h2>메인</h2>
						</div>
					</div>
					<div class="item">
						<a href="http://www.daum.net"> 
							<img src="<c:url value='/Images/eventImages/event3.jpg'/>" alt="슬라이드2" style="width: 100%; height: 500px">
						</a>
						<div class="carousel-caption">
							<h2>이벤트 첫번째</h2>
						</div>
					</div>
					<div class="item">
						<a href="http://www.nate.com"> 
							<img src="<c:url value='/Images/eventImages/event5.jpg'/>" alt="슬라이드3" style="width: 100%; height: 500px;">
						</a>
						<div class="carousel-caption">
							<h2>이벤트 두번째</h2>
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
	        <img src="assets/img/sass-less.png" alt="Recommend" class="img-responsive">
	        <h3>인기맛집 리스트<!--Preprocessors--></h3>
	        <p>링고포스는 유저분들이 가장 추천수가 높은 맛집을 추려 <a href="../css/#less">인기맛집 top리스트</a>를 제공하여 줍니다.
	      </div>
	      <div class="col-sm-4">
	        <img src="assets/img/devices.png" alt="Reservation" class="img-responsive">
	        <h3>지도를 통한 예약<!--One framework, every device.--></h3>
	        <p><a href="<c:url value='/Reservation/Search.Lingo'/>">지도를</a> 통하여 집 주변의 맛집에서부터 원하는 지역의 맛집을 찾아 쉽게 예약할수있게 도와줍니다.</p>
	      </div>
	      <div class="col-sm-4">
	        <img src="assets/img/components.png" alt="Components" class="img-responsive">
	        <h3>자유 게시판<!--Full of features--></h3>
	        <p>부트스트랩과 함께, 보통의 HTML 요소들, 맞춤형 HTML 과 CSS 콤포넌트들, 그리고 놀라운 jQuery 플러그인들로 광범위하고 아름다운 문서들을 가질 수 있습니다.<!--With Bootstrap, you get extensive and beautiful documentation for common HTML elements, dozens of custom HTML and CSS components, and awesome jQuery plugins.--></p>
	      </div>
	    </div>
	
	    <hr class="half-rule">
	
	    <p class="lead">부트스트랩은 오픈소스 입니다. 깃허브에서 호스트되고, 개발되고, 유지보수 됩니다.<!--Bootstrap is open source. It's hosted, developed, and maintained on GitHub.--></p>
	    <a href="https://github.com/twbs/bootstrap" class="btn btn-outline btn-lg">깃허브 프로젝트 보기</a>
	  </div>
	</div>
	
	<div class="bs-docs-featurette">
	  <div class="container">
	    <h2 class="bs-docs-featurette-title">부트스트랩으로 만들어졌습니다.<!--Built with Bootstrap.--></h2>
	    <p class="lead">웹상의 무수히 많은 놀라운 사이트들이 부트스트랩으로 만들어져 있습니다. 늘어가는 <a href="../getting-started/#examples">예제 모음</a> 으로 당신의 것을 시작하거나 전시된 사이트를 구경하세요.<!--TODO: Millions of amazing sites across the web are being built with Bootstrap. Get started on your own with our growing collection of examples or by exploring some of our favorites.--></p>
	
	    <hr class="half-rule">
	
	    <div class="row bs-docs-featured-sites">
	    
	      <div class="col-xs-6 col-sm-3">
	        <a href="http://expo.getbootstrap.com/2014/10/29/lyft/" target="_blank" title="Lyft">
	          <img src="http://expo.getbootstrap.com/thumbs/lyft-thumb.jpg" alt="Lyft" class="img-responsive">
	        </a>
	      </div>
	    
	      <div class="col-xs-6 col-sm-3">
	        <a href="http://expo.getbootstrap.com/2014/09/30/vogue/" target="_blank" title="Vogue">
	          <img src="http://expo.getbootstrap.com/thumbs/vogue-thumb.jpg" alt="Vogue" class="img-responsive">
	        </a>
	      </div>
	    
	      <div class="col-xs-6 col-sm-3">
	        <a href="http://expo.getbootstrap.com/2014/03/13/riot-design/" target="_blank" title="Riot Design">
	          <img src="http://expo.getbootstrap.com/thumbs/riot-thumb.jpg" alt="Riot Design" class="img-responsive">
	        </a>
	      </div>
	    
	      <div class="col-xs-6 col-sm-3">
	        <a href="http://expo.getbootstrap.com/2014/02/12/newsweek/" target="_blank" title="Newsweek">
	          <img src="http://expo.getbootstrap.com/thumbs/newsweek-thumb.jpg" alt="Newsweek" class="img-responsive">
	        </a>
	      </div>
	    
	    </div>
	
	    <hr class="half-rule">
	
	    <p class="lead">부트스트랩으로 만들어진 감명 깊은 프로젝트들을 전시합니다. <!--We showcase dozens of inspiring projects built with Bootstrap on the Bootstrap Expo.--></p>
	    <a href="http://expo.getbootstrap.com" class="btn btn-outline btn-lg">전시관으로 이동</a>
	  </div>
	</div>
	</div><!-- row -->
</div>


