<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- eakld;f -->
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
				교육과정추가 <small>it all starts here</small>
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
										</div><!-- /.cate-toolbox -->
										
										<div class = "scroll">
											<!-- 카테고리 메인영역 -->
											<div class = "cate-box">
												<div class = "" id = "">
													<ul id = "treeDemo" class = "ztree"></ul>
												</div>
											</div><!-- /.cate-box -->
											<!-- /.카테고리 메인영역 -->
										</div><!-- /.scroll -->
										<div class = "cate-toolbox-bottom">
											<div class = "input-group input-group-sm">
												<input class = "form-control cate-search-input" type = "text">
												<span class = "input-group-btn">
													<button class = "btn btn-default btn-cate-search" type = "button">검색</button>
												</span>
											</div><!-- /.input-group input-group-sm -->
										</div><!-- /.cate-toolbox-bottom -->
									</div><!-- /.cate-outter bordered -->
								</div><!-- /.sub-box -->
								<!-- /.네비 바 끝 -->
							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 끝 -->
							
							<!-- 교육과정 정보 영역 시작-->
							<div class = "col-xs-9">
								<!-- 탭박스 외곽  -->
								<div class = "nav-tabs-custom">
									<!-- 상단 탭 영역 -->
									<ul class = "nav nav-tabs" >
										<li class = "active"><a href = "#tab_1" data-toggle = "tab">교육과정정보</a></li>
									</ul><!-- /.nav nav-tabs -->
									<!-- /.상단 탭 영역 끝 -->
									<!-- 탭 내용 박스 -->
									
									<div class = "tab-content">
										<!-- 1번 탭 내용 -->
										<div class = "tab-pane active" id = "tab_1_addCurri">
											<div class = "sub-box">
												<div class = "sub-body" id = "addCurriForm">
													<div class = "innerBox">
														<div class = "addCurriDiv">
															<!-- 탭 상단 -->
															<div class = "row">
																<div class = "col-xs-12">
																	<div class = "sub-box">
																		<table class = "table table-condensed" id = "curriCateInfoTbl">
																			<colgroup>
																				<col width = "90px"/>
																				<col width = "229px"/>
																				<col width = "90px"/>
																				<col width = ""/>
																			</colgroup>
																			<tbody>
																				<tr>
																					<th>업무구분</th>
																					<td>
																						<input type = "hidden" name = "curriculumCate_no"  style = "border:none;">
