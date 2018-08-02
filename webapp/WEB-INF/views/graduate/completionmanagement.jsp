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
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>

	<style type="text/css">
		.btn-date {
			padding-top : 0px;
			padding-bottom :0px;
		}

	</style>

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
												<th>교육과정명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<div style = "float:right;">
														<label class="form-controll-static"><input class="" type="radio" name="state" value="">전체</label>
														<label class="form-controll-static"><input class="" type="radio" name="state" value="">준비중</label>
														<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집중</label>
														<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집마감</label>
														<label class="form-controll-static"><input class="" type="radio" name="state" value="">수업중</label>
														<label class="form-controll-static"><input class="" type="radio" name="state" value="">종료</label>
													</div>
												</th>
											</tr>
											</thead>

											<tbody>
											<tr>
												<td>
													<select name="workType"
															class="form-control input-sm" id="workTypeSelect">
														<c:forEach items="${requestScope.curriList}"
																   var="curriList">
															<option value="${curriList.workType}"
																	id="${curriList.workType}">${curriList.workType}</option>
														</c:forEach>
													</select>
												</td>
												<td id="curriTd">
													<select name="strcurriName" class="form-control input-sm" id="curriSelect">

													</select>
												</td>
											</tr>
											</tbody>
										</table>
									</div><!-- /.sub-body -->
									<div class="sub-toolbox text-center">
										<button type="button" class="btn btn-primary" id="applySearch">조회</button>
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
				<div class="col-xs-12" style="height: 720px;">
					<div class="box box-body" style="height: 720px;">

						<div class="row">
							<div class="col-xs-12" >
								<div class="sub-box">
									<div class="sub-title">
										수강생리스트
									</div><!-- sub_title -->
									<div class="sub-body" style="height:300px;">
										<table id="jqGrid" style="text-align:center;"></table>

										<div id="jqGridPager"></div>
									</div><!-- /.sub-body -->

								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-12 -->
						</div><!-- /.row -->
						<div class="space"></div>
						<div class="row">
							<div class="col-xs-4" style="margin-top:13px;">
								<div class="sub-box">
									<div class="sub-title">
										취업정보
									</div><!-- sub_title -->
									<div class="sub-body bordered" style="height:150px; ">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="" />
												<col width="" />
												<col width="" />
												<col width="" />
												<col width="" />
											</colgroup>

											<thead>
											<tr style="height:10px;">
												<th></th>
												<th>회사명</th>
												<th>입사일</th>
												<th>퇴사일</th>
												<th>재직여부</th>
											</tr>
											</thead>

											<tbody id="afterServiceTable">

											<!-- <tr>
												<th>2</th>
												<td>위메프</td>
												<td>2018-05-01</td>
			                  					<td></td>
			                  					<td style="width:10px;">○</td>
											</tr> -->
											</tbody>
										</table>
									</div><!-- /.sub-body -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-3 -->
							<div class="col-xs-8">
								<div class="sub-box">
										<div class="pull-right" style="margin-bottom:5px;width:100px;height:30px;padding-right:15px;float:right;"id="companyAdd_div">
											<button type="button" class="btn btn-primary" id="companyAdd">추가</button>
										</div><!-- sub_title -->
									<div class="row">
										<div class="sub-body" style="height:220px;padding-right: 15px;" id="companyTableDiv">
											<table class="table table-condensed" id="companyTable">
												<colgroup>
													<col width="80px" />
													<col width="300px" />
													<col width="80px" />
													<col width="300px" />
												</colgroup>

												<tbody>
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
													<td style="height:20px;">
														<div class="input-group" style="border: 1px solid #c2c2c2;height:20px;">
	                                                 				<span class="input-group-btn">
			                                                  			<button type="button" class="btn btn-date" data-toggle="datepicker" style="
			                                                  				background-color: rgba(255,255,255,0)"  id="testDatepicker">
			                                                  			<label for="date1">
			                                                  			<i class="fa fa-calendar"></i>
			                                                  			</label></button>
		                                                  			</span>
															<input type="text" class="form-control input-xs pull-right"
																   name="date1" id="date1"  data-select="datepicker" style="border: none;width:270px;height:20px;">
														</div>
													</td>
													<th>퇴사일</th>
													<td style="height:20px;">
														<div class="input-group" style="border: 1px solid #c2c2c2;height:20px;">
	                                                 				<span class="input-group-btn">
			                                                  			<button type="button" class="btn btn-date" data-toggle="datepicker" style="
			                                                  				background-color: rgba(255,255,255,0)"  id="testDatepicker">
			                                                  			<label for="date2">
			                                                  			<i class="fa fa-calendar"></i>
			                                                  			</label></button>
		                                                  			</span>
															<input type="text" class="form-control input-xs pull-right"
																   name="date2" id="date2"  data-select="datepicker" style="border: none;width:270px;height:20px;">
														</div>
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
										<div class="sub-toolbox text-center" id="company_btn_div">
											<button type="button" class="btn btn-primary" id="company_btn">수정</button>
										</div>
									</div><!-- /.sub-box -->
									<input type = "hidden" name="hidden_no" id = "hidden_no">
									<input type = "hidden" name="hidden_applyno" id = "hidden_applyno">
								</div><!-- /.col-xs-9 -->
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

	<div class="control-sidebar-bg"></div>



