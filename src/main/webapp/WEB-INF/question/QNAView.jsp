<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 서머노트  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

<!-- 서머노트 한글화 -->
<script src="../js/summernote-ko-KR.js" charset="utf-8"></script>
    
<script>
$(function(){
		$('#del_memo').click(function(){
				if(confirm("정말 삭제 하시겠습니까")){
					location.replace("<c:url value='/Question/QNADelete.Lingo?qnano=${record.qnano}'/>");
				}
		});
		$('#del_reply').click(function(){
			if(confirm("정말 삭제 하시겠습니까")){
				location.replace("<c:url value='/Reply/ReplyDelete.Lingo?replyno=${reply.replyno}&qnano=${record.qnano}'/>");
			}
		});
		//사진 업로드 시 서버에 저장된 사진제목 저장할 배열
		var realImage =[];
		
		//문의등록 시  문의리스트로	
		$('#confirm').click(function(){
			if($('#summernote').val() != ""){
				$('#frm').submit();
			}
			else if($("#summernote").val() == ""){
				$("#error").html("답변내용을 입력하세요");
				return false;
			}
		})

		//서머노트 
		$('#summernote').summernote({
			height: 300,
		    minHeight: null,
		    maxHeight: null,
		    focus: true,
		    lang: 'ko-KR',
		  	toolbar: [
		      	['style', ['bold', 'italic', 'underline', 'clear']],
		        ['fontNames', ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New']],
		        ['fontsize', ['fontsize']],
		        ['color', ['color']],
		        ['para', ['ul', 'ol', 'paragraph']],
		        ['height', ['height']],
		        ['insert', ['link', 'picture']],
		        ['table', ['table']],
		    ],
			callbacks: {
		    	onImageUpload: function(files, editor, welEditable) {
			    	for(var i = files.length - 1; i >= 0; i--) {
			        	sendFile(files[i], this);
			        }
			    },
			    onMediaDelete : function(target, editor, welEditable){
			    	summernoteDeleteImage(target[0].src);
	 			}   
			}
		});
		
		//서머노트 이미지 업로드
		function sendFile(file, el) {
			var form_data = new FormData();
		    form_data.append('upload', file);
		    $.ajax({
				data: form_data,
			    type: "POST",
			    url: '<c:url value="/Image/Image.Lingo"/>',
			    cache: false,
			    contentType: false,
			    enctype: 'multipart/form-data',
			    processData: false,
			    success: function(url) {
					$(el).summernote('editor.insertImage', url);
					realImage.push(url.substr(url.lastIndexOf("/")+1));
					console.log(realImage+"업로드된 모든 이미지");
					}
		    });
		}
		
		//서머노트 업로드된 이미지 삭제
		function summernoteDeleteImage(file){
			  var remove = file.substr(file.lastIndexOf("/")+1);
			  var fileRemove = "removeFile="+remove;
			  $.ajax({
		        data: fileRemove,
		        type: "GET",
		        url: '<c:url value="/Image/Image.Lingo"/>',
		        cache: false,
		        contentType: false,
		        processData: false,
		        success: function() {
		        	realImage = jQuery.grep(realImage, function(value) { 
		        		return value != remove; });
					console.log(realImage+"삭제 후 서버에 저장된 이미지");
		        }
		    });
		}
});
</script>
<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />QNA<small>1:1문의 상세보기</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 상세보기 내용 예시 시작  -->
	<div class="row" >
		<table class="col-sm-10 table table-striped table-responsive ">
			<tr class="tsTitles">
				<th class="col-xs-9">문의제목 : <small>${record.title}</small></th><th>문의유형 : <small>${record.kind}</small></th>
			</tr>
			<tr class="tsTitles">		
				<th>문의일 : <small>${record.postdate}</small></th><th>답변여부 : <small>${reply.replyno!=null?'답변완료':'미완료'}</small></th>
			</tr>
			<tbody class="tsGroup">
				<tr>
					<th colspan="2">문의내역</th>
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
<!-- DB연결시 관리자만 보일 문의 답변 입력 폼  시작 -->
	<div class="row" >
		<c:if test="${not empty reply.replyno}" var="result">	
			<table class="col-sm-10 table table-striped table-responsive ">
				<tbody class="tsGroup">
						<tr>
							<th>답변내역</th>
						</tr>
						<tr>
							<td>
								${reply.content}
							</td>
						</tr>
					</tbody>
			</table>
			<c:if test="${not empty sessionScope.loginDTO.adminno}">
				<div class="row">
					<div class="text-center">
						<a id="del_reply" href="#" class="btn btn-success">답변삭제</a>
					</div>
				</div>
			</c:if>
		</c:if>
		<c:if test="${not result}" var="result">
			<c:if test="${empty sessionScope.loginDTO.adminno}" var="res">
				<table class="col-sm-10 table table-striped table-responsive ">
					<tbody class="tsGroup">
						<tr>
							<th>답변내역</th>
						</tr>
						<tr>
							<td style="text-align: center">
								아직 답변이 도착하지 않았어요!
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${not res}" var="res">
				<label class="col-sm-2 control-label">답변내용</label>
				<form id="frm" class="form-horizontal" method="post" action='<c:url value="/Reply/ReplyWrite.Lingo"/>'>
					<div class="form-group">	
						<div class="col-sm-12">
							<textarea name="content" id="summernote"></textarea>
							<label style="color:red" id="error"></label>  			
					  	</div>
					</div>
					<input type="hidden" name="qnano" value="${record.qnano}"/>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" >
				 			<button type="button" class="btn btn-primary col-sm-offset-11" id="confirm">등록하기</button>     
				  		</div>
					</div>
				</form>
			</c:if>
		</c:if>
		<br/><br/>
	</div>


	<div class="row">
		<div class="text-center">
			<a  href="<c:url value='/Question/QNAEdit.Lingo?qnano=${record.qnano}'/>"
					class="btn btn-success">수정</a>
			<a id="del_memo" href="#" class="btn btn-success">삭제</a>
			<a href="<c:url value='/Question/QNA.Lingo?nowPage=${nowPage}'/>" class="btn btn-success">목록</a>
		</div>
	</div>		
<!-- 버튼 3개 예시 끝 -->
<!-- 버튼 3개 끝 -->
<!-- 내용 끝 -->
<br/><br/><br/><br/>
</div>
	