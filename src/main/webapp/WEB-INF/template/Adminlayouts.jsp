<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>LingoPOS Admin</title>
	<!--  
	<link href="../../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	-->
	<link href="<c:url value="/lib/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
	<!-- 
	<link href="../../lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
	 -->
	<link href="<c:url value="/lib/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
	<!-- 
	<link rel="stylesheet" type="text/css" href="../../css/zabuto_calendar.css">
	 -->
	<link href="<c:url value="/css/zabuto_calendar.css"/>" rel="stylesheet">
	<!-- 
	<link rel="stylesheet" type="text/css" href="../../lib/gritter/css/jquery.gritter.css" />
	 -->
	<link href="<c:url value="/lib/gritter/css/jquery.gritter.css"/>" rel="stylesheet">
	<!-- 
	<link href="../../css/adminstyle.css" rel="stylesheet">
	 -->
	<link href="<c:url value="/css/adminstyle.css"/>" rel="stylesheet">
	<!-- 
  	<link href="../../css/style-responsive.css" rel="stylesheet">
  	 -->
  	<link href="<c:url value="/css/style-responsive.css"/>" rel="stylesheet">
  	<!-- 
  	<script src="../../lib/chart-master/Chart.js"></script>
  	 -->
  	<script src="<c:url value="/lib/chart-master/Chart.js"/>"></script> 
  	<!-- 
	<script src="../../lib/jquery/jquery.min.js"></script>
	 -->
	<script src="<c:url value="/lib/jquery/jquery.min.js"/>"></script>
	
	<style>
/*body의 최소 크기를 2000px로 하여 컨텐츠의 영역을  일부러
   확장하여 스크롤바가 생기도록 css를 설정함-네비게이션바가 상단에 고정되는지 테스트 하기 위함*/
/* 화면이 스마트폰 크기일때 큰 화면 */
@media all and (min-width: 768px) {
	#logo {
		width: 102px;
		margin: -15px;
	}
	#top {
		height: 50px;
	}
	#carousels {
		margin-top: 76px;
	}
	#gtBtn {
		display:;
	}
	#smBtn {
		display: none;
	}
}

/* 화면이 태블릿 크기일때 작은 화면 */
@media all and (max-width: 767px) {
	#logo {
		width: 80px;
		margin: -15px;
	}
	#carousels {
		margin-top: 50px;
	}
	#gtBtn {
		display: none;
	}
	#smBtn {
		display:;
	}
}
/* 화면이 태블릿 크기일때 작은 화면 */
@media all and (max-width: 991px) {
	#drop {
		display:;
	}
	#outline {
		display: none;
	}
}
/* 화면이 태블릿 크기일때 큰 화면 */
@media all and (min-width: 992px) {
	#drop {
		display: none;
	}
	#outline {
		display:;
	}
}
</style>
	</head>
  <body>
  	<section id="container">
	  	<tiles:insertAttribute name="Top"/>
	  	<div class="container-fluid">
	  	<!--메인 페이지 -->
		   <section id="main-content">
		     <section class="wrapper">
		    
		       
			<tiles:insertAttribute name="Body"/>
			    
		       <!-- /row -->
		     </section>
		   </section>
		<!--메인 페이지 -->	
	   	</div>
	   	<tiles:insertAttribute name="Footer"/>
   	</section>
   	  	<!-- 
		<script src="../../lib/bootstrap/js/bootstrap.min.js"></script>
		 -->
		<script src="<c:url value="/lib/bootstrap/js/bootstrap.min.js"/>"></script>
		<!-- 
	  	<script class="include" type="text/javascript" src="../../lib/jquery.dcjqaccordion.2.7.js"></script>
	  	 -->
	  	<script src="<c:url value="/lib/jquery.dcjqaccordion.2.7.js"/>"></script>
	  	<!--  
	  	<script src="../../lib/jquery.scrollTo.min.js"></script>
	  	-->
	  	<script src="<c:url value="/lib/jquery.scrollTo.min.js"/>"></script>
	  	<!-- 
	  	<script src="../../lib/jquery.nicescroll.js" type="text/javascript"></script>
	  	 -->
	  	<script src="<c:url value="/lib/jquery.nicescroll.js"/>"></script>
	  	<!--  
	  	<script src="../../lib/jquery.sparkline.js"></script>
	  	 -->
	  	<script src="<c:url value="/lib/jquery.sparkline.js"/>"></script> 
	  	<!-- 
	  	<script src="../../lib/common-scripts.js"></script>
	  	 -->
	  	<script src="<c:url value="/lib/common-scripts.js"/>"></script> 
	  	<!-- 
		<script type="text/javascript" src="../../lib/gritter/js/jquery.gritter.js"></script>
		 -->
		<script src="<c:url value="/lib/gritter/js/jquery.gritter.js"/>"></script>
		<!--  
		<script type="text/javascript" src="../../lib/gritter-conf.js"></script>
		 -->
		<script src="<c:url value="/lib/gritter-conf.js"/>"></script>
  </body>
</html>