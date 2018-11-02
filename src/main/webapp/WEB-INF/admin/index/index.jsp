<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--메인 페이지 -->
          <div class="col-lg-12 main-chart">
<!-- 걍 설명 -->          
			<div class="row" style="margin-bottom: 30px">
				<div class="col-xs-6">
					<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px;" />LingoPOS<small>보고서</small></h2>
				</div>
			</div>		
			<div class="row">
				<div class="out" style="height:220px">
					<div class="in" style="width:100%">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
							<div class="weather-3 pn centered" style="height: 200px;">
								<i class="fa fa-cutlery"></i>
								<h1>Best 메뉴</h1>
								<div class="info">
									<div class="row">
										<h3 class="centered">${storename}의 ${name} : ${count}회 주문</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
							<div class="weather-3 pn centered" style="height: 200px;">
								<i class="fa fa-cutlery"></i>
								<h1>Worst 메뉴</h1>
								<div class="info">
									<div class="row">
										<h3 class="centered">${storename}의 ${name} : ${count}회 주문</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb">
							<div class="weather-3 pn centered" style="height: 200px;">
								<i class="fa fa-shopping-cart"></i>
								<h1>인기가게</h1>
								<div class="info">
									<div class="row">
										<h3 class="centered">${storename}의 매출 : ${totalprice}원</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 걍 설명 -->   						
<!-- 원형차트 혹시 모르니 대기 -->			
            <div class="row mt">
	<!--1번 원형차트-->			
			  <div class="col-md-4 col-sm-4 mb">
			    <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>금일 신규가입고객/총 가입고객</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 70,
                        color: "#fdfdfd"
                      },
                      {
                        value: 30,
                        color: "#FF6B6B"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p>신규 고객<br/>증가량</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                      <h2>${newUser/totalUser*100}%</h2>
                    </div>
                  </div>
                </div>
			  </div>
	<!--1번 원형차트-->			  
	<!--2번 원형차트-->			  
              <div class="col-md-4 col-sm-4 mb">
                <div class="my-panel pn" >
                  <div class="my-header">
                    <h5>사업자회원 / 일반고객 </h5>
                  </div>
                  <canvas id="serverstatus02" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 60,
                        color: "#1c9ca7"
                      },
                      {
                        value: 40,
                        color: "#f68275"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <p> </p>
                  <footer>
                    <div class="pull-left">
                      <h5><i class="fa fa-hdd-o"></i>사업자회원 /일반회원</h5>
                    </div>
                    <div class="pull-right">
                      <h5>${ownerUser/totalUser*100}%/${(totalUser-storeUser-adminUser)/totalUser*100}%</h5>
                    </div>
                  </footer>
                </div>
              </div>
	<!--2번 원형차트-->			
	<!--3번 원형차트-->	
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>금일 예약 시스템 사용자</h5>
                  </div>
                  <canvas id="serverstatus03" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 90,
                        color: "#1c9ca7"
                      },
                      {
                        value: 10,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <p> </p>
                  <footer>
                    <div class="pull-left">
                      <h5><i class="fa fa-hdd-o"></i>금일 사용자 /총 일반고객</h5>
                    </div>
                    <div class="pull-right">
                      <h5>${todayReservation/totalUser*100}%/${(totalUser-todayReservation)/totalUser*100}%</h5>
                    </div>
                  </footer>
                </div>
              </div>
	<!--3번 원형차트-->			  
            </div>
            <br/>				
			<br/>				
			<br/>				
			<br/>				
			<br/>				
			<br/>				
			<br/>				
			<br/>	
<!-- 원형차트 혹시 모르니 대기 -->					
          </div>

<!--메인 페이지 -->	
