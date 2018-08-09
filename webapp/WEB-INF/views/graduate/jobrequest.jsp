<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>TCOMS ver2</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<!-- 공통css -->
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>기업취업관리
				<small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">출신업무관리</a></li>
				<li class="active">기업취업관리</li>
			</ol>
		</section>
		<!-- /.Content Header (Page header) -->
		
		<!-- Main content -->
		<section class="content">
			<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						
						<!-- 검색영역 -->
						<div class="row">
							<div class="col-xs-12">
							
								<div class="sub-box">
								
									<!-- sub_title -->
									<div class="sub-title">업체검색</div>
									
									
									<div class="sub-body">
										<table class="table table-condensed">
											<colgroup>
												<col width="120px" />
												<col width="" />
											</colgroup>		
											
											<tbody id="searchListTable">
												<tr>
													<th>검색조건</th>
													<td class="clearfix">
														<div class="radio-group pull-left">
															<label class="radiobox"><input type="radio" name="comCondition" value="all" checked="checked">전체보기</label>
															<label class="radiobox"><input type="radio" name="comCondition" value="post">게시중만 보기</label>
															<label class="radiobox"><input type="radio" name="comCondition" value="employment">상시채용만 보기</label>
															<label class="radiobox"><input type="radio" name="comCondition" value="receiptdate">신청일로 조회</label>
														</div>

														<div class="clearfix pull-left dateRange">
															<div class="input-group border-inputcolor w140 pull-left">
																<input class="input-datepicker form-control border-none" id="startDate" name="startDate" value="" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD" >
																<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
															</div>
															<div class="pull-left"> &nbsp;&nbsp; - &nbsp;&nbsp;</div>
															<div class="input-group border-inputcolor w140 pull-left">
																<input class="input-datepicker form-control border-none" id="endDate" name="endDate" value=""  data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									

									<!-- 업체검색 조회 -->
									<div class="sub-toolbox clearfix text-center">
										<input type="submit" value="검색" class="btn btn-primary" id="btn_search">
									</div>
									

								</div>
								<!-- sub-box -->
							</div>
							<!-- /.col-xs-12 -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col-xs-12 -->
			</div>
			<!-- /.row 상단-->	
			
			<!-- 하단 -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						<div class="row">
							<div class="col-xs-9 right-nopadding">
								<div class="sub-box">
									
									<!-- sub_title -->
									<div class="sub-title">구인업체</div>
									
									<!-- sub_body -->
									<div class="sub-body">
											
										<!-- 업체정보 테이블 -->
										<table id="jqGrid" class="mouse">		
										</table>
										
										<!-- 페이징 -->
										<div id="jqGridPager"></div>
										
									</div>
									<!-- ./sub_body -->
									
								</div>
								<!-- /.sub-box -->
								
							</div><!-- ./col-xs-9 -->
							
							
							<div class="col-xs-3">
								<div class="row">	
									<div class="col-xs-12">
										<div class="sub-box">
											<div class="row">
												<div class="col-xs-6">
													<div class="sub-title">지원자리스트</div>
												</div>
												<div class="col-xs-6">
													<button class="sub-t btn btn-default btn-h25 pull-right" type="button" id="insertData">지원자 추가</button>
												</div>
											</div>
										
										
										
											<!-- sub_body -->
											<div class="sub-body">
											
												<div class="bordered scroll innerBox" style="height: 500px;">
													<table class="table table-hover table-condensed">
														<colgroup>
															<col width="20px" />
															<col width="82px" />
															<col width="44px" />
															<col width="" />
															<col width="38px" />
															<col width="20px" />
														</colgroup>			
															<thead>
																<tr>
																	<th>&nbsp;</th>
																	<th>기수</th>
																	<th>이름</th>
																	<th>지원일자</th>
																	<th>결과</th>
																	<th>X</th>
																</tr>
															</thead>
															<tbody id="applicantList">
																<!-- jquery로 출력 -->
															</tbody>
													</table>	
												</div> <!--./innerBox -->

											</div>
											<!-- ./sub_body -->
											
										</div>
										<!-- /.sub-box -->
									</div><!-- ./col-xs-12 -->
								</div>
								<div class="space"></div>
				
								<div class="space"></div>
								
								<!-- <div class="row">	
									<div class="col-xs-12">
										<div class="sub-box">
											<div class="sub-toolbox clearfix" >
												<span class="sub-title">메모</span>
												<div class="bordered scroll innerBox" style="height: 250px;">
												메모 오른쪽 버튼		
												<button class="btn btn-default btn-sm pull-right" type="button">메모저장</button>
										
											</div>
												
											sub_body 메모
											<div class="sub-body bordered">
												<textarea class="form-control" rows="15"></textarea>
											</div>
											./sub_body
											
											메모 저장 버튼
											<div class="sub-toolbox clearfix text-center">
												<input type="submit" value="저장" class="btn btn-primary " id="btn_memoAdd">
											</div>
											
											
										</div>
										./sub_body
									</div>./col-xs-12
								</div> -->
								<!-- /.row-->
							</div><!-- ./col-xs-3 -->
						
						</div>
						<!-- /.row-->	
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col-xs-12 -->	
			</div>
			<!-- /.row -->
		</section>
		<!-- /.Main content -->
	</div>
	<!-- /.content-wrapper -->
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
	

