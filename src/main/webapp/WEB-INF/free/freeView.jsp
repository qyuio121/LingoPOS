<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<script>
$(function(){
	//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/Comment/List.bbs'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:displayComments			
		});
	};
	
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	var displayComments	 = function(data){
		console.log(JSON.stringify(data));
		var commentString="<h3 style='fontColor:blue'>댓글란 </h3>";
		commentString+='<table class="table table-bordered">';
		commentString+='<tr><th width="15%">작성자</th><th width="50%">댓글</th><th width="20%">답변일</th><th>비고</th></tr>';
		if(data.length==0){
			commentString+="<tr><td colspan='4'>등록된 댓글이 없어요</td></tr>";
		}
		$.each(data,function(index,comment){			
			commentString+='<tr><td>'+comment['NAME']+'</td>';
			if('${sessionScope.id}' != comment["ID"])
				commentString+='<td align="left">'+comment['ONELINECOMMENT']+'</td>'; 
			else
				commentString+='<td align="left"><span style="cursor:pointer" class="commentEdit" title="'+comment["CNO"]+'">'+comment['ONELINECOMMENT']+'</span></td>'; 		
			commentString+='<td>'+comment['CPOSTDATE']+'</td>';
			commentString+='<td>';
			if('${sessionScope.id}' == comment["ID"])
				commentString+='<span  class="commentDelete" title="'+comment["CNO"]+'" style="cursor: pointer; color: green; font-size: 1.4em; font-weight: bold">삭제</span>';
			else
				commentString+='<span style="color: gray; font-size: 0.7em; font-weight: bold">답변대기</span>';
			commentString+='</td></tr>';
		});		
		commentString+='</table>';
		
		$('#comments').html(commentString);
		
		//코멘트 수정/삭제 처리
		$('.commentEdit').click(function(){
			//cno값 출력
			console.log($(this).attr("title"));
			$('#title').val($(this).html());
			$('#submit').val('수정');
			//form의 hidden속성중 name="cno"값 설정
			$('input[name=cno]').val($(this).attr("title"));
			
		});
		
		$('.commentDelete').click(function(){			
			var cno_value = $(this).attr("title");
			
			$.ajax({
				url:"<c:url value='/Question/QNADelete.Lingo'/>",
				data:{cno:cno_value,no:${record.no}},
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);					
				}		
			});		
			
			
		});

	};
	
	$(function(){
		//페이지 로드시 코멘트 목록 뿌려주기
		showComments(${record.no});
	
		//코멘트 입력처리]
		$('#submit').click(function(){	
//DB 연결 후 운영자 답변 테이블 추가 필요//			
			if($(this).val()=='등록')
				var action="<c:url value='#'/>";
			else
				var action="<c:url value='#'/>";	
//DB 연결 후 운영자 답변 테이블 추가 필요//				
			$.ajax({
				url:action,
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);
					if($('#submit').val()=='수정'){						
						$('#submit').val('등록');
						$('#title').val('');
					}
					
				}		
			});		
			
		});
//Message.jsp 파일 필요		
		//메모글 삭제처리]
		$('#del_memo').on('click',function(){
			if(confirm('답변한 내용을  삭제하실겁니까?')){
				location.replace("<c:url value='/Question/QNADelete.Lingo=${record.no}'/>");				
			}
		});
	});
</script>
<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />자유게시판<small>게시글 보기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 상세보기 내용 예시 시작  -->
	<div class="row" >
		<table class="col-sm-10 table table-striped table-responsive ">
			<tr class="tsTitles">
				<th class="col-xs-9">제목 : <small>노가리 잡담</small></th><th>조회수 : <small>1</small></th>
			</tr>
			<tr class="tsTitles">		
				<th>글쓴이 : <small>김남섭</small></th><th>작성일 : <small>2018/09/10</small></th>
			</tr>
			<tbody class="tsGroup">
				<tr>
					<th colspan="2">내용</th>
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
<!-- DB연결시 관리자만 보일 문의 답변 입력 폼  시작 -->
	<div class="row">
		<h3>댓글 입력 폼</h3>
		<form class="form-inline" id="frm" >
			<input type="hidden" name="no" value="${record.no}" />
			<!-- 수정 및 삭제용 파라미터 -->
			<input type="hidden" name="cno" />
			<input placeholder="댓글을 입력하세요" id="title" class="form-control" type="text" size="50" name="onelinecomment" />
			<input class="btn btn-primary" id="submit" type="button" value="등록" /></td>
				
		</form>
	</div>
<!-- DB연결시 관리자만 보일 문의 답변 입력 폼  끝 -->
<!-- DB연결시 답변 목록 시작 -->
	<div class="row" id="comments">
	</div>
<!-- DB연결시 답변 목록 끝 -->
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
	