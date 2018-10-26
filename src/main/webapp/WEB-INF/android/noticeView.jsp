<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
<script>
</script>
<div class="container" >
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 50px" />공지글</h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 상세보기 내용 예시 시작  -->
<!-- 상세보기 내용 예시 시작  -->
	<div class="row" >
		<table class="table table-bordered table-responsive ">
			<tr class="tsTitles">
				<th class="col-xs-9">공지제목 : <small>${record.title}</small></th>
			</tr>
			<tr class="tsTitles">
				<th>조회수 : <small>${record.count}</small></th>
			<tr>	
			<tr class="tsTitles">		
				<th>글쓴이 : <small>${record.adminnick}</small></th>
			</tr>
			<tbody class="tsGroup" >
			<tr>
				<td>
					${record.content}	
				</td>
			</tr>
			</tbody>
		</table>
	</div>	
	<a href="<c:url value='/Android/Notice.Lingo?nowPage=${nowPage}'/>" class="btn btn-success">목록</a>
<!-- 상세보기 내용 예시 끝  -->
<!-- 내용 끝 -->
<br/><br/><br/>
</div>