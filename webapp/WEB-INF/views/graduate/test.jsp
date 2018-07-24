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
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>



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
		<section class="content">

			<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12">

					<div class="box box-body">
						<div class="row">
							<div class="col-xs-12">
								<div class="sub-box">

									<!-- 조회 버튼 눌렀을때 조회 데이터 전송 -->

									<div class="sub-title">업체검색</div>

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
												<th style="padding-bottom: 10px; text-align: center">검색조건</th>

												<td>
													<div class="input-group form-inline" style="float: left;">
														<input type="radio" name="radio" value="1">전체 <input
															type="radio" style="margin-left: 10px;" name="radio"
															value="2">게시중 <input type="radio"
																				 style="margin-left: 10px;" name="radio" value="3">상시채용
														<input type="radio" style="margin-left: 10px;"
															   name="radio" value="4">신청일
													</div> <!-- <달력> -->

													<div class="input-group form-inline date"
														 style="float: left; padding-left: 20px">

														<input type="text"
															   style="width: 125px; margin-left: 20px;"
															   class="form-control input-sm datepicker"
															   id="datepicker1" name="date1"> <label
															for="datepicker1"
															style="background-image:${pageContext.request.contextPath}/assets/1.jpg">
														<i class="fa fa-calendar"
														   style="position: absolute; left: 145px; top: 7px; z-index: 2"></i>
													</label> <input type="text"
																	style="width: 125px; margin-left: 20px;"
																	class="form-control input-sm datepicker"
																	id="datepicker2" name="date2"> <label
															for="datepicker2"
															style="background-image:${pageContext.request.contextPath}/assets/2.jpg">
														<i class="fa fa-calendar"
														   style="position: absolute; left: 290px; top: 7px; z-index: 2"></i>
													</label>
													</div>


												</td>

											</tr>
											</thead>


										</table>
									</div>
									<!-- /.sub-body -->
									<div class="sub-toolbox text-center">
										<button type="submit" class="btn btn-primary" id="inquiry">조회</button>
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
									<div class="sub-title">구인업체</div>


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
												<col width="10" />
												<col width="10" />
												<col width="10" />
												<col width="5" />
											</colgroup>

											<thead>
											<tr>
												<th>&nbsp;</th>
												<th>게시유무</th>
												<th>블랙</th>
												<th>접수일</th>
												<th>회사명</th>
												<th>담당자</th>
												<th>모집부분</th>
												<th>모집인원</th>
												<th>이메일</th>
												<th>상시채용</th>
											</tr>
											</thead>
											<tbody>


											<c:forEach items="${dataList}" var="vo">
												<tr>
													<td>${vo.commpany_no}</td>
													<td><input type="checkbox"></td>
													<td><input type="checkbox"></td>
													<td>${vo.date}</td>
													<td>${vo.company_name}</td>
													<td>${vo.gender}</td>
													<td>${vo.recruit}</td>
													<td>${vo.person}</td>
													<td>${vo.email}</td>
													<td><input type="checkbox"></td>
												</tr>
											</c:forEach>


											</tbody>

										</table>
									</div>
									<!-- /.sub-body -->

								</div>
								<!-- /.sub-box -->
							</div>
							<div class="col-xs-3">
								<div class="sub-title">지원자리스트</div>
								<!-- sub_title -->
								<div class="sub-body bordered scroll" style="height: 150px;">
									<table class="table table-hover table-condensed">
										<colgroup>
											<col width="" />
											<col width="" />
										</colgroup>



										<!-- MODAL -->
										<tr>
											<button type="button" style="float: right;"
													class="btn btn-primary" id="insertData">추가</button>
										</tr>

										<thead>
										<tr>
											<th>&nbsp;</th>
											<th>기수</th>
											<th>이름</th>
											<th>&nbsp;</th>
										</tr>
										</thead>


										<!-- 내맘대로 입력값 -->

										<!-- <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>BS_SHOT9</td>
                                                <td>하재원</td>
                                                <td><button type="submit"
                                                        class="btn btn-link deleteBtn">X</button></td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>BS_SHOT9</td>
                                                <td>하재원</td>
                                                <td><button type="submit"
                                                        class="btn btn-link deleteBtn">X</button></td>
                                            </tr>
                                        </tbody> -->


									</table>
								</div>
								<!-- /.sub-body -->


								<!-- /.col-xs-3 -->
								<div class="col-xs-15">
									<div class="sub-box">
										<div class="sub-title">메모</div>
										<!-- sub_title -->
										<div class="sub-body">
											<table class="table table-condensed">
												<colgroup>
													<col width="80px" />
													<col width="" />
													<col width="80px" />
													<col width="" />
													<col width="250px" />
												</colgroup>

												<tbody>
												<tr>

													<td rowspan="5"><textarea class="form-control"
																			  rows="9"></textarea></td>
												</tr>


												</tbody>
											</table>
										</div>
									</div>
									<!-- /.sub-box -->
								</div>
								<!-- /.col-xs-12 -->
							</div>
							<!-- /.row -->
							<div class="space"></div>
							<div class="row">



								<!-- /.sub-body -->
								<div class="sub-toolbox text-center">
									<button type="button" class="btn btn-primary">저장</button>
								</div>
							</div>
							<!-- /.sub-box -->
						</div>
						<!-- /.col-xs-9 -->
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






<!-- Modal!!! -->
<div class="modal fade" id="insertDataModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
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
				<button type="submit" class="btn btn-primary" id="inquiry2">조회</button>

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



</body>
</html>




