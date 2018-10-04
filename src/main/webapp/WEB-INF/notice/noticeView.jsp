<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<script>
$(function(){
	});
</script>
<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />공지게시판<small>공지글 보기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 상세보기 내용 예시 시작  -->
<!-- 상세보기 내용 예시 시작  -->
	<div class="row" >
		<table class="col-sm-10 table table-striped table-responsive ">
			<tr class="tsTitles">
				<th class="col-xs-9">공지제목 : <small>공지합니다</small></th><th>조회수 : <small>1</small></th>
			</tr>
			<tr class="tsTitles">		
				<th>글쓴이 : <small>김남섭</small></th><th>작성일 : <small>2018/09/10</small></th>
			</tr>
			<tbody class="tsGroup">
				<tr>
					<th colspan="2">공지내용</th>
				</tr>
				<tr>
					<td>
						연결용한줄</br>연결용한줄</br>연결용한줄</br>연결용한줄</br>연결용한줄</br>연결용한줄</br>
					</td>
				</tr>
			</tbody>
		</table>
	</div>	
<!-- 상세보기 내용 예시 끝  -->
<!-- 버튼 3개 시작 -->
<!-- 버튼 3개 시작  DB연결 전까지 대기 시작 -->
	<!-- 
	<div class="row">
		<div class="text-center">
			<c:if test="${sessionScope.id==record.id }">
				<a  href="<c:url value='/BBS/Edit.bbs?no=${record.no}'/>"
					class="btn btn-success">수정</a>
				<a id="del_memo" href="#" class="btn btn-success">삭제</a>
			</c:if>
			<a href="<c:url value='/BBS/List.bbs'/>" class="btn btn-success">목록</a>

		</div>
	</div>
	 -->
<!-- 버튼 3개 시작  DB연결 전까지 대기 끝 -->
<!-- 버튼 3개 예시 시작 -->
	<div class="row">
		<div class="text-center">
			<a  href="<c:url value='#'/>" class="btn btn-primary">수정</a>
			<a id="del_memo" href="#" class="btn btn-primary">삭제</a>
			<a href="<c:url value='#'/>" class="btn btn-primary">목록</a>
		</div>
	</div>			
<!-- 버튼 3개 예시 끝 -->
<!-- 버튼 3개 끝 -->
<!-- 내용 끝 -->
</div>
	