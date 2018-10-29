<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>     
    
    
	<div class="container">
		<div >
			<div class="row">
				<div class="col-xs-12">
					<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 공지사항</h2>
				</div>
			</div>
			<table class="table table-bordered">
				<tr style="text-align: center;font-weight:bold;background-color: #EAEDED">
					<td style="width: 5%">NO</td>
					<td style="width: 50%">공지제목</td>
					<td style="width: 20%">작성일</td>
					
				</tr>
				<c:if test="${not empty list}" var="result">
				<c:forEach items="${list}" var="item" varStatus="loop">
					<tr style="text-align: center">
						<td style="width: 5%">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
						<td style="width: 50%">
						<a href="<c:url value='/Android/NoticeView.Lingo?noticeno=${item.noticeno}&nowPage=${nowPage}'/>">
						${item.title}
						</a></td>
						<td style="width: 20%">${item.postdate}</td>
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
	<c:forEach begin="0" end="${15-fn:length(list)}" step="1">
		<br/>
	</c:forEach>

