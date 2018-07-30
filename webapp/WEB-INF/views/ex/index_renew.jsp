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
                        <textarea style="width: 100%; height: 200px">
달력 1개만 쓸때
달력을 쓸 위치에
<div class="input-group border-inputcolor w140">
    <input type="text" class="input-sm form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
    <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
</div>
를 추가하면 아래와 같은 달력이 생김
태그의 가로 길이는 div의  w140클래스를 지우고 Style에서 width를 줘서 조절하면 됨 (w140은 width를 140px으로 설정한 CSS임)
input태그에 id랑 name은 바꿔도 되지만 data-select="datepicker" data-toggle="datepicker" 이거는 절대 바꾸면 안됨
id겹치게 만들지 말것!!!

</textarea>
                    </div>
							<div class="sub-body">
						        <div class="input-group border-inputcolor w140">
							        <input type="text" class="input-sm form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
							        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
						        </div>
                                <br>

								<textarea rows="18" style="width: 100%;">
달력 2개 쓸때 코드
달력을 쓸 위치에
<div class="clearfix">
	<div class="input-group border-inputcolor w140 pull-left">
		<input class="input-datepicker form-control border-none" name="date1" id="date3" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
		<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
	</div>
	<div class="pull-left"> &nbsp;&nbsp; - &nbsp;&nbsp;</div>
	<div class="input-group border-inputcolor w140 pull-left">
		<input class="input-datepicker form-control border-none" name="date1" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
		<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
	</div>
</div>
를 추가하면 아래와 같은 달력이 생김
태그의 가로 길이는 div의  w140클래스를 지우고 Style에서 width를 줘서 조절하면 됨 (w140은 width를 140px으로 설정한 CSS임)
input태그에 id랑 name은 바꿔도 되지만 data-select="datepicker" data-toggle="datepicker" 이거는 절대 바꾸면 안됨
id겹치게 만들지 말것!!!

</textarea>

                                <h5>두개 붙일때</h5>
								<div class="clearfix">
									<div class="input-group border-inputcolor w140 pull-left">
										<input class="input-datepicker form-control border-none" name="date1" id="date3" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
										<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
									</div>
									<div class="pull-left"> &nbsp;&nbsp; - &nbsp;&nbsp;</div>
									<div class="input-group border-inputcolor w140 pull-left">
										<input class="input-datepicker form-control border-none" name="date1" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
										<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
									</div>
								</div>
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

<script type="text/javascript">
    $(document).ready(function() {

        var cnames = ['과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부'];

        $("#jqGrid").jqGrid({
            url: "jqgridStartMain.do",
            datatype: "local",
            colNames: cnames,
            colModel: [
                {name: 'gisu', index: 'gisu', width: 200, align: "center"},
                {name: 'name', index: 'name', width: 200, align: "center"},
                {name: 'birth', index: 'birth', width: 200, align: "center"},
                {name: 'gender', index: 'gender', width: 200, align: "center"},
                {name: 'result', index: 'result', width: 200, align: "center"},
                {name: 'phone', index: 'phone', width: 200, align: "center"},
                {name: 'appdate', index: 'appdate', width: 200, align: "center"},
                {name: 'exdate', index: 'exdate', width: 200, align: "center"},
                {name: 'school', index: 'school', width: 200, align: "center"},
                {name: 'major', index: 'major', width: 200, align: "center"},
                {name: 'yn', index: 'yn', width: 200, align: "center"}
            ],

            rowheight: 20,
            height: 300,
            rowNum: 10,
            rowList: [10, 20, 30],
            pager: '#jqGridPager',
            rownumbers: true,
			scroll: 1,
            ondblClickRow: function (rowId, iRow, iCol, e) {

                if (iCol == 1) {

                    alert(rowId + " 째줄 입니다.");
                }
            },

            viewrecords: true,
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
<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
