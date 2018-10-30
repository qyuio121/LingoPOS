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
	$('#reviewWrite').click(function(){
		var comment = $('#reviewText').val();
		if(comment==''){
			alert('리뷰 내용을 입력해주세요');
			return false;
		}
		reviewWrite(${param.storeno},comment);
		showCommentsWrite(${param.storeno});
		return false;
	});
	showCommentsWrite(${param.storeno});
});

//해당 글번호에 대한 코멘트 목록을 가져오는 함수
var reviewWrite = function(key,comment){		
	$.ajax({
		url:"<c:url value='/Review/ReviewWrite.Lingo'/>",
		data: "storeno="+key+"&comment="+comment,
		dataType:"text",
		type:'post',
		success:function(data){
			if(data=='0'){
				alert('입력실패!');
			}
		}			
	});
};
var showCommentsWrite = function(key){		
	$.ajax({
		url:"<c:url value='/Review/Review.Lingo'/>",
		data: "storeno="+key,
		dataType:"text",
		type:'post',
		success:displayComments			
	});
};
var showCommentsPage = function(key,nowPage){		
	$.ajax({
		url:"<c:url value='/Review/Review.Lingo'/>",
		data:"storeno="+key+"&nowPage="+nowPage,
		dataType:"text",
		type:'post',
		success:displayComments			
	});
};
//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
var displayComments	 = function(data){
	$('#tab3').html(data);
	$('#reviewWrite').click(function(){
		var comment = $('#reviewText').val();
		if(comment==''){
			alert('리뷰 내용을 입력해주세요');
			return false;
		}
		reviewWrite(${param.storeno},comment);
		showCommentsWrite(${param.storeno});
		return false;
	});
};
function getReview(nowPage){
	showCommentsPage(${param.storeno},nowPage);
}
if(${not empty isBlack}){
	alert('해당 가게에 블랙리스트 등록되어 예약을 하실수 없습니다');
	location.replace("<c:url value='/'/>")
}
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
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />${store.storename}<small>상세보기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 슬라이드 갤러리 시작 -->
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
<!-- 슬라이드 갤러리 끝 -->
<!-- 탭 바 시작-->
	<div class="tabGroup tabGroup2">
		<ul class="swichtab-controller">
	        <li data-swichtab="controller"><a href="#tab1">가게정보</a></li>
	        <li data-swichtab="controller"><a href="#tab2">메뉴</a></li>
	        <li data-swichtab="controller"><a href="#tab3">리뷰</a></li>
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
							<th class="col-md-3"><h3>${store.storename} <small>${store.bigkind}</small></h3></th>
						</tr>
					</thead>
					<tbody class="tsGroup">
						<tr><td class="text-center"><h4>가게전화번호</h4></td><td><h5>${store.tel}</h5></td><tr>
						<tr><td class="text-center"><h4>가게주소</h4></td><td><h5>${store.address}</h5></td><tr>
						<tr><td class="text-center"><h4>영업시간</h4></td><td><h5>${store.opentime} ~ ${store.closetime}</h5></td><tr>
						<tr><td class="text-center"><h4>사용 가능한 테이블수</h4></td><td><h5>${store.atable} / ${store.tablenum}</h5></td><tr>
						<tr><td class="text-center"><h4>예약하기</h4></td><td><button class="btn btn-primary">예약하기</button></td></tr>
					</tbody>	
				</table>
			</div>
			<c:forEach begin="0" end="5" step="1">
				<br/>
			</c:forEach>
		</div>	
<!-- 가게정보 끝 -->	

		<div id="tab2" class="swichtab-panel" data-swichtab="target">
			<div style="text-align: center;width:100%;">
				<c:forEach items="${foodimgs}" var="foodimg">
					<div style="display:inline-table;width:45%">
						<img style="width:400px;height:400px;display: table-row;" class="fs-gal" src="${foodimg.img}" data-url="${foodimg.img}" alt="메뉴 : ${foodimg.name} 가격 : ${foodimg.price}" title="메뉴 : ${foodimg.name} 가격 : ${foodimg.price}" />	
						<span style="display:table-row;font-size:1.8em">메뉴 : ${foodimg.name} 가격 : ${foodimg.price}</span>
						<br/>
					</div>
				</c:forEach>
			</div>
			<div class="fs-gal-view">
				<h1></h1> 
				<img class="fs-gal-prev fs-gal-nav" src="../Images/prev.svg" alt="Previous picture" title="Previous picture" />
				<img class="fs-gal-next fs-gal-nav" src="../Images/next.svg" alt="Next picture" title="Next picture" />
				<img class="fs-gal-close" src="../Images/close.svg" alt="Close gallery" title="Close gallery" />
				<img class="fs-gal-main" src="" alt="">
			</div>	
		</div>
<!-- 메뉴갤러리 끝 -->		
<!-- 리뷰 시작 -->	

	 	<div id="tab3" class="swichtab-panel" data-swichtab="target">\
	 		<div style="float: right;">
				<span>멋진 댓글을 작성해 주세요 </span> <input type="text" id="reviewText" style="width:300px"/> <button id="reviewWrite" class="btn btn-primary">등록</button>			
			</div>
			<div>
				<br/>
			</div>
			<table class="table table-bordered">
				<tr style="font-weight:bold; background-color: #EAEDED">
					<th style="width: 50%; text-align: center">한줄리뷰</th>
					<th style="width: 10%; text-align: center">글쓴이</th>
					<th style="width: 20%; text-align: center">작성일</th>
				</tr>
				<c:if test="${empty requestScope.reviews}" var="isEmpty">
					<tr style="text-align: center">
						<td colspan="4">등록된 리뷰가 없어요</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="review" items="${reviews}" varStatus="loop">
						<tr style="text-align: center">
							<td>${review.comment}</td>
							<td>${review.id}</td>
							<td>${review.postdate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="row">
				<div>${pagingString}</div>
			</div>
		</div>	
<!-- 리뷰 끝 -->	
	</div>
<!-- 탭 바 내 내용 끝 -->
	</div>	
<!-- 내용 끝 -->	
</div>