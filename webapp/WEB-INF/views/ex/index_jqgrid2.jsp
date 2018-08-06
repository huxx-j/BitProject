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
<table id="jqGrid"></table>
<div id="jqGridPager"></div>
<%--<br/>--%>
<%--<div id="paginate"></div>--%>

</body>
</html>
<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>

<script type="text/javascript">
    $(document).ready(function(){
        $(document).ready(function () {
            var rowNum = 20; // 로우넘버

            $("#jqGrid").jqGrid({
                //  1,000,000만건 sample 데이터
                url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
                colModel: [
                    { label: 'OrderID', name: 'OrderID', key: true, width: 75 },
                    { label: 'Customer ID', name: 'CustomerID', width: 150 },
                    { label: 'Order Date', name: 'OrderDate', width: 150 },
                    { label: 'Freight', name: 'Freight', width: 150 },
                    { label:'Ship Name', name: 'ShipName', width: 150 }
                ],
                rowNum: rowNum,
                mtype:"POST",
                datatype: "json",
                viewrecords: true,
                autowidth:true,
                height: 346,
                pager: "#jqGridPager"
            });
        });
    });
</script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.datepicker.js"></script>--%>

