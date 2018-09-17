<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 슬라이드 js -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="../js/infiniteslidev2.js"></script>
<!-- 슬라이드 css  -->
<link rel="stylesheet" href="../css/infiniteslidev2.css" />

<!-- 탭css -->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/swichTab.css">
<!-- 탭 js -->
<script src="../js/jquery.swichTab.js" charset="utf-8"></script>

<!-- 메뉴음식 사진 갤러리 css -->
<link rel="stylesheet" type="text/css" href="../css/fs-gal.css" />
<!-- 메뉴음식 사진 갤러리 js -->
<script type="text/javascript" src="../js/fs-gal.js"></script>

<script>
$(function(){
	//슬라이드
	$('.scroll2').infiniteslide({
		speed: 50,
		direction: 'right',
		clone: 10
	});
	
	//탭
	 $('.tabGroup2').swichTab({
     cahngePanel: 'fade',
     swiper: true,
     index: 0,
   });
});
</script>
<style>
<!--슬라이드 -->
.scroll2 img{
	vertical-align: bottom;
}
.scroll2 .scroll_item {
	position: relative;
}

<!--  메뉴음식 사진 갤러리-->
.fs-gal {
        width: 100px;
        height: auto;
        float: left;
      }
</style>

<div class="container" style="padding-top: 60px; margin-top: 60px;">
	
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="page-header">
		<h1>${name}<small>상세보기</small></h1>
	</div>
<!-- 바디 헤더 끝-->
<!-- 슬라이드 갤러리 시작 -->
	<div class="module">
		<div class="scroll2" >
			<c:forEach items="${hidden}" var="hiddenFile">
				<a href='${hiddenFile}'>
					<div class="scroll_item">
						<div class="img">
							<img src="${hiddenFile}" style="width:100%;height:300px">
						</div>
					</div>
				</a>
			</c:forEach>  	
		</div>
	</div>	
<!-- 슬라이드 갤러리 끝 -->
<!-- 탭 바 시작-->
	<div class="tabGroup tabGroup2">
		<ul class="swichtab-controller">
	        <li data-swichtab="controller"><a href="#tab1">가게정보</a></li>
	        <li data-swichtab="controller"><a href="#tab2">메뉴</a></li>
	        <li data-swichtab="controller"><a href="#tab3">리뷰</a></li>
	        <!-- DB연결 시 예약하기 예약불가 구분해서 표시하기!! -->
	        <li data-swichtab="controller" class="disabled"><a href="#tab4">예약하기</a></li>
	    </ul>
<!-- 탭 바 끝-->
<!-- 탭 바 내 내용 시작 -->
	<div class="swichtab-contents">
<!-- 가게정보 시작 -->	
		<div id="tab1" class="swichtab-panel" data-swichtab="target">
			<div class="table-responsive">
				<table class="table ">
					<thead>
						<tr class="tsTitles">
							<th class="col-md-3"><h3>${name}<small>${foodselect1} / ${foodselect2}</small></h3></th>
						</tr>
					</thead>
					<tbody class="tsGroup">
							<tr><td class="text-center"><h4>가게전화번호</h4></td><td><h5>${telselect} - ${teltext1} - ${teltext2}</h5></td><tr>
							<tr><td class="text-center"><h4>가게주소</h4></td><td><h5>${addr2}</h5></td><tr>
							<tr><td class="text-center"><h4>영업시간</h4></td><td><h5>${startTime} ~ ${endTime}</h5></td><tr>
							<tr><td class="text-center"><h4>음식메뉴</h4></td><td><h5>${menu}</h5></td><tr>
					</tbody>	
				</table>
			</div>	
		</div>
<!-- 가게정보 끝 -->		
<!-- 메뉴갤러리 시작 -->	
		<div id="tab2" class="swichtab-panel" data-swichtab="target">
			<c:forEach items="${hidden}" var="hiddenFile">
				<img class="fs-gal" src="${hiddenFile}" data-url="${hiddenFile}" />
			</c:forEach>
			<div class="fs-gal-view">
				<h3>메뉴사진</h3>
				<img class="fs-gal-prev fs-gal-nav" src="../Images/prev.svg" alt="Previous picture" title="Previous picture" />
				<img class="fs-gal-next fs-gal-nav" src="../Images/next.svg" alt="Next picture" title="Next picture" />
				<img class="fs-gal-close" src="../Images/close.svg" alt="Close gallery" title="Close gallery" />
				<img class="fs-gal-main" src="" alt="">
			</div>	
		</div>
<!-- 메뉴갤러리 끝 -->		
<!-- 리뷰 시작 -->	
		<div id="tab3" class="swichtab-panel" data-swichtab="target">
		</div>
<!-- 리뷰 끝 -->			
<!-- 예약하기 시작 -->
		<div id="tab4" class="swichtab-panel" data-swichtab="target">
		</div>
<!-- 예약하기 끝 -->		
	</div>
<!-- 탭 바 내 내용 끝 -->
	</div>	
<!-- 내용 끝 -->	
</div>