<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 계산기 API -->
<script type="text/javascript" src="../js/jautocalc.js"></script>
<script type="text/javascript" src="../js/FileSaver.js"></script>
<script>

$(function(){
	//계산기
	var storename;
	function getStoreName(key){	
	 $.ajax({
			url:"<c:url value='/SalesCal/GetStoreName.Lingo'/>",
			data: "id="+key,
			dataType:"text",
			type:'post',
			success:function(data){
				storename=data;
			}			
		});
	}
	getStoreName('${sessionScope.loginDTO.id}');
	function autoCalcSetup() {
	        $('form[name=cart]').jAutoCalc('destroy');
	        $('form[name=cart] tr[name=line_items]').jAutoCalc({keyEventsFire: true, decimalPlaces: -1, emptyAsZero: true,thousandOpts:['','','']});
	        $('form[name=cart]').jAutoCalc({decimalPlaces: 0,thousandOpts:['','','']});
	    }
	    autoCalcSetup();
	
	 $('button[name=remove]').click(function(e) {
	        e.preventDefault();
	
	        var form = $(this).parents('form')
	        $(this).parents('tr').remove();
	        autoCalcSetup();
	
	    });
	
	   $('button[name=add]').click(function(e) {
	        e.preventDefault();
	
	        var $table = $(this).parents('table');
	        var $top = $table.find('tr[name=line_items]').first();
	        var $new = $top.clone(true);
	
	        $new.jAutoCalc('destroy');
	        $new.insertBefore($top);
	        $new.find('input[type=text]').val('');
	        autoCalcSetup();
	});
	 $('#save').click(function(e) {
	     e.preventDefault();
	     var now = new Date();
	     var nowTime = now.getFullYear();
	     nowTime += '-' + (now.getMonth() + 1);
	     nowTime += '-' + now.getDate();
	     nowTime += '_' + now.getHours()+"시";
	     var output = "\ufeff"+storename+"_"+nowTime+"_입출고계산서,,,\n사용내역,수량,금액,총 금액";
	     $.each($("tr[name=line_items]"),function(index,data){
	    	 output += "\n"+$("input[name=item]").eq(index).val()+","
	    	 +$("input[name=qty]").eq(index).val()+","
	    	 +$("input[name=price]").eq(index).val()+","
	    	 +$("input[name=item_total]").eq(index).val();
	     });
	     output +="\n,,세금전 합산,"+$("input[name=sub_total]").val();
	     output +="\n,,세금"+$("#tax :selected").text()+":,"+$("input[name=tax_total]").val();
	     output +="\n,,총합,"+$("input[name=grand_total]").val();
	     var blob = new Blob([output], {type:"text/csv;charset=UTF-8"});
	     var filename = storename+"_"+nowTime+"_입출고내역서.csv";
	     saveAs(blob, filename);  
	});
});
</script>

<div class="container" style="padding-top: 60px; margin-top: 60px;">
<!-- 내용 시작 -->
<!-- 바디 헤더 시작-->
	<div class="row">
		<div class="col-xs-12">
			<h2 ><img src="<c:url value='/Images/apple.png'/>" alt="image" style="width: 40px" /> 내 가게 <small>입출고 내역서 서비스</small></h2>
		</div>
		<div class="col-xs-12">
			<h3>가게 회원님들을 위한 입출고 내역서 파일 제작 서비스 입니다.</h3>
		</div>
	</div>	
<!-- 바디 헤더 끝-->
<!-- 계산기  시작-->
	<div class="row">
		<form name="cart" >
			<div class="col-xs-12" >
				<table name="cart" class="table table-striped table-bordered">
					<tr>
						<th></th>
						<th>사용내역</th>
						<th>수량</th>
						<th>금액</th>
						<th>총 금액</th>
					</tr>			
<!-- 실질적 입력 시작 -->			
					<tr name="line_items">
						<td><button name="remove" class="btn btn-danger">제거</button></td>
						<td><input type="text" name="item" placeholder="사용내역을 입력하세요"></td>
						<td><input type="text" name="qty" placeholder="수량을 입력하세요"></td>
						<td><input type="text" name="price" placeholder="금액을 입력하세요"></td>
						<td><input type="text" name="item_total" value="" jAutoCalc="{qty} * {price}"></td>
					</tr>
					<tr name="line_items">
						<td><button name="remove" class="btn btn-danger">제거</button></td>
						<td><input type="text" name="item" placeholder="사용내역을 입력하세요"></td>
						<td><input type="text" name="qty" placeholder="수량을 입력하세요"></td>
						<td><input type="text" name="price" placeholder="금액을 입력하세요"></td>
						<td><input type="text" name="item_total" value="" jAutoCalc="{qty} * {price}"></td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
						<td>세금 전 합산</td>
						<td><input type="text" name="sub_total" value="" jAutoCalc="SUM({item_total})"></td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
						<td>
						세금:
						<select name="tax" id="tax">
							<option value=".1">(부가가치세 포함)</option>
							<option selected value=".00">(부가가치세 미포함)</option>
						</select>
						</td>
						<td><input type="text" name="tax_total" value="" jAutoCalc="{sub_total} * {tax}"></td>
					</tr>
<!-- 실질적 입력 끝 -->				
					<tr>
						<td colspan="3">&nbsp;</td>
						<td>총합</td>
						<td><input type="text" name="grand_total" value="" jAutoCalc="{sub_total} + {tax_total}"></td>
					</tr>
					<tr>
						<td colspan="99"><button name="add"  class="btn btn-primary">추가</button> <button id="save" class="col-md-offset-9 btn btn-info">파일로 저장</button></td>
					</tr>
				</table>
				<br/><br/><br/><br/>
			</div>
		</form>
	</div>	
<!-- 계산기  끝-->	
<!-- 내용 끝 -->
</div>