<!-- 																						<select class = "form-control " id = "curriculumCate_no" name = "curriculumCate_no"> -->
																						<select class = "form-control " id = "curriculumCate_no" name = "cateName">
																							<c:forEach items = "${workType }" var = "workType">
																								<option id = "${workType.curriculumCate_no }"  value = "${workType.curriculumCate_no }">${workType.cateName }</option>
																							</c:forEach>
																						</select>
																					</td>
																					<th>선택패키지</th>
																					<td>
																						<input type = "hidden" name = "package_no"  style = "border:none;">
																						<input type = "text" class = "w300" readonly name = "packageName" style = "border : none; text-overflow: ellipsis;" >
																						<button type = "button" class = "btn btn-default btn-h25 pull-right " data-toggle = "modal" data-target = "#packageViewModal2">패키지보기</button>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div><!-- /.sub-box -->
																</div><!-- /.col-xs-12 -->
															</div><!--/.row --><!-- /.탭 상단 -->
															
															<div class = "space"></div>
															
															<div class = "row">
																<div class = "col-xs-12">
																	<div class = "sub-box">
																		<div class = "sub-title" style = "width : 945px;">
																			<div class = " pull-left " style = "float : left;">기본정보</div>
																			<div class = "pull-right" style = "float : right;"><button type = "button" class = "btn btn-default btn-sm pull-right" id = "emptyTbl">전체 내용 지우기</button></div>
																		</div><!-- /.sub-title -->
																		<div class = "sub-body">
																			<table class = "table table-condensed" id = "curriInfoTbl">
																				<colgroup>
																					<col width = "90px"/>
																					<col width = ""/>
																					<col width = "90px"/>
																					<col width = ""/>
																					<col width = "90px"/>
																					<col width = ""/>
																				</colgroup>
																				<tbody>
																					<tr>
																						<th>교육과정명</th>
																						<td colspan = "3">
																							<input type = "hidden"  name = "curriculum_no">
																							<input class = "form-control" type = "text"  name = "curriName">
																						</td>
																						<th>과목별명</th>
																						<td>
																							<input type = "text" class = "form-control" name = "curriNickname">
																						</td>
																					</tr>
																					<tr>
																						<th>시작일</th>
																						<td>
																							 <div class="input-group border-inputcolor ">
																						        <input type="text" class=" form-control border-none" name="startDate" id="startDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																						        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																					        </div>
																						</td>
																						<th>종료일</th>
																						<td>
																							 <div class="input-group border-inputcolor ">
																						        <input type="text" class=" form-control border-none" name="endDate" id="endDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																						        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																					        </div>
																						</td>
																						<th>정원</th>
																						<td>
																							<input type="text" class="form-control w140 pull-left" name = "maxCnt">명
																						</td>
																					</tr>
																					
																					<tr id = "tr_testDate" >
																						<th>전형일시<input type = "hidden" value = "0" name = "testTimeCnt"></th>
																						<td colspan="5" id = "testTimeTd">
										<%-- 											       	<c:forEach begin="1" end="9"> --%>
																						        <div class="pull-left form-inline testTimeDiv w280" id = "testTimeDiv0"> <!-- style = " margin-bottom:3px;" -->
																									<span class="input-group border-inputcolor w200">
																								        <input type="text" class="  form-control border-none" id="testDate0" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																								        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																							        </span>
																							        <span>
																							        	<select class="form-control w60 testTime" id = "testTime0">
																											<option value = "">--:--</option>
																											<option value = "08:00">08:00</option>
																											<option value = "09:00">09:00</option>
																											<option value = "10:00">10:00</option>
																											<option value = "11:00">11:00</option>
																											<option value = "12:00">12:00</option>
																											<option value = "13:00">13:00</option>
																											<option value = "14:00">14:00</option>
																											<option value = "15:00">15:00</option>
																											<option value = "16:00">16:00</option>
																											<option value = "17:00">17:00</option>
																											<option value = "18:00">18:00</option>
																											<option value = "19:00">19:00</option>
																											<option value = "20:00">20:00</option>
																											<option value = "21:00">21:00</option>
																											<option value = "22:00">22:00</option>
																											<option value = "23:00">23:00</option>
																										</select>
																									</span>
																									<!-- 
																									<span>
																										<button class = "glyphicon glyphicon-plus border-none addTestDateBtn" style = "background-color : transparent; " id = "addTestDateBtn"></button>
																										<button class = "glyphicon glyphicon-remove border-none removeTestDateBtn" style = "background-color : transparent; "></button>
																									</span>
																									 -->
																						        </div>
																						        
																						        
																						        <div class="pull-left form-inline testTimeDiv w280" id = "testTimeDiv1"><!--  style = " margin-bottom:3px;" -->															
																						        	<span class="input-group border-inputcolor w200">
																								        <input type="text" class="  form-control border-none" id="testDate1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																								        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																							        </span>
																							        <span>
																							        	<select class="form-control w60 testTime" id = "testTime1">
																											<option value = "">--:--</option>
																											<option value = "08:00">08:00</option>
																											<option value = "09:00">09:00</option>
																											<option value = "10:00">10:00</option>
																											<option value = "11:00">11:00</option>
																											<option value = "12:00">12:00</option>
																											<option value = "13:00">13:00</option>
																											<option value = "14:00">14:00</option>
																											<option value = "15:00">15:00</option>
																											<option value = "16:00">16:00</option>
																											<option value = "17:00">17:00</option>
																											<option value = "18:00">18:00</option>
																											<option value = "19:00">19:00</option>
																											<option value = "20:00">20:00</option>
																											<option value = "21:00">21:00</option>
																											<option value = "22:00">22:00</option>
																											<option value = "23:00">23:00</option>
																										</select>
																									</span>
																									<!-- 
																									<span>
																										<button class = "glyphicon glyphicon-plus border-none addTestDateBtn" style = "background-color : transparent; " id = "addTestDateBtn"></button>
																										<button class = "glyphicon glyphicon-remove border-none removeTestDateBtn" style = "background-color : transparent; "></button>
																									</span>
																									 -->
																						        </div>
																						        
																						        
																						        <div class="pull-left form-inline testTimeDiv w280" id = "testTimeDiv2">
																									<span class="input-group border-inputcolor w200">
																								        <input type="text" class="  form-control border-none" id="testDate2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																								        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																							        </span>
																							        <span>
																							        	<select class="form-control w60 testTime" id = "testTime2">
																											<option value = "">--:--</option>
																											<option value = "08:00">08:00</option>
																											<option value = "09:00">09:00</option>
																											<option value = "10:00">10:00</option>
																											<option value = "11:00">11:00</option>
																											<option value = "12:00">12:00</option>
																											<option value = "13:00">13:00</option>
																											<option value = "14:00">14:00</option>
																											<option value = "15:00">15:00</option>
																											<option value = "16:00">16:00</option>
																											<option value = "17:00">17:00</option>
																											<option value = "18:00">18:00</option>
																											<option value = "19:00">19:00</option>
																											<option value = "20:00">20:00</option>
																											<option value = "21:00">21:00</option>
																											<option value = "22:00">22:00</option>
																											<option value = "23:00">23:00</option>
																										</select>
																									</span>
																									<!-- 
																									<span>
																										<button class = "glyphicon glyphicon-plus border-none addTestDateBtn" style = "background-color : transparent; " id = "addTestDateBtn"></button>
																										<button class = "glyphicon glyphicon-remove border-none removeTestDateBtn" style = "background-color : transparent; "></button>
																									</span>
																									 -->
																						        </div>
																						        
																						        
										<%-- 											        </c:forEach> --%>
																						</td>
																					</tr>
																					
																					<tr>
																						<th>강의시간</th>
																						<td colspan="5">
																							<input type="text" class="form-control" name = "time">
																						</td>
																						
																					</tr>
																					<tr>
																						<th>교육비용</th>
																						<td>
																							<input type="text" class="form-control" name = "price">
																						</td>
																						<th>교육비지원</th>
																						<td>
																							<input type="text" class="form-control" name = "support">
																						</td>
																						<th>문의</th>
																						<td>
																							<input type="text" class="form-control" name = "managerInfo">
																						</td>
																					</tr>
																					<tr>
																						<th>상태</th>
																						<td colspan="3">
																							<div class="radio-group">
																								<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="0">준비중</label>
																								<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="1">모집중</label>
																								<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="2">모집마감</label>
																								<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="3">수업중</label>
																								<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="4">종료</label>
																							</div>
																						</td>
																						<th>기수</th>
																						<td><input type="text" class="form-control " name = "gisuName"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div><!-- /.sub-box -->
																		<div class = "sub-toolbox clearfix text-center">
																			<button type = "button" class = "btn btn-primary" id = "addCurriBtn" >저장</button>
																			<a href = "${pageContext.request.contextPath }/curri/">
																				<button type = "button" class = "btn btn-default pull-right" >취소</button>
																			</a>
																		</div><!-- /.sub-toolbox text-center -->
																	</div><!-- /.sub-box -->
																</div><!-- /.col-xs-12 -->
															</div><!-- /.tab_1 row2(1번탭 하단) -->
														</div><!-- /.addCurriDiv -->
													</div><!-- /.innerBox -->
												</div><!-- /.sub-body -->
											</div><!-- /.sub-box -->
										</div><!-- /.tab_1 -->
										<!-- /.1번탭 -->
									</div><!-- /.tab-content -->
									<!-- /.탭 내용 박스 끝 -->
								</div><!-- /.nav-tabs-custom -->
								<!-- 탭 박스 외곽 끝 -->
							</div><!-- col-xs-9 -->
							<!-- /.교육과정 정보 영역 끝 -->
						</div><!-- /.row -->
					</div><!-- /.box box-body -->
				</div><!-- /.col-xs-12 -->
			</div><!-- /.row -->
		</section>
	</div><!-- content-wrapper -->



