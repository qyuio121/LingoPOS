<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> QNA <small>미답변 리스트</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 테이블 시작 -->
	<div class="row">
		<div class="table-responsive ">
			<table class="table table-bordered">
				<tr class="tsTitles" style="text-align: center; font-weight:bold;background-color: #EAEDED">
						<th class="col-md-1 text-center">글번호</th>
						<th class="col-md-1 text-center">문의자</th>
						<th class="col-md-2 text-center">문의유형</th>
						<th class="text-center">문의제목</th>
						<th class="col-md-2 text-center">문의일</th>
				</tr>
				<c:if test="${empty records }" var="isEmpty">
					<tr style="text-align: center">
						<td colspan="5">등록하신 문의가 없어요</td>
					</tr>
				</c:if> 
					<c:if test="${not isEmpty}">
						<c:forEach var="record" items="${records}" varStatus="loop">
							<tr>
								<td style="text-align: center;">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
								<td style="text-align: center;">${record.id}</td>
								<td style="text-align: center;">${record.kind}</td>
								<td style="text-align: center;"><a href="<c:url value='/Question/QNAView.Lingo?qnano=${record.qnano}&nowPage=${nowPage}'/>">${record.title}</a></td>
								<td style="text-align: center;">${record.postdate}</td>
							</tr>
						</c:forEach>
					</c:if>
										
			</table>
		</div>
	</div>
<!-- 테이블 끝 -->
<!-- 페이징  시작-->
	<div class="row">
		<div>${pageString}</div>
	</div>
<!-- 페이징  끝-->

<!-- 내용 끝 -->   
</div>