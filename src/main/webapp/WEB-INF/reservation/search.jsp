<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
if(${empty sessionScope.loginDTO}){
	alert('로그인후 접속 가능합니다.');
	location.replace("<c:url value='/Login/Login.Lingo'/>");
}

</script>
<style>
		.container {position: absolute;left: 0;bottom: 70px;width: 370px;height: 140px;margin-left: -180px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .container * {padding: 0;margin: 0;}
	    .container #markerRow {width: 365px;height: 125px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .container .markerRow:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .markerRow .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;white-space: nowrap;}
	    .markerRow .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .markerRow .close:hover {cursor: pointer;}
	    .markerRow .body {position: relative;overflow: hidden;}
	    .markerRow .desc {position: relative;margin: 13px 20px 10px 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .markerRow .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .markerRow:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .markerRow .link {color: #5085BB;}
	    .searchLayout{overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size: 12px; }
	    .titleText{overflow: hidden; text-overflow: ellipsis; white-space: nowrap; height: 35px;}
</style>
<div class="container-fluid" style="margin-top:70px;margin-top:70px">
	<div class="bg_wrap">
		<div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>
	</div>
	<div class="option">
		<div >
			<input type="text" id="searchText" >
			<button id="btnSearch">검색</button>
		</div>
	</div>
</div>
<div class="container-fluid" >	
	<div class="bg_wrap" id="drag" style="overflow:auto">
		
		<table>
			<tr id="searchTable" style="height:240px;width:400px;display:inline-block" >
				<td></td>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da1e05139c89159059ef2c519421cae8&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="<c:url value='/js/search.js?version=20181101'/>"></script>