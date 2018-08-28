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
															<label class="radiobox"><input type="radio" name="comCondition" value="all">전체보기</label>
															<label class="radiobox"><input type="radio" name="comCondition" value="isShow" checked="checked">게시중만 보기</label>
															<label class="radiobox"><input type="radio" name="comCondition" value="employment">상시채용만 보기</label>
															<label class="radiobox"><input type="radio" name="comCondition" value="receiptDate">신청일로 조회</label>
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
								
											<div class="sub-toolbox">
												<div class="row">
													<div class="col-xs-6">
														<span class="sub-title">지원자리스트</span>
													</div>
													<div class="col-xs-6">
														<button class="btn btn-default btn-h25 pull-right" type="button" id="insertData">지원자 추가</button>
													</div>
												</div><!-- /.row -->
											</div>
											<!-- sub_title -->
											
										
											<!-- sub_body -->
											<div class="sub-body">
											
												<div class="bordered scroll innerBox" style="height: 500px;">
													<table class="table table-hover table-condensed no-border">
														<colgroup>
															<col width="16" />
															<col width="58" />
															<col width="43" />
															<col width="" />
															<col width="33" />
															<col width="34" />
														</colgroup>				
														<thead>
															<tr>
																<th>&nbsp;</th>
																<th>기수</th>
																<th>이름</th>
																<th>지원일자</th>
																<th>결과</th>
																<th>관리</th>
															</tr>
														</thead>
														<tbody id="interViewerList">
															<tr class='noData'>
																<td colspan='6' class='text-center hfull'>
																	<div class=''>구인업체를 선택해 주세요</div>
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
	
	<div class="control-sidebar-bg"></div>
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
								<col width="16" />
								<col width="58" />
								<col width="43" />
								<col width="90" />
								<col width="33" />
								<col width="34" />
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
	
	/* 그리드실행 */
	gridExec();
});


/* 검색조건(라디오버튼) 선택했을때 */
$("[name=comCondition]").on("click", function(){

	var $this = $(this).val();
	console.log($this);

	if($this == 'receiptDate'){
		$(".dateRange").show();
	} else{
		$(".dateRange").hide();
	}

});


/* 검색버튼 클릭했을때 */
$("#btn_search").on("click", function(){
	console.log("검색클릭");
	
	var comCondition = $("input[name=comCondition]:checked").val()
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	if(comCondition == 'receiptDate'){
		if((startDate == null || startDate == "") || (endDate == null || endDate == "" )){
			alert("날자를 입력해주세요");
			return;
		}
	} 
	
	/* 그리드실행 */
	gridExec();
	
});


/* 면접자리스트 두번클릭 */
$("#interViewerList").on("dblclick", "tr", function(){
	$this = $(this);
	console.log($this.attr("class"));
	if($this.attr("class") != "noData"){
		trSelected($this);
		console.log("in");
		//프로필 창 로드	
	}
});	


/* 그리드 출력하기 */
function gridExec() {
	
	var postData ={
		"comCondition": $('input[name=comCondition]:checked').val(),
		"startDate": $("#startDate").val(),
		"endDate": $("#endDate").val()
	}
	
	console.log(postData);
	
	var cnames = [ '회사번호', '취업의뢰번호', '유무', '블랙', '접수일', '회사명', '담당자', '모집부문', '모집인원', '이메일', '상시채용'];
	$("#jqGrid").jqGrid({
		url : "${pageContext.request.contextPath}/jobrequest/jobRequestList",
		mtype : "post",
		postData : postData,
		datatype:"json",
		
		colNames : cnames,
		colModel : [{name: 'company_no', index: 'company_no', width: 60/* , hidden: true */},
					{name: 'request_no', index: 'request_no', width: 60/* , hidden: true */},
					{name: 'isShow', index: 'isShow', width: 60, align: "center"},
					{name: 'black', index: 'black' , width: 50, align: "center"},
					{name: 'receiptDate', index: 'receiptDate', width: 80, align: "center"},
					{name: 'compName', index: 'compName', width: 200, align: "left"},
					{name: 'mgrName', index: 'mgrName', width: 70, align: "left"},
					{name: 'field', index: 'field', width: 250, align: "left"},
					{name: 'hireCntDisplay', index: 'hireCntDisplay', width: 90, align: "left"},
					{name: 'email', index: 'email', width: 180, align: "left"},
					/* {name: 'employment', index: 'employment', width: 60, align: "center", formatter: function( cellvalue , options ,rowObject ){
																											    if(cellvalue == '1') return "상시";
																											    else return "aa";}
					} */
					{name: 'employment', index: 'employment', width: 60, align: "center", formatter:'checkbox', editoptions:{value:'1:0'}, formatoptions:{disabled:false} }
					],
		rowheight : 20,
		height : 443,
		width : 960,
		rowNum : 500,
		rowList : [ 10, 300, 500, 1000 ],
		pager : '#jqGridPager',
		rownumbers : true,
		loadtext : '로딩중',
		sortname : 'receiptDate',
		sortorder:"desc", 
		gridview:true,
		shrinkToFit: false,
		emptyrecords: '데이터가 없습니다.',  //데이터 없을 때


		/* 그리드 한번클릭했을때 --> 면접지원자 리스트*/
		onSelectRow : function(rowId, iRow, iCol, e) {
	
			var rowId = $("#jqGrid").getGridParam("selrow");
			var request_no = $("#jqGrid").getRowData(rowId).request_no; 
			console.log(request_no)
			
	
			$.ajax({
	        	url : "${pageContext.request.contextPath}/jobrequest/getInterviewList",
				type : "post",
				data : {"request_no" : request_no},
				dataType : "json",
				success : function(interViewerList) {
	           	 	console.log(interViewerList);
	           	 	
	           	 	interViewerListRender(interViewerList);
	           	 	
				},
				error : function(request, status, error) {
	            		alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);
	            }
			});
		},
		
		/* 그리드 두번클릭했을때 (팝업호출)*/
		ondblClickRow : function(rowId, iRow, iCol, e,user_no) {
			var rowId = $("#jqGrid").getGridParam("selrow");
			var company_no = $("#jqGrid").getRowData(rowId).company_no;
			var request_no = $("#jqGrid").getRowData(rowId).request_no; 
		
			console.log(url)
			var url = "${pageContext.request.contextPath}/jobrequest/jobRequestPopup?request_no="+ request_no + "&company_no="+ company_no ;
			window.open(url, "_blank", "width=1120px, height=900px, scrollbars=yes"); 
		}
		
	});
	
	/* 그리드 파라미터값 재설정 */
	$("#jqGrid").setGridParam({
	   	 datatype	: "json",
	   	 postData	: postData,
	   	 loadComplete	: function(data) {
	   		 console.log(data);
	   	 }
	}).trigger("reloadGrid");

}

