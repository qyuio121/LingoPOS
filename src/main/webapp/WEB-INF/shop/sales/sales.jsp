<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="<c:url value="/lib/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
<link href="<c:url value="/css/zabuto_calendar.css"/>" rel="stylesheet">
<link href="<c:url value="/lib/gritter/css/jquery.gritter.css"/>" rel="stylesheet">
<link href="<c:url value="/css/salesstyle.css"/>" rel="stylesheet">
<link href="<c:url value="/css/style-responsive.css"/>" rel="stylesheet">
<script src="<c:url value="/lib/chart-master/Chart.js"/>"></script> 


<script>
$(function() {
	
});
</script>
<style>
	.pn {
		height: 200px;
		box-shadow: 0 2px 1px rgba(0, 0, 0, 0.2);
	}
	.weather-3 {
	background: #4ECDC4;	
	}
	
	.weather-3 .info h3 {
	font-weight: 700;
	margin-bottom: 0px;
	background: white;	
	}
	.weather-3 .info {
	background: white;
}
}
</style>
<!--메인 페이지 -->
<div class="container" style="margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px;" />가맹점<small>매출확인</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
	<section id="main-content">
<!-- 가게삭제, 매출계산기  시작 -->
	 	<section class="wrapper">	
     		<button type="button" class="btn-lg btn-danger nav pull-right" id="storeDelete" style="margin-left:10px"> 가게삭제</button>
			<button type="button" class="btn-lg btn-primary nav pull-right" id="salescal"> 매출계산기</button>
     	</section>
<!-- 가게삭제, 매출계산기  시작 -->
<!-- 출력3개  시작 -->
<!-- 
		<div class="col-md-4 col-sm-4 mb">
			<div class="darkblue-panel pn">
				<div class="darkblue-header">
                   	<h5>일별 방문고객 수</h5>
               	</div>
               	<h1 class="mt"><i class="fa fa-user fa-3x"></i></h1>
               	</br>
               	<footer>
					<div class="centered">
        	  			<h4><i class="fa fa-play"></i> 100명</h4>
               		</div>
           		</footer>
           	</div>
		</div>
		<div class="col-md-4 col-sm-4 mb">
			<div class="darkblue-panel pn">
				<div class="darkblue-header">
                   	<h5>일별 총 매출액</h5>
               	</div>
               	<h1 class="mt"><i class="fa fa-usd fa-3x"></i></h1>
               	</br>
               	<footer>
                  		<div class="centered">
                    			<h4><i class="fa fa-play"></i> 100만원</h4>
                  		</div>
                		</footer>
              	</div>
		</div>
		<div class="col-md-4 col-sm-4 mb">
			<div class="darkblue-panel pn">
				<div class="darkblue-header">
                   	<h5>월별 총 매출액</h5>
               	</div>
               	<h1 class="mt"><i class="fa fa-usd fa-3x"></i></h1>
               	</br>
               	<footer>
                  		<div class="centered">
                    			<h4><i class="fa fa-play"></i> 1,000만원</h4>
                  		</div>
                		</footer>
              	</div>
		</div>
-->
<!-- 출력3개  끝 -->			
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
           <div class="weather-3 pn centered">
             <i class="fa fa-user"></i>
             <h1>금일 사용자</h1>
             <div class="info">
               <div class="row">
                 <h3 class="centered">100명</h3>
               
               </div>
             </div>
           </div>
         </div>
         <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="weather-3 pn centered">
                  <i class="fa fa-usd"></i>
                  <h1>일별 총 매출액</h1>
                  <div class="info">
                    <div class="row">
                      <h3 class="centered">100만원</h3>
            
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="weather-3 pn centered">
                  <i class="fa fa-usd"></i>
                  <h1>월별 총 매출액</h1>
                  <div class="info">
                    <div class="row">
                      <h3 class="centered">1,000만원</h3>
              
                    </div>
                  </div>
                </div>
              </div>
              
<!-- 차트 시작 -->
<!-- 차트 타이틀-->
		<section class="wrapper">			
		    <div class="border-head">
				<h3>일별 매출</h3>
			</div>
<!-- 차트 타이틀-->			
<!-- 차트-->			
			<div class="custom-bar-chart">
<!-- y축-->			
		    	<ul class="y-axis">
					<li><span>500</span></li>
					<li><span>400</span></li>
					<li><span>300</span></li>
					<li><span>200</span></li>
					<li><span>100</span></li>
					<li><span>0</span></li>
				</ul>
<!-- y축-->	
<!-- x축-->			  
				<div class="bar">
					<div class="title">1일</div>
					<div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">85%</div>
				</div>
		        <div class="bar ">
					<div class="title">5일</div>
					<div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">50%</div>
				</div>
		       	<div class="bar ">
		        	<div class="title">10일</div>
		            <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">60%</div>
				</div>
		        <div class="bar ">
		        	<div class="title">15일</div>
		            <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">45%</div>
				</div>
		        <div class="bar">
		            <div class="title">20일</div>
		            <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">32%</div>
				</div>
		        <div class="bar ">
		            <div class="title">25일</div>
		        	<div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">62%</div>
				</div>
				<div class="bar ">
		            <div class="title">30일</div>
		        	<div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">62%</div>
				</div>
<!-- x축-->					  
			</div>
		</section>	
<!-- 차트 끝 -->
<!-- 테이블 시작 -->
		
<!-- 테이블 끝 -->
	</section>
<!-- 내용 끝 -->
</div>

<script src="<c:url value="/lib/jquery.dcjqaccordion.2.7.js"/>"></script>
<script src="<c:url value="/lib/jquery.scrollTo.min.js"/>"></script>
<script src="<c:url value="/lib/jquery.nicescroll.js"/>"></script>
<script src="<c:url value="/lib/jquery.sparkline.js"/>"></script>
<script src="<c:url value="/lib/common-scripts.js"/>"></script> 
<script src="<c:url value="/lib/gritter/js/jquery.gritter.js"/>"></script>
<script src="<c:url value="/lib/gritter-conf.js"/>"></script>