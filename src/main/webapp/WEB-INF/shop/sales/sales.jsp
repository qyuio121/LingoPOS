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
	.out {
		 width:100%;
		 text-align: center;
		 display: block;
	}
	.in{
		display: inline-block;
		height:210px;
		
		margin: auto;
	}
}
</style>
<!--메인 페이지 -->
<div class="container" style="margin-top: 70px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row" style="margin-bottom: 30px">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px;" />가맹점<small>매출확인</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
	<section id="main-content">
<!-- 출력3개  끝 -->
	<div class="row">
		<div class="out" style="height: 220px">
			<div class="in" style="width:100%;" >
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
					<div class="weather-3 pn centered">
						<i class="fa fa-usd"></i>
						<h1>금일 매출액</h1>
						<div class="info">
							<div class="row">
								<h3 class="centered">${saleList.day}</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
					<div class="weather-3 pn centered">
						<i class="fa fa-usd"></i>
						<h1>금월 매출액</h1>
						<div class="info">
							<div class="row">
								<h3 class="centered">${saleList.month}</h3>
	
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
					<div class="weather-3 pn centered">
						<i class="fa fa-usd"></i>
						<h1>올해 매출액</h1>
						<div class="info">
							<div class="row">
								<h3 class="centered">${saleList.year}</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="out" style="margin-top: 20px;height:220px">
				<div class="in" style="width:66%">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 mb">
						<div class="weather-3 pn centered">
							<i class="fa fa-cutlery"></i>
							<h1>Best 메뉴</h1>
							<div class="info">
								<div class="row">
									<h3 class="centered">${saleList.bestName1}</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 mb">
						<div class="weather-3 pn centered">
							<i class="fa fa-cutlery"></i>
							<h1>Worst 메뉴</h1>
							<div class="info">
								<div class="row">
									<h3 class="centered">${saleList.worstName1}</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="margin-bottom:50px;height: 240px;">
				<p style="margin-bottom:50px;font-weight: bold;font-size: 80px">Best메뉴 Top3</p>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb" style="margin-bottom:50px ">
						<div class="weather-3 pn centered">
							<i class="fa fa-usd"></i>
							<h1>Best1</h1>
							<div class="info">
								<div class="row">
									<h3 class="centered">${saleList.bestName1}</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
						<div class="weather-3 pn centered">
							<i class="fa fa-usd"></i>
							<h1>Best2</h1>
							<div class="info">
								<div class="row">
									<h3 class="centered">${saleList.bestName2}</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
						<div class="weather-3 pn centered">
							<i class="fa fa-usd"></i>
							<h1>Best3</h1>
							<div class="info">
								<div class="row">
									<h3 class="centered">${saleList.bestName3}</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="margin-bottom:80px;height: 300px;margin-top:50px">
				<p style="margin-bottom:50px;font-weight: bold;font-size: 80px">Worst메뉴 Top3</>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb" >
					<div class="weather-3 pn centered">
						<i class="fa fa-usd"></i>
						<h1>Worst1</h1>
						<div class="info">
							<div class="row">
								<h3 class="centered">${saleList.worstName1}</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
					<div class="weather-3 pn centered">
						<i class="fa fa-usd"></i>
						<h1>Worst2</h1>
						<div class="info">
							<div class="row">
								<h3 class="centered">${saleList.worstName2}</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
					<div class="weather-3 pn centered">
						<i class="fa fa-usd"></i>
						<h1>Worst3</h1>
						<div class="info">
							<div class="row">
								<h3 class="centered">${saleList.worstName3}</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="height:250px"></div>
	<!-- 테이블 시작 -->
			
	<!-- 테이블 끝 -->
		</section>
	</div>
<!-- 내용 끝 -->
</div>

<script src="<c:url value="/lib/jquery.dcjqaccordion.2.7.js"/>"></script>
<script src="<c:url value="/lib/jquery.scrollTo.min.js"/>"></script>
<script src="<c:url value="/lib/jquery.nicescroll.js"/>"></script>
<script src="<c:url value="/lib/jquery.sparkline.js"/>"></script>
<script src="<c:url value="/lib/common-scripts.js"/>"></script> 
<script src="<c:url value="/lib/gritter/js/jquery.gritter.js"/>"></script>
<script src="<c:url value="/lib/gritter-conf.js"/>"></script>