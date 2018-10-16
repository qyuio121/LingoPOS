<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 아코디언 css -->
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" />

<!-- 탭css -->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/swichTab.css">

<!-- 탭 js -->
<script src="../js/jquery.swichTab.js" charset="utf-8"></script>

<script>
$(function(){
	//탭
	 $('.tabGroup2').swichTab({
      cahngePanel: 'fade',
      swiper: true,
      index: 0,
    });
	
	//아코디언
	$(".set > a").on("click", function() {
		    if ($(this).hasClass("active")) {
		      $(this).removeClass("active");
		      $(this)
		        .siblings(".content")
		        .slideUp(200);
		      $(".set > a i")
		        .removeClass("fa-minus")
		        .addClass("fa-plus");
		    } else {
		      $(".set > a i")
		        .removeClass("fa-minus")
		        .addClass("fa-plus");
		      $(this)
		        .find("i")
		        .removeClass("fa-plus")
		        .addClass("fa-minus");
		      $(".set > a").removeClass("active");
		      $(this).addClass("active");
		      $(".content").slideUp(200);
		      $(this).next().slideDown(200);
		     }
		  });
});
</script>



<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-6">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />FAQ<small>자주묻는질문</small></h2>
		</div>
	</div>		
<!-- 바디 헤더 끝-->
<!-- 탭 바 시작-->
	<div class="tabGroup tabGroup2">
		<ul class="swichtab-controller">
	        <li data-swichtab="controller"><a href="#tab1">나의정보관리</a></li>
	        <li data-swichtab="controller"><a href="#tab2">가게등록</a></li>
	        <li data-swichtab="controller"><a href="#tab3">찾기/예약</a></li>
	        <li data-swichtab="controller"><a href="#tab4">모바일/기타</a></li>
    	</ul>
<!-- 탭 바 끝-->	
<!-- 탭 바 내 아코디언 시작-->
	<div class="swichtab-contents">
