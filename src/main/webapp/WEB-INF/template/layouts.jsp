<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>LingoPOS</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  <script>
  if(${not empty sessionScope.loginDTO.adminno}){
	 location.replace('<c:url value="/Admin/Index/Index.Admin"/>');
  }
  
  </script>
	<style>
/*body의 최소 크기를 2000px로 하여 컨텐츠의 영역을  일부러
   확장하여 스크롤바가 생기도록 css를 설정함-네비게이션바가 상단에 고정되는지 테스트 하기 위함*/
/* 화면이 스마트폰 크기일때 큰 화면 */
@media all and (min-width: 768px) {
	#logo {
		width: 102px;
		margin: -15px;
	}
	#top {
		height: 50px;
	}
	#carousels {
		margin-top: 76px;
	}
	#gtBtn {
		display:;
	}
	#smBtn {
		display: none;
	}
}

/* 화면이 태블릿 크기일때 작은 화면 */
@media all and (max-width: 767px) {
	#logo {
		width: 80px;
		margin: -15px;
	}
	#carousels {
		margin-top: 50px;
	}
	#gtBtn {
		display: none;
	}
	#smBtn {
		display:;
	}
}
/* 화면이 태블릿 크기일때 작은 화면 */
@media all and (max-width: 991px) {
	#drop {
		display:;
	}
	#outline {
		display: none;
	}
}
/* 화면이 태블릿 크기일때 큰 화면 */
@media all and (min-width: 992px) {
	#drop {
		display: none;
	}
	#outline {
		display:;
	}
}
</style>
	</head>
  <body>
  	<tiles:insertAttribute name="Top"/>
  	<div class="container-fluid">
	<tiles:insertAttribute name="Body"/>
   	</div>
   	<tiles:insertAttribute name="Footer"/>
  </body>
</html>