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
				<li><a href="#">전형관리</a></li>
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
									<div class="sub-title">수료생</div>

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
												<td><input type="text" name="text" value="">
												<th>이름</th>
												<td><input type="text" name="text" value="">
											</tr>
											</thead>
										</table>
									</div>
									<!-- /.sub-body -->
									<div class="sub-toolbox text-center">
										<button type="button" class="btn btn-primary">조회</button>
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
							<div class="col-xs-12">
								<div class="sub-box">
									<div class="sub-title">수료생</div>
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
											<c:forEach var="i" begin="1" end="20" step="1">
												<tr>
													<td>1</td>
													<td><input type="checkbox"></td>
													<td>KUKA19_RD01</td>
													<td>강규범</td>
													<td>911121</td>
													<td>남</td>

												</tr>
											</c:forEach>
											</tbody>

										</table>
									</div>
									<!-- /.sub-body -->

								</div>
								<!-- /.sub-box -->
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
						<button type="button" class="btn btn-primary">선택</button>
						<button type="button" class="btn btn-primary">취소</button>
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



</div>
<!-- ./wrapper -->


</body>
</html>

<script type="text/javascript">
    $(document).ready(
        function() {

            var cnames = [ '번호', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰',
                '지원일자', '전형일자', '학교', '전공', '입금여부' ];

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

            /* ajax로 DB에서 정보 긁어서 뿌려주는 코드 */

            // $(function () {
            //
            //     $.ajax({
            //         url: "/api/getuserinfo",
            //         type: "post",
            //         dataType: "json",
            //         success: function (result) {
            //             console.log(result);
            //
            //             for (var i = 0; i<result.length; i++)
            //                 $("#jqGrid").jqGrid('addRowData', i+1, result[i]);
            //         },
            //         error: function (XHR, status, error) {
            //             console.error(status + " : " + error);
            //         }
            //     });
            //
            // });
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













<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						<div class="row">
							<!-- 위에테이블 왼쪽-->
							<div class="col-xs-12">
								<div class="sub-box">
									<div class="sub-title">기업정보</div>
									<div class="sub-body">
										<table class="table table-condensed">
											<colgroup>
												<col width="80px" />
												<col width="" />
												<col width="80px" />
												<col width="" />
												<col width="80px" />
												<col width="" />	
												<col width="80px" />
												<col width="" />			
											</colgroup>
																					
											<tbody>
												
												<tr>
													<th>자본금금금</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>연매출액</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
													<th>직원수</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>상장여부</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
											</tbody>
										</table>
									</div>

									
										<table class="table table-condensed">
											<colgroup>
												<col width="111px" />
												<col width="311px" />
												<col width="111px" />
												<col width="311px" />
												<col width="111px" />
												<col width="311px" />			
											</colgroup>
										
											<tbody>
												<tr>
													<th>회사명</th>
														<td>
															<input class="form-control" type="text">
														</td>
													<th>홈페이지</th>
														<td colspan="5">
															<input class="form-control" type="text">
														</td>
												</tr>
												<tr>
													<th>설립년도</th>
													<td>
													<!-- 	<div class="input-group border-inputcolor">
															<input class="form-control border-none" name="date" id="date" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																<span class="input-group-btn">
																	<button type="button" class="btn- btn-date border-none" data-toggle="datepicker">
																		<i class="fa fa-calender">::before</i>
																	</button>
																</span>
														</div> -->
													</td>
													<th>사업자번호</th>
													<td>
														<input class="form-control" type="text">
													</td>
													
													<th>직원수</th>
													<td class="form-inline">
														<input class="form-control w140" type="text">명
													</td>
												</tr>
												<tr>
													<th>자본금</th>
													<td>
														<input class="form-control" type="text">
													</td>
												
													<th>연매출액</th>
													<td
														><input class="form-control" type="text">
													</td>
												
													<th>상장여부</th>
													<td>
														<select class="form-control">
															<option value="상장">상장</option>
															<option value="비상장">비상장</option>
														</select>
													</td>
												</tr>
											
												<tr>
													<th rowspan="2">회사주소</th>
													<td colspan="5">
														<input class="w140" type="text">
														<button class="btn btn-default btn-sm" type="button">찾기</button>
													</td>
												</tr>
												<tr>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
											
												<!-- <tr>
													<th>홈페이지</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr> -->
												<tr>
													<th>회사소개</th>
													<td colspan="5">
														<textarea class="form-control"></textarea>
													</td>
												</tr>
												<tr>
													<th>복지사항</th>
													<td colspan="5">
														<textarea class="form-control"></textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!-- /.sub-box -->
							</div>
							<!-- /.col-xs-12 -->
							
						</div>
						<!-- 위에테이블 -->
					</div>
					<!-- body -->
				</div>
				<!-- 12 -->	
			</div>
			<!-- row -->

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						<div class="row">
							<div class="col-xs-3">
								<div class="sub-box">
									<div class="sub-title">채용요청</div>
									<div class="sub-body">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="" />
												<col width="" />
											</colgroup>
											<thead>
												<tr>
													<th>코드</th>
													<th>신청일</th>
												</tr>
											</thead>
											<tbody>
												<tr class="mouse">
													<td>1</td>
													<td>2018-07-08</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!--/.sub-box -->
							</div>
							<!-- /.col-xs-3 -->
	
	
							<div class="col-xs-6 right-nopadding">
								<div class="sub-box">
									<div class="sub-title">충원계획</div>
									<div class="sub-body">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="" />
												<col width="" />
												<col width="" />
												<col width="" />
												<col width="" />
												<col width="" />
											</colgroup>
											<thead>
												<tr>
													<th>회사명</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>신청일</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>게시여부</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>모집인원</th>
													<td><input class="form-control" type="text"></td>
													<th>고용형태</th>
													<td colspan="3">
														<div class="radio-group pull-left">
															<label class="radiobox">
																<input type="radio">정규직
															</label>
															<label class="radiobox">
																<input type="radio">계약직
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<th>근무지</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>담당업무</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>개발환경</th>
													<td colspan="5">
														<input class="form-control" type="text">
														<input class="form-control" type="text">
														<input class="form-control" type="text">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>연봉</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>채용직급</th>
													<td colspan="3">
														<input class="form-control" type="text">
													</td>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!--/.sub-box -->
								
								
								<div class="sub-box">
									<div class="sub-title">자격요건</div>
									<div class="sub-body">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="60px" />
												<col width="350px" />
												<col width="60px" />
												<col width="" />
											</colgroup>
											<thead>
												<tr>
													<th>학력</th>
													<td>
														<div class="radio-group pull-left">
															<label class="radiobox">
																<input type="radio">석사
															</label>
															<label class="radiobox">
																<input type="radio">대졸
															</label>
															<label class="radiobox">
																<input type="radio">전문대졸
															</label>
															<label class="radiobox">
																<input type="radio">불문
															</label>
														</div>
													</td>
													<th>학과</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>경력사항</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>우대사항</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>담당업무</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!--/.sub-box -->
								
								
								<div class="sub-box">
									<div class="sub-title">전형방법</div>
									<div class="sub-body">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="60px" />
												<col width="" />
											</colgroup>
											<thead>
												<tr>
													<th>전형절차</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>제출서류</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>요구사항</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!--/.sub-box -->
								
								<div class="sub-box">
									<div class="sub-title">담당자정보</div>
									<div class="sub-body">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="60px" />
												<col width="" />
												<col width="60px" />
												<col width="" />
												<col width="60px" />
												<col width="" />
											</colgroup>
											<thead>
												<tr>
													<th>담당자</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>부서</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>직책</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>전화번호</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>휴대폰</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>팩스</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>이메일</th>
													<td  colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!--/.sub-box -->		
							</div>
							<!-- /.col-xs-6 -->
							
							
							<div class="col-xs-3">
								<div class="sub-box">
									<div class="row">
										<div class="col-xs-6">
											<span class="sub-title">지원자리스트</span>
										</div>
										<div class="col-xs-6">
											<button class="btn btn-default btn-h25 pull-right" type="button" id="insertData">지원자 추가</button>
										</div>
									</div>
									<div class="sub-body">
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
									</div>
									<!-- /.sub-body -->
								</div>
								<!--/.sub-box -->
							</div>
							<!-- /.col-xs-3 -->
		
						</div>
						<!--/.row -->
					</div>
					<!-- /.box -->
				</div>
				<!--/.col-xs-12 -->
			</div>
			<!--/.row -->
































