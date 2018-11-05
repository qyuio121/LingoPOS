<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<script>
$(function(){
	$('#del_memo').click(function(){
			if(confirm("정말 삭제 하시겠습니까")){
				location.replace("<c:url value='/Notice/NoticeDelete.Lingo?noticeno=${record.noticeno}'/>");
			}
	});
});
</script>
<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-10">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 공지게시판 <small>공지글 보기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 상세보기 내용 예시 시작  -->
<!-- 상세보기 내용 예시 시작  -->
	<div class="row" >
		<table class="col-sm-10 table table-striped table-responsive ">
			<tr class="tsTitles">
				<th class="col-xs-9">공지제목 : <small>${record.title}</small></th><th>조회수 : <small>${record.count}</small></th>
			</tr>
			<tr class="tsTitles">		
				<th>글쓴이 : <small>${record.adminnick}</small></th><th>작성일 : <small>${record.postdate}</small></th>
			</tr>
			<tbody class="tsGroup">
				<tr>
					<th colspan="2">공지내용</th>
				</tr>
				<tr>
					<td>
						${record.content}	
					</td>
				</tr>
			</tbody>
		</table>
	</div>	
<!-- 상세보기 내용 예시 끝  -->
<!-- 버튼 3개 시작 -->
<!-- 버튼 3개 시작  DB연결 전까지 대기 시작 -->

	<div class="row">
		<div class="text-center">
			<c:if test="${sessionScope.loginDTO.adminno==record.adminno}">
				<a  href="<c:url value='/Notice/NoticeEdit.Lingo?noticeno=${record.noticeno}'/>"
					class="btn btn-success">수정</a>
				<a id="del_memo" href="#" class="btn btn-success">삭제</a>
			</c:if>
			<a href="<c:url value='/Notice/Notice.Lingo?nowPage=${nowPage}'/>" class="btn btn-success">목록</a>

		</div>
	</div>
<!-- 버튼 3개 시작  DB연결 전까지 대기 끝 -->

<!-- 버튼 3개 끝 -->
<!-- 내용 끝 -->
<br/><br/><br/>
</div>