<!-- 모달 시작! -->
<div class = "modal fade" id = "packageViewModal2" >
	<div class = " modal-dialog">
		<div class = "modal-content">
			<div class = "modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class = "modal-title" id = "packageViewModalLabel2">패키지선택</h4>
			</div><!-- /.modal-header -->
			<div class = "modal-body">
				<div class = "sub-box">
					<div class = "cate-outter bordered">
						<div class = "scroll">
							<div class = "tab-content-custom" style = "height : 500px;" >
								<ul id = "modalTree2" class = "ztree"></ul>
							</div><!-- /.tab-content-custom -->
						</div><!-- /.modal scroll -->
					</div><!-- /.cate-outter bordered -->
				</div><!-- /.sub-box -->
			</div><!-- /.modal-body -->
			<div class = "modal-footer">
				<input type = "hidden" id = "package_no" class = "input-group input-group-sm" >
				<button type = "button" class = "btn btn-default" id = "modalSelectBtn2" >선택</button>
				<button type = "button" class = "btn btn-default " id = "modalCancelBtn2" data-dismiss = "modal">취소</button>
			</div><!-- /.modal-footer -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal-fade -->
<!-- /.모달 끝 --> 



<!-- 교육과정 카테고리 추가 버튼 모달창 -->
<div class = "modal fade" id = "addCateModal" >
	<div class = " modal-dialog">
		<div class = "modal-content">
			<div class = "modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class = "modal-title" id = "addCateModalLabel">패키지선택</h4>
			</div><!-- /.modal-header -->
			<div class = "modal-body">
				<table class = "table table-condensed">
					<tr>
						<th>위치</th>
						<td>
							<select name = "curriCate" id = "curriculumCate_no2" class = "form-control">
								<c:forEach items = "${workType }" var = "workType">
									<option id = "${workType.curriculumCate_no }" value = "${workType.curriculumCate_no }">${workType.cateName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리명</th>
						<td>
							<input type = "text" class = "form-control" name = "cateName2" value = "" id = "cateName">
						</td>
					</tr>	
				</table>
			</div><!-- /.modal-body -->
			<div class = "modal-footer">
				<button type = "button" class = "btn btn-primary " id = "addCateSaveBtn" >저장</button>
				<button type = "button" class = "btn btn-default pull-right" id = "addCateCancelBtn" data-dismiss = "modal" >취소</button>
			</div><!-- /.modal-footer -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal-fade -->
<!-- /.모달 끝 --> 


<!-- /.교육과정 카테고리 추가 버튼 모달창 -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


</body>
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript">
</script>
	<c:import url="/WEB-INF/views/screening/includes/script_addCurri.jsp"></c:import>


</html>

