var mapInfo = null;
/* map 객체생성 메소드 */
function initDaumMap(position) {
	/* 사용자 좌표 가져오기 */
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;
	/* map객체생성 */
	mapInfo.map = new daum.maps.Map(document.getElementById('map'), {
		center: new daum.maps.LatLng(latitude,longitude),
		level: 3,
		keyboardShortcuts:true
	});
	mapInfo.position = {'latitude':latitude,'longitude':longitude};
	setCurrentPosition();
}
/* 현재 좌표주변에 음식점을 찾아주기위한 메소드 */
function setCurrentPosition(){
	/* 사용자 좌표 가져오기 */
	console.log(mapInfo.position.latitude);
	console.log(mapInfo.position.longitude);
	getRestaurant(mapInfo.position.longitude,mapInfo.position.latitude);
	
	
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
		places.keywordSearch(searchText+" 음식점", function(result, status) {
			//console.log(status);
			/* 서비스가능 확인이 되면 좌표값을 넘겨 검색처리 메소드 호출 */
			if(result.length > 0) {						
		    if (status === daum.maps.services.Status.OK) {
		    		getRestaurant(result[0].x, result[0].y);
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

function getRestaurant(x, y) {
	var places = new daum.maps.services.Places();	
	places.keywordSearch($('#searchText').val()+' 음식점', function(result, status) {
		/*재검색시 marker중복저장 방지를 위한 초기화작업*/
		if(mapInfo.markers.length > 0){
			console.log(mapInfo.markers.length);
			$.each(mapInfo.markers,function(index,marker){
				marker.setMap(null);
			});
			/* mapInfo.markers(맵 마커가 담긴 배열변수) 초기화 */
			mapInfo.markers.length = 0;
			//console.log(mapInfo.markers.length);
		}
		/*재검색시 overlay중복저장 방지를 위한 초기화작업*/
		if(mapInfo.overlays.length > 0){
			$.each(mapInfo.overlays,function(index,ovarlay){
				ovarlay.setMap(null);
			});
			/* mapInfo.overlays(마커 클릭시 띄워주는overlay가 담긴 배열변수) 초기화 */
			mapInfo.overlays.length=0;
			console.log(mapInfo.overlays.length);
		}
		/*places검색결과 필터*/
	    if (status === daum.maps.services.Status.OK) {
	    	//console.log(result[0]);
	       if(result.length > 0) {	 
	    	   //console.log('result:'+result);
	    	   //
	    	   if(mapInfo.map) {
	    		   /* 좌표로 맵 가운데로 맞춰주는 메소드 */
	    		   	mapInfo.map.setCenter(new daum.maps.LatLng(y, x));
	    		   	/* 마커 객체생성 및 배열에 담기 */
	    		    $.each(result,function(index,value){
	    		    	var marker = new daum.maps.Marker({
	    		    		map:mapInfo.map,
	    		    		position: new daum.maps.LatLng(value.y,value.x),
		    		   		image:new daum.maps.MarkerImage('/MinJoungWooWebProJ/Images/marker/marker2.png',
		    		   										new daum.maps.Size(64, 69),
		    		   										{offset: new daum.maps.Point(27, 69)})
		    			});
	    		    	//console.log(value,index)
	    		    	mapInfo.markers.push(marker);
	    		    	/* overlay객체생성 및 배열에 담기 및 맵 세팅 */
	    		    	var overlay = new daum.maps.CustomOverlay({
			    			   content : ('<div class="container">' + 
				   	    	              '    <div class="row">' + 
				   	    	              '        <div class="title">' +
				   	    	              '            <div class ="titleText" style="width:250px">'+
				   	    	              '            <a href="'+value.place_url+'" class="link">'+value.place_name +'</a></div>'+
				   	    	              '            <div class="close btnOverlayClose" data-overlay-index="'+index+'" title="닫기"></div>' + 
				   	    	              '        </div>' + 
				   	    	              '        <div class="body">' + 
				   	    	              '            <div class="img">' +
				   	    	              '                <img src="/MinJoungWooWebProJ/Images/marker/userLogo.png" style="width:73px;height:70px">' +
				   	    	              '           </div>' + 
				   	    	              '            <div class="desc">' + 
				   	    	              '                <div class="ellipsis">도로명주소 : '+value.address_name+'</div>' + 
				   	    	              '                <div class="jibun ellipsis">지번주소 : '+value.road_address_name+'</div>' + 
				   	    	              '				   <div class="ellipsis">'+value.phone+'<h1 class="jibun ellipsis" style="display:inline"> | '+value.category_name+'</h1></div>' +
				   	    	              '                <div><a href="'+value.place_url+'" target="_blank" class="link">'+value.place_url+'</a></div>' + 
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
	    		    /* 맵 아래 띄어줄 테이블처리를 위한 메소드호출 */
	    		    searchTableList(result);
	    	   }
	       } 
	       else {
	    	   alert('음식점이 없습니다.');
	       }
	    }
	}, {
		x: x,
		y: y,
		radius: 3000
	});
}
function searchTableList(result){
	var $searchTable = $("#searchTable");
	var $searchText = $("#searchText");
//	console.log($searchText.val());
//	console.log($searchTable.val());
	/* 재검색시 테이블에 담겨있는 값 초기화를 위한 메소드 */
	$searchTable.empty();
	$.each(result,function(index,value){
		console.log(value.place_url);
		//console.log(value)
		$searchTable.append(
					'<td>'+						
						'<table class="table" style="border-right:0.1px solid #888;border-bottom:0.1px solid #E5E2E5;height:70px" >'+
								"<tr style='height:20px'>"+
									"<td class='titleText' style='font-weight: bold;font-size:15px;display:inline-block;width:250px'>" +
										"<a href='"+value.place_url+"'>"+value.place_name +"</a>" +
									"</td>"+
								"</tr>"+
								"<tr>"+
									"<td>" +
										"<div class='body' style=''>" +
											"<div class='img'>" +
						   	    	        "	<img src='/MinJoungWooWebProJ/Images/marker/userLogo.png' style='width:73px;height:70px'>"+
											"</div>" +
											"<div  >" +
												"<div class='searchLayout' >도로명주소 : "+value.address_name+"</div><br/>"+
												"<div class='searchLayout' style='font-size: 11px;color: #888;margin-top: -22px;'>지번주소 : "+value.road_address_name+"</div><br/>"+
												"<div class='searchLayout' style='margin-top:-22px;'>"+value.phone+"</div><br/>" +
												"<div style='font-size: 11px;color: #888;margin-top:-22px;'>  "+value.category_name+"</div> "+
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
(function() {
	mapInfo = {
			map: null,
			markers: [],
			overlays:[],
			position:{}
	}
	
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