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
	
	<!-- 공통css -->
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>
	
	<!-- 자신의 css사용시 --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="/assets/css/jquery.datepicker.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	<!-- 그리드 사용시 주석풀어 사용 -->
	<%-- <c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import> --%>

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
				교육과정관리 <small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">전형관리 업무</a></li>
				<li><a href="#">교육과정관리</a></li>
			</ol>
		</section>

		<!-- Main content -->
		<section class = "content">
			<div class = "row">
				<div class = "col-xs-12">
					<div class = "box box-body">
						<div class = "row">
							<!-- 카테고리영역 -->
							<div class="col-xs-3">
								<div class="sub-box">
<!-- 									<div class="cate-title"> -->
<!-- 										교육과정카테고리 -->
<!-- 									</div>cate-title -->
									
									
									<div class = "bordered">
										<div class = "cate-toolbox-top clearfix">
											<button type="button" id="addCateBtn" class="btn btn-default btn-h25 pull-right">카테고리 추가</button>
										</div><!-- /.cate-toolbox-top clearfix -->
										
										<div class = "scroll">
											<!-- 카테고리 메인영역 -->
											<div class="cate-box">
												<div class="" id="">
													<ul id="treeDemo" class="ztree">
													</ul>
												</div>
											</div><!--/.cate-box -->
											<!-- /.카테고리 메인영역 -->
										</div><!-- /.scroll -->
										
										<div class = "cate-toolbox-bottom">
											<div class = "input-group input-group-sm">
												<input class = "form-control cate-search-input" type = "text">
												<span class = "input-group-btn">
													<button class = "btn btn-default btn-cate-search" type = "button">검색</button>
												</span>
											</div><!-- /.input-group input-group-sm -->
										</div><!-- cate-toolbox-bottom -->
										
									</div><!-- /.bordered -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 -->
							<!-- 교육과정 정보 영역 시작-->
							<div class = "col-xs-9">
								<!-- 탭박스 외곽  -->
								<div class = "nav-tabs-custom">
									<!-- 상단 탭 영역 -->
									<ul class = "nav nav-tabs" id = "curri-nav-tab">
										<li class = "active"><a href = "#tab_1" data-toggle = "tab">교육과정정보</a></li>
<!-- 										<li class = ""><a href = "#tab_2" data-toggle = "tab">홈페이지관리</a></li> -->
										<li class = ""><a href = "#tab_3" data-toggle = "tab">교육생관리</a></li>
<!-- 										<li class = ""><a href = "#tab_4" data-toggle = "tab">강사배정</a></li> -->
<!-- 										<li class = ""><a href = "#tab_5" data-toggle = "tab">강의실배정</a></li> -->
<%-- 										<a href = "${pageContext.request.contextPath }/curri/addCurriForm"> --%>
											<span><button type = "button" class = "btn btn-default btn-sm pull-right" id = "addCurriFormBtn">교육과정추가</button></span>
<!-- 										</a> -->
									</ul><!-- /.nav nav-tabs -->
									<!-- /.상단 탭 영역 끝 -->
									<!-- 탭 내용 박스 -->
									
									
									<div class = "tab-content">
										<!-- 1번 탭 내용 -->
										<c:import url="/WEB-INF/views/screening/includes/tab_CurriInfo.jsp"></c:import>
										<!-- /.1번탭 -->
										
										<!-- 2번탭 영역 시작 -->
<%-- 										<c:import url="/WEB-INF/views/screening/includes/tab_HomepageManagement.jsp"></c:import> --%>
										<!-- /.2번탭 끝 -->

										<!-- 3번탭 영역 시작 -->
										<c:import url="/WEB-INF/views/screening/includes/tab_ApplicantManagement.jsp"></c:import>
										<!-- /.3번탭 끝 -->
										
										<!-- 4번탭 영역 시작 -->
<%-- 										<c:import url="/WEB-INF/views/screening/includes/tab_AssignInstructor.jsp"></c:import> --%>
										<!-- /.4번탭 끝 -->
										
										<!-- 5번탭 영역 시작 -->
<%-- 										<c:import url="/WEB-INF/views/screening/includes/tab_AssignClassroom.jsp"></c:import> --%>
										<!-- /.5번탭 끝 -->
										
									</div><!-- /.tab-content -->
									<!-- /.탭 내용 박스 끝 -->
								</div><!-- /.nav-tabs-custom -->
								<!-- 탭 박스 외곽 끝 -->
							</div><!-- col-xs-9 -->
							<!-- /.교육과정 정보 영역 끝 -->
						</div><!-- /.row -->
					</div><!-- /.box -->
				</div>
			</div><!-- /.row -->
		</section>
		<!-- /.content -->
		
	</div><!-- content-wrapper -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
	<div class="control-sidebar-bg"></div>
	
</div>

<!-- ./wrapper -->
</body>

<!-- 자바스크립트영역 -->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<%-- <c:import url="/WEB-INF/views/includes/script.jsp"></c:import> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript">

</script>

	<c:import url="/WEB-INF/views/screening/includes/script_Curriculum.jsp"></c:import>
	<c:import url="/WEB-INF/views/screening/includes/script_ApplicantManagement.jsp"></c:import>
	<c:import url="/WEB-INF/views/screening/includes/script_CurriInfo.jsp"></c:import>

</html>
