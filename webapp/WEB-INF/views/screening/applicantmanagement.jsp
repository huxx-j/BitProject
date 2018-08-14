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
	
	<!-- 자신의 css사용시 --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="/assets/css/jquery.datepicker.css">
	
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
			<h1>
				지원자관리 <small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">전형업무관리</a></li>
				<li class="active">지원자관리</li>
			</ol>
		</section>
		<!-- /.Content Header (Page header) -->

		<!-- Main content -->
		<section class="content"> <!-- style="padding-top:10px;padding-bottom:10px;" -->

			<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12">

					<div class="box box-body">
						<div class="row">
							<div class="col-xs-12">
								<div class="sub-box">
									<%-- <form class="search-form" method="post" action="${pageContext.request.contextPath}/api/cm/search"> --%>
									<div class="sub-title">지원자검색</div>
									<!-- sub_title -->

									<div class="sub-body">
										<table class="table table-condensed">
											<colgroup>
												<col width="150px" />
												<col width="300px" />
												<col width="" />
											</colgroup>

											<thead>
											<tr>
												<th>업무구분</th>
												<th>교육과정명
													<div class="radio-group pull-right">
														<label class="radiobox" ><input class="" type="radio" name="curriState" value="0">전체</label>
														<label class="radiobox" ><input class="" type="radio" name="curriState" value="1">모집중</label>
													</div>
												</th>
											</tr>
											</thead>

											<tbody>
											<tr>
												<td><select name="cateNameSelect"class="form-control" id="cateNameSelect">
													<c:forEach items="${requestScope.curriCateList}" var="curriCateList">
														<option value="${curriCateList.curriculumCate_no}">${curriCateList.cateName}</option>
													</c:forEach>
												</select></td>
												<td id="curriTd">
													<select name="strcurriName" class="form-control" id="curriSelect">

													</select>
												</td>
											</tr>
											</tbody>
										</table>
									</div>
									<!-- /.sub-body -->
									<div class="sub-toolbox text-center">
										<button type="button" class="btn btn-primary"id="applySearch">조회</button>
									</div>
									<!-- </form> -->
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
							<div class="col-xs-12">
								<div class="sub-box">
									<div class="sub-title">지원자리스트</div>
									<!-- sub_title -->
									<div class="sub-body" id="jqGridDiv" style="height: 300px;">
										<!-- <table id="jqGrid" style="text-align: center;"></table>

										<div id="jqGridPager"></div> -->
									</div>
									<!-- /.sub-body -->

								</div>
								<!-- /.sub-box -->
							</div>
							<!-- /.col-xs-12 -->
						</div>
						<!-- /.row -->
						<div class="space"></div>
						<div class="row">
							<div class="col-xs-4 right-nopadding">
								<div class="sub-box">
									<div class="sub-title">과거지원내역</div>
									<!-- sub_title -->
									<div class="sub-body bordered scroll" style="height:245px;">
										<div class="innerBox">
											<table class="table table-hover table-condensed">
												<colgroup>
													<col width="22%" />
													<col width="78%" />
												</colgroup>
	
												<thead>
												<tr>
	
													<th>전형일자</th>
													<th>과정명</th>
												</tr>
												</thead>
	
												<tbody id="appliedTable">
													<!-- 과거지원내역리스트 jquery 처리-->
												</tbody>
											</table>
										</div><!-- ./innerBox -->
									</div>
									<!-- /.sub-body -->
								</div>
								<!-- /.sub-box -->
							</div>
							<!-- /.col-xs-4 -->
							
							
							<div class="col-xs-8 right-nopadding">
								<div class="col-xs-8 right-nopadding">
									<div class="sub-box">
										<!-- sub_title -->
										<div class="sub-title">지원내역상세</div>
										<!-- /.sub_title -->
										<!-- sub_body -->
										<div class="sub-body" id="companyTableDiv">
											
											<table class="table table-condensed">
												<colgroup>
													<col width="80px" />
													<col width="" />
													<col width="80px" />
													<col width="" />
												</colgroup>
	
												<tbody>
												<tr>
													<th>업무구분</th>
													<td><input type="text" class="form-control" name="cateName" readOnly="readOnly"></td>
												</tr>
												<tr>
													<th>교육과정명</th>
													<td><input type="text" class="form-control" name="curriName" readOnly="readOnly"></td>
												</tr>
	
												</tbody>
											</table>
										
											<div class="space"></div>
											
											<table class="table table-condensed">
												<colgroup>
													<col width="80px" />
													<col width="207px" />
													<col width="80px" />
													<col width="" />
												</colgroup>

												<tbody>
													<tr>
														<th>지원종류</th>
														<td><select class="form-control"
																name="applyType" id="applyType">
																<option value="전체" selected>전체</option>
																<option value="대학교" >근로자형</option>
																<option value="대학교" >내일배움카드</option>
																<option value="노동부지원">노동부지원</option>
																<option value="대학교" >노동부지원(납입)</option>
																<option value="노동부지원">노동부지원(미납입)</option>
																<option value="개인지원">재직자 환급지원</option>
																<option value="대학교" >정통부지원</option>
																<option value="일반지원" >일반지원</option>
																<option value="노동부지원">사업주훈</option>
																<option value="노동부지원">위탁(유급휴직)</option>
															</select>
														</td>
														<th>전형과목</th>
														<td><select class="form-control"
														name="testLang" id="testLang">
		 													</select>
		 												</td>
													<tr>
														<th>전형점수</th>
														<td><input class="form-control" type="text"
														   name="testScore" id="testScore"></td>
														<th>전형결과</th>
														<td>
															<select class="form-control" name="testResult" id="testResult">
																<option>합격</option>
																<option>불합격</option>
																<option>보류</option>
																<option>미정</option>
																<option>전월합격</option>
																<option>재시험</option>
																<option>미전형</option>
																<option>조건부(과제물)</option>
																<option>불합격(과정이수)</option>
																<option>불합격(포기자)</option>
															</select>
														</td>
													</tr>
												</tbody>
											</table>
											
											<div class="space"></div>
											
											<table class="table table-condensed">
												<colgroup>
													<col width="80px" />
													<col width="207px" />
													<col width="80px" />
													<col width="" />
												</colgroup>

												<tbody>

													<tr>
														<th>계좌 입금일</th>
														<td>
															<div class="input-group border-inputcolor">
			                                                 	<input class="input-datepicker form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD" value="">
																<span class="input-group-btn">
																	<button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i>
																	</button>
																</span>
															</div>
														</td>
														<th>계좌입금액</th>
														<td><input class="form-control" type="text"
																   name="depositAmount" id="amountCalcul_1" ></td>
													</tr>

													<tr>
														<th>카드결제일</th>
														<td>
															<div class="input-group border-inputcolor">
																<input class="input-datepicker form-control border-none" name="date2" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD" value="">
																<span class="input-group-btn">
																	<button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i>
																	</button>
																</span>
															</div>
														</td>
														<th>카드결제액</th>
														<td><input type="text"
																   class="form-control pull-right" id="amountCalcul_2"
																   name="cardPayAmount" ></td>
													</tr>
													<tr>
														<th>입금여부</th>
														<td>
															<select class="form-control" name="deposit" id="deposit">
																<option>완납</option>
																<option>미납</option>
																<option>분납</option>
																<option>환불</option>
															</select>
														</td>
														<th>결제액 계</th>
														<td><input type="text"
																   class="form-control pull-right" id="amountResult"
																   name="totalPay" readOnly="readOnly">
														</td>
													</tr>
												</tbody>
											</table>
											<input type = "hidden" name="hidden_no">
											<input type = "hidden" name="hidden_currino">
										
										
										</div>
										<!-- /.sub_body -->
									</div>
									<!-- /.sub-box -->
								</div><!-- /.col-xs-8 -->
								
								
								<div class="col-xs-4">
									<div class="sub-box">
										<!-- sub_title -->
										<div class="sub-title">상담내용</div>
										<!-- /.sub_title -->
										
										<!-- sub_body -->
										<div class="sub-body">
											<textarea class="form-control" rows="14" id="consult" name="consult"></textarea>
										</div><!-- /.sub_body -->
									</div>
									<!-- /.sub_boX -->
								</div><!-- /.col-xs-4 -->
								
								
								<div class="col-xs-12">
									<div class="sub-toolbox text-center">
										<button type="button" class="btn btn-primary" id="update">수정</button>
									</div>
								</div><!-- /.row -->
								
							</div>
							<!-- /.col-xs-8 -->
							
						</div>
						<!-- /.row -->

					</div>
					<!-- /.box -->
				</div>
				<!-- /.col-xs-12 -->
			</div>
			<!-- /.row 하단-->

		</section>
		<!-- /.Main content -->



	</div>
	<!-- /.content-wrapper -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
	<div class="control-sidebar-bg"></div>



