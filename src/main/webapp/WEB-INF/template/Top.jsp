<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header" id="top" style="height: 60px">
			<!-- 화면크기가 작을때 보여지는 메뉴버튼 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#collapseMenu">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/'/>"> 
			<img id="logo" class="logoImage" src="<c:url value='/Images/Lingo로고.png'/>" alt="로고이미지" />
			</a>
		</div>
		<!-- navbar-header -->
		<!-- 화면 크기가 클때 상단에 보이는 메뉴 -->
		<div class="collapse navbar-collapse" id="collapseMenu"
			style="margin-top: 25px">

			<!-- 메뉴에 폼 추가 -->
			<form class="navbar-form navbar-right" id="gtBtn">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색" style="width: 70%; display: block;">
				</div>
				<button type="submit" class="btn btn-default"
					style="margin-left: -54px;">검색</button>
			</form>
			<form class="navbar-form" id="smBtn">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색"
						style="width: 240px; display: inline;">
					<button type="submit" class="btn btn-default">검색</button>
				</div>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${not empty sessionScope.loginDTO.storeno}">
					<li><a href="<c:url value='/Shop/Sales.Lingo'/>">매출</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.loginDTO.id and empty sessionScope.loginDTO.ownerno and empty sessionScope.loginDTO.adminno}">
					<li><a href="<c:url value='/Reservation/Search.Lingo'/>">예약</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.loginDTO}" var="result">
					<li><a href="<c:url value='/Login/Update/Update.Lingo?id=${sessionScope.loginDTO.id}'/>">회원수정</a></li>	
					<li><a class="login/out" href="<c:url value='/Login/Logout.Lingo'/>">로그아웃</a></li>
				</c:if>
				<c:if test="${not result}">
					<li><a class="login/out" href="<c:url value='/Login/Login.Lingo'/>">로그인</a></li>
					<li><a class="member" href="<c:url value='/Login/Signup/Terms.Lingo'/>">회원가입</a></li>
				</c:if>
				
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li class="dropdown " id="drop">
				<a data-toggle="dropdown" class="dropdown-toggle" id="dropdownButton">
				메뉴 리스트<span class="caret"></span>
				</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li class="dropdown-header">목록</li>
						<li class="divider"></li>
						<li><a href="<c:url value='/Notice/Notice.Lingo'/>">공지사항</a></li>
						<li><a href="<c:url value='/Free/Free.Lingo'/>">자유게시판</a></li>
						<li><a href="<c:url value='/Question/FAQ.Lingo'/>">FAQ</a></li>
						<c:if test="${not empty sessionScope.loginDTO}">
							<li><a href="<c:url value='/Question/QNA.Lingo'/>">1:1 문의</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.loginDTO.ownerno}">
							<c:if test="${empty sessionScope.loginDTO.storeno}" var="result">
								<li><a href="<c:url value='/Shop/Apply.Lingo'/>">가게등록</a></li>
							</c:if>
							<c:if test="${not result}">
								<li><a href="<c:url value='/Shop/BlackList.Lingo'/>">블랙리스트신청</a></li>
							</c:if>
							<li><a href="<c:url value='/Shop/SalesCal.Lingo'/>">입출고내역서</a></li>
						</c:if>
						<!-- 테스트용 임시 (나중에 데이터 베이스 연동할때 수정) -->
						<li class="divider"></li>	
						<li><a href="<c:url value='/Reservation/Reservation.Lingo'/>">상세예약</a></li>
						<li class="divider"></li>
						<!-- 임시끝 -->
					</ul></li>

			</ul>
			<ul class="nav navbar-nav navbar-left" id="outline">
				<li><a href="<c:url value='/Notice/Notice.Lingo'/>">공지사항</a></li>
				<li><a href="<c:url value='/Free/Free.Lingo'/>">자유게시판</a></li>
				<li><a href="<c:url value='/Question/FAQ.Lingo'/>">FAQ</a></li>
				<c:if test="${not empty sessionScope.loginDTO}">
					<li><a href="<c:url value='/Question/QNA.Lingo'/>">1:1 문의</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.loginDTO.ownerno}">
					<c:if test="${empty sessionScope.loginDTO.storeno}" var="result">
						<li><a href="<c:url value='/Shop/Apply.Lingo'/>">가게등록</a></li>
					</c:if>
					<c:if test="${not result}">
						<li><a href="<c:url value='/Shop/BlackList.Lingo'/>">블랙리스트신청</a></li>
					</c:if>
					<li><a href="<c:url value='/Shop/SalesCal.Lingo'/>">입출고내역서</a></li>
				</c:if>
				<!-- 테스트용 임시 (나중에 데이터 베이스 연동할때 수정) -->
				<li class="divider"></li>				
				<li><a href="<c:url value='/Reservation/Reservation.Lingo'/>">상세예약</a></li>
				<c:if test="${empty sessionScope.loginDTO.ownerno}">
					<li><a href="<c:url value='/Reservation/ReservationList.Lingo'/>">예약목록</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.loginDTO.ownerno ? not empty sessionScope.loginDTO.storeno ? true : false : false }">
					<li><a href="<c:url value='/Reservation/reservationOwnerList.Lingo'/>">가게예약목록</a></li>
				</c:if>
				<li class="divider"></li>
				<!-- 임시끝 -->
			</ul>
		</div>
	</div>
	<!-- div:container-fluid -->
</nav>