</div><!-- /.wrapper -->




<!---------------- 지원자 추가 Modal!!! ---------------->
<div class="modal fade" id="insertDataModal">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<!-- modal-header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>	
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">지원자 추가</h4>
			
			</div>
			<!-- /.modal-header -->
			
			
			<div class="modal-body">
				
				<!-- 검색영역 -->
				<div class="sub-box">
					<div class="sub-body">
						<table class="table table-condensed">
							<colgroup>
								<col width="40px" />
								<col width="" />
								<col width="40px" />
								<col width="" />
								<col width="40px" />
							</colgroup>
					
							<tbody>
								<tr>
									<th>기수</th>
									<td><input class="form-control" type="text"name="gisu" value="">
									<th>이름</th>
									<td><input class="form-control" type="text" name="name" value=""></td>
									<td><button type="button" class="btn btn-primary btn-h25" id="btn_search">검색</button></td>
								</tr>
							</tbody>
						</table>
					</div><!-- /.sub-body -->
					
				</div><!-- /.sub-box 검색영역 끝-->
				
				<div class="space"></div>
				<div class="space"></div>
				<div class="space"></div>
				
				<!-- 하단부분 -->
				<div class="sub-box">
					<div class="sub-body">
						<table class="table table-hover table-condensed">
							<colgroup>
								<col width="5" />
								<col width="10" />
								<col width="10" />
								<col width="10" />
								<col width="10" />
								<col width="10" />
							</colgroup>
					
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>선택</th>
									<th>과정</th>
									<th>이름</th>
									<th>생년월일</th>
									<th>성별</th>
								</tr>
							</thead>
					
							<tbody>
								<c:forEach begin="0" end="15">
								<tr>
									<td>1</td>
									<td><input type="checkbox"></td>
									<td class="gisu"></td>
									<td class="name"></td>
									<td>911121</td>
									<td>남</td>
								</tr>
								</c:forEach>
							</tbody>	
						</table>
					</div><!-- /.sub-body -->
					
				</div><!-- /.sub-box 하단영역 끝-->
				
				
			</div>
			<!-- /.modal-body -->
			
			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-4"></div>
					<div class="col-xs-4 text-center">
						<button type="button" class="btn btn-primary">선택</button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
					</div>
				</div>
      		</div>
			
									
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!---------------- 지원자 추가 Modal!!! ---------------->



</body>





<script type="text/javascript">

/* 화면 처음 로딩될때 */
$(document).ready(function() {
	/* 시작시 달력 안보이게 */
	$(".dateRange").hide();
});


/* 검색조건(라디오버튼) 선택했을때 */
$("[name=comCondition]").on("click", function(){

	var $this = $(this).val();
	console.log($this);

	if($this == 'receiptdate'){
		$(".dateRange").show();
	} else{
		$(".dateRange").hide();
	}

});


