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
                    <div class="sub-body" id="jqGridDiv">

					</div>

					<button type="button" id="btn">asdf</button>
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
    // $(document).ready(function() {
	$(document).on("click","#btn", function () {
	    jqframe()
		console.log("ddddd")
        var cnames = ['이름', '성별', '핸드폰'];

        $("#jqGrid").jqGrid({
            url: "/jqtest", //ajax와 비슷한 방식으로 컨트롤러 mapping 주소를 입력 (지금은 MainController로 연결)
            datatype: "json", //데이터를 json형태로 리턴받아 올거니 바꾸지 말것
			mtype:"POST",
            colNames: cnames,
            colModel: [
                {name: 'username', index: 'username', width: 100, align:"center"},
                {name: 'gender', index: 'gender', width: 100, align: "center"},
                {name: 'cellphone', index: 'cellphone', width: 200, align: "center"}
            ],
            rowheight: 20,
            height: 300,
			// width: 1200,
            // rowNum: 10, //처음 로딩시 뿌릴 데이터의 개수
            rowList: [10, 20, 30], //데이터의 정렬 개수
            pager: '#jqGridPager', //페이지가 들어갈 div의 아이디
            rownumbers: true, //jqgrid 기본 인덱스
			onSelectRow: function(){
                //한번 클릭했을때 이벤트 발생
                alert("123");
                console.log("asd");
			}
        });
    });

	function jqframe() {
	    $("#gbox_jqGrid").remove();
		str = "";
		str = "<table id='jqGrid'></table>" +
			  "<div id='jqGridPager'></div>";

		$("#jqGridDiv").append(str);
    }
</script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.datepicker.js"></script>--%>

