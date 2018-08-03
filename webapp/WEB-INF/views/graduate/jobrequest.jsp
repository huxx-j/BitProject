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

	<!-- 그리드 사용시 주석풀어 사용 -->



</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>지원자관리
				<small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">과정설계업무</a></li>
				<li class="active">패키지관리</li>
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
											
											<tbody>
												<tr>
													<th>검색조건</th>
													<td class="clearfix">
														<div class="radio-group pull-left">
															<label class="radiobox"><input class="whole" type="radio" name="comCondition" value="1" checked="checked">전체보기</label>
															<label class="radiobox"><input class="post" type="radio" name="comCondition" value="2">게시중만 보기</label>
															<label class="radiobox"><input class="employment" type="radio" name="comCondition" value="3">상시채용만 보기</label>
															<label class="radiobox"><input class="search" type="radio" name="comCondition" value="4">신청일로 조회</label>
														</div>

														<div class="clearfix pull-left dateRange">
															<div class="input-group border-inputcolor w140 pull-left">
																<input class="input-datepicker form-control border-none" name="startDate" id="startDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
															</div>
															<div class="pull-left"> &nbsp;&nbsp; - &nbsp;&nbsp;</div>
															<div class="input-group border-inputcolor w140 pull-left">
																<input class="input-datepicker form-control border-none" name="endDate" id="endDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
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
							<div class="col-xs-9">
								<div class="sub-box">
									
									<!-- sub_title -->
									<div class="sub-title">구인업체</div>
									
									<!-- sub_body -->
									<div class="sub-body bordered scroll" style="height: 400px;">
									
									
										<!-- 업체정보 테이블 -->
										<table id="jqGrid" class="box-body">

										</table>
										
									</div>
									<!-- ./sub_body -->
									
								</div>
								<!-- /.sub-box -->
								
							</div><!-- ./col-xs-9 -->
							
							
							<div class="col-xs-3">
								<div class="row">	
									<div class="col-xs-12">
										<div class="sub-box">
											<div class="sub-toolbox clearfix">
												<span class="sub-title">지원자리스트</span>
												<button class="btn btn-default btn-sm pull-right" type="button" id="insertData">지원자 추가</button>
											</div>
											<!-- sub_title -->
											
										
											<!-- sub_body -->
											<div class="sub-body">
											
												<div class="bordered scroll innerBox" style="height: 180px;">
													<table class="table table-hover table-condensed">								
														<colgroup>
															<col width="" />
															<col width="" />
														</colgroup>
																	
														<thead>
															<tr>
																<th>&nbsp;</th>
																<th>기수</th>
																<th>이름</th>
																<th>&nbsp;</th>
															</tr>
														</thead>
																						
														<!-- 내맘대로 입력값 -->
														<tbody>
															<tr>
																<td>1</td>
				                                                <td>BS_SHOT9</td>
				                                                <td>하재원</td>
				                                                <td>
				                                                	<button type="submit" class="btn btn-link deleteBtn">X</button>
				                                                </td>
				                                         	</tr>
				                                         	
				                                         	<tr>
				                                         		<td>1</td>
				                                                <td>BS_SHOT9</td>
				                                                <td>하재원</td>
				                                                <td>
				                                                	<button type="submit" class="btn btn-link deleteBtn">X</button>
				                                                </td>
				                                         	</tr>
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
								<div class="row">	
									<div class="col-xs-12">
										<div class="sub-box">
											<div class="sub-toolbox clearfix">
												<span class="sub-title">메모</span>
												<button class="btn btn-default btn-sm pull-right" type="button">메모저장</button>
											</div>
												
											<!-- sub_body -->
											<div class="sub-body bordered">
												<textarea class="form-control" rows="10"></textarea>
											</div>
											<!-- ./sub_body -->
											
										</div>
										<!-- ./sub_body -->
									</div><!-- ./col-xs-12 -->
								</div>
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
	
	<!-- Modal!!! -->
	<div class="modal fade" id="insertDataModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>	
					</button>
					<div class="sub-title">수료생</div>
				</div>
				<!-- sub_title -->
				
				<div class="sub-body">
					<table class="table table-condensed">
						<colgroup>
							<col width="100px" />
							<col width="" />
							<col width="150px" />
						</colgroup>
						
						<thead>
							<tr>
								<th>기수</th>
								<td><input type="text" name="gisu" value="">
								<th>이름</th>
								<td><input type="text" name="name" value="">
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.sub-body -->
				
				<!-- 추가 눌렀을때 조회 -->
				<div class="sub-toolbox text-center">
					<button type="submit" class="btn btn-primary" id="inquiry">조회</button>
				</div>
				
				<!-- sub_title -->
				<div class="sub-body bordered scroll" style="height: 400px;">
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
							<tr>
								<td>1</td>
								<td><input type="checkbox"></td>
								<td class="gisu"></td>
								<td class="name"></td>
								<td>911121</td>
								<td>남</td>
							</tr>
						</tbody>
					</table>
					
					<!-- /.row -->
					<div class="space"></div>
					<div class="row">
						<!-- /.sub-body -->
						<div class="sub-toolbox text-center">
							<button type="button" class="btn btn-primary">선택</button>
							<button type="button" class="btn btn-primary">취소</button>
						</div>
					</div>
					<!-- /.sub-box -->
				</div>
			</div>
			<!-- sub-box -->
		</div>
		<!-- /.col-xs-12 -->
	</div>