/* 검색버튼 클릭했을때 */
$("#btn_search").on("click", function(){
	$("#jqGrid").clearGridData();   //해당 데이터 초기화 하기 !
	
	var comCondition = $('input[name=comCondition]:checked').val();        //라디오 버튼 눌렀을때  name값들 들어가기
	var data
 	if (comCondition!='receiptdate') {
		data = {"comCondition" :comCondition}
	} else {
		data = {"comCondition" :comCondition,
				"startDate" : $("#startDate").val(),
				"endDate" : $("#endDate").val()}
	}
	console.log("클릭" + data);

	$.ajax({
        url: "${pageContext.request.contextPath}/jobrequest/jobRequestList",
        type: "post",
        data: data,

        dataType: "json",
        success: function (list) {
      		console.log(list);
      		
      		/* 그리드에 데이타출력 */
      		for (var i=0; i<=list.length; i++) {
                 $("#jqGrid").jqGrid('addRowData', i+1, list[i]);
            }
      		
        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
});

	


/* 메인그리드관련 */
var cnames = [ '회사번호', '취업의뢰번호', '유무', '블랙', '접수일', '회사명', '담당자', '모집부문', '모집인원', '이메일', '채용'];
$("#jqGrid").jqGrid(
	{
		url : "jqgridStartMain.do",
		datatype : "local",
		colNames : cnames,
		colModel : [{name: 'commpany_no', index: 'commpany_no', width: 60, hidden: true},
					{name: 'request_no', index: 'request_no', width: 60, hidden: true},
					{name: 'post', index: 'post', width: 60, align: "center"},
					{name: 'black', index: 'black', width: 60, align: "center"},
					{name: 'receiptDate', index: 'receiptDate', width: 220, align: "center"},
					{name: 'compName', index: 'compName', align: "center"},
					{name: 'person', index: 'person', width: 90, align: "center"},
					{name: 'field', index: 'field', width: 200, align: "center"},
					{name: 'recruitment', index: 'recruitment', width: 200, align: "center"},
					{name: 'email', index: 'email', width: 200, align: "center"},
					{name: 'employment', index: 'employment', width: 60, align: "center"}],
		rowheight : 20,
		height : 443,
		width : 960,
		rowNum : 15,
		rowList : [ 10, 20, 30 ],
		pager : '#jqGridPager',
		rownumbers : true,
	
		/* 클릭했을때 */
		onSelectRow : function(rowId, iRow, iCol, e) {

			var rowId = $("#jqGrid").getGridParam("selrow");
			var request_no = $("#jqGrid").getRowData(rowId).request_no; 
			console.log(request_no)
			

			$.ajax({
            	url : "${pageContext.request.contextPath}/jobrequest/getInterviewList",
				type : "post",
				data : {"request_no" : request_no},
				dataType : "json",
				success : function(list) {
               	 	console.log(list);
               	 	$("#applicantList").empty();
               	 	for (var i=0; i<list.length; i++) {
						render(list[i])
                 	}               		
				},
				error : function(request, status, error) {
                		alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);
                }
			});
		}
    });


/* 지원자리스트 테이블(리스트)그리기 */
function render(GisuTableVo) {
	
	var str = "" +
			"<tr class=''>"+
				"<td>" + "</td>" +
				"<td>" + GisuTableVo.gisuName + "</td>" +
				"<td>" + GisuTableVo.nameHan + "</td>" +
				"<td>" + "2018-09-07" + "</td>" +
				"<td>" + "합격" + "</td>" +
				"<td>" +  "</td>"
			"</tr>"	
			
	$("#applicantList").append(str); 		
}
 


/* 모달 선택 */
$("#choice").on("click", function() {
	event.preventDefault();
	var GisuName = $("#GisuName").val();
	var NameHan = $("#NameHan").val();
	console.log(gisuName);
	console.log(nameHan);

	$.ajax({
		url : "${pageContext.request.contextPath }/subject/addcate",
		type : "post",
		data : {
			"GisuName" : GisuName,
			"NameHan" : NameHan
		},
		dataType : "json",
		success : function() {
		},

		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	});


$('[id=insertData]').on('click', function() {
	$("[id=insertDataModal]").modal();
});


/* 모달 그리드 */
var cnames = [ 'j', '선택', '과정', '이름', '생년월일', '성별' ];
$("#jqGrid").jqGrid(
		{
			url : "jqgridStartMain.do", 
			datatype : "local",
			colNames : cnames,
			colModel : [{name : 'seq',index : 'seq',width : 110,align : "center"},
						{name : 'gisu',index : 'gisu',width : 200},
						{name : 'name',index : 'name',width : 200},
						{name : 'birth',index : 'birth',width : 200},
						{name : 'gender',index : 'gender',width : 200},
						{name : 'result',index : 'result',width : 200}
					   ],

			rowheight : 20,
			height : 450,
			rowNum : 15,
			rowList : [ 10, 20, 30 ],
			pager : '#jqGridPager',
			rownumbers : true,
			ondblClickRow : function(rowId, iRow, iCol, e) {

			if (iCol == 1) {
				alert(rowId + " 째줄 입니다.");
			}
		},

		viewrecords : true,
		caption : "유저 정보"
});

</script>
</html>
