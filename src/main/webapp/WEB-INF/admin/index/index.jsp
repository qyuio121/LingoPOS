<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--메인 페이지 -->
          <div class="col-lg-12 main-chart">
            <!--CUSTOM CHART START -->
<!-- 차트 타이틀-->			
            <div class="border-head">
              <h3>신규 가입자</h3>
            </div>
<!-- 차트 타이틀-->			
<!-- 차트-->			
			<div class="custom-bar-chart">
<!-- y축-->			
              <ul class="y-axis">
                <li><span>500</span></li>
                <li><span>400</span></li>
                <li><span>300</span></li>
                <li><span>200</span></li>
                <li><span>100</span></li>
                <li><span>0</span></li>
              </ul>
<!-- y축-->	
<!-- x축-->			  
              <div class="bar">
                <div class="title">0시</div>
                <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar ">
                <div class="title">4시</div>
                <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">50%</div>
              </div>
              <div class="bar ">
                <div class="title">8시</div>
                <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">60%</div>
              </div>
              <div class="bar ">
                <div class="title">12시</div>
                <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">45%</div>
              </div>
              <div class="bar">
                <div class="title">16시</div>
                <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">32%</div>
              </div>
              <div class="bar ">
                <div class="title">20시</div>
                <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">62%</div>
              </div>
              <div class="bar">
                <div class="title">24시</div>
                <div class="value tooltips" data-original-title="오버시 들어갈 데이타" data-toggle="tooltip" data-placement="top">75%</div>
              </div>
<!-- x축-->					  
            </div>
<!-- 차트-->	
<!-- 원형차트 혹시 모르니 대기 -->			
            <div class="row mt">
	<!--1번 원형차트-->			
			  <div class="col-md-4 col-sm-4 mb">
			    <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>POS 가맹점 신규 설치</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 70,
                        color: "#FF6B6B"
                      },
                      {
                        value: 30,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p>POS 설치<br/>증가량</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                      <h2>21%</h2>
                    </div>
                  </div>
                </div>
			  </div>
	<!--1번 원형차트-->			  
	<!--2번 원형차트-->			  
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>사업자회원 / 일반회원 </h5>
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
                  <p>그래프</p>
                  <footer>
                    <div class="pull-left">
                      <h5><i class="fa fa-hdd-o"></i>사업자회원 / 일반회원비율</h5>
                    </div>
                    <div class="pull-right">
                      <h5>60% / 40%</h5>
                    </div>
                  </footer>
                </div>
              </div>
	<!--2번 원형차트-->			
	<!--3번 원형차트-->	
              <div class="col-md-4 col-sm-4 mb">
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>금일 예약 시스템 사용자</h5>
                  </div>
                  <div class="chart mt">
                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
                  </div>
                  <p class="mt"><b>1,000</b><br/>회원</p>
                </div>
              </div>
	<!--3번 원형차트-->			  
            </div>
<!-- 원형차트 혹시 모르니 대기 -->					
          </div>

<!--메인 페이지 -->	