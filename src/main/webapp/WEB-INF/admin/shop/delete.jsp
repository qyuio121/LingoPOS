<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 가게승인 -->
<script>
$(function() {
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
  //정렬
    $('th').click(function(){
        var table = $(this).parents('table').eq(0)
        var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()))
        this.asc = !this.asc
        if (!this.asc){rows = rows.reverse()}
        for (var i = 0; i < rows.length; i++){table.append(rows[i])}
    })
    function comparer(index) {
        return function(a, b) {
            var valA = getCellValue(a, index), valB = getCellValue(b, index)
            return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.toString().localeCompare(valB)
        }
    }
    function getCellValue(row, index){ return $(row).children('td').eq(index).text() }
});
</script>
<!--메인 페이지 -->
<div class="wrapper content-panel">

		<div class="row">
			<h4>
				<i class="fa fa-angle-right"></i>가게승인 페이지
			</h4>
		</div>
		<!-- 검색창 -->
		<div class="row">
			<div class="col-md-12">
				<form class="navbar-form navbar-right" id="gtBtn"
					action="<c:url value='#'/>" method="get">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="id">가게명</option>
							<option value="content">상태</option>
						</select> <input type="text" class="form-control" id="searchWord"
							name="searchWord" placeholder="검색">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
			</div>
		</div>
		<!-- 검색창 -->
		<!-- 테이블 -->
		<div class="row">
			<div class="col-md-12">
				<table id="tablesort"
					class="tablesorter table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th><i class="fa fa-check"></i><input type="checkbox"
								id="checkall"></th>
							<th><i class=" fa fa-list-alt"></i>가게명</th>
							<th><i class=" fa fa-user"></i>가게아이디</th>
							<th><i class=" fa fa-bookmark"></i>사업증</th>
							<th id="status"><i class=" fa fa-edit"></i>상태</th>
							<th><i class=" fa fa-trash"></i>거부</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>가게명</td>
							<td>가게아이디</td>
							<td>사업증</td>
							<td><span class="label label-warning label-mini">승인요청</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>가게명</td>
							<td>가게아이디</td>
							<td>사업증</td>
							<td><span class="label label-info label-mini">승인</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>가게명</td>
							<td>가게아이디</td>
							<td>사업증</td>
							<td><span class="label label-warning label-mini">승인요청</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>가게명</td>
							<td>가게아이디</td>
							<td>사업증</td>
							<td><span class="label label-info label-mini">승인</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 검색창 끝-->
</div>
<!-- <br/>처리 -->
<c:forEach begin="0" end="${25-fn:length(list)}" step="1">
	<br/>
</c:forEach>
<!--메인 페이지 -->	