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

						<div id="jqGridPager"></div><br/>
						<%--<div id="paginate"></div>--%>
						<button type="button" id="btn">asd</button>
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

        var cnames = ['이름', '성별', '핸드폰'];

        $("#jqGrid").jqGrid({
            url: "/jqtest",
            datatype: "json",
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
            // rowNum: 10,
            rowList: [10, 20, 30],
            pager: '#jqGridPager',
            rownumbers: true,
			onSelectRow: function(){
                alert("123");
                console.log("asd");
			}
        });
    });


	$("#btn").on("click",function () {
        var asd = $(".ui-pg-input").val();
        console.log(asd);
    });
</script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.datepicker.js"></script>--%>

