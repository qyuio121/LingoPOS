<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	/* UI Object */
	.tbl_type, .tbl_type th, .tbl_type td {
		border: 0
	}
	
	.tbl_type {
		width: 100%;
		border-bottom: 2px solid #dcdcdc;
		font-family: '돋움', dotum;
		font-size: 12px;
		text-align: center;
		border-collapse: collapse
	}
	
	.tbl_type caption {
		display: none
	}
	
	.tbl_type tfoot {
		background-color: #f5f7f9;
		font-weight: bold
	}
	
	.tbl_type th {
		padding: 7px 0 4px;
		border-top: 2px solid #dcdcdc;
		border-right: 1px solid #dcdcdc;
		border-left: 1px solid #dcdcdc;
		background-color: #f5f7f9;
		color: #666;
		font-family: '돋움', dotum;
		font-size: 12px;
		font-weight: bold
	}
	
	.tbl_type td {
		padding: 6px 0 4px;
		border: 1px solid #e5e5e5;
		color: #4c4c4c
	}
	
	.tbl_type td.date {
		font-weight: bold
	}
	/* //UI Object */
</style>
<br/><br/><br/><br/><br/><br/><br/>
<div id="wrapper">
	<div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">통계</a></li>
				<li class="breadcrumb-item active">Charts</li>
			</ol>
			<!-- Area Chart Example-->
				<div class="panel panel-default">
				 	 <div class="panel-body">
				   		 <table class="table">
							<div class="card mb-3">
								<div class="card-header">
									<i class="fas fa-chart-area"></i>
								</div>
								<div class="card-body">
									<canvas id="myAreaChart" width="100%" height="30"></canvas>
								</div>
								<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
							</div>
							</table>
						</div>
				</div>
			<!-- UI Object -->
			<table cellspacing="0" border="1" class="tbl_type">
				<colgroup>
					<col width="10%">
					<col>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">주문일</th>
						<th scope="col">결제건수</th>
						<th scope="col">실결제금액</th>
						<th scope="col">판매금액</th>
						<th scope="col">판매이익</th>
						<th scope="col">??</th>
						<th scope="col">??</th>
						<th scope="col">??</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td>합계</td>
						<td>34</td>
						<td>3,000,000</td>
						<td>3,000,000</td>
						<td>1,500,000</td>
						<td>???</td>
						<td>????</td>
						<td>????</td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td scope="row" class="date">2018-9-15</td>
						<td>19</td>
						<td>1,000,000</td>
						<td>1,000,000</td>
						<td>700,000</td>
						<td>???</td>
						<td>???</td>
						<td>???</td>
					</tr>
					<tr>
						<td scope="row" class="date">2018-9-15</td>
						<td>60</td>
						<td>1,100,000</td>
						<td>1,100,000</td>
						<td>500,000</td>
						<td>????</td>
						<td>????</td>
						<td>????</td>
					</tr>
					<tr>
						<td scope="row" class="date">2018-9-15</td>
						<td>40</td>
						<td>1,000,000</td>
						<td>1,000,000</td>
						<td>500,000</td>
						<td>????</td>
						<td>????</td>
						<td>????</td>
					</tr>
					<tr>
						<td scope="row" class="date">2018-9-15</td>
						<td>30</td>
						<td>1,000,000</td>
						<td>1,000,000</td>
						<td>500,000</td>
						<td>????</td>
						<td>????</td>
						<td>????</td>
					</tr>
					<tr>
						<td scope="row" class="date">2018-9-15</td>
						<td>40</td>
						<td>1,100,000</td>
						<td>1,100,000</td>
						<td>500,000</td>
						<td>????</td>
						<td>????</td>
						<td>????</td>
					</tr>
					<tr>
						<td scope="row" class="date">2018-9-15</td>
						<td>30</td>
						<td>1,000,000</td>
						<td>1,000,000</td>
						<td>500,000</td>
						<td>???</td>
						<td>???</td>
						<td>????</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<!-- //UI Object -->
	
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->
</div>
<!-- /#wrapper -->

<!-- Page level plugin JavaScript-->
<script src="../js/Chart.min.js"></script>

<!-- Demo scripts for this page-->
<script src="../js/chart-area-demo.js"></script>