</div>
<!-- ./wrapper -->


</body>
<!-- </html> -->

<script type="text/javascript">

    $(document).ready(function() {

        var selectValue = $("#workTypeSelect option:selected").val();
        console.log(selectValue);

        $.ajax({
            url : "${pageContext.request.contextPath }/api/completion/getcurri",
            type : "get",
            data : {"workType" : selectValue},
            dataType : "json",
            success : function(list) {
                console.log("지원자 관리 들어갔다 왔어요");
                $("#curriSelect").remove();
                var str = "";
                str += "<select id='curriSelect' class='form-control input-sm' style='width: 90%'></select>";

                $("#curriTd").append(str);

                for (var i = 0; i < list.length; i++) {
                    renderCurri(list[i])}

            },
            error : function(XHR, status, error) {
                console.error(status + " : "+ error)}
        });

        //업무 구분별 과목 불러오는 스크립트
        $("#workTypeSelect").change(function() {
            var selectValue = $("#workTypeSelect option:selected").val();

            $.ajax({
                url : "/api/completion/getcurri",
                type : "get",
                data : {"workType" : selectValue},
                dataType : "json",
                success : function(list) {
                    $("#curriSelect").remove();
                    var str = "";
                    str += "<select id='curriSelect' class='form-control input-sm' style='width: 90%'></select>";
                    $("#curriTd").append(str);
                    for (var i = 0; i < list.length; i++) {
                        /* console.log(list[i]) */
                        renderCurri(list[i])
                    }
                },
                error : function(XHR,status,error) {
                    console.error(status+ " : "+ error)}
            });

        });

        function renderCurri(curri) {
            var str = "";
            str += "<option value='" + curri.curriculum_no + "'>"
                + curri.curriName + "</option>";

            $("#curriSelect").append(str);

        };

    });

    $(document).on("click","#applySearch",function() {
        var selectValue = $("#curriSelect option:selected").val();
        console.log("클릭됨" + selectValue);
        $.ajax({
            url : "/api/completion/search",
            type : "get",
            data : {"selectValue" : selectValue},
            dataType : "json",
            success : function(list) {
                console.log("search 잘 들어갔다 나옴");

                jqGridUserInfo();

                for (var i = 0; i < list.length; i++)
                    $("#jqGrid").jqGrid('addRowData', i + 1,
                        list[i]);
            },
            error : function(request, status, error) {
                alert("code:" + request.status + "\n" + "message:"
                    + request.responseText + "\n" + "error:"
                    + error);
            }
        });

    });

   function jqGridUserInfo() {

	  removeJqGridTable();
      renderJqGridTable();

    var cnames = [ 'j', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자','전형일자', '학교', '전공', '입금여부' ];

    $("#jqGrid")
        .jqGrid(
            {
                url : "jqgridStartMain.do",
                datatype : "local",
                colNames : cnames,
                colModel : [ {name : 'user_no',index : 'user_no',width : 10,hidden : true},
                    {name : 'gisuName',index : 'gisuName',width : 100,align : "center"},
                    {name : 'nameHan',index : 'nameHan',width : 100,align : "center"},
                    {name : 'birthDate',index : 'birthDate',width : 100,align : "center"},
                    {name : 'gender',index : 'gender',width : 50,align : "center"},
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
                        url : "/api/completion/afterServiceList",
                        type : "get",
                        data : {"user_no" : userNo},
                        dataType : "json",
                        success : function(list) {
                            console.log(list);

                            $("#afterServiceTable").empty();

                            for (var i = 0; i < list.length; i++) {
                                renderApplied(list[i])
                            }

                        },
                        error : function(request, status, error) {
                            alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);}

                    });

                    /* function renderApplied(list) {
                      var str = "";
                      str += "<tr onClick='past_apply(" + list.curriculum_no + ")'>";
                         str += "<td value='" + list.curriculum_no + "'>" + list.testDay + "</td>";
                         str += "<td value='" + list.curriculum_no + "'>" + list.curriName + "</td>";
                         str += "</tr>";
                         $("#appliedTable").append(str);

                        }; */

                    function renderApplied(list) {
                        var str = "";
                        str += "<tr id='" + list.userCareer_no+ "' name='" + list.user_no + "' class='past'>";
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
                },

                viewrecords : true
                /* caption: "유저 정보" */
            });
  }

   function renderJqGridTable() {
      str = "";
      str = "<table id='jqGrid'></table>";

      $("div[name=jqgrid]").append(str);
  }

  function removeJqGridTable() {
      $("#gbox_jqGrid").remove();
  }


   function past_apply(userCareer_no, user_no) {

        console.log(user_no);
        console.log(userCareer_no);

        $.ajax({
            url : "/api/completion/afterService_details",
            type : "get",
            data : {"userCareer_no" : userCareer_no,
                "user_no" : user_no},
            dataType : "json",
            success : function(userCareerVo) {
                console.log(userCareerVo)
                $("input[name='hidden_no']").val(userCareerVo.user_no)
                $("input[name='hidden_applyno']").val(userCareerVo.userCareer_no)
                $("input[name='compName']").val(userCareerVo.compName)
                $("input[name='telePhone']").val(userCareerVo.telePhone)
                $("input[name='date1']").val(userCareerVo.startDate)
                $("input[name='date2']").val(userCareerVo.endDate)
                $("input[name='position']").val(userCareerVo.role)
                $("input[name='department']").val(userCareerVo.department)
                $("input[name='companyAddress']").val(userCareerVo.companyAddress)

            },
            error : function(request, status, error) {
                alert("취업한 정보가 없습니다.");
            }
        });

    }

    $("#afterServiceTable").on("click", "[class=past]", function() {
        console.log("들어왔음");
        var afterService_no = $(this).attr("id");
        var user_no = $(this).attr("name");
        past_apply(afterService_no, user_no);

    });

    //달력1
    $("#date1").datepicker();
    //달력2
    $("#date2").datepicker();

    $.datepicker.setDefaults({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
            '8월', '9월', '10월', '11월', '12월' ], //월 이름
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
            '7월', '8월', '9월', '10월', '11월', '12월' ], //
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        showMonthAfterYear : true,
        yearSuffix : '년',
        changeMonth : true,
        changeYear : true,
        dateFormat : "yy-mm-dd"
    });

    $(document).on("click","#companyAdd",function (user_no) {

    	console.log(user_no);
        $("#companyAdd").remove();

        $("input[name='compName']").val("")
        $("input[name='telePhone']").val("")
        $("input[name='date1']").val("")
        $("input[name='date2']").val("")
        $("input[name='position']").val("")
        $("input[name='department']").val("")
        $("input[name='companyAddress']").val("")

        $("#company_btn").remove();



        var str = "";
        str += "<button type='button' class='btn btn-primary' id='company_btnAdd'>저장</button>";
        str += "&nbsp&nbsp&nbsp&nbsp<button type='button' class='btn btn-primary' id='company_cancle'>취소</button>";
        $("#company_btn_div").append(str);

    });

    $("#company_btn_div").on("click","#company_btn", function () {

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
            state:$("#state").selectValue()
        };

        $.ajax({

            url: "/api/completion/afterServiceUpdate",
            type: "post",
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

    })

    $("#company_btn_div").on("click","#company_btnAdd", function (user_no) {
		console.log("저장버튼됨");
        report = {
            user_no: $("#hidden_no").val(),
            userCareer_no:$("#hidden_applyno").val(),
            compName: $("#compName").val(),
            telePhone: $("#telePhone").val(),
            startDate: $("#date1").val(),
            endDate: $("#date2").val(),
            role: $("#position").val(),
            department: $("#department").val(),
            companyAddress: $("#companyAddress").val()

        };

        console.log(report);
        $.ajax({

            url: "/api/completion/afterServiceAdd",
            type: "post",
            data : report,
            dataType: "json",
            success: function (result) {

            	if(result==1){
                alert("취업정보 저장 완료");}

            	past_apply(userCareer_no, user_no)

            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });

    })


    $("#company_btn_div").on("click","#company_cancle",function () {

         $("input[name='compName']").val("")
         $("input[name='telePhone']").val("")
         $("input[name='date1']").val("")
         $("input[name='date2']").val("")
         $("input[name='position']").val("")
         $("input[name='department']").val("")
         $("input[name='companyAddress']").val("")

    	 $("#company_cancle").remove();
    	 $("#company_btnAdd").remove();

         var strAdd = "";
         strAdd += "<button type='button' class='btn btn-primary' id='companyAdd'>추가</button>";
         $("#companyAdd_div").append(strAdd);

         var str = "";
         str += "<button type='button' class='btn btn-primary' id='company_btn'>수정</button>";
         $("#company_btn_div").append(str);

    })

</script>
</html>
