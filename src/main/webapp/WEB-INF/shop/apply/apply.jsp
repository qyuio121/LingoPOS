<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 주소 API -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da1e05139c89159059ef2c519421cae8&libraries=services,clusterer,drawing"></script>
<!-- 사진 등록 plug in -->
<!-- 공통 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" >
<!-- 가게 -->
<script type="text/javascript" src="../js/spartan-multi-image-picker.js"></script>
<!-- 메뉴 -->
<script type="text/javascript" src="../js/spartan-multi-image-picker1.js"></script>

<!-- 유효성  검사 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>

<!-- 영업시간 -->
<link rel="stylesheet" href="../css/wickedpicker.css">
<script type="text/javascript" src="../js/wickedpicker.js"></script>


<script>
$(function(){
	var postcode;//우편번호 변수 설정
	var addr;//상세주소 변수 설정
	
	$('#frm').validate({
		rules:{
			name:"required",
			addr1:"required",
			addr2:"required",
			bigkind:"required",
			tel:"required",
			coba:"required",
			check:"required",
			hiddenFile :"required",
			table : "required"
			
		},messages:{
			name:"가게명을 입력하세요.",
			addr1:"우편번호를 입력하세요.",
			addr2:"주소를 입력하세요.",
			bigkind:"음식분류1를 선택하세요.",
			tel:"번호 앞자리를 입력하세요.",
			hiddenFile:"사진을 업로드하세요.",
			check:"가게정보  수집 동의에 체크하세요.",
			table : "테이블 수를 선택하세요."
		}});
	
	//validate
	$('#confirm').click(function(){
		if($('#frm').valid() && $('#hiddenStore').val() != "" && $('#startTime').val()!=$('#endTime').val()){
			
			$('#frm').submit();
		}else{
			if($('#hiddenStore').val() == "")
				$('#hiddenStore').next().html("가게사진을 업로드하세요");	
			if($('#hiddenMenu').val() == "")
				$('#hiddenMenu').next().html("메뉴사진을 업로드하세요");	
			if($('#startTime').val()==$('#endTime').val())
					$('.timeError').html("영업시간을 선택하세요");	
			return false;
		}
		
	})
	
	//영업시간 유효성검사 후 재 선택시 유효성 검사 끄기
	$(".time").on('change',function(){
		$('.timeError').html("");	
	})
	
	//주소 API
	$('.orgBtn').on("click",function(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                var value;
	                var jusoSangsae="";
	                var str = data.jibunAddress;   
	                str = str.split(" ");          
				 	if(data.userSelectedType == "J"){  
	                    for(var i =0;i<str.length;i++){
	                        if(str[i]==data.bname){     
	                            value=i;               
	                        }
	                    }
	                }else{
	                    str = data.roadAddress;        
	                    str = str.split(" ");         
	                    for(var i=0;i<str.length;i++){
	                        if(str[i]==data.roadname){
	                            value=i;               
	                        }
	                    }
	                }
	 				for(var i=value;i<str.length;i++){  
	                    jusoSangsae = jusoSangsae+str[i];
	                }
	 				addr = data.sido+" "+data.sigungu+" "+jusoSangsae;
	                postcode = data.postcode;
	                $("#addr1").val(postcode);
	              	$("#addr2").val(addr);
	              	$('#addr1Error').html("");	
	              	$('#addr2Error').html("");
	              	var geocoder = new daum.maps.services.Geocoder();
	    			geocoder.addressSearch($("#addr2").val(),function(result, status){
	    				 if (status === daum.maps.services.Status.OK) {
	    					 $('#x').val(result[0].x);
	    					 $('#y').val(result[0].y);
	    				 }
	    			});
	 			},
	        shorthand : false
	        }).open();
	});
	
	//사진 등록 plug in
	//가게 전경 및 내부 사진
	$("#coba").spartanMultiImagePicker({
		
		directUpload : {
			status: true, // activate direct upload
			url:'/lingopos/Shop/Store.Lingo',
			loaderIcon: '<i class="fas fa-sync fa-spin"></i>',
			success : function(data, textStatus, jqXHR){
				$('#hiddenFile').next().html("");	
			},
		}
	});
	
	//메뉴 사진
	$("#coba_Menu").spartanMultiImagePicker1({
		
		directUpload : {
			status: true, // activate direct upload
			url:'/lingopos/Shop/Menu.Lingo',
			loaderIcon: '<i class="fas fa-sync fa-spin"></i>',
			success : function(data, textStatus, jqXHR){
				$('#hiddenFile1').next().html("");	
			},
		}
	});
	
	//영업시간
	$('.timepicker').wickedpicker({twentyFour: true,minutesInterval:10,now: "0:00"});
	$('.timepicker-two').wickedpicker({twentyFour: true,minutesInterval:10,now: "0:00"});
	
});
</script>
<!-- 폼 모양 맞추는 css  -->
<style>
	#teltext1 {
		display:inline-block;
	}
	#teltext2 {
		display:inline-block;
	}
	h2{
		display:inline-block;
	}
	#lookup{
		display:inline-block;
	}
	#addr2{
		display:inline-block;
	}
	
