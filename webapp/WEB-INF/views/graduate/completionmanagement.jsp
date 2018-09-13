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
			<h1>수료생관리
				<small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">전형업무관리</a></li>
				<li class="active">지원자관리</li>
			</ol>
		</section>
		<!-- /.Content Header (Page header) -->

		<!-- Main content -->
		<section class="content">

			<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12">

					<div class="box box-body">
						<div class="row">
							<div class="col-xs-12">
								<div class="sub-box">
									<div class="sub-title">
										수업과정 검색
									</div><!-- sub_title -->

									<div class="sub-body">
										<table class="table table-condensed">
											<colgroup>
												<col width="250px" />
												<col width="" />
												<col width="300px" />
											</colgroup>

											<thead>
											<tr>
												<th>업무구분</th>
												<th class="">
													교육과정명
													<div class="radio-group pull-right">
														<label class="radiobox"><input class="" type="radio" name="curriState" value="0">전체</label>
														<label class="radiobox"><input class="" type="radio" name="curriState" value="1">준비중</label>
														<label class="radiobox"><input class="" type="radio" name="curriState" value="2">모집중</label>
														<label class="radiobox"><input class="" type="radio" name="curriState" value="3">모집마감</label>
														<label class="radiobox"><input class="" type="radio" name="curriState" value="4">수업중</label>
														<label class="radiobox"><input class="" type="radio" name="curriState" value="5">종료</label>
													</div>
												</th>
											</tr>
											</thead>

											<tbody>
											<tr>
												<td>
													<select name="cateNameSelect" class="form-control" id="cateNameSelect">
														<c:forEach items="${requestScope.curriCateList}" var="curriCateList">
															<option value="${curriCateList.curriculumCate_no}">${curriCateList.cateName}</option>
														</c:forEach>
													</select>
												</td>
												<td id="curriTd">
													<select name="strcurriName" class="form-control" id="curriSelect">

													</select>
												</td>
											</tr>
											</tbody>
										</table>
									</div><!-- /.sub-body -->
									<div class="sub-toolbox text-center">
										<button type="button" class="btn btn-primary" id="btn_applySearch">조회</button>
									</div>
								</div><!-- sub-box -->
							</div><!-- /.col-xs-12 -->
						</div><!-- /.row -->
					</div><!-- /.box -->

				</div><!-- /.col-xs-12 -->
			</div>
			<!-- /.row 상단-->

			<!-- 하단 -->
			<div class="row" style="height: 720px;">
				<div class="col-xs-12">
					<div class="box box-body">

						<div class="row">
							<div class="col-xs-12">
								<div class="sub-box">
									<div class="sub-title">
										수강생리스트
									</div><!-- sub_title -->
									<div class="sub-body" id="jqGridDiv" style="height:300px;">
										<!-- <table id="jqGrid" style="text-align:center;"></table>

										<div id="jqGridPager"></div> -->
									</div><!-- /.sub-body -->

								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-12 -->
						</div><!-- /.row -->
						
						<div class="space"></div>
						
						<div class="row">
							<div class="col-xs-4 right-nopadding">
								<div class="sub-box">
									<div class="sub-title">
										취업정보
									</div><!-- sub_title -->
									<div class="sub-body bordered scroll" style="height:150px; ">
										<div class="innerBox">
											<table class="table table-hover table-condensed">
												<colgroup>
													<col width="30px" />
													<col width="" />
													<col width="80px" />
													<col width="80px" />
													<col width="60px" />
												</colgroup>
	
												<thead>
												<tr>
													<th></th>
													<th>회사명</th>
													<th>입사일</th>
													<th>퇴사일</th>
													<th>재직여부</th>
												</tr>
												</thead>
	
												<tbody id="afterServiceTable">
													<!-- 취업기업리스트 jquery 처리-->
												</tbody>
											</table>
										</div><!-- ./innerBox -->
									</div><!-- /.sub-body -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-3 -->
							<div class="col-xs-8">
								<div class="sub-box">
									<!-- sub_title -->
									<div class="sub-toolbox clearfix" id="companyAdd_div">
										<!-- <button type="button" class="btn btn-default btn-sm pull-right" id="companyAdd">&nbsp;&nbsp;&nbsp;&nbsp;취업기업 추가&nbsp;&nbsp;&nbsp;&nbsp;</button> -->
									</div><!-- /sub_title -->
									
									<div class="sub-body" id="companyTableDiv">
										<table class="table table-condensed" id="companyTable">
											<colgroup>
												<col width="80px" />
												<col width="300px" />
												<col width="80px" />
												<col width="300px" />
											</colgroup>

											<tbody id="userCareerTable">
											<tr>
												<th>회사명</th>
												<td colspan="8">
													<input class="form-control input-sm" type="text"
														   name="compName" id="compName" placeholder="">
												</td>
											</tr>

											<tr>
												<th>전화</th>
												<td>
													<input class="form-control input-sm" type="text" id="telePhone" name="telePhone" placeholder="">
												</td>
												<th>재직여부</th>
												<td colspan="2">
													<select class="form-control input-sm" name="state" id="state">
														<option>재직중</option>
														<option>퇴사</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>입사일</th>
												<td>
													<div class="input-group border-inputcolor">
														<input class="input-datepicker form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
														<span class="input-group-btn">
															<button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
														
													<!-- <div class="input-group" style="border: 1px solid #c2c2c2;height:20px;">
                                                 				<span class="input-group-btn">
		                                                  			<button type="button" class="btn btn-date" data-toggle="datepicker" style="
		                                                  				background-color: rgba(255,255,255,0)"  id="testDatepicker">
		                                                  			<label for="date1">
		                                                  			<i class="fa fa-calendar"></i>
		                                                  			</label></button>
	                                                  			</span>
														<input type="text" class="form-control input-xs pull-right"
															   name="date1" id="date1"  data-select="datepicker" style="border: none;width:270px;height:20px;">
													</div> -->
												</td>
												<th>퇴사일</th>
												<td>
													<div class="input-group border-inputcolor">
														<input class="input-datepicker form-control border-none" name="date2" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
														<span class="input-group-btn">
															<button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<!-- <div class="input-group" style="border: 1px solid #c2c2c2;height:20px;">
                                                 				<span class="input-group-btn">
		                                                  			<button type="button" class="btn btn-date" data-toggle="datepicker" style="
		                                                  				background-color: rgba(255,255,255,0)"  id="testDatepicker">
		                                                  			<label for="date2">
		                                                  			<i class="fa fa-calendar"></i>
		                                                  			</label></button>
	                                                  			</span>
														<input type="text" class="form-control input-xs pull-right"
															   name="date2" id="date2"  data-select="datepicker" style="border: none;width:270px;height:20px;">
													</div> -->
												</td>
											</tr>
											<tr>
												<th>직책</th>
												<td>
													<input class="form-control input-sm" type="text" id="position" name = "position" placeholder="">
												</td>
												<th>부서</th>
												<td colspan="2">
													<input class="form-control input-sm" type="text" id="department" name = "department" placeholder="">
												</td>
											</tr>
											<tr>
												<th>회사주소</th>
												<td colspan="8">
													<input class="form-control input-sm" type="text" id="companyAddress" name = "companyAddress" placeholder="" >
												</td>
											</tr>
											</tbody>
										</table>
									</div><!-- /.sub-body -->
									<div class="sub-toolbox text-center clearfix" id="company_btn_div">
										<!-- <button type="button" class="btn btn-primary" id="company_btn">수정</button> -->
									</div>
									<input type='hidden' name="hidden_no" id = "hidden_no">
									<input type='hidden' name="hidden_applyno" id = "hidden_applyno">
								</div><!-- /.sub-box -->
							</div><!-- /.row -->

						</div><!-- /.box -->
					</div><!-- /.col-xs-12 -->
				</div>
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


