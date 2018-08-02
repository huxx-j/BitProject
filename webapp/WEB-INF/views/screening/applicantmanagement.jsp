<%--<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>TCOMS ver2</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta
			content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
			name="viewport">
	<c:import url="/WEB-INF/views/includes/link.jsp" />
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp" />

<style type="text/css">
		.btn-date {
			padding-top : 0px;
			padding-bottom :0px;
		}
</style>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<c:import url="/WEB-INF/views/includes/aside.jsp" />


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
		<section class="content" style="padding-top:10px;padding-bottom:10px;">

			<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12" style="height: 155px;">

					<div class="box box-body" style="padding-bottom: 0px;">
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
												<th>교육과정명&nbsp;&nbsp;&nbsp;&nbsp;
													<label class="form-controll-static"><input class="" type="radio" name="state" value="전체">전체</label>
													<label class="form-controll-static"><input class="" type="radio" name="state" value="모집중">모집중</label>
												</th>
											</tr>
											</thead>

											<tbody>
											<tr>
												<td><select name="workType"
															class="form-control input-sm" id="workTypeSelect">
													<c:forEach items="${requestScope.curriList}"
															   var="curriList">
														<option value="${curriList.workType}"
																id="${curriList.workType}">${curriList.workType}</option>
													</c:forEach>
												</select></td>
												<td id="curriTd">
													<select name="strcurriName" class="form-control input-sm" id="curriSelect">

													</select></td>
											</tr>
											</tbody>
										</table>
									</div>
									<!-- /.sub-body -->
									<div class="sub-toolbox text-center">
										<button type="button" class="btn btn-primary"
												id="applySearch">조회</button>
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
			<div class="row" style="height: 690px;">
				<div class="col-xs-12" style="height: 690px;">
					<div class="box box-body" style="height: 690px;">

						<div class="row">
							<div class="col-xs-12">
								<div class="sub-box">
									<div class="sub-title">지원자리스트</div>
									<!-- sub_title -->
									<div class="sub-body" style="height: 300px;">
										<table id="jqGrid" style="text-align: center;"></table>

										<div id="jqGridPager"></div>
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
							<div class="col-xs-4" style="padding-right:0px;">
								<div class="sub-box">
									<div class="sub-title">과거지원내역</div>
									<!-- sub_title -->
									<div class="sub-body">
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
											<!-- <tr id ="applied">
                                        <td></td>
                                          <td></td>
                                    </tr> -->
											</tbody>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!-- /.sub-box -->
							</div>
							<!-- /.col-xs-3 -->
							<div class="col-xs-6" style="height: 310px;padding-right:5px;width:645px;">
								<div class="sub-box">
									<div class="sub-box"
										 style="height: 200px;float: right;">
										<div class="sub-title">지원내역상세</div>
										<!-- sub_title -->

										<table class="table table-condensed">
											<colgroup>
												<col width="12%" />
												<col width="" />
												<col width="12%" />
												<col width="" />
											</colgroup>

											<tbody>
											<tr>
												<th>업무구분</th>
												<td><input class="form-control input-sm"
														   name="workType"></td>
											</tr>
											<tr>
												<th>교육과정명</th>
												<td><input class="form-control input-sm"
														   name="curriName"></td>
											</tr>

											</tbody>
										</table>
										<div class="space"></div>
										<table class="table table-condensed">
											<colgroup>
												<col width="12%" />
												<col width="38%" />
												<col width="12%" />
												<col width="38%" />
											</colgroup>

											<tbody>
											<tr>
												<th>지원종류</th>
												<td><select class="form-control input-sm"
															name="applyType" id="applyType">
													<c:if test="${applyVo.applyType eq '일반지원'}">
														<option value="일반지원" selected>일반지원</option>
													</c:if>
													<c:if test="${applyVo.applyType ne '일반지원'}">
														<option value="일반지원">일반지원</option>
													</c:if>

													<c:if test="${applyVo.applyType eq '노동부지원'}">
														<option value="노동부지원" selected>노동부지원</option>
													</c:if>
													<c:if test="${applyVo.applyType ne '노동부지원'}">
														<option value="노동부지원">노동부지원</option>
													</c:if>
													<c:if test="${applyVo.applyType eq '개인지원'}">
														<option value="개인지원" selected>개인지원</option>
													</c:if>
													<c:if test="${applyVo.applyType ne '개인지원'}">
														<option value="개인지원">개인지원</option>
													</c:if>
													<c:if test="${applyVo.applyType eq '대학교'}">
														<option value="대학교" selected>대학교</option>
													</c:if>
													<c:if test="${applyVo.applyType ne '대학교'}">
														<option value="대학교">대학교</option>
													</c:if>
												</select></td>
												<th>전형과목</th>
												<td><select class="form-control input-sm"
															name="testLang" id="testLang">


												</select></td>
											<tr>
												<th>전형점수</th>
												<td><input class="form-control input-sm" type="text"
														   name="testScore" id="testScore"></td>
												<th>전형결과</th>
												<td><select class="form-control input-sm"
															name="state" id="state">
													<option>합격</option>
													<option>불합격</option>
												</select></td>
											</tr>
											</tbody>
										</table>
										<div class="space"></div>
										<table class="table table-condensed">
											<colgroup>
												<col width="12%" />
												<col width="38%" />
												<col width="12%" />
												<col width="38%" />
											</colgroup>

											<tbody>

											<tr>
												<th>계좌 입금일</th>
												<td>
													<div class="input-group" style="border: 1px solid #c2c2c2">
	                                                 				<span class="input-group-btn">
			                                                  			<button type="button" class="btn btn-date" data-toggle="datepicker" style="border: none;
			                                                  				background-color: rgba(255,255,255,0)"  id="testDatepicker">
			                                                  			<label for="date1">
			                                                  			<i class="fa fa-calendar"></i>
			                                                  			</label></button>
		                                                  			</span>
														<input type="text" class="form-control input-sm pull-right"
															   name="date1" id="date1"  data-select="datepicker" style="border: none">
													</div>
												</td>
												<th>계좌입금액</th>
												<td><input class="form-control input-sm" type="text"
														   name="depositAmount" id="amountCalcul_1" ></td>
											</tr>

											<tr>
												<th>카드결제일</th>
												<td>
													<div class="input-group" style="border: 1px solid #c2c2c2">
	                                                 				<span class="input-group-btn">
			                                                  			<button type="button" class="btn btn-date" data-toggle="datepicker" style="border: none;
			                                                  				background-color: rgba(255,255,255,0)"  id="testDatepicker">
			                                                  			<label for="date2">
			                                                  			<i class="fa fa-calendar" id="testDatepicker"></i>
			                                            				</label></button>
		                                                  			</span>
														<input type="text" class="form-control input-sm pull-right"
															   name="date2" id="date2"  data-select="datepicker" style="border: none">
													</div>
												</td>
												<th>카드결제액</th>
												<td><input type="text"
														   class="form-control input-sm pull-right" id="amountCalcul_2"
														   name="cardPayAmount" ></td>
											</tr>
											<tr>
												<th>입금여부</th>
												<td><select class="form-control input-sm"
															name="deposit" id="deposit">
													<option>완납</option>
													<option>미납</option>
													<option>부분납</option>
												</select></td>
												<th>결제액 계</th>
												<td><input type="text"
														   class="form-control input-sm pull-right" id="amountResult"
														   name="totalPay" readOnly="readOnly"></td>
											</tr>
											</tbody>
										</table>
										<!-- /.sub-body -->
									</div>
									<input type = "hidden" name="hidden_no">
								</div>
								<!-- /.sub-box -->
							</div>
							<!-- /.col-xs-9 -->
							<div class = "col-xs-2" style="padding-left:0px;height: 310px;">
									<div class="sub-box"
										 style=" height: 310px;">
										<div class="sub-title">상담내역</div>
										<!-- <div style="width: 100%; float: right;"> -->
												<textarea class="form-control" rows="9"
														  style="height: 280px;" id="consult" name="consult"></textarea>
										<!-- </div> -->
									</div>
							</div>
							<div class="sub-toolbox text-center">
								<button type="button" class="btn btn-primary" id="update">수정</button>
							</div>
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

	<div class="control-sidebar-bg"></div>