</style>


<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />내 가게<small>등록하기</small></h2>
		</div>
	</div>
<!-- 바디 헤더 끝-->
<!-- 가게 등록 입력 폼 시작 --> 
	<form id="frm" class="form-horizontal" action='<c:url value="/Shop/Apply.Lingo"/>' method="post" accept-charset="UTF-8">
<!--가입 가게 이름 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">가게명</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" value="${storename }" name="storename" id="storename" readOnly>	    
			    <label for="name" class="error" style="color:red"></label>
			</div>
		</div>
<!-- 가입 가게 이름   끝-->
<!--주소명검색 시작 -->
		<div class="form-group">
		    <label class="col-sm-2 control-label">주소명</label>
		    <div class="col-sm-10">
		        <input type="text" class="form-control" placeholder="우편번호를 입력해주세요"  style="width: 20%"  name="addr1" id="addr1">
		        <input type="text" class="form-control" placeholder="주소를 입력해주세요"  style="width: 30%"  name="addr2" id="addr2">
		        <button type="button" value="button타입" class="orgBtn btn btn-primary" id="lookup">조회하기</button><!-- 조회하기 -->
		        
		        <input type="text" class="form-control" placeholder="상세주소를 입력해주세요"  style="width: 30%"  name="addr3" id="addr3">   
		    </div>
		    <label class="col-sm-2 control-label"></label>
		    <div class="col-sm-10">
		    	<label for="addr1" id="addr1Error" class="error" style="color:red"></label>
		    	<label for="addr2" id="addr2Error" class="error" style="color:red"></label>
		    	<label for="addr3" class="error" style="color:red"></label>
		    </div>
		</div>
<!-- 주소명검색  끝-->
<!--전화번호 시작 -->
	 	<div class="form-group">
			<label class="col-sm-2 control-label">가게전화번호</label>
			<div class="col-sm-10">
		        <input type="text" class="form-control" placeholder="가게 번호를 입력해주세요"  style="width: 20%"  name="tel" id="tel">
			</div>
		    <label class="col-sm-2 control-label"></label>
		    <div class="col-sm-10">
		    	<label for="tel" class="error" style="color:red"></label>
		    </div>
		</div>
<!-- 전화번호   끝-->		
<!-- 영업시간 시작 -->
		<div class="form-group">
			<label class="col-sm-2 control-label">영업시간</label>
			<div class="col-sm-10">
				<label class="control-label" for="timepicker">개장시간</label>
        		<input type="text" id="startTime" name="opentime" class="timepicker form-control time" style="width: 20%;display: inline-block"><br>
        		
        		<label class="control-label" for="timepicker-two">종료시간</label>
        		<input type="text" id="endTime" name="closetime" class="timepicker-two form-control time" style="width: 20%;display: inline-block"><br>
        		<label class="timeError" style="color:red"></label>  	
        	</div>
		</div>
