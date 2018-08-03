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
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jquery.datepicker.css">--%>


</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>태그 사용 설명서
			<small>it all starts here</small>
		</h1>
	</section>



	<!-- /.Content Header (Page header) -->

	<!-- Main content -->
	<section class="content">

		<!-- 상단 -->
		<div class="row">
			<div class="col-xs-12">

				<div class="box box-body">
                    <div class="sub-title">
                        DatePicker 사용법
                    </div>
                    <div class="sub-body">
						<table id="jqGrid"></table>

						<div id="jqGridPager"></div>
					</div>

				</div><!-- /.box -->

			</div><!-- /.col-xs-12 -->
		</div>
		<!-- /.row 상단-->

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
<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>

<script type="text/javascript">
    $(document).ready(function() {

        var cnames = ['번호', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부'];

        $("#jqGrid").jqGrid({
            url: "/api/cm/getUserInfo?curriNo=1",
            datatype: "json",
			mtype:"POST",
            colNames: cnames,
            colModel: [
                {name: 'user_no', index: 'user_no', width: 10, hidden: true},
                {name: 'gisuName', index: 'gisuName', width: 150, align: "center"},
                {name: 'nameHan', index: 'nameHan', width: 100, align: "center"},
                {name: 'studResNum', index: 'studResNum', width: 100, align: "center"},
                {name: 'gender', index: 'gender', width: 60, align: "center"},
                {name: 'testResult', index: 'testResult', width: 95, align: "center"},
                {name: 'cellphone', index: 'cellphone', width: 150, align: "center"},
                {name: 'applyDate', index: 'applyDate', width: 100, align: "center"},
                {name: 'testDate', index: 'testDate', width: 100, align: "center"},
                {name: 'school', index: 'school', width: 140, align: "center"},
                {name: 'major', index: 'major', width: 140, align: "center"},
                {name: 'deposit', index: 'deposit', width: 60, align: "center"}
            ],
            rowheight: 20,
            height: 300,
			width: 1200,
            rowNum: 10,
            rowList: [5, 10, 15],
            pager: '#jqGridPager',
            rownumbers: true,
            ondblClickRow: function (rowId, iRow, iCol, e) {

                if (iCol == 1) {

                    alert(rowId + " 째줄 입니다.");
                }
            },

            // viewrecords: true,
            caption: "유저 정보"


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


    $(function () {
        var mydata = [
            {seq:"1",gisu:"dsfjkf",name:"ㅇㄹㄴ",birth:'2018-05-05',gender:"남",result:"탈락",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서을대학교",major:"콤퓨타",yn:"미납"},
            {seq:"1",gisu:"dsfjkf",name:"ㅇㄹㄴ",birth:'2018-05-05',gender:"남",result:"탈락",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서을대학교",major:"콤퓨타",yn:"미납"}


        ];

        for (var i=0; i<=mydata.length; i++) {
            $("#jqGrid").jqGrid('addRowData', i+1, mydata[i]);
        }
    });
</script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.datepicker.js"></script>--%>
