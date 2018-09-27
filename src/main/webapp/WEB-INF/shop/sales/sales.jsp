<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<br />
<br />
<br />
<br />
<br />
<div class="container">

	<h1>매출 확인 페이지</h1>
	<button id="update">월별 매출현황 보기</button>

	<div id="chart1" class="reusable-highchart"
		data-options='{"title":{"text":"연별 매출 현황"},"subtitle":{"text":"Source: Lingo.com"},
						"yAxis":{"title":{"text":"연매출 현황"}},
						"legend":{"layout":"vertical","align":"right","verticalAlign":"middle"},
						"plotOptions":{"series":{"label":{"connectorAllowed":false},"pointStart":2010}},
						"responsive":{"rules":[{"condition":{"maxWidth":500},
						"chartOptions":{"legend":{"layout":"horizontal","align":"center","verticalAlign":"bottom"}}}]}}'
						
		data-data='[{"name":"매출","data":[43934,52503,57177,69658,97031,119931,137133,154175]},
					{"name":"재료비","data":[24916,24064,29742,29851,32490,30282,38121,40434]},
					{"name":"인건비","data":[11744,17722,16005,19771,20185,24377,32147,39387]},
					{"name":"월세","data":[null,null,7988,12169,15112,22452,34400,34227]},
					{"name":"기타지출","data":[12908,5948,8105,11248,8989,11816,18274,18111]}]'>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>

	<script src="../js/jquery.reusable-highcharts.min.js"></script>
	<script>
		(function() {
			"use strict";
			$(document).ready(
					function() {
						var fakeAJAXOptions = {
							chart : {
								type : "line"
							},
							title : {
								text : "월별 매출 현황"
							},
							subtitle : {
								text : "Source: Lingo.com"
							},
							xAxis : {
								categories : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
							},
							yAxis : {
								title : {
									text : "만원"
								}
							},
							plotOptions : {
								line : {
									dataLabels : {
										enabled : true
									},
									enableMouseTracking : false
								}
							}
						};

						var fakeAJAXData = [
								{
									name : "매출",
									data : [ 700, 609, 905, 1405, 1804, 2105, 2502, 2605, 2303, 1803, 1309, 906 ]
								},
								{
									name : "지출",
									data : [ 309, 402, 507, 805, 1109, 1502, 1700, 1606, 1402, 1003, 606, 408 ]
								} ];

						$("#update").click(
								function(e) {
									e.preventDefault();

									// update #chart1 with new data and options
									$("#chart1").reusableHighchart().updateChart(fakeAJAXData,fakeAJAXOptions);

									// rerender #chart2
									$("#chart2").reusableHighchart("updateChart");
						});
					});
		})();
	</script>
</div>