<!-- 영업시간 끝 -->	
<!-- 테이블 수 받기 시작-->
		<div class="form-group">
			<label class="col-sm-2 control-label">가게 테이블 수</label>
			<div class="col-sm-10">
		    	<select class="form-control col-sm-4" style="width: 20%" id="tablenum" name="tablenum">
		      			<option value="">테이블 수</option>
		           	<c:forEach begin="5" end="15" var="i">
			            <option value="${i}">${i}</option>
			        </c:forEach>
		      	</select>
		    </div> 
		    <label class="col-sm-2 control-label"></label>
		    <div class="col-sm-10">
		    	<label for="table" class="error" style="color:red"></label>
		    </div>	
	    </div>	     	
<!-- 테이블 수 받기 끝-->
<!-- 음식 분류 AJAX 셀렉터 2개  시작 DB연결 DB로 대체 시작 -->
		<div class="form-group">
	    	<label  class="col-sm-2 control-label">음식분류</label>
	    	<div class="col-sm-10">
	      		<select class="form-control col-sm-4" style="width: 20%" id="bigkind" name="bigkind" >
		      		<option value="" >음식분류선택</option>
		            <option value="한식">한식</option>
		            <option value="양식">양식</option>
		            <option value="중식">중식</option>
		            <option value="일식">일식</option>
	      		</select>
	      	</div>
	    	<label  class="col-sm-2 control-label"></label>
	    	<div class="col-sm-10">
	    		<label for="bigkind" class="error" style="color:red"></label>
	    	</div>
	  	</div>
<!--음식 분류 AJAX 셀렉터 2개  시작 DB연결 DB로 대체 끝 -->

<!-- 메뉴 사진 시작  -->
		<div class="form-group">
			<label class="col-sm-2 control-label">메뉴 사진</label>
			<div class="col-md-8">
				<div class="row">
					<div id="coba_Menu" name="coba_Menu"></div>
				</div>
			</div>
			<div class="col-md-8">
						<input type="hidden" id="hiddenMenu" name="hiddenMenu"/> 
				<label class="col-sm-offset-3" style="color:red"></label>  
			</div>
		</div>	
<!-- 메뉴 사진  끝  -->
<!-- 가게 전경 및 내부 사진 시작  -->
		<div class="form-group">
			<label class="col-sm-2 control-label">가게 전경 및 내부 사진</label>
			<div class="col-md-8">
				<div class="row">
					<div id="coba" name="coba"></div>
				</div>
			</div>
			<div class="col-md-8">
				<input type="hidden" id="hiddenStore" name="hiddenStore"/>	
				<label class="col-sm-offset-3" style="color:red"></label>  
			</div>
		</div>	
<!-- 가게 전경 및 메뉴 사진 끝  -->
<!-- 가게정보  수집동의 체크란 시작-->
		<div class="form-group">
		    <label class="col-sm-2 control-label">가게정보  수집 동의</label>
		 	<div class="col-sm-10">
			  	<input type="checkbox" name="check" id="check" value="check">동의합니다.
			  	<h6><small>입력하시는 가게 정보는 원활한 가게 등록 및 관리를 위해 수집하여 5년간 보관합니다.</small></h6>
				<h6><small>(문의 종류에 따라 증빙서류 및 기타 정보가 수집될 수 있음)</small></h6>
				<label for="check" class="error" style="color:red"></label>
		    </div>
		 </div>
<!-- 가게정보 수집동의 체크란 시작 끝 -->	 
<!-- 버튼 2개 시작 - 문의하기 / 취소  -->
		<div class="form-group">
		  	<div class="col-sm-offset-2 col-sm-10">
		   		<button type="button" value="button타입" class="btn btn-primary" id="confirm">등록하기</button><!-- 문의하기 -->     
		   		<button type="button" value="button타입" class="btn btn-default" id="cancle">취소</button><!-- 취소 -->     
		  	</div>
		</div>
<!-- 버튼 2개 끝 - 문의하기 / 취소  -->	

		<input type="hidden" id="x" name="x"/>	
		<input type="hidden" id="y" name="y"/>  
	</form>	  
<!-- 가게 등록 입력 폼 끝 -->
<!-- 내용 끝 -->
</div>
