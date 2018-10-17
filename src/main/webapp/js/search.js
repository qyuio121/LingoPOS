var mapInfo = null;
/* map 객체생성 메소드 */
function initDaumMap(position) {
	/* 사용자 좌표 가져오기 */
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;
	/* map객체생성 */
	mapInfo.map = new daum.maps.Map(document.getElementById('map'), {
		center: new daum.maps.LatLng(latitude,longitude),
		level: 5,
		keyboardShortcuts:true
	});
	mapInfo.clusterer = new daum.maps.MarkerClusterer({
		map:mapInfo.map,
		averageCenter:true,
		minLevel:6
	});
	mapInfo.position = {'latitude':latitude,'longitude':longitude};
	setCurrentPosition();
}

function setCurrentPosition(){
	$.ajax({
		url: "/lingopos/Map/Map.Lingo",
		type: "GET",
		data: null,
		dataType:'json',
	    success: function(data) {
	    	$.each(data,function(index,value){
	    		var marker = new daum.maps.Marker({
		    		map:mapInfo.map,
		    		position: new daum.maps.LatLng(value.y,value.x),
    		   		image:new daum.maps.MarkerImage('/lingopos/Images/search/marker2.png',
    		   										new daum.maps.Size(64, 69),
    		   										{offset: new daum.maps.Point(27, 69)})
    			});
	    		mapInfo.markers.push(marker);
	    		var overlay = new daum.maps.CustomOverlay({
	    			   content : ('<div class="container">' + 
		   	    	              '    <div class="row">' + 
		   	    	              '        <div class="title">' +
		   	    	              '            <div class ="titleText" style="width:250px">'+
		   	    	              '            <a href="'+'#'+'" class="link">'+value.storename +'</a></div>'+
		   	    	              '            <div class="close btnOverlayClose" data-overlay-index="'+index+'" title="닫기"></div>' + 
		   	    	              '        </div>' + 
		   	    	              '        <div class="body">' + 
		   	    	              '            <div class="img">' +
		   	    	              '                <img src="'+value.img+'" style="width:73px;height:70px">' +
		   	    	              '           </div>' + 
		   	    	              '            <div class="desc">' + 
		   	    	              '                <div class="ellipsis">주소 : '+value.address+'</div>' + 
		   	    	              '				   <div class="ellipsis">'+value.tel+'<h1 class="jibun ellipsis" style="display:inline"> | '+value.bigkind+'</h1></div>' +
		   	    	              '            </div>' + 
		   	    	              '        </div>' + 
		   	    	              '    </div>' +    
	   	    	            	  '</div>'),
	    	            map : null,
	    	            position: new daum.maps.LatLng(value.y,value.x)
	    			   });
		    	  mapInfo.overlays.push(overlay);
		    	  var initFlag = false;
		    	  /* marker 클릭시 창을 띄우기위한 함수 */
	    		   daum.maps.event.addListener(marker, 'click', function() {
	    			   if(overlay.getMap() == null) {
	    				   overlay.setMap(mapInfo.map);

	    			   }
	    			  // console.log(overlay.getMap())
	    			   /* 이벤트처리를 돔에 한번만 올리기 위한 if처리 */
	    			   if(!initFlag) {
	    			   		buttonOverlayClose(index);
	    			   		initFlag = true;
	    			   }
	    		   });
	    	});
	    	searchTableList(data);
	    	mapInfo.clusterer.addMarkers(mapInfo.markers);
		}
    });
	
}
/* 검색 이벤트 처리 */
function setBtnSearch() {
	/* 처음에 현재 좌표로 값 뿌리기 처리  */
	
	var $searchText = $('#searchText'),
		$btnSearch = $('#btnSearch');
	  	
	$btnSearch.on('click', function() {
		var searchText = $searchText.val();
		if(searchText === '') {
			alert('값을 입력해주세요');
			return;
		}
		/* kiword검색값으로 주소및 상세정보를 가져와주는 service객체 생성 */
		var places = new daum.maps.services.Places();
		places.keywordSearch(searchText, function(result, status) {
			//console.log(status);
			/* 서비스가능 확인이 되면 좌표값을 넘겨 검색처리 메소드 호출 */
			if(result.length > 0) {						
			    if (status === daum.maps.services.Status.OK) {
			    	mapInfo.map.setCenter(new daum.maps.LatLng(result[0].y, result[0].x));
			    }
		    } 
		    else {
		    	alert('검색에러 사용자과실..');
		    }
		});
	});
	/* 검색 엔터처리 */
	$searchText.on('keydown', function(e) {
		if(e.keyCode === 13) {
			$btnSearch.trigger('click');
		}
	})
}
function searchTableList(result){
	var $searchTable = $("#searchTable");
	var $searchText = $("#searchText");
//	console.log($searchText.val());
//	console.log($searchTable.val());
	/* 재검색시 테이블에 담겨있는 값 초기화를 위한 메소드 */
	$searchTable.empty();
	$.each(result,function(index,value){
		$searchTable.append(
					'<td>'+						
						'<table class="table" style="border-right:0.1px solid #888;border-bottom:0.1px solid #E5E2E5;height:70px" >'+
								"<tr style='height:20px'>"+
									"<td class='titleText' style='font-weight: bold;font-size:15px;display:inline-block;width:250px'>" +
										"<a href='"+'#'+"'>"+value.storename +"</a>" +
									"</td>"+
								"</tr>"+
								"<tr>"+
									"<td>" +
										"<div class='body'>" +
											"<div class='img' style='background-image:url('"+value.img+"');background-size: contain;width:73px;height:70px'>" +
											"</div>" +
											"<div  >" +
												"<div class='searchLayout' >도로명주소 : "+value.address+"</div><br/>"+
												"<div class='searchLayout' style='margin-top:-22px;'>"+value.tel+"</div><br/>" +
												"<div style='font-size: 11px;color: #888;margin-top:-22px;'>  "+value.bigkind+"</div> "+
											"</div>"+
										"</div>" +
									"</td>"+
								"</tr>"+
						"</table>"+
					"</td>"
		);
	})
	
}
/* 맵에 셋팅돼있는 overlay 닫기버튼 메소드 */
function buttonOverlayClose(index) {
	
	$(".btnOverlayClose").on('click', function() {
			
   			mapInfo.overlays[$(this).data('overlay-index')].setMap(null);
	
//		console.log(mapInfo.overlays[index]);
//   		console.log($(this).data('overlayIndex'))
   	});
}

