<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--메인 페이지 -->
          <div class="col-lg-12 main-chart">
<!-- 걍 설명 -->          
			<div class="row" style="margin-bottom: 30px">
				<div class="col-xs-6">
					<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px;" /> LingoPOS <small>보고서</small></h2>
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
										<h3 class="centered">${bestmenu.storename} 의<br/>${bestmenu.name}<br/>${bestmenu.count}회 주문</h3>
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
										<h3 class="centered">${worstmenu.storename} 의<br/>${worstmenu.name}<br/>${worstmenu.count}회 주문</h3>
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
										<h3 class="centered">${beststore.storename}<br/><br/>${beststore.totalprice}원</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br/><br/><br/>
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
                        value: ${(totaluser-newuser)/totaluser},
                        color: "#fdfdfd"
                      },
                      {
                        value: ${newuser/totaluser},
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
                      <h2><fmt:formatNumber value="${((newuser/totaluser)*100)}" pattern=".00"/>%</h2>
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
                    var doughnutData = [
                      {
                            value: ${(totaluser-admin-owner)/(totaluser-admin)},
                            color: "#f68275"
                      },
                      {
                        value: ${owner/(totaluser-admin)},
                        color: "#1c9ca7"
                      },
                      
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <p> </p>
                  <footer>
                      <h5><i class="fa fa-hdd-o"></i>사업자회원 /일반회원</h5>
                      <h5><fmt:formatNumber value="${(owner/(totaluser-admin))*100}" pattern=".00"/>%/<fmt:formatNumber value="${((totaluser-admin-owner)/(totaluser-admin))*100}" pattern=".00"/>%</h5>    
                  </footer>
                </div>
              </div>
	<!--2번 원형차트-->			
	<!--3번 원형차트-->	
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>현재 예약 건수</h5>
                  </div>
                  <canvas id="serverstatus03" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [
                    	{
                            value: ${notvisit}/${reserve+visit+notvisit},
                            color: "#f68275"
                        },
                      {
                        value: ${visit}/${reserve+visit+notvisit},
                        color: "#fdfdfd"
                      },
                      {
                          value: ${reserve}/${reserve+visit+notvisit},
                      	  color: "#1c9ca7"
                      }
                      
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <p> </p>
                  <footer>
                      <h5><i class="fa fa-hdd-o"></i>현재 예약 건수/방문 건수/미방문 건수</h5>
                      <h5>${reserve}건/${visit}건/${notvisit}건</h5>
                  </footer>
                </div>
              </div>
	<!--3번 원형차트-->			  
            </div>
<!-- 원형차트 혹시 모르니 대기 -->					
          </div>

<!--메인 페이지 -->	
