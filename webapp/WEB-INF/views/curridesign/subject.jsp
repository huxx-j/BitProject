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
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>과목관리</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">과정설계업무</a></li>
				<li class="active">패키지관리</li>
			</ol>
		</section>


		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						<div class="row">
							<!-- 카테고리영역 -->
							<div class="col-xs-3">

								<div class="sub-box">
									<!-- <div class="cate-title">
                                        패카지카테고리
                                    </div> --><!-- cate-title -->

									<div class="bordered">

										<div class="cate-toolbox-top clearfix">
											<button type="button" id="addcate" class="btn btn-default btn-h25 pull-right">카테고리 추가</button>
										</div><!-- /.cate-toolbox -->

										<div class="scroll">

											<!-- 카테고리 메인영역 -->
											<div class="cate-box">
												<div class="" id="">

													<ul id="treeDemo" class="ztree">

													</ul>
												</div>

											</div>
											<!-- /.카테고리 메인영역 -->


										</div><!-- /.scroll -->

										<div class="cate-toolbox-bottom">
											<div class="input-group input-group-sm">
												<input class="form-control cate-search-input" type="text">
												<span class="input-group-btn">
	                     							<button class="btn btn-default btn-cate-search" type="button">검색</button>
	                   						</span>
											</div>
										</div><!-- /.cate-toolbox -->
									</div><!-- /.bordered -->

								</div><!-- /.sub-box -->

							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 -->

							<!-- 과목정보영역 -->
							<div class="col-xs-9">
								<div class="sub-box">
									<div id ="brzone" class="sub-toolbox clearfix">
										<button  id="btnAddsubject" class="btn btn-default btn-h25 pull-right" type="button">과목 추가</button>
									</div>
									<div class="sub-body">
										<form id="subject" name="subject" method="get" action="${pageContext.request.contextPath}/subject/addSubject">
											<table class="table table-condensed">
												<colgroup>
													<col width="120px" />
													<col width="" />
												</colgroup>
												<tbody>
												<tr>
													<th>과목 카테고리</th>
													<td><input id="category" name="CateName" value="카테고리를 선택" type="text" style="border:none" readonly>
														<input type="hidden" id="cate_no" name="subjectCate_no" value="">
														<button type="button" id="selectCate" class="btn btn-default btn-h25 pull-right" >카테고리 선택</button>
														<%--<select name='subjectCate_no' class='form-control'>--%>
															<%--<c:forEach items="${list}" var="vo">--%>
																<%--<option value="${vo.subjectCate_no}"> ${vo.cateName} </option>--%>
															<%--</c:forEach>--%>
														<%--</select>--%>
													</td>
												</tr>
												<tr>
													<th>과목 명</th>
													<td><input name="SubjectName" class="form-control" type="text" placeholder=""></td>
												</tr>
												<tr>
													<th>과목 개요</th>
													<td><textarea name="Outline" class="form-control" rows="6" placeholder=""></textarea></td>
												</tr>
												</tbody>
											</table>
											<input type="hidden" id="prevInfo" value="">
									</div><!-- /.sub-body -->
									<div class="sub-toolbox clearfix text-center">
										<div class="row">
											<div class="col-xs-4">
											</div>
											<div id="primary" class="col-xs-4">
													<input type="button" id="save-subject" value="저장" class="btn btn-primary">
											</div>
											<div id="default" class="col-xs-4">
											</div>
										</div>
									</div>
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-9 -->
							<!-- /.과목정보영역 -->
						</div><!-- /.row -->
					</div><!-- /.box box-body -->
				</div><!-- /.col-xs-12 -->
			</div><!-- /.row -->
		</section>
		<!-- /.content -->

	</div>
	<!-- /.content-wrapper -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	<div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- ***************************************** -->
<!-- 모달창영역 -->
<div class="modal fade" id="pop">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">카테고리 추가</h4>
			</div>
			<div class="modal-body">
				<table class="table table-condensed">
					<tr>
						<th>위치</th>
						<td>
							<select name='subjectCate_no' id="SubjectCate_no" class='form-control input-sm'>
								<c:forEach items="${list}" var="vo">
									<option  value="${vo.subjectCate_no}"> ${vo.cateName} </option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리명</th>
						<td>
							<input style="width: 100%" type="text" name="CateName" value="" id="CateName">
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="save">저장</button>
				<button type="button" class="btn btn-primary" id="btn_cancel">취소</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--과목 선택 모달창-->
<!--카테고리 선택 모달창-->
<div class="modal fade" id="pop2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">과목 카테고리 선택</h4>
			</div>
			<div class="modal-body">
				<ul id="treeDemo2" class="ztree"></ul>
			</div>
			<div class="modal-footer">
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- /.모달창영역 -->
<!-- ***************************************** -->

</body>

<!-- 자바스트립트영역 -->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.exedit.js"></script>
<c:import url="/WEB-INF/views/curridesign/sub-script.jsp"></c:import>
</html>