</div>
<!-- ./wrapper -->


<script type="text/javascript">
/* 로딩될때 */
$(document).ready(function() {

	var curriculumCate_no = $("#cateNameSelect option:selected").val();
	console.log(curriculumCate_no);
	
	getCurriList(curriculumCate_no);

});
/* 카테고리(업무구분)셀렉트박스 선택시 커리큘럼가져오기 */
$("#cateNameSelect").change(function() {
    var curriculumCate_no = $("#cateNameSelect option:selected").val();
    getCurriList(curriculumCate_no);

});

//상단 교육과정명의 radio 선택할때
$("input[name=curriState]").change(function() {
	
	var curriculumCate_no = $("#cateNameSelect option:selected").val();
	var curriState = $("input[name=curriState]:checked").val();
	console.log(curriculumCate_no);
	console.log(curriState);

	$.ajax({
        url : "/api/apply/getCurriList_state",
        type : "post",
        data : {"curriculumCate_no" : curriculumCate_no,
        		"curriState" : curriState},
        dataType : "json",
        success : function(list) {

            console.log("radio선택하고 돌아옴");

            $("#curriSelect").remove();
            var str = "";
            str += "<select name='strcurriName' class='form-control' id='curriSelect'></select>";
            $("#curriTd").append(str);
            for (var i = 0; i < list.length; i++) {
                
           	 var tmp = "";
           	 tmp += "<option value='" + list[i].curriculum_no + "'>"
                    + list[i].curriName + "</option>";

             $("#curriSelect").append(tmp);
        	}
        },	
        error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                + request.responseText + "\n" + "error:"
                + error);
        }
	
	});
});

