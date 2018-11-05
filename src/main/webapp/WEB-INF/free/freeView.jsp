<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<script>

	//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/Comment/Comment.Lingo'/>",
			data:{freeno:key},
			dataType:'json',
			type:'post',
			success:displayComments			
		});
	};
	
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	var displayComments	 = function(data){
			console.log(JSON.stringify(data));
			var commentString="<h3 style='fontColor:blue'>댓글 목록 </h3>";
			commentString+='<table class="table table-bordered">';
			commentString+='<tr><th width="15%">작성자</th><th width="50%">한줄 댓글</th><th width="20%">댓글일</th><th>삭제여부</th></tr>';
			if(data.length==0){
				commentString+="<tr><td colspan='4' style='text-align:center'>등록된 댓글이 없어요</td></tr>";
			}
		$.each(data,function(index,comment){			
			commentString+='<tr><td>'+comment['id']+'</td>';
			commentString+='<td align="left">'+comment['comment']+'</td>'; 
			commentString+='<td>'+comment['commentdate']+'</td>';
			commentString+='<td>';
			if('${sessionScope.loginDTO.id}' == comment["id"])
				commentString+='<span class="commentDelete" title="'+comment["commentno"]+'" style="cursor: pointer; color: green; font-size: 1.4em; font-weight: bold">삭제</span>';
			else
				commentString+='<span style="color: gray; font-size: 0.7em; font-weight: bold">삭제불가</span>';
			commentString+='</td></tr>';
		});		
		commentString+='</table>';
		
		$('#comments').html(commentString);
		
		//코멘트 삭제 처리
		
		$('.commentDelete').click(function(){			
			var cno_value = $(this).attr("title");
			
			$.ajax({
				url:"<c:url value='/Comment/CommentDelete.Lingo'/>",
				data:{commentno:cno_value,freeno:${record.freeno}},
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
		showComments(${record.freeno});
	
		//코멘트 입력처리]
		$('#submit').click(function(){				
			$.ajax({
				url:"<c:url value='/Comment/CommentWrite.Lingo'/>",
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);
				}		
			});		
			$("#comment").val("");
		});		
		$('#del_memo').click(function(){
			if(confirm("정말 삭제 하시겠습니까")){
				location.replace("<c:url value='/Free/FreeDelete.Lingo?freeno=${record.freeno}'/>");
			}
		});
	});
</script>
<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-10">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 자유게시판<small>게시글 보기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 상세보기 내용 예시 시작  -->
	<div class="row" >
		<table class="col-sm-10 table table-striped table-responsive ">
			<tr class="tsTitles">
				<th class="col-xs-9">제목 : <small>${record.title}</small></th><th>조회수 : <small>${record.count}</small></th>
			</tr>
			<tr class="tsTitles">		
				<th>글쓴이 : <small>${record.id}</small></th><th>작성일 : <small>${record.postdate}</small></th>
			</tr>
			<tbody class="tsGroup">
				<tr>
					<th colspan="2">내용</th>
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
	<div class="row">
		<div class="text-center">
			<c:if test="${sessionScope.loginDTO.id==record.id }">
				<a href="<c:url value='/Free/FreeEdit.Lingo?freeno=${record.freeno}'/>" class="btn btn-primary">수정</a>
				<a id="del_memo" href="#" class="btn btn-primary">삭제</a>
			</c:if>
			<a href="<c:url value='/Free/Free.Lingo?searchWord=${param.searchWord}&searchColumn=${param.searchColumn}&nowPage=${param.nowPage}'/>" class="btn btn-primary">목록</a>
		</div>
	</div>	

	<div class="row">
		<c:if test="${not empty sessionScope.loginDTO.id}">
			<h3>댓글 입력 폼</h3>
			<form class="form-inline" id="frm" >
				<input type="hidden" name="freeno" value="${record.freeno}" />
				<!-- 수정 및 삭제용 파라미터 -->
				<input type="hidden" name="id" value="${sessionScope.loginDTO.id}" />
				<input placeholder="댓글을 입력하세요" id="comment" class="form-control" type="text" size="50" name="comment" />
				<input class="btn btn-primary" id="submit" type="button" value="등록" />	
			</form>
		</c:if>
	</div>

		<div class="row" id="comments">
		</div>

<br/><br/><br/>
</div>
	