</body>
<!-- </html> -->

<script type="text/javascript">

/* 로딩될때 */
$(document).ready(function() {

	var curriculumCate_no = $("#cateNameSelect option:selected").val();
    console.log(curriculumCate_no);

    getCurriList(curriculumCate_no);
    addUpdate_btnSet();
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
        url : "/api/completion/getCurriList_state",
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

/* 검색버튼 클릭할때 수료생리스트 가져옴 */
$("#btn_applySearch").on("click", function() {
	
	/* $("#jqGrid").clearGridData(); */
	jqGridFrame();
    var curriculum_no = $("#curriSelect option:selected").val();
    console.log("클릭됨" + curriculum_no);

  /*    $.ajax({
         url : "/api/completion/getStudentList",
         type : "get",
         data : {"curriculum_no" : curriculum_no},
         dataType : "json",
         success : function(studentList) {
             console.log(studentList);
 
             for (var i = 0; i < studentList.length; i++)
                 $("#jqGrid").jqGrid('addRowData', i + 1,
                		 studentList[i]); 
         },
         error : function(request, status, error) {
             alert("code:" + request.status + "\n" + "message:"
                 + request.responseText + "\n" + "error:"
                 + error);
         }
     }); */

//그리드영역 그리기
var cnames = [ 'j', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자','전형일자', '학교', '전공', '입금여부' ];

$("#jqGrid").jqGrid({
    
	url : "/api/completion/getStudentList?curriculum_no="+curriculum_no,//jqgridStartMain.do,
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
	
	//리스트 클릭할때
	onSelectRow : function(rowId, iRow, iCol, e,user_no) {

        var rowId = $("#jqGrid").getGridParam("selrow");
        var userNo = $("#jqGrid").getRowData(rowId).user_no; //선택한 줄의 User_no을 가져오는 코드
        console.log(userNo);
        /*  alert("나중에 " + userNo + "") */

        $.ajax({
            url : "/api/completion/getUserCareerList",
            type : "get",
            data : {"user_no" : userNo},
            dataType : "json",
            success : function(list) {
                console.log(list);

                $("#afterServiceTable").empty();
                companyForm_Reset();

                if (list.length > 0) {
	                 for (var i = 0; i < list.length; i++) {
	                     renderApplied(list[i])
	                 }
                } else {
                    var str = "<tr><td colspan='5' align='center'>등록된 정보가 없습니다.</td></tr>";
                    $("#afterServiceTable").append(str);
                }

                $("input[name='hidden_no']").val(userNo)
               /*  $("input[name='hidden_applyno']").val(userCareer_no) */

            },
            error : function(request, status, error) {
                alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);}

        });

        function renderApplied(list) {
            var str = "";
            str += "<tr data-careerno='" + list.userCareer_no+ "' data-userno='" + list.user_no + "' class='past'>";
            str += "<td value='" + list.userCareer_no + "'></td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.compName + "</td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.startDate + "</td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.endDate + "</td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.state + "</td>";
            str += "</tr>";
            $("#afterServiceTable").append(str);

        };
    },

    viewrecords : true
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


/* 취업정보에서 회사클릭할때 */
$("#afterServiceTable").on("click", "tr", function() {
    console.log("들어왔음");
    var userCareer_no = $(this).data("careerno");
    var user_no = $(this).data("userno");
    
    past_apply(userCareer_no,user_no);

    $("input[name='hidden_no']").val(user_no)
    $("input[name='hidden_applyno']").val(userCareer_no)

    addUpdate_btnSet();
});

//취업기업추가 버튼 누를때
$("#companyAdd_div").on("click","#btn_companyAdd",function (user_no) {
	
	companyForm_Reset();
    addCancel_btnSet();

});

//수정버튼 누를때
$("#company_btn_div").on("click","#btn_companyUpdate", function () {
	console.log()
    report = {
        user_no: $("#hidden_no").val(),
        userCareer_no:$("#hidden_applyno").val(),
        compName: $("#compName").val(),
        telePhone: $("#telePhone").val(),
        startDate: $("#date1").val(),
        endDate: $("#date2").val(),
        role: $("#position").val(),
        department: $("#department").val(),
        companyAddress: $("#companyAddress").val(),
        state:$("#state option:selected").val()
    };

    $.ajax({

        url: "/api/completion/afterServiceUpdate",
        type:"post",
        data : report,
        dataType: "json",
        success: function (result) {

        	if(result==1){
            alert("항목 수정 완료");

        	}
        },
        error: function () {
        	alert("항목을 수정할 수 없습니다.");
        }
    });

});

//저장버튼 누를때
$("#company_btn_div").on("click","#btn_companyInsert", function (user_no) {
	console.log("저장버튼됨");
	console.log(user_no);
    report = {
        user_no: $("#hidden_no").val(),
        compName: $("#compName").val(),
        telePhone: $("#telePhone").val(),
        startDate: $("#date1").val(),
        endDate: $("#date2").val(),
        role: $("#position").val(),
        department: $("#department").val(),
        companyAddress: $("#companyAddress").val(),
		state:$("#state option:selected").val()
    	};
    console.log(report);
    $.ajax({
        url: "/api/completion/afterServiceAdd",
        type: "post",
        data : report,
        dataType: "json",
        success: function (result) {

        	if(result==1){
                alert("취업정보 저장 완료");
                getUserCareerList(report.user_no);/*afterServiceList영역으로 보내야함*/
        	}
        },
        error: function () {
        	 alert("데이터를 모두 입력해주세요.");
        }
    })

    function getUserCareerList(user_no){

    	$.ajax({
             url : "/api/completion/getUserCareerList",
             type : "get",
             data : {"user_no" : user_no},
             dataType : "json",
             success : function(list) {
                 console.log(list);

                 $("#afterServiceTable").empty();

                 if (list.length > 0) {
	                 for (var i = 0; i < list.length; i++) {
	                     renderApplied(list[i])
	                 }
                 } else {
                     var str = "<tr><td colspan='5' align='center'>등록된 정보가 없습니다.</td></tr>";
                     $("#afterServiceTable").append(str);
                 }

             },
             error : function(request, status, error) {
                 alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);}

         		 });

    	function renderApplied(list) {
            var str = "";
            str += "<tr data-careerno='" + list.userCareer_no+ "' data-userno='" + list.user_no + "' class='past'>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.userCareer_no + "</td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.compName + "</td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.startDate + "</td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.endDate + "</td>";
            str += "<td value='" + list.userCareer_no + "'>"
                + list.state + "</td>";
            str += "</tr>";
            $("#afterServiceTable").append(str);

        };
    }
});

//취소버튼 누를때
$("#company_btn_div").on("click","#btn_companyCancle",function () {

	companyForm_Reset();
	addUpdate_btnSet();
	
	var user_no= $("input[name='hidden_no']").val()
    var userCareer_no=$("input[name='hidden_applyno']").val()
	past_apply(userCareer_no,user_no);

})

//취업정보 클릭시 특정 회사의 상세정보 가져오기
function past_apply(userCareer_no,user_no) {
    console.log(user_no);
    console.log(userCareer_no);
    
    $.ajax({
        url : "/api/completion/getUserCareer",
        type : "post",
        data : {"user_no" : user_no,
        		"userCareer_no": userCareer_no},
        dataType : "json",
        success : function(userCareerVo) {
            console.log(userCareerVo)
            $("input[name='hidden_no']").val(userCareerVo.user_no)
            $("input[name='hidden_applyno']").val(userCareerVo.userCareer_no)
            $("input[name='compName']").val(userCareerVo.compName)
            $("input[name='telePhone']").val(userCareerVo.telePhone)
            $("input[name='date1']").val(userCareerVo.startDate)
            $("input[name='date2']").val(userCareerVo.endDate)
            $("[name='state']").val(userCareerVo.state)
            $("input[name='position']").val(userCareerVo.role)
            $("input[name='department']").val(userCareerVo.department)
            $("input[name='companyAddress']").val(userCareerVo.companyAddress)

        },
        error : function() {
            alert("에러.");
        }
    });

};


/* 카테고리번호로 커리큘럼 리스트 가져오기 */
function getCurriList(curriculumCate_no){
	
	 $.ajax({
         url : "/api/completion/getCurriList",
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

function addCancel_btnSet(){
	
	$("#btn_companyAdd").remove();
	$("#btn_companyUpdate").remove();
	$("#btn_companyCancle").remove();
	$("#btn_companyInsert").remove();
	
	var str = "";
    str += "<button type='button' class='btn btn-primary' id='btn_companyInsert'>저장</button>";
    str += "<button type='button' class='btn btn-default btn-sub pull-right' id='btn_companyCancle'>취소</button>";
    $("#company_btn_div").append(str);
    
}

function addUpdate_btnSet(){

	$("#btn_companyAdd").remove();
	$("#btn_companyUpdate").remove();
	$("#btn_companyCancle").remove();
	$("#btn_companyInsert").remove();

    var strAdd = "";
    strAdd += "<button type='button' class='btn btn-default btn-h25 pull-right' id='btn_companyAdd'>취업기업 추가</button>";
    $("#companyAdd_div").append(strAdd);

    var str = "";
    str += "<button type='button' class='btn btn-primary' id='btn_companyUpdate'>수정</button>";
    $("#company_btn_div").append(str);
	
}

function companyForm_Reset(){
	
	$("input[name='compName']").val("")
    $("input[name='telePhone']").val("")
    $("input[name='date1']").val("")
    $("input[name='date2']").val("")
    $("input[name='position']").val("")
    $("input[name='department']").val("")
    $("input[name='companyAddress']").val("")
	
};

</script>
</html>