<script type="text/javascript">
    $(document)
        .ready(
            function() {

                /* 삭제 */

                $(".deleteBtn").on("click", function() {
                    console.log("!");
                    $(this).closest("tr").remove();
                });

                //달력1
                $("#datepicker1").datepicker();
                //달력2
                $("#datepicker2").datepicker();

                $.datepicker
                    .setDefaults({
                        prevText : '이전 달',
                        nextText : '다음 달',
                        monthNames : [ '1월', '2월', '3월', '4월',
                            '5월', '6월', '7월', '8월', '9월',
                            '10월', '11월', '12월' ], //월 이름
                        monthNamesShort : [ '1월', '2월', '3월', '4월',
                            '5월', '6월', '7월', '8월', '9월',
                            '10월', '11월', '12월' ], //
                        dayNames : [ '일', '월', '화', '수', '목', '금',
                            '토' ],
                        dayNamesShort : [ '일', '월', '화', '수', '목',
                            '금', '토' ],
                        dayNamesMin : [ '일', '월', '화', '수', '목',
                            '금', '토' ],
                        showMonthAfterYear : true,
                        yearSuffix : '년',
                        changeMonth : true,
                        changeYear : true,
                        dateFormat : "yy년 mm월 dd일"
                    });

                /* 조회 */

                $("#inquiry")
                    .on(
                        "click",
                        function() {
                            console.log("!");
                            $
                                .ajax({
                                    url : "${pageContext.request.contextPath}/inquiry",
                                    type : "post",
                                    data : {
                                        radio : $(
                                            "[name=radio]")
                                            .val(),
                                        date1 : $(
                                            "[name=date1]")
                                            .val(),
                                        date2 : $(
                                            "[name=date2]")
                                            .val()

                                    },
                                    //dataType : "json",
                                    success : function() {

                                    },
                                    error : function(XHR,
                                                     status, error) {
                                        console
                                            .error(status
                                                + " : "
                                                + error);
                                    }

                                });
                        });

                /* 조회2 */

                $("#inquiry2")
                    .on(
                        "click",
                        function() {
                            console.log("!");
                            $
                                .ajax({
                                    url : "${pageContext.request.contextPath}/inquiry2",
                                    type : "post",
                                    data : {
                                        "gisu" : $(
                                            "[name=gisu]")
                                            .val(),
                                        "name" : $(
                                            "[name=name]")
                                            .val(),
                                    },
                                    dataType : "json",
                                    success : function(
                                        getGisu) {
                                        console
                                            .log(getGisu[0].gisuName
                                                + "/"
                                                + getGisu[0].nameHan)
                                        $(".gisu")
                                            .html(
                                                getGisu[0].gisuName)
                                        $(".name")
                                            .html(
                                                getGisu[0].nameHan)
                                    },

                                    error : function(XHR,
                                                     status, error) {
                                        console
                                            .error(status
                                                + " : "
                                                + error);
                                    }

                                });
                        });

                /* 모달 선택 */

                $("#choice")
                    .on(
                        "click",
                        function() {
                            event.preventDefault();
                            var GisuName = $("#GisuName").val();
                            var NameHan = $("#NameHan").val();
                            console.log(gisuName);
                            console.log(nameHan);
                            $
                                .ajax({
                                    url : "${pageContext.request.contextPath }/subject/addcate",
                                    type : "post",
                                    data : {
                                        "GisuName" : GisuName,
                                        "NameHan" : NameHan
                                    },
                                    dataType : "json",
                                    success : function() {
                                    },

                                    error : function(XHR,
                                                     status, error) {
                                        console
                                            .error(status
                                                + " : "
                                                + error);
                                    }
                                });
                        });

                $('[id=insertData]').on('click', function() {
                    $("[id=insertDataModal]").modal();
                })

                var cnames = [ '번호', '과정', '이름', '생년월일', '성별', '전형결과',
                    '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부' ];

                $("#jqGrid").jqGrid({
                    url : "jqgridStartMain.do",
                    datatype : "local",
                    colNames : cnames,
                    colModel : [ {
                        name : 'seq',
                        index : 'seq',
                        width : 110,
                        align : "center"
                    }, {
                        name : 'gisu',
                        index : 'gisu',
                        width : 200
                    }, {
                        name : 'name',
                        index : 'name',
                        width : 200
                    }, {
                        name : 'birth',
                        index : 'birth',
                        width : 200
                    }, {
                        name : 'gender',
                        index : 'gender',
                        width : 200
                    }, {
                        name : 'result',
                        index : 'result',
                        width : 200
                    }, {
                        name : 'phone',
                        index : 'phone',
                        width : 200
                    }, {
                        name : 'appdate',
                        index : 'appdate',
                        width : 200
                    }, {
                        name : 'exdate',
                        index : 'exdate',
                        width : 200
                    }, {
                        name : 'school',
                        index : 'school',
                        width : 200
                    }, {
                        name : 'major',
                        index : 'major',
                        width : 200
                    }, {
                        name : 'yn',
                        index : 'yn',
                        width : 200
                    } ],

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

            });

    $(function() {
        var mydata = [ {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        }, {
            seq : "1",
            gisu : "dsfjkf",
            name : "ㅇㄹㄴ",
            birth : '2018-05-05',
            gender : "남",
            result : "탈락",
            phone : "010-6565-5644",
            appdate : "2018-06-50",
            exdate : "2018-21-56",
            school : "서을대학교",
            major : "콤퓨타",
            yn : "미납"
        } ];

        for (var i = 0; i <= mydata.length; i++) {
            $("#jqGrid").jqGrid('addRowData', i + 1, mydata[i]);
        }
    });
</script>
