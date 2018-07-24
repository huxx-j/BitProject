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
