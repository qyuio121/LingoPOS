<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 가게 위치  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8b1f17eca567f307bb9f9a105ef8e9f&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="../js/search.js"></script>

<!-- 슬라이드 js -->
<script src="../js/infiniteslidev2.js"></script>
<!-- 슬라이드 css  -->
<link rel="stylesheet" href="../css/infiniteslidev2.css" />

<!-- 탭css -->
<!-- 
<link rel="stylesheet" href="../css/base.css">
 -->
<link rel="stylesheet" href="../css/swichTab.css">
<!-- 탭 js -->
<script src="../js/jquery.swichTab.js" charset="utf-8"></script>

<!-- 메뉴음식 사진 갤러리 css -->
<link rel="stylesheet" type="text/css" href="../css/fs-gal.css" />
<!-- 메뉴음식 사진 갤러리 js -->
<script type="text/javascript" src="../js/fs-gal.js"></script>


<script>
$(function(){
	//탭
	 $('.tabGroup2').swichTab({
    cahngePanel: 'fade',
    swiper: true,
    index: 0,
    });

	//슬라이드
	$('.scroll2').infiniteslide({
		speed: 50,
		direction: 'right',
		clone: 10
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
        float: center;
      }
      
</style>

<div class="container" style="padding-top: 60px; margin-top: 60px;">
	
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />${name}<small>상세보기</small></h2>
			<!-- 
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />${store.storename}<small>상세보기</small></h2>
 			-->
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 슬라이드 갤러리 시작 -->
	<div class="module">
		<div class="scroll2" >
			<c:forEach items="${hidden}" var="hiddenFile">
				<div class="scroll_item">
					<div class="img">
						<img src="${hiddenFile}" style="width:100%;height:200px">
					</div>
				</div>
			</c:forEach>  	
		</div>
	</div>	
<!-- DB연결용 미리 만들어논거 시작 -->
	<!-- 
	<div class="module">
		<div class="scroll2" >
			<c:forEach items="${storeimgs}" var="storeimg">
				<div class="scroll_item">
					<div class="img">
						<img src="${storeimg.img}" style="width:100%;height:300px">
					</div>
				</div>
			</c:forEach>  	
		</div>
	</div>	
	 -->
<!-- DB연결용 미리 만들어논거 끝 -->
<!-- 슬라이드 갤러리 끝 -->
<!-- 탭 바 시작-->
	<div class="tabGroup tabGroup2">
		<ul class="swichtab-controller">
	        <li data-swichtab="controller"><a href="#tab1">가게정보</a></li>
	        <li id="mapEvent" data-swichtab="controller"><a href="#tab2">가게위치</a></li>
	        <li data-swichtab="controller"><a href="#tab3">메뉴</a></li>
	        <li data-swichtab="controller"><a href="#tab4">리뷰</a></li>
	        <!-- DB연결 시 예약하기 예약불가 구분해서 표시하기!! -->
	        <li data-swichtab="controller" class="disabled"><a href="#tab5">예약하기</a></li>
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
							<th class="col-md-3"><h3 id="storename">${name}<small>${foodselect1}</small></h3></th>
						</tr>
					</thead>
					<tbody class="tsGroup">
						<tr><td class="text-center"><h4>가게전화번호</h4></td><td><h5>${telselect} - ${teltext1} - ${teltext2}</h5></td><tr>
						<tr><td class="text-center"><h4>가게주소</h4></td><td><h5>${addr2} ${addr3}</h5></td><tr>
						<tr><td class="text-center"><h4>영업시간</h4></td><td><h5>${startTime} ~ ${endTime}</h5></td><tr>
						<tr><td class="text-center"><h4>음식메뉴</h4></td><td><h5>${menu}</h5></td><tr>
					</tbody>	
				</table>
			</div>	
		</div>
<!-- DB연결용 미리 만들어논거 시작 -->
	<!-- 
		<div id="tab1" class="swichtab-panel" data-swichtab="target">
			<div class="table-responsive">
				<table class="table ">
					<thead>
						<tr class="tsTitles">
							<th class="col-md-3"><h3>${store.storename}<small>${store.bigkind}</small></h3></th>
						</tr>
					</thead>
					<tbody class="tsGroup">
						<tr><td class="text-center"><h4>가게전화번호</h4></td><td><h5>${store.tel}</h5></td><tr>
						<tr><td class="text-center"><h4>가게주소</h4></td><td><h5>${store.address}</h5></td><tr>
						<tr><td class="text-center"><h4>영업시간</h4></td><td><h5>${store.opentime} ~ ${store.closetime}</h5></td><tr>
						<tr><td class="text-center"><h4>음식메뉴</h4></td><td><h5>${foodimg.name}</h5></td><tr>
					</tbody>	
				</table>
			</div>	
		</div>
	 -->
<!-- DB연결용 미리 만들어논거 끝 -->
<!-- 가게정보 끝 -->		
<!-- 가게위치 시작 -->	
	<form>
		<input id="x" type="hidden" value="37.473567"/>
		<input id="y" type="hidden" value="126.874399"/>
	</form>
	<div id="tab2" class="swichtab-panel" data-swichtab="target">
		<div class="bg_wrap">
			<div id="map" style="height:240px;width:400px;display:inline-block" ></div>
		</div>	
	</div>
<!-- DB연결용 미리 만들어논거 시작 -->
	<!-- jquery.swichTab.js  여기서  맵에 표시할 x/y 좌표 2개 넣기 -->
<!-- DB연결용 미리 만들어논거 끝 -->
<!-- 가게위치 끝 -->	
<!-- 메뉴갤러리 시작 -->	
		<div id="tab3" class="swichtab-panel" data-swichtab="target">
			<c:forEach items="${hidden1}" var="hiddenFile1">
				<img class="fs-gal" src="${hiddenFile1}" data-url="${hiddenFile1}" alt="DB연결시 제목 나올자리" title="DB연결시 제목 나올자리" />
			</c:forEach>
			<div class="fs-gal-view">
				<h1></h1> <!-- 저장된 메뉴 이미지의 타이틀 값 넣어줄 자리 -->
				<img class="fs-gal-prev fs-gal-nav" src="../Images/prev.svg" alt="Previous picture" title="Previous picture" />
				<img class="fs-gal-next fs-gal-nav" src="../Images/next.svg" alt="Next picture" title="Next picture" />
				<img class="fs-gal-close" src="../Images/close.svg" alt="Close gallery" title="Close gallery" />
				<img class="fs-gal-main" src="" alt="">
			</div>	
		</div>
<!-- DB연결용 미리 만들어논거 시작 -->
	<!--
		<div id="tab3" class="swichtab-panel" data-swichtab="target">
			<c:forEach items="${foodimgs}" var="foodimg">
				<img class="fs-gal" src="${foodimg.img}" data-url="${foodimg.img}" alt="메뉴 : ${foodimg.name} 가격 : ${foodimg.price}" title="메뉴 : ${foodimg.name} 가격 : ${foodimg.price}" />
			</c:forEach>
			<div class="fs-gal-view">
				<h1></h1> 
				<img class="fs-gal-prev fs-gal-nav" src="../Images/prev.svg" alt="Previous picture" title="Previous picture" />
				<img class="fs-gal-next fs-gal-nav" src="../Images/next.svg" alt="Next picture" title="Next picture" />
				<img class="fs-gal-close" src="../Images/close.svg" alt="Close gallery" title="Close gallery" />
				<img class="fs-gal-main" src="" alt="">
			</div>	
		</div>
	-->
<!-- DB연결용 미리 만들어논거 끝 -->
<!-- 메뉴갤러리 끝 -->		
<!-- 리뷰 시작 -->	
		<div id="tab4" class="swichtab-panel" data-swichtab="target">
			<table class="table table-bordered">
				<tr style="font-weight:bold; background-color: #EAEDED">
					<th style="width: 10%; text-align: center">글쓴이</th>
					<th style="width: 50%; text-align: center">한줄리뷰</th>
					<th style="width: 10%; text-align: center">작성일</th>
				</tr>
				<c:forEach var="i" begin="1" end="6">
					<tr style="text-align: center">
						<td>글쓴이${i}</td><td>한줄리뷰${i}</td><td>작성일${i}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
<!-- DB연결용 미리 만들어논거 시작 -->
	<!--
	 	<div id="tab4" class="swichtab-panel" data-swichtab="target">
			<table class="table table-bordered">
				<tr style="font-weight:bold; background-color: #EAEDED">
					<th style="width: 50%; text-align: center">글쓴이</th>
					<th style="width: 10%; text-align: center">한줄리뷰</th>
					<th style="width: 10%; text-align: center">작성일</th>
				</tr>
				<c:if test="${empty requestScope.reviews}" var="isEmpty">
					<tr>
						<td colspan="4">등록된 리뷰가 없어요</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="review" items="${reviews}" varStatus="loop">
						<tr>
							<td>${review.id}</td>
							<td>${review.comment}</td>
							<td>${review.postdate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	 -->		
<!-- DB연결용 미리 만들어논거 끝 -->		
		<div class="row">
			<div>${pagingString}</div>
		</div>
<!-- 리뷰 끝 -->			
<!-- 예약하기 시작 -->
		<div id="tab5" class="swichtab-panel" data-swichtab="target">
			
		</div>
<!-- 예약하기 끝 -->		
	</div>
<!-- 탭 바 내 내용 끝 -->
	</div>	
<!-- 내용 끝 -->	
</div>