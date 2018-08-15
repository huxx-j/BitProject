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
			<h1>패키지관리</h1>
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

								<!--탭 박스 외곽 -->
								<div class="nav-tabs-custom">

									<!-- 상단탭영역 -->
									<ul class="nav nav-tabs" id="packageTab">
										<li class="active"><a href="#tab_1" data-toggle="tab">패키지 개요</a></li>
										<li class=""><a href="#tab_2" data-toggle="tab">구성 과목</a></li>
										<div id="btnzone">
											<button id="btnAddPackage" class="btn btn-default btn-h25 pull-right" type="button">패키지 추가</button>
										</div>
									</ul>

									<!-- /.상단탭영역 -->

									<!-- /.탭내용박스 -->
									<div class="tab-content">
										<!-- 1번탭내용 -->
										<div class="tab-pane active" id="tab_1">

											<div class="sub-box">
												<div class="sub-body">
														<table class="table table-condensed">
															<colgroup>
																<col width="120px" />
																<col width="480px" />
																<col width="120px" />
																<col width="" />
															</colgroup>

															<tbody>
															<tr>
																<th>사용가능여부</th>
																<td colspan="3">
																	<div class="radio-group">
																		<label class="radiobox"><input class="" id="UserStatus0" type="radio" name="UseStatus" value="0" checked >불가능</label>
																		<label class="radiobox"><input class="" id="UserStatus1" type="radio" name="UseStatus" value="1">가능</label>
																	</div>
																</td>
															</tr>
															<tr>
																<th>패키지카테고리</th>
																<td colspan="3">
																<input id="category" name="PackageName" value="카테고리를 선택" type="text" style="border:none" readonly>
																	<input type="hidden" id="cate_no" name="PackageCate_no" value="">
																	<button type="button" id="selectCategory" class="btn btn-default btn-h25 pull-right" >카테고리 선택</button>
																	</td>
																	<%--<select name ="strPackageCate_no" class="form-control">--%>
																		<%--<c:forEach items="${packcatelist}" var="vo">--%>
																			<%--<option value='${vo.packageCate_no}'>${vo.cateName}</option>--%>
																		<%--</c:forEach>--%>
																	<%--</select>--%>

															</tr>
															<tr>
																<th>패키지명</th>
																<td><input name="PackageName" class="form-control" type="text" placeholder="" ></td>
																<th>총 시간</th>
																<td class="form-inline"><input name="TotalTime" class="form-control w60" type="text" placeholder=""><span> 시간</span>
																</td>
															</tr>
															<tr>
																<th>훈련목적및목표</th>
																<td colspan="3"><textarea name="Goal" class="form-control" rows="6" placeholder=""></textarea></td>
															</tr>
															<tr>
																<th>주요훈련내용</th>
																<td colspan="3"><textarea name="Content" class="form-control" rows="6" placeholder=""></textarea></td>
															</tr>
															<tr>
																<th>훈련대상요건</th>
																<td colspan="3"><textarea name="Qualification" class="form-control" rows="6" placeholder=""></textarea></td>
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
															<input type="button" value="저장" id="addpackage" name="addpackage" class="btn btn-primary">
														</div>
														<div id="default" class="col-xs-4">
														</div>
													</div>



												</div>
											</div><!-- /.sub-box -->

										</div>
										<!-- /.1번탭내용 -->

										<!-- 2번탭내용 -->
										<div class="tab-pane" id="tab_2">
											<div class="sub-body">

													<!-- 2번메뉴내용 -->
												<%--<button id="all" onclick="javascript:insertStep()">tr 콘솔</button>action="${pageContext.request.contextPath}/package/addStep"--%>


													<table class="table table-condensed">
														<colgroup>
															<col width="80px" />
															<col width="" />
															<col width="80px" />
															<col width="" />
															<col width="250px" />
														</colgroup>

														<tbody>

														<tr>
															<th  style="width : 100px">패키지명</th>
															<td name='PackageName' style="width : 400px" colspan="3" value="">
																<input name="PackageNameInStep" type="text" readonly style="border: none; width: 500px">
															</td>
															<th style="width : 100px" colspan="2">총 교육시간</th>
															<td name='TotalTime' style="width : 200px" value="">
																<input name="Time" type="text"  style="width: 35px; border: none" readonly>/<input name="TotalTimeInStep" type="text"  readonly style="border: none;width: 35px">시간
															</td>
														</tr>
														</tbody>
													</table>

													<br>

												<form id="stepadd2" name="stepadd2"  method="post"  onsubmit="return check();" action="${pageContext.request.contextPath}/package/addStep">
													<div id="step-list">

														<%--<table id ="steptable0" class="table table-condensed">--%>

															<%--<caption><button type="button" id='deletestep' class='btn btn-default btn-sm' value='0'>단계 삭제</button></caption>--%>


															<%--<colgroup>--%>
																<%--<col width="50px" />--%>
																<%--<col width="250px" />--%>
																<%--<col width="" />--%>
																<%--<col width="80px" />--%>
																<%--<col width="60px" />--%>
															<%--</colgroup>--%>
															<%--<tbody id='subject-list0'>--%>

															<%--<input type="hidden" name ="steplist[0].Package_no">--%>
															<%--<input type='hidden' name="steplist[0].Level" value="1">--%>
															<%--<input type='hidden' name='steplist[0].Step_no' value="0">--%>
															<%--<tr>--%>
																<%--<td style="text-align: center">단계명</td>--%>
																<%--<td colspan="3" >--%>
																	<%--<input type="text" name="steplist[0].StepName" style="width: 800px">--%>
																<%--</td>--%>
																<%--<td style="width: 50px">--%>
																	<%--<button  id='btnAddsubject' name='btnAddsubject0'class="btn btn-default pull-right" type="button" data-step="0" data-sub="0">추가</button>--%>
																<%--</td>--%>
															<%--</tr>--%>
															<%--<tr id="subject-item00" style="height: 150px">--%>
																<%--<td></td>--%>
																<%--<td>--%>
																	<%--&lt;%&ndash;<textarea type="text" style="overflow:hidden; resize: none; border: none;" name="SubjectName00" readonly></textarea>&ndash;%&gt;--%>
																	<%--<input type="text" style="border: none;" name="SubjectName00" readonly>--%>
																	<%--<input type="hidden" name="steplist[0].sublist[0].Subject_no" value="0">--%>
																	<%--<input type="hidden" name="steplist[0].sublist[0].SubInStep_no" value="0">--%>
																	<%--<button style=" float: right;" id="selectsub" class="btn btn-default pull-right" data-step="0" data-sub="0" type="button">과목선택</button>--%>
																<%--</td>--%>
																<%--<td>--%>
															<%--<textarea name="steplist[0].sublist[0].Content" style="width: 490px; height: 135px;">--%>
															<%--</textarea>--%>
																<%--</td>--%>
																<%--<td>--%>
																	<%--<input id='time' class='time' name="steplist[0].sublist[0].SubHour" style="width:30px; margin-right: 5px" type="text" >시간--%>
																<%--</td>--%>
																<%--<td>--%>
																	<%--<button  id="del-subject" class="btn btn-default pull-right" type="button" data-val="0">삭제</button>--%>
																<%--</td>--%>
															<%--</tr>--%>
															<%--</tbody>--%>
														<%--</table>--%>

													</div>

												<div class="sub-toolbox clearfix text-center">
													<div class="row">
														<div class="col-xs-4">
														</div>
														<div id="primary2" class="col-xs-4">
															<input type="submit" value="저장" id="stepadd" class="btn btn-primary">
														</div>
														<div id="default2" class="col-xs-4">
														</div>
													</div>
												</div>

											</div>
										</div>
										<!-- /.2번메뉴내용 -->


									</div>
									<!-- /.탭내용박스 -->
								</div><!--/.탭 박스 외곽 -->
							</div><!-- /.col-xs-9 -->
							<!-- /.과목정보영역 -->
						</div><!-- /.row -->
					</div><!-- /.box -->
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
<!-- 카테고리 추가 모달창-->
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
							<select name='subcate' id="PackageCate_no" class='form-control input-sm'>
								<c:forEach items="${packcatelist}" var="vo">
									<option  value="${vo.packageCate_no}"> ${vo.cateName} </option>
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

<!--과목선택 모달창-->
<div class="modal fade" id="pop2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<input type="hidden" id="step" value="">
				<input type="hidden" id="sub" value="">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">과목 선택</h4>
			</div>
			<div class="modal-body">
				<ul id="treeDemo2" class="ztree"></ul>
			</div>
			<div class="modal-footer">
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--카테고리 선택 모달창-->
<div class="modal fade" id="pop3">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">패키지 카테고리 선택</h4>
			</div>
			<div class="modal-body">
				<ul id="treeDemo3" class="ztree"></ul>
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
    <c:import url="/WEB-INF/views/curridesign/pack-script.jsp"></c:import>
</html>
