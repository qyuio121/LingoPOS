<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container" style="padding-top:60px;margin-top:60px">
		<div >
			<img src='<c:url value="/Images/eventLogo.png"/>' alt="이벤트 이미지" style="width: 100%;height: 200px" />
		</div>
		<div >
			<div class="row">
				<div class="col-xs-6">
					<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 공지사항</h2>
				</div>
				<div class="col-xs-6">
					<form class="navbar-form navbar-right" id="gtBtn" style="margin-top: 50px" action="#" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="searchtext" placeholder="검색" >
						</div>
						<button type="submit" class="btn btn-default" style="margin-left: -3px">검색</button>
					</form> 
				</div>
			
			</div>
			
			<table class="table table-bordered">
				<tr style="text-align: center;font-weight:bold;background-color: #EAEDED">
					<td style="width: 5%">NO</td>
					<td style="width: 50%">공지제목</td>
					<td style="width: 10%">글쓴이</td>
					<td style="width: 20%">작성일</td>
					<td style="width: 7%">조회수</td>
				</tr>
				<c:if test="${not empty list}" var="result">
				<c:forEach items="${list}" var="item" varStatus="loop">
					<tr style="text-align: center">
						<td style="width: 5%">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
						<td style="width: 50%">
						<a href="<c:url value='/Notice/NoticeView.Lingo?noticeno=${item.noticeno}'/>">
						${item.title}
						</a></td>
						<td style="width: 10%">${item.adminnick}</td>
						<td style="width: 20%">${item.postdate }</td>
						<td style="width: 5%">${item.count}</td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${not result}">
					<td colspan="5" align="center">
						게시물이 없습니다.
					</td>
				</c:if>
			</table>
		</div>
		${pageString}
	</div>

