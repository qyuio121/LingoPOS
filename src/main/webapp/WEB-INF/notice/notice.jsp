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
				<c:forEach var="i" begin="1" end="10">
					<tr style="text-align: center">
						<td style="width: 5%">${i}</td>
						<td style="width: 50%">${command.title}</td>
						<td style="width: 10%">${command.id}</td>
						<td style="width: 20%">${command.regidate }</td>
						<td style="width: 5%">${gestCount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-xs-offset-19">
				<nav style="text-align: center" >
					<ul class="pagination pagination">
						<li>
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach var="i" begin="1" end="5">
							<li><a href="#">${i}</a></li>
						</c:forEach>
						<li>
							<a href="#" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>

	</div>