<!-- #faq1 -->	
		  <div id="tab1" class="swichtab-panel" data-swichtab="target">
			<div class="accordion-container">
				<div class="set">
					<a href="#" >회원탈퇴는 어떻게 하나요?<i class="fa fa-plus"></i></a>
		  			<div class="content">
			       		<h3 style="color:red">√ PC 로그인 > 마이페이지 > 회원정보 수정 > 탈퇴하기</h3>
		                <p>
							ㆍ회원탈퇴는 위메프 사이트 마이페이지 >회원정보수정에서 페이지 하단의 회원탈퇴 버튼을 클릭하시면 즉시 탈퇴됩니다.<br>
							ㆍ회원탈퇴는 PC에서만 가능합니다.<br>
							ㆍ탈퇴 전, 반드시 아래 유의사항을 확인하여 주시기 바랍니다.<br>
							ㆍ회원탈퇴 시, 유의 사항<br>
							 &nbsp;&nbsp;1) 회원탈퇴 후에는 구매내역 확인이 불가합니다.<br>
							 &nbsp;&nbsp;&nbsp;&nbsp;단, 위메프에서 구매한 쿠폰상품 중 사용하지 않은 쿠폰을 탈퇴 후에도 사용하실 수 있으니,탈퇴 전 마이페이지 > 구매목록에서 티켓번호를 미리 출력해 주시기 바랍니다.<br>
							 &nbsp;&nbsp;2) 회원탈퇴 시, 남아있는 위메프포인트는 소멸되어 재가입을 하시더라도 소멸된 위메프포인트는 복구되지 않습니다.<br>
							 &nbsp;&nbsp;3) 탈퇴 후 5일간 재가입이 불가합니다. 재가입 후에도 기존 회원정보가 삭제되어 구매내역이 연결되지 않습니다.<br>
							ㆍ'전자상거래 등에서의 소비자 보호에 관한 법률 제 6조 (거래기록의 보존 등)'에 따라, 탈퇴 후에도 주문정보는 5년간 보관됩니다.<br>
							
							 <br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a>
						</p>
					</div>
					<a href="#">비밀번호가 기억나지 않아요.<i class="fa fa-plus"></i></a>		
			      	<div class="content">
				        <h3 style="color:red">√ 로그인 > 비밀번호찾기에서 확인 가능</h3>
	                    <p>
	                    	ㆍ비밀번호 확인 방법 (고객 성함과 이메일(아이디) 입력한 뒤)<br>
						  	&nbsp;&nbsp;1) 등록한 휴대폰번호, 선택 시<br>
						    &nbsp;&nbsp;&nbsp;&nbsp;: 가입 시 등록한 휴대폰으로 전송된 임시 비밀번호를 수신 받아 입력 후 새로운 비밀번호로 변경<br>
						    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;( 임시 비밀번호는 영문 대/소문자를 구분합니다. )<br>
						   	&nbsp;&nbsp;2) 이메일 주소, 선택 시<br>
						    &nbsp;&nbsp;&nbsp;&nbsp;: 가입 시 등록한 이메일로 전송된 임시 비밀번호를 수신 받아 입력 후 새로운 비밀번호로 변경<br>
						    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 		( 임시 비밀번호는 영문 대/소문자를 구분합니다. )<br>
						        ㆍ위 방법으로도 확인되지 않을 경우, 고객센터 1:1문의로 접수 문의주시면 본인 확인 후 임시 비밀번호를 발급해 드립니다.<br>
						     
						    <br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a>    
	                    </p>
				   	</div>
				   	<a href="#">회원 탈퇴를 하고 다시 기존 아이디로 가입할 수 있나요?<i class="fa fa-plus"></i></a>		
				  	<div class="content">
				    	<h3 style="color:red">√ 기존 아이디 재가입 가능</h3>
	                    <p>
	                    	탈퇴 신청 5일 이후 기존 아이디로 재가입이 가능합니다.<br>
							(단, 강제탈퇴 된 회원은 심사 후 재가입 여부가 결정됩니다.)<br>
							
							<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a>    
	                    </p>
	                </div>    
	    			<a href="#">1:1문의는 어디서 남길 수 있나요?<i class="fa fa-plus"></i></a>	
				 	<div class="content">
					    <h3 style="color:red">√ 마이페이지 > 1:1문의에서 접수 가능</h3>
	                    <p>
	                    	ㆍ위메프 사이트 마이페이지 > 1:1문의에서 1:1문의 접수 및 답변 확인이 가능합니다.<br>
							ㆍ1:1문의는 문의에 답변이 등록될 시 기재한 휴대폰 번호로 답변 안내 SMS가 전송됩니다.<br>
							ㆍ1:1문의 접수는 주말 및 공휴일 관계 없이 24시간 가능하며,문의사항 확인 후 업무 시간 내 신속하게 도움 드리겠습니다.<br>
							
							<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a>    
	                    </p>
				   	</div>
				   	<a href="#">탈퇴하면 개인정보는 모두 삭제되나요?<i class="fa fa-plus"></i></a>	
				   	<div class="content">
				    	<h3 style="color:red">√ 회원탈퇴 5일까지 보관 후 모두 삭제</h3>
	                    <p>
	                    	ㆍ고객님의 개인정보는 5일 동안 보관 후 모두 삭제되며, 탈퇴에 대한 안내메일을 발송해 드립니다.<br>
							ㆍ단, 상법 및 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령에 의하여 아래와 같이 거래 관련 권리 의무 관계의 확인 <br>
							&nbsp;&nbsp;등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 정해진 기간 동안 보유 후 파기합니다.
							
							 - 계약 또는 청약철회 등에 관한 기록 : 5년<br>
							 - 대금 결제 및 재화 등의 공급에 관한 기록 : 5년<br>
							 - 소비자의 불만 또는 분쟁에 관한 기록 : 3년<br>
							
							 <br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a>    
	                    </p>
				  	</div>
				</div>	
			</div>	  	
		</div>
<!-- #faq1 -->
<!-- #faq2 -->	
		<div id="tab2" class="swichtab-panel" data-swichtab="target">
			<div class="set">
				<a href="#">가게 등록시 필요한 서류는 어떻게 되나요?<i class="fa fa-plus"></i></a>
	  			<div class="content">
	  				<h3 style="color:red">√ 가게등록 신청은 PC 홈페이지에서 가능합니다.</h3>
                    <p>
                    	<a href="#">[가게등록 신청 바로가기]</a><br>
						
						ㆍ가게등록 신청하기 <br>
						&nbsp;&nbsp;1) PC 홈페이지 접속<br>
						&nbsp;&nbsp;2) Main화면에서 가맹점주 가입하기<br>
						&nbsp;&nbsp;3) [가게등록 신청] 선택<br>
						
						<br>※ 가게 등록의 경우 내용 입력 후 필요서류를 정확하게 등록해주시면 2일 이내에 입점이 완료됩니다.<br>
						
						<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a>    
                    </p>
		        </div>
			   	<a href="#">Lingo POS설치는 어떻게 하나요?<i class="fa fa-plus"></i></a>
	  			<div class="content">
			       <h3 style="color:red">√ POS설치 신청은 PC 홈페이지에서 가능합니다.</h3>
                    <p>
                    	<a href="#">[POS설치 신청 바로가기]</a><br>
						
						ㆍPOS설치 신청하기 <br>
						&nbsp;&nbsp;1) PC 홈페이지 접속<br>
						&nbsp;&nbsp;2) Main화면에서 가맹점주 가입하기<br>
						&nbsp;&nbsp;3) [POS설치하기] 선택<br>
						
						<br>※ Lingo POS설치의 경우 내용 입력 후 필요서류를 정확하게 등록해주시면 2일 이내에 입점이 완료됩니다.<br>
										                    	
						<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a> 				                    	
                    </p>
			    </div>
			</div>	   
		</div>
