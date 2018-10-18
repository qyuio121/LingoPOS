<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



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
			<h4><i class="fa fa-angle-right"></i>블랙리스트</h4>
		</div>
		<!-- 검색창 -->
		<div class="row">
			<div class="col-md-12">
				<form class="navbar-form navbar-right" id="gtBtn" action="<c:url value='#'/>" method="get">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="content">신고한 가게</option>
						</select> <input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색">
					</div>
					<button type="submit" class="btn btn-default" >검색</button>
				</form>
			</div>
		</div>
		<!-- 검색창 -->
		<!-- 테이블 -->
		<div class="row">
			<div class="col-md-12">
				<table id="tablesort" class="tablesorter table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
					<!-- <input type="checkbox" name="check" id="check" value="check">동의합니다. -->
						<tr>
							<th><i class="fa fa-check"></i><input type="checkbox" id="checkall"></th>
							<th><i class=" fa fa-user"></i>id</th>
							<th><i class=" fa fa-question-circle"></i>이름</th>
							<th><i class=" fa fa-bookmark"></i>누적된 신고</th>
							<th><i class=" fa fa-list-alt"></i>신고한가게</th>
							<th id="status"><i class=" fa fa-edit"></i>상태</th>
							<th><i class=" fa fa-trash"></i>삭제</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>1</td>
							<td>1</td>
							<td>2</td>
							<td>가게명</td>
							<td><span class="label label-danger label-mini">승인요청</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p>
							</td>
						</tr>

						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>2</td>
							<td>2</td>
							<td>1</td>
							<td>가게명</td>
							<td><span class="label label-warning label-mini">승인</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p>
							</td>
						</tr>
						
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>3</td>
							<td>1</td>
							<td>2</td>
							<td>가게명</td>
							<td><span class="label label-danger label-mini">승인요청</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p>
							</td>
						</tr>
						
						<tr>
							<td><input type="checkbox" name="check"></td>
							<td>4</td>
							<td>2</td>
							<td>1</td>
							<td>가게명</td>
							<td><span class="label label-warning label-mini">승인</span></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 검색창 끝-->
	</div>
		<!-- 삭제버튼 모달 -->
		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title custom_align" id="Heading"></h4>
					</div>
					
					<div class="modal-body">
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span>
							해당 회원을 블랙리스트 해제하시겠습니까?
						</div>
					</div>
					
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

<!--메인 페이지 -->
