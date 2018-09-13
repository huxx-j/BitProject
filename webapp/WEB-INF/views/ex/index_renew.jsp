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
    <input type="text" class="input-sm form-control border-none" name="date1" id="date11" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
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
		<input class="input-datepicker form-control border-none" name="date1" id="date33" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
		<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
	</div>
	<div class="pull-left"> &nbsp;&nbsp; - &nbsp;&nbsp;</div>
	<div class="input-group border-inputcolor w140 pull-left">
		<input class="input-datepicker form-control border-none" name="date1" id="date22" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
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
				<br/>
					<div class="sub-title">
						숫자만 입력해야하는 input 태그
					</div>
					<input type="text" name="score"> <br/> <br/>
					<textarea style="width: 100%; height: 200px">
<input type="text" name="score" >
name은 마음대로 정하고 아래 스크립트를 추가해주면 포커스가 아웃될때 숫자이외의 문자를 없애줌

$(document).ready(function() {
	$("input[name=score]").change(function(){
		var cost = $(this).val();
		cost = cost.replace(/[^0-9]/g,"");
		$(this).val(cost);
	});
});
					</textarea>

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
        $("input[name=score]").change(function(){
            var cost = $(this).val();
            cost = cost.replace(/[^0-9]/g,"");
            $(this).val(cost);
		});
    });
</script>