/* 검색버튼 클릭할때 지원자리스트 가져옴 */
$("#applySearch").on("click",function() {
	/* $("#jqGrid").clearGridData(); */
	jqGridFrame();
    var curriculum_no = $("#curriSelect option:selected").val();
    console.log("클릭됨" + curriculum_no);
    $("#appliedTable").empty();
    past_apply_Reset();
    
    /* $.ajax({
        url : "/api/apply/getStudentList",
        type : "get",
        data : {"curriculum_no" : curriculum_no},
        dataType : "json",
        success : function(list) {

            console.log("search 잘 들어갔다 나옴");

            for (var i = 0; i < list.length; i++)
                $("#jqGrid").jqGrid('addRowData', i + 1, list[i]);
        },
        error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                + request.responseText + "\n" + "error:"
                + error);
        }
    }); */


var cnames = [ 'j', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자',
    '전형일자', '학교', '전공', '입금여부' ];

$("#jqGrid").jqGrid({
        
	url : "/api/apply/getStudentList?curriculum_no="+curriculum_no,
	datatype : "json",
	colNames : cnames,
	colModel : [ {name : 'user_no',index : 'user_no',width : 10,hidden : true},
	    {name : 'gisuName',index : 'gisuName',width : 100,align : "center"},
	    {name : 'nameHan',index : 'nameHan',width : 100,align : "center"},
	    {name : 'studResNum',index : 'studResNum',width : 100,align : "center"},
	    {name : 'c_gender',index : 'c_gender',width : 50,align : "center"},
	    {name : 'testResult',index : 'testResult',width : 80,align : "center"},
	    {name : 'cellphone',index : 'cellphone',width : 150,align : "center"},
	    {name : 'applyDate',index : 'applyDate',width : 100,align : "center"},
	    {name : 'testDate',index : 'testDate',width : 100,align : "center"},
	    {name : 'school',index : 'school',width : 150,align : "center"},
	    {name : 'major',index : 'major',width : 150,align : "center"},
	    {name : 'deposit',index : 'deposit',width : 80,align : "center"} ],
	
	rowheight : 20,
	height : 230,
	width : 1265,
	rowNum : 10,
	rowList : [ 10, 20, 30 ],
	pager : '#jqGridPager',
	rownumbers : true,
	
	onSelectRow : function(rowId, iRow, iCol, e) {
	
	    var rowId = $("#jqGrid").getGridParam("selrow");
	    var userNo = $("#jqGrid").getRowData(rowId).user_no; //선택한 줄의 User_no을 가져오는 코드
	    console.log(userNo)
	    /*  alert("나중에 " + userNo + "") */
	
	    $.ajax({
	        url : "/api/apply/getAppliedList",
	        type : "get",
	        data : {"user_no" : userNo},
	        dataType : "json",
	        success : function(list) {
	            console.log(list);
	
	            $("#appliedTable").empty();
	            past_apply_Reset();
	
	            for (var i = 0; i < list.length; i++) {
	                renderApplied(list[i])
	            }
	
	        },
	        error : function(request, status, error) {
	            alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);}
	
	    });

	function renderApplied(list) {
	    var str = "";
	    str += "<tr id='" + list.curriculum_no+ "' name='" + list.user_no + "' class='past'>";
	    str += "<td value='" + list.curriculum_no + "'>"
	        + list.testDate + "</td>";
	    str += "<td value='" + list.curriculum_no + "'>"
	        + list.curriName + "</td>";
	    str += "</tr>";
	    $("#appliedTable").append(str);
	
	};

    }

    /* viewrecords : true */
    /* caption: "유저 정보" */

	});
});

