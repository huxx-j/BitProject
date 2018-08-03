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
									<div class="cate-title">
										과목카테고리
									</div><!-- cate-title -->

									<div class="cate-outter bordered">
										<div class="cate-toolbox">
											<button type="button" id="addcate" class="btn btn-default btn-cate">추가</button>
											<button type="button" class="btn btn-default btn-cate pull-right">편집</button>
										</div><!-- /.cate-toolbox -->
										<div class="scroll">

											<div class="tab-content-custom" style="height: 500px;">
												<div class="tab-pane active" id="tab_1">

													<ul id="treeDemo" class="ztree"></ul>

													<%--<ul id="cate-tree" class="side-bar test" data-widget="tree">--%>


														<%--<!-- 최하단 카테고리 조건(ajax구현 고려)--%>
													<%--<c:forEach items="${sublist}" var="sub">--%>
														<%--<ul class="treeview-menu">--%>
															<%--<li><a href="#"><i class="fa fa-circle-o"></i> ${sub.subjectName}</a></li>--%>
														<%--</ul>--%>
													<%--</c:forEach>-->--%>

														<%--<li class="treeview">--%>
															<%--<a href="#"> <i class="fa fa-circle-o"></i>C<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
															<%--<ul class="treeview-menu">--%>
																	<%--<li class="treeview">--%>
																				<%--<a href="#"><i class="fa fa-circle-o"></i> C <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																				<%--<ul class="treeview-menu">--%>
																					<%--<li class="treeview">--%>
																					<%--</li>--%>
																				<%--</ul>--%>
																				<%--<a href="#"><i class="fa fa-circle-o"></i> C++ <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																				<%--<ul class="treeview-menu">--%>
																					<%--<li class="treeview">--%>
																					<%--</li>--%>
																				<%--</ul>--%>
																	<%--</li>--%>
															<%--</ul>--%>
														<%--</li>--%>
														<%--<li class="treeview">--%>
															<%--<a href="#"> <i class="fa fa-circle-o"></i>JAVA<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
															<%--<ul class="treeview-menu">--%>
																<%--<li class="treeview">--%>
																	<%--<a href="#"><i class="fa fa-circle-o"></i> JAVA <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																	<%--<ul class="treeview-menu">--%>
																		<%--<li class="treeview">--%>
																			<%--<a href="#"><i class="fa fa-circle-o"></i> JAVA1 <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																			<%--<ul class="treeview-menu">--%>
																				<%--<li class="treeview">--%>
																				<%--</li>--%>
																			<%--</ul>--%>
																		<%--</li>--%>
																	<%--</ul>--%>
																	<%--<a href="#"><i class="fa fa-circle-o"></i> JAVA WEB <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																	<%--<ul class="treeview-menu">--%>
																		<%--<li class="treeview">--%>
																			<%--<a href="#"><i class="fa fa-circle-o"></i> SPRING <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																			<%--<ul class="treeview-menu">--%>
																				<%--<li class="treeview">--%>
																				<%--</li>--%>
																			<%--</ul>--%>
																		<%--</li>--%>
																	<%--</ul>--%>
																<%--</li>--%>
															<%--</ul>--%>
														<%--</li>--%>

													<%--</ul>--%>
													</ul>
												</div>

												<!-- /.tab-pane -->
											</div>
										</div><!-- /.sub-body -->

									</div><!-- /.cate-outter -->

									<div class="cate-toolbox">
										<div class="input-group input-group-sm">
											<input class="form-control" type="text">
											<span class="input-group-btn">
	                     							<button class="btn btn-info btn-flat" type="button">Go!</button>
	                   						</span>
										</div>
									</div><!-- /.cate-toolbox -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 -->

						<!--
							카테고리 영역 시작
							<div class = "col-xs-3">
								네비 바 시작
								<div class = "sub-box">
									<div class = "cate-title">
										교육과정카테고리
									</div>
									<div class = "cate-outter bordered">
										<div class = "cate-toolbox">
											<button type = "button" class = "btn btn-default btn-cate">추가</button>
											<button type = "button" class = "btn btn-default btn-cate pull-right">편집</button>
										</div>/.cate-toolbox
										<div class = "scroll">


											<div class = "tab-content-custom" style = "height:500px;">
												<div class = "row">
													<ul id = "treeDemo" class = "ztree"></ul>
												</div>
											</div>/.tab-content-custom



											카테고리 메인영역
											<div class="cate-box">
												<div class="" id="">
													<ul id="treeDemo" class="ztree">
													</ul>
												</div>
											</div>
											/.카테고리 메인영역

										</div>/.scroll
									</div>/.cate-outter bordered
									<div class = "cate-toolbox">
										<div class = "input-group input-group-sm">
											<input class = "form-control" type = "text">
											<span class = "input-group-btn">
												<button class = "btn btn-info btn-flat" type = "button">Go!</button>
											</span>/.input-group-btn
										</div>/.input-group input-group-sm
									</div>/.cate-toolbox
								</div>/.sub-box
								/.네비 바 끝
							</div>/.col-xs-3
							/.카테고리영역 끝
							 -->
							
							<!-- 교육과정 정보 영역 시작-->
							<div class = "col-xs-9">
								<!-- 탭박스 외곽  -->
								<div class = "nav-tabs-custom">
									<!-- 상단 탭 영역 -->
									<ul class = "nav nav-tabs" id = "curri-nav-tab">
										<li class = "active"><a href = "#tab_1" data-toggle = "tab">교육과정정보</a></li>
										<li class = ""><a href = "#tab_2" data-toggle = "tab">홈페이지관리</a></li>
										<li class = ""><a href = "#tab_3" data-toggle = "tab">교육생관리</a></li>
										<li class = ""><a href = "#tab_4" data-toggle = "tab">강사배정</a></li>
										<li class = ""><a href = "#tab_5" data-toggle = "tab">강의실배정</a></li>
										<a href = "${pageContext.request.contextPath }/curri/addCurriForm">
											<button type = "button" class = "btn btn-default btn-sm pull-right" >교육과정추가</button>
										</a>
									</ul><!-- /.nav nav-tabs -->
									<!-- /.상단 탭 영역 끝 -->
									<!-- 탭 내용 박스 -->
									<div class = "tab-content">
										<!-- 1번 탭 내용 -->
										<c:import url="/WEB-INF/views/screening/includes/tab_CurriInfo.jsp"></c:import>
										<!-- /.1번탭 -->
										
										<!-- 2번탭 영역 시작 -->
										<c:import url="/WEB-INF/views/screening/includes/tab_HomepageManagement.jsp"></c:import>
										<!-- /.2번탭 끝 -->

										<!-- 3번탭 영역 시작 -->
										<c:import url="/WEB-INF/views/screening/includes/tab_ApplicantManagement.jsp"></c:import>

										<!-- /.3번탭 끝 -->
										
										
										<!-- 4번탭 영역 시작 -->
										<div class = "tab-pane" id = "tab_4">
											<div class = "row">
												<div class = "col-xs-12">
													<table class = "table table-condensed">
														<tr>
															<th>교육과정명</th>
															<td class = "col-xs-10"><input type = "text" class = "form-control " readonly name = "curriName"></td>
														</tr>
													</table>
												</div><!-- /.col-xs-12" -->
											</div><!-- /.row 4번탭 상단 -->
											<div class = "row">
												<div class = "col-xs-12">
												
												</div><!-- /.col-xs-12 -->
											</div><!-- /.row 4번탭 하단 -->
										</div><!-- /.tab_4 -->
										<!-- /.4번탭 끝 -->
										
										
										<!-- 5번탭 영역 시작 -->
										<div class = "tab-pane" id = "tab_5">
											<div class = "row">
												<div class = "col-xs-12">
													<table class = "table table-condensed">
														<tr>
															<th>교육과정명</th>
															<td class = "col-xs-10"><input type = "text" class = "form-control " readonly name = "curriName"></td>
														</tr>
													</table>
												</div><!-- /.col-xs-12" -->
											</div><!-- /.row 5번탭 상단 -->
											<div class = "row">
												<div class = "col-xs-12">
												
												</div><!-- /.col-xs-12 -->
											</div><!-- /.row 5번탭 하단 -->
										</div><!-- /.tab_5 -->
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
<%--jqgrid사용시 삭제할것--%>
	<c:import url="/WEB-INF/views/screening/includes/script_Curriculum.jsp"></c:import>


</html>
