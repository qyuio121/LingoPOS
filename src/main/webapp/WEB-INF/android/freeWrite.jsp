<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
 
<!-- 서머노트  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

<!-- 서머노트 한글화 -->
<script src="../js/summernote-ko-KR.js" charset="utf-8"></script>
	
<script>
$(function(){
	$('#confirm').click(function(){
		$('#frm').submit();
	})
	$('#cancle').click(function(){
		history.back();
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
	        ['insert', ['link']],
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

	
});	
</script>

<div class="container" >
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-12">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />자유게시판<small>게시판 등록</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 폼 시작 -->
 	<form id="frm" class="form-horizontal" method="post" action='<c:url value="/Android/FreeWrite.Lingo"/>'>
<!-- 제목 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-7">
   				<input type="text" class="form-control" placeholder="제목을 입력해주세요"  name="title" id="title" />
   			</div>
		</div>
<!-- 제목   끝-->
<!-- 문의 내용 시작  -->
		<div class="form-group">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea name="content" id="summernote"></textarea>
			</div>
		</div>
<!-- 문의 내용 끝  -->

<!-- 버튼 2개 시작 - 문의하기 / 취소  -->
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10" >
 			<button type="button" value="button타입" class="btn btn-primary col-sm-offset-3" id="confirm">등록하기</button>     
			<button type="button" value="button타입" class="btn btn-default" id="cancle">취소</button>     
  		</div>
	</div>
<input type="hidden" name="id" value="${sessionScope.loginDTO.id}">
</form>
<!-- 폼 시작 -->    
<!-- 내용 끝 -->   
</div>