/* 지원자리스트 마우스오버 */
$("#interViewerList").on("mouseenter", "tr",  function(){
	$this = $(this);
	$this.find(".td_btn_del_area").html("<span class='label label-danger'>X</span>");
});

/* 지원자리스트 마우스아웃 */
$("#interViewerList").on("mouseleave","tr",  function(){
	$this = $(this);
	$this.find(".td_btn_del_area").empty();
});

/* 지원자리스트 삭제버튼 클릭 */
$("#interViewerList").on("click", "span", function(){
	$this = $(this);
	var interview_no = $this.parent().data("interview_no");
	
	var result = confirm('삭제하시겠습니까?'); 
	if(result == true) { 
		console.log(interview_no+"삭제");
		$this.closest("tr").remove();
		
	} else { 
		console.log(interview_no+"취소");		
	} 
});



/* 면접학생리스트 */
function interViewerListRender(interViewerList) {
	var str = "";
	
	if(interViewerList.length > 0){
		for (var i=0; i<interViewerList.length; i++) {
			var no = i+1;
			var interViewerVo = interViewerList[i];
			str +=  "<tr class='mouse'>"+
						"<td class='text-center'></td>" +
						"<td>" + interViewerVo.gisuName + "</td>" +
						"<td>" + interViewerVo.nameHan + "</td>" +
						"<td>" + interViewerVo.applyDate + "</td>" +
						"<td>" + interViewerVo.result + "</td>" +
						"<td class='td_btn_del_area' data-interview_no="+interViewerVo.interview_no+"></td>"
					"</tr>"	
	    }  
	} else {
		str +=  "<tr class='noData'>"+
					"<td colspan='6' class='text-center'>지원자가 없습니다.</td>" +
				"</tr>"	
	}
	
	$("#interViewerList").empty();			
	$("#interViewerList").append(str); 	
}


/* 면접자 리스트 선택한 tr 배경색변경 */
function trSelected($this){
	console.log($this); 
	$this.removeClass("trSelected");
	$this.addClass("trSelected");
}

/* 면접자 삭제 */
function delInterViewer(interview_no, $this){
	var result = confirm('삭제하시겠습니까?'); 
	if(result) { 
		$.ajax({
	    	url : "${pageContext.request.contextPath}/jobrequest/delInterViewer",
			type : "post",
			data : {"interview_no" : interview_no},
			dataType : "text",
			async : false, 
			success : function(result) {
				if(result > 0){
					$this.parents("tr").remove();
				}else {
					alert("삭제실패(관리자에게 문의하세요)");
				}
			},
			error : function(request, status, error) {
	        		alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);
	        }
		});
		
		
	} 
	
	
}

 
/* 모달 선택 */
 /* $("#choice").on("click", function() {
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
  */

$("#insertData").on("click", function() {
	$("#insertDataModal").modal();
});


/* 모달 그리드 */
/* var cnames = [ 'j', '선택', '과정', '이름', '생년월일', '성별' ];
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
}); */

</script>
</html>