function jqGridFrame() {
	$("#gbox_jqGrid").remove();
	str="";
	str="<table id='jqGrid' style='text-align: center;'></table>" +
		"<div id='jqGridPager'></div>";
		
	$("#jqGridDiv").append(str);
}

/* 카테고리번호로 커리큘럼 리스트 가져오기 */
function getCurriList(curriculumCate_no){
	
	 $.ajax({
         url : "/api/apply/getCurriList",
         type : "post",
         data : {"curriculumCate_no" : curriculumCate_no},
         dataType : "json",
         success : function(curriList) {
             $("#curriSelect").remove();
             var str = "";
             str += "<select name='strcurriName' class='form-control' id='curriSelect'></select>";
             $("#curriTd").append(str);
             for (var i = 0; i < curriList.length; i++) {
                 
            	 var tmp = "";
            	 tmp += "<option value='" + curriList[i].curriculum_no + "'>"
                     + curriList[i].curriName + "</option>";

                 $("#curriSelect").append(tmp);
             }
         },
         error : function(XHR,status,error) {
             console.error(status+ " : "+ error)}
     });
}

/* 과거지원내역에서 수업클릭할때 */
$("#appliedTable").on("click", "[class=past]", function() {
    console.log("들어왔음");
    var curriculum_no = $(this).attr("id");
    var user_no = $(this).attr("name");
    past_apply(curriculum_no, user_no);

});