function errormap(error){
	console.log(error.code);
}
/* 마우스 드레그이벤트 처리를위한 변수선언 */
var dragFlag = false;
var x, y, pre_x, pre_y;
(function() {
	mapInfo = {
			map: null,
			markers: [],
			overlays:[],
			clusterer:null,
			position:{}
	}
	/* 스크롤 마우스드레그 이벤트 처리 */
	$('#drag').mousedown(
		function (e) {
			dragFlag = true;
			var obj = $(this);
			x = obj.scrollLeft();
			y = obj.scrollTop();

			pre_x = e.screenX;
			pre_y = e.screenY;					

			$(this).css("cursor", "pointer");
			//$('#result').text("x:" + x + "," + "y:" + y + "," + "pre_x:" + pre_x + "," + "pre_y:" + pre_y);
		}
	);
	$('#drag').mousemove(
		function (e) {
			if (dragFlag) {
				var obj = $(this);
				obj.scrollLeft(x - e.screenX + pre_x);
				obj.scrollTop(y - e.screenY + pre_y);
				return false;
			}
		}
	);
	$('#drag').mouseup(
		function () {
			dragFlag = false;
			//$('#result').text("x:" + x + "," + "y:" + y + "," + "pre_x:" + pre_x + "," + "pre_y:" + pre_y);
			$('#result').text(dragFlag);
			$(this).css("cursor", "default");
		}
	);
	$('body').mouseup(
		function () {
			dragFlag = false;					
			$('#result').text(dragFlag);
			$(this).css("cursor", "default");
		}
	);

	/* 현재위치의 좌표값을 가져오기위한 처리  */
	if (navigator.geolocation) {
	var option = {enableHighAccuracy:false};
	navigator.geolocation.getCurrentPosition(initDaumMap, function(error) {
	    switch(error.code) {
	    case error.PERMISSION_DENIED:
	        console.log("User denied the request for Geolocation.")
	        break;
	    case error.POSITION_UNAVAILABLE:
	        console.log("Location information is unavailable.")
	        break;
	    case error.TIMEOUT:
	        console.log("The request to get user location timed out.")
	        break;
	    case error.UNKNOWN_ERROR:
	        console.log("An unknown error occurred.")
	            break;
	    	}
		});
	} else {
		  console.log('사용못함..');
	}
	/* 재검색을 위한 메소드 재호출 */
	setBtnSearch();
})();