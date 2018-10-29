<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>     
    
    
	<div class="container">
	<div class="row">
		<div class="col-xs-6">
			<h2>
				<img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 30px" /> 자유게시판
			</h2>
		</div>
		<div class="col-xs-6">
			<form class="navbar-form navbar-right" id="gtBtn" style="margin-top: 50px" action="<c:url value='/Android/Free.Lingo'/>" method="get">
				<div class="form-group">
					<select name="searchColumn" class="form-control">
				       <option value="title">제목</option>
				       <option value="id">작성자</option>
				       <option value="content">내용</option>
				    </select>
					<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
				</div>
				<button type="submit" class="btn btn-default" style="margin-left: -3px">검색</button>
			</form>
		</div>
	</div>
	<table class="table table-bordered">
		<tr
			style="text-align: center; font-weight: bold; background-color: #EAEDED">
			<td style="width: 5%">NO</td>
			<td style="width: 50%">제목</td>
			<td style="width: 20%">글쓴이</td>
		</tr>
		<c:if test="${not empty list}" var="result">
				<c:forEach items="${list}" var="item" varStatus="loop">
					<tr style="text-align: center">
						<td style="width: 5%">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
						<td style="width: 50%">
						<a href="<c:url value='/Android/FreeView.Lingo?freeno=${item.freeno}&searchColumn=${param.searchColumn}&searchWord=${param.searchWord}&nowPage=${nowPage}'/>">
						${item.title}
						</a><small class="badge">${item.commentcount}</small></td>
						<td style="width: 10%">${item.id}</td>
					</tr>
				</c:forEach>
		</c:if>
				<c:if test="${not result}">
					<td colspan="5" align="center">
						게시물이 없습니다.
					</td>
		</c:if>
	</table>
	<c:if test="${not empty sessionScope.loginDTO.id}" var="result">
		<div class="row">
			<div class="btn-group btn-group-justified" role="group" aria-label="...">
				<div class="col-xs-12" >
					<div class="btn-toolbar pull-right" >
					  	<div class="btn-group " role="group">
					    	<a href="<c:url value='/Android/FreeWrite.Lingo'/>"><button type="button" class="btn btn-primary" id="updateBtn">등록</button></a>
					  	</div>
					</div>
			  	</div>
			</div>
		</div>
	</c:if>
	${pageString}
</div>
<c:forEach begin="0" end="${25-fn:length(list)}" step="1">
	<br/>
</c:forEach>

