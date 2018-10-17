<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<!-- 유효성검사 -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
 
<!-- 서머노트  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

<!-- 서머노트 한글화 -->
<script src="../js/summernote-ko-KR.js" charset="utf-8"></script>

 
<script>
$(function(){
	//사진 업로드 시 서버에 저장된 사진제목 저장할 배열
	var realImage =[];
	
	//유효성검사
	$('#frm').validate({
		rules:{
			title:"required",
		},messages:{
			
			title:"공지제목을 입력하세요",
		}});
		
	//공지등록 시  공지리스트로	
	$('#confirm').click(function(){
		if($('#frm').valid() && $('#summernote').val() != ""){
			$('#frm').submit();
		}
		else if($("#summernote").val() == "")
			$("#error").html("공지내용을 입력하세요");	
	})
	
	//서머노트  유효성검사 후 재 작성시 유효성 검사 끄기
	$('#summernote').on('summernote.change', function(we, contents, $editable) {
		$("#error").html("");	
	});


	//공지취소 시 전페이지로	
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
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />공지게시판<small>공지 수정</small></h2>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 폼 시작 -->
 <form id="frm" class="form-horizontal" method="post" action='<c:url value="/Notice/NoticeEdit.Lingo"/>'>
<!-- 제목 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">공지제목</label>
			<div class="col-sm-7">
   				<input type="text" class="form-control" placeholder="공지제목을 입력해주세요"  name="title" value="${record.title}">
   				
				<label for="title" class="error" style="color:red"></label>
  			</div>
		</div>
<!-- 제목   끝-->
<!-- 공지 내용 시작  -->
		<div class="form-group">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
<!-- 서머노트 시작 -->			
				<textarea name="content" id="summernote">${record.content}</textarea>
				<label style="color:red" id="error"></label>  
<!-- 서머노트 끝 -->				
		  	</div>
		</div>
<!-- 문의 내용 끝  -->

<!-- 버튼 2개 시작 - 등록하기 / 취소  -->
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10" >
 			<button type="button" value="button타입" class="btn btn-primary col-sm-offset-3" id="confirm">수정하기</button>     
			<button type="button" value="button타입" class="btn btn-default" id="cancle">취소</button>     
  		</div>
	</div>
	
<!-- 버튼 2개 끝 - 등록하기 / 취소  -->
	<input type="hidden" name="noticeno" value="${param.noticeno}">
	
</form>
<!-- 폼 시작 -->    
<!-- 내용 끝 -->   
</div>
