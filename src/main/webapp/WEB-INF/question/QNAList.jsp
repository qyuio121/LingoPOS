<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 테이블솔트 css  -->
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/tablesorter.css">
    
    <!-- 테이블솔트 js -->
    <script src="../js/modernizr-2.8.3.min.js"></script>
    <script src="../js/tablesorter.js"></script>
   	<script src="../js/main.js"></script>
    
<script>
$(function(){
	$("table.sort").tablesorter({tablesorterColumns: [{col: 0, order: 'desc'}]});
});
</script> 

<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="page-header">
		<h1>QNA<small>1:1문의 리스트</small></h1>
	</div>
	<div>
			<img alt="asdf" src="../Images/apple.png" style="width: 100%;height: 150px;">
	</div>
<!-- 바디 헤더 끝-->
<!-- 문의등록 버튼 시작 -->
	<div class="row" style="margin-bottom: 10px">
		<div class="text-right">
			<a href="<c:url value='/Question/QNA.Lingo'/>"
				class="btn btn-primary">문의하기</a>
		</div>
	</div>
<!-- 문의등록 버튼 끝-->
<!-- 테이블 시작 -->
	<div class="row">
		<div class="table-responsive">
			<table class="ts sort table table-striped table-bordered table-hover">
				<thead>
					<tr class="tsTitles">
						<th class="col-md-1 text-center">문의답변</th>
						<th class="col-md-1 text-center">문의유형</th>
						<th class="text-center">문의제목</th>
						<th class="col-md-1 text-center">문의일</th>
					</tr>
				</thead>
				<tbody class="tsGroup"> 
						<tr><td>답변완료</td><td>11</td><td>11</td><td>11</td></tr>
						<tr><td>미완료</td><td>22</td><td>22</td><td>22</td></tr>
						<tr><td>답변완료</td><td>33</td><td>33</td><td>33</td></tr>
						<tr><td>미완료</td><td>44</td><td>44</td><td>44</td></tr>	
				</tbody>	
<!-- DB연결 후 재조정  시작 -->					
				<!-- 
				<c:if test="${empty requestScope.list }" var="isEmpty">
					<tr>
						<td colspan="4">등록하신 문의가 없어요</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="record" items="${list}" varStatus="loop">
							<tr>
								<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
								<td class="text-left">
								 <a	href="<c:url value='/BBS/View.bbs?no=${record.no}'/>">${record.title }</a>
								 <span class="badge">${record.commentCount}</span>
								</td>
								<td>${record.name}</td>
								<td>${record.postdate}</td>
							</tr>
					</c:forEach>
				</c:if>
				 -->
<!-- DB연결 후 재조정  끝 -->						
			</table>
		</div>
	</div>
<!-- 테이블 끝 -->
<!-- 페이징  시작-->
	<div class="row">
		<div>${pagingString}</div>
	</div>
<!-- 페이징  끝-->
<!-- 검색용 UI 끝 -->
	<div class="row">
		<div class="text-center">
			<form class="form-inline" method="post"
				action="<c:url value='/Question/QNAList.Lingo'/>">
				<div class="form-group">
					<select name="searchColumn" class="form-control">
						<option value="title">답변여부</option>
						<option value="name">문의유형</option>
						<option value="content">문의제목</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" name="searchWord" class="form-control" />
				</div>
				<button type="submit" class="btn btn-primary">검색</button>
	
			</form>
		</div>
	</div>
<!-- 검색용 UI 끝 -->
<!-- 내용 끝 -->   
</div>
