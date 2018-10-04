<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- 영업시간 -->
	<link rel="stylesheet" href="../css/wickedpicker.css">
	<script type="text/javascript" src="../js/wickedpicker.js"></script>

  <script>
  $( function() {
    $("#datepicker").datepicker({
    	minDate: "0",
    	maxDate: "+3M",
    	dateFormat: "yy-mm-dd"
    });
    $("#timepicker").wickedpicker({
    	now: "15:00"
    });
  } );
  </script>
<div class="container" style="padding-top: 60px; margin-top: 60px;">
	<div class="row">
		<div class="col-xs-6">
			<h2><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" />가게명들어갈곳</h2>
		</div>
	</div>
	<form id="frm" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">예약시간/날짜</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" style="width: 20%" id="datepicker">
				<input type="text" class="form-control" style="width: 20%" disabled="disabled" id="timepicker">
			    <label for="name" class="error" style="color:red"></label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">예약인원수</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" style="width: 40%" disabled="disabled" id="memberNumber">
			    <label for="name" class="error" style="color:red"></label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">예약한 테이블수</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" style="width: 40%" disabled="disabled" id="memberNumber">
			    <label for="name" class="error" style="color:red"></label>
			</div>
		</div>
	</form>
	
	
	
	<div class="form-group">
		<div class="col-sm-10">
			<select class="form-control col-sm-4" style="width: 20%" id="select1" name="select1">
				<option value="">1</option>
				<option value="">2</option>
				<option value="">3</option>
				<option value="">4</option>
			</select> 
			<label for="select1" class="error" style="color: red"></label>
		</div>
		
	</div>


	<div class="col-sm-6">
	<table class="table table-hover">
	 <tr>
	 <td class="active">...</td>
	  <td class="success">...</td>
	  <td class="warning">...</td>
	  <td class="danger">...</td>
	  <td class="info">...</td>
	 </tr>
	 <tr>
	 <td class="active">...</td>
	  <td class="success">...</td>
	  <td class="warning">...</td>
	  <td class="danger">...</td>
	  <td class="info">...</td>
	 </tr>
	 <tr>
	 <td class="active">...</td>
	  <td class="success">...</td>
	  <td class="warning">...</td>
	  <td class="danger">...</td>
	  <td class="info">...</td>
	 </tr>
	</table>
	</div>
</div>