//지원내역 클릭시 특정 지원내역의 상세정보 가져오기
function past_apply(curriculum_no, user_no) {

    console.log(curriculum_no);

    $.ajax({
        url : "/api/apply/apply_details",
        type : "get",
        data : {
            "curriculum_no" : curriculum_no,
            "user_no" : user_no
        },
        dataType : "json",
        success : function(applyVo) {
            console.log(applyVo.consult);
            $("input[name='hidden_no']").val(applyVo.user_no)
            $("input[name='hidden_currino']").val(applyVo.curriculum_no)
            $("input[name='cateName']").val(applyVo.cateName)
            $("input[name='curriName']").val(applyVo.curriName)
            $("input[name='applyType']").val(applyVo.applyType)
            $("input[name='testLang']").val(applyVo.testLang)
            var str = "";
            str += "<option>"+applyVo.testLang+"<option>";
            $("[name=testLang]").append(str);

            $("input[name='testScore']").val(applyVo.testScore)
            $("input[name='testResult']").val(applyVo.testResult)
            $("input[name='date1']").val(applyVo.depositDate)
            $("input[name='date2']").val(applyVo.cardPayDate)
            $("input[name='depositAmount']").val(applyVo.depositAmount)
            $("input[name='cardPayAmount']").val(applyVo.cardPayAmount)
            $("input[name='deposit']").val(applyVo.deposit)
            $("input[name='totalPay']").val(applyVo.totalPay)
            $("[name='consult']").val(applyVo.consultContent)

        },
        error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                + request.responseText + "\n" + "error:" + error);
        }
    });

}

//지원내역 상세에서 계좌입금액,카드결제액 자동계산
$("#amountCalcul_1, #amountCalcul_2").change(function(){
    calc();
    var cost = $(this).val();
	cost = cost.replace(/[^0-9]/g,"");
	$(this).val(cost);
});
/* 지원내역 상세에서 계좌입금액,카드결제액 자동계산 END*/
function calc() {
    $("#amountResult").val(Number($("#amountCalcul_1").val()) + Number($("#amountCalcul_2").val()));
    
}


//수정버튼 누를때
$("#update").on("click", function () {

    report = {
        user_no: $("input[name='hidden_no']").val(),
        curriculum_no:$("input[name='hidden_currino']").val(),
        applyType: $("#applyType").val(),
        testLang: $("#testLang").val(),
        testScore: $("#testScore").val(),
        testResult: $("#testResult").val(),
        depositDate: $("#date1").val(),
        depositAmount: $("#amountCalcul_1").val(),
        cardPayDate: $("#date2").val(),
        cardPayAmount: $("#amountCalcul_2").val(),
        deposit: $("#deposit").val(),
        totalPay: $("#amountResult").val(),
        consultContent: $("#consult").val()

    };
	console.log(report);
    $.ajax({
        url: "/api/apply/applyUpdate",
        type: "post",
        contentType: "application/json",
        data: JSON.stringify(report),
        dataType: "json",
        success: function (result) {

        	if(result==1){
            	alert("수정이 완료되었습니다.");
        	}
        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error);
        }
    });

})

function past_apply_Reset(){
    
    $("input[name='cateName']").val("")
    $("input[name='curriName']").val("")
    $("input[name='applyType']").val("")
    $("input[name='testLang']").val("")
    var str = "";
    str += "<option><option>";
    $("[name=testLang]").append(str);

    $("input[name='testScore']").val("")
    $("input[name='testResult']").val("")
    $("input[name='date1']").val("")
    $("input[name='date2']").val("")
    $("input[name='depositAmount']").val("")
    $("input[name='cardPayAmount']").val("")
    $("input[name='deposit']").val("")
    $("input[name='totalPay']").val("")
    $("[name='consult']").val("")
	
};

</script>
</body>
</html>


<%-- <c:import url="/WEB-INF/views/screening/applyScript.jsp" /> --%>