</div>
<!-- ./wrapper -->


<script type="text/javascript">

    $(document).ready(function() {

        var selectValue = $("#workTypeSelect option:selected").val();
        console.log("ajsdfhijashdfahdfuihsadijfb");
        console.log(selectValue);

        $.ajax({
            url : "${pageContext.request.contextPath }/api/apply/getcurri",
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
                url : "/api/apply/getcurri",
                type : "get",
                data : {"workType" : selectValue},
                dataType : "json",
                success : function(list) {
                    $("#curriSelect").remove();
                    var str = "";
                    str += "<select id='curriSelect' class='form-control input-sm' style='width: 90%'></select>";
                    $("#curriTd").append(str);
                    for (var i = 0; i < list.length; i++) {
                        console.log(list[i])
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
            url : "/api/apply/search",
            type : "get",
            data : {
                "selectValue" : selectValue
            },
            dataType : "json",
            success : function(list) {

                console.log("search 잘 들어갔다 나옴");

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

    var cnames = [ 'j', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자',
        '전형일자', '학교', '전공', '입금여부' ];

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
                        url : "/api/apply/getAppliedList",
                        type : "get",
                        data : {"user_no" : userNo},
                        dataType : "json",
                        success : function(list) {
                            console.log(list);

                            $("#appliedTable").empty();

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
                        str += "<tr id='" + list.curriculum_no+ "' name='" + list.user_no + "' class='past'>";
                        str += "<td value='" + list.curriculum_no + "'>"
                            + list.testDay + "</td>";
                        str += "<td value='" + list.curriculum_no + "'>"
                            + list.curriName + "</td>";
                        str += "</tr>";
                        $("#appliedTable").append(str);

                    };

                },

                viewrecords : true
                /* caption: "유저 정보" */

            });

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
                $("input[name='workType']").val(applyVo.workType)
                $("input[name='curriName']").val(applyVo.curriName)
                $("input[name='applyType']").val(applyVo.applyType)
                $("input[name='testLang']").val(applyVo.testLang)
                var str = "";
                str += "<option>"+applyVo.testLang+"<option>";
                $("[name=testLang]").append(str);

                $("input[name='testScore']").val(applyVo.testScore)
                $("input[name='state']").val(applyVo.state)
                $("input[name='date1']").val(applyVo.depositDay)
                $("input[name='date2']").val(applyVo.cardPayDay)
                $("input[name='depositAmount']").val(applyVo.depositAmount)
                $("input[name='cardPayAmount']").val(applyVo.cardPayAmount)
                $("input[name='deposit']").val(applyVo.deposit)
                $("input[name='totalPay']").val(applyVo.totalPay)
                $("[name='consult']").val(applyVo.consult)

            },
            error : function(request, status, error) {
                alert("code:" + request.status + "\n" + "message:"
                    + request.responseText + "\n" + "error:" + error);
            }
        });

    }

    $("#appliedTable").on("click", "[class=past]", function() {
        console.log("들어왔음");
        var curriculum_no = $(this).attr("id");
        var user_no = $(this).attr("name");
        past_apply(curriculum_no, user_no);

    });


    $("#amountCalcul_1, #amountCalcul_2").change(function(){
        calc();
    });

    function calc() {
        $("#amountResult").val(Number($("#amountCalcul_1").val()) + Number($("#amountCalcul_2").val()));
    }

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

    $("#update").on("click", function () {

        report = {
            user_no: $("input[name='hidden_no']").val(),
            applyType: $("#applyType").val(),
            testLang: $("#testLang").val(),
            testScore: $("#testScore").val(),
            state: $("#state").val(),
            depositDay: $("#date1").val(),
            depositAmount: $("#amountCalcul_1").val(),
            cardPayDay: $("#date2").val(),
            cardPayAmount: $("#amountCalcul_2").val(),
            deposit: $("#deposit").val(),
            totalPay: $("#amountResult").val(),
            consult: $("#consult").val()

        };

        $.ajax({
            url: "/api/apply/applyUpdate",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(report),
            dataType: "json",
            success: function () {

                alert("항목 저장 완료");
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });

    })

</script>
</body>
</html>


<%-- <c:import url="/WEB-INF/views/screening/applyScript.jsp" /> --%>