<!-- #faq2 -->	
<!-- #faq3 -->	
		 <div id="tab3" class="swichtab-panel" data-swichtab="target">
		  	<div class="set">
				<a href="#">예약 취소는 어떻게 하죠?<i class="fa fa-plus"></i></a>
	  			<div class="content">
		          	<h3 style="color:red">√ 예약 취소 가능합니다.</h3>
                    <p>
                    	ㆍ예약 취소하기<br>
						&nbsp;&nbsp;1) PC 홈페이지 접속<br>
						&nbsp;&nbsp;2) Main화면에서 가맹점주 가입하기<br>
						&nbsp;&nbsp;3) [마이페이지 > 예약 내역 확인] 선택<br>
                    	
                    	<br>※다만, 잦은 예약 취소일 경우 재서비스 사용에 불편함이 있을 수 있습니다.<br>
                    	
                    	<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a> 	
                    </p>
			    </div>
			  	<a href="#">잦은 예약 취소 고객이 있습니다.<i class="fa fa-plus"></i></a>
	  			<div class="content">
			        <h3 style="color:red">√ 잦은 예약취소 고객님 관련하여 따로 블랙리스트를 관리 중입니다.</h3>
                    <p>
                    	잦은 예약취소 고객님을 따로 관리하는 블랙리스트 제도를 가지고 있습니다.<br>
                    	추가로, 점주님들의 편의를 위하여 예약확인 시 해당 정보를 바로 확인하실 수 있습니다.<br>
                    	
                    	<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a> 	
                    </p>
		        </div>
			</div>
		</div>
<!-- #faq3 -->	
<!-- #faq4 -->	
		 <div id="tab4" class="swichtab-panel" data-swichtab="target">
		  	<div class="set">
				<a href="#">고객센터의 운영시간을 알고 싶어요.<i class="fa fa-plus"></i></a>
	  			<div class="content">
		    	      <h3 style="color:red">√  평일 9시~18시  , 주말/공휴일 10시~17시</h3>
	                   <p>
	                   	저희 링고포스 고객센터(1588-4763)는 평일(월~금) 9시~18시, 주말과 공휴일 10시~17시 까지 운영합니다.<br>
						(설날,추석 연휴는 휴무입니다.)<br>
						
						<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a> 	
	                   </p>
			    </div>
			 	<a href="#">모바일웹과 모바일앱이 무엇이 다른가요?<i class="fa fa-plus"></i></a>
	  			<div class="content">
			        <h3 style="color:red">√ 모바일 APP은 어플리케이션 접속 , 모바일 WEB은 브라우저를 통해 홈페이지 접속</h3>
                    <p>
                    	모바일 APP은 어플리케이션 마켓을 통해 위메프 어플리케이션을 다운받아서 사용하는 서비스입니다.<br>
						모바일 WEB은 모바일 기기의 브라우저를 통해 URL을 입력하여 접근하는 서비스입니다.<br>
						(접속 URL : m.wemakeprice.com )<br>
						모바일 APP/WEB은 PC WEB과는 다르게 모바일에 최적화된 UI를 선사하여, 스마트폰으로도 간편하게 쾌적한 쇼핑을 할 수 있도록 도와드립니다.<br> 
						
						<br>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="<c:url value='/Question/QNA.Lingo'/>">[1:1문의 바로가기]</a> 	
                    </p>
			     </div>
			 </div>
		</div>
<!-- #faq4 -->			
	</div>
</div>
<br/><br/><br/><br/> 
<!-- 네이베이션 바 내 아코디언 끝-->	
<!-- 내용 끝 -->
</div>