</div>
</body>


<script type="text/javascript">


$(document).ready(function() {
	/* 시작시 달력 안보이게 */
	$(".dateRange").hide();
});


/* 검색조건(라디오버튼) 선택했을때 */
$("[name=comCondition]").on("click", function(){                 		   //btn_search 는 id (#은 id, .은 class) on 누르고 클릭했을때 function 함수

	var $this = $(this).val();
	console.log($this);

	if($this == 4){
		$(".dateRange").show();
	} else{
		$(".dateRange").hide();
	}

});

/* 검색버튼 클릭했을때 */
$("#btn_search").on("click", function(){
	var comCondition = $('input[name=comCondition]:checked').val();        //라디오 버튼 눌렀을때  name값들 들어가기
	var data
 	if (comCondition!=4) {
		data = {"comCondition" :comCondition}
	} else {
		data = {"comCondition" :comCondition,
				"startDate" : $("#startDate").val(),
				"endDate" : $("#endDate").val()}
	}
	console.log("클릭됨" + comCondition);

	$.ajax({
        url: "${pageContext.request.contextPath}/jobRequestList"
        type: "post",
        data: data,

        dataType: "json",
        success: function (list) {
      		console.log(list);

           /*  for (var i = 0; i < list.length; i++){
            	$("#jqGrid").jqGrid('addRowData', i + 1, list[i]);
            } */
        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
});

/* 메인그리드관련 */
var cnames = [ 'j', '게시유무', '블랙', '접수일', '회사명', '담당자', '모집부문', '모집인원', '이메일', '상시채용'];
$("#jqGrid").jqGrid(
	{
		url : "jqgridStartMain.do",
		datatype : "local",
		colNames : cnames,
		colModel : [{name : 'commpany_no',index : 'commpany_no',width : 10,hidden : true},
					{name : 'Post',index : 'Post',width : 100,align : "center"},
					{name : 'Black',index : 'Black',width : 100,align : "center"},
					{name : 'Receipt',index : 'Receipt',width : 100,align : "center"},
					{name : 'CompName',index : 'CompName',width : 50,align : "center"},
					{name : 'Person',index : 'Person',width : 80,align : "center"},
					{name : 'Field',index : 'Field',width : 150,align : "center"},
					{name : 'Recruitment ',index : 'Recruitment ',width : 100,align : "center"},
					{name : 'Email',index : 'Email',width : 100,align : "center"},
					{name : 'Employment ',index : 'Employment ',width : 150,align : "center"} ],
		rowheight : 20,
		height : 230,
		width : 1265,
		rowNum : 15,
		rowList : [ 10, 20, 30 ],
		pager : '#jqGridPager',
		rownumbers : true,

		ondblClickRow : function(rowId, iRow, iCol, e) {

			var rowId = $("#jqGrid").getGridParam("selrow");
			var userNo = $("#jqGrid").getRowData(rowId).user_no; //선택한 줄의 User_no을 가져오는 코드
			console.log(userNo)
			/*  alert("나중에 " + userNo + "") */


			$.ajax({
            		url : "${pageContext.request.contextPath}/getSearchList",
				type : "post",
				data : {"commpany_no" : commpanyNo},
				dataType : "json",
				success : function(list) {
               	 	console.log(list);

                  		$("#searchList").empty();

               		for (var i = 0; i < list.length; i++) {
                   		renderApplied(list[i])
              			}

				},
				error : function(request, status, error) {
                		alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);
                	}
			});
		}
    });





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
var cnames = [ '번호', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부' ];
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
						{name : 'result',index : 'result',width : 200},
						{name : 'phone', index : 'phone', width : 200},
						{name : 'appdate', index : 'appdate', width : 200},
						{name : 'exdate', index : 'exdate', width : 200},
						{name : 'school', index : 'school', width : 200},
						{name : 'major', index : 'major', width : 200},
						{name : 'yn', index : 'yn', width : 200}
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
