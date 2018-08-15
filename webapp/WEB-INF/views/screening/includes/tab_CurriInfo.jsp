<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class = "tab-pane active" id = "tab_1">
	<div class="sub-box">
		<div class="sub-body" id = "curriInfo">
			<div class = "innerBox">
				<div id = "editCurriDiv">
					<!-- 1번탭 상단 -->
					<div class = "row"><!-- tab_1 row1 -->
						<div class = "col-xs-12">
							<div class = "sub-box">
								<table class = "table table-condensed ">
									<colgroup>
										<col class = "col-xs-2"/>
										<col class = "col-xs-3"/>
										<col class = "col-xs-2"/>
										<col class = "col-xs-5"/>
									</colgroup>
									<tbody>
										<tr>
											<th>업무구분</th>
											<td>
												<input type = "hidden" name = "curriculumCate_no"  style = "border:none;">
												<select class = "form-control " id = "cateName" name = "cateName">
													<c:forEach items="${workType}" var="vo">
														<option id = "${vo.curriculumCate_no }" value="${vo.cateName}">${vo.cateName}</option>
													</c:forEach>
												</select>
											</td>
											<th>선택패키지</th>
											<td>
												<input type = "hidden" name = "package_no"  style = "border:none;">
												<input type = "text " class = "w300" readonly name = "packageName" style = "border : none; text-overflow: ellipsis;" >
												<button type = "button" class = "btn btn-default btn-sm pull-right" data-toggle = "modal" data-target = "#packageViewModal">패키지보기</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-12 -->	
					</div><!-- /.tab_1 row1(1번탭 상단) -->
					
					<div class = "space"></div>
					
					<div class = "row">
						<div class = "col-xs-12">
							<div class = "sub-box">
								<div class = "sub-title">
									기본정보
								</div><!-- /.sub-title -->
								<div class = "sub-body">
									<table class = "table table-condensed ">
										<tbody>
											<tr >
												<th  class = "col-xs-1">교육과정명</th>
												<td colspan = "3" class = "col-xs-7">
													<input type = "hidden"  name = "curriculum_no">
													<input class = "form-control" type = "text"  name = "curriName">
												</td>
												<th class = "col-xs-1">과목별명</th>
												<td class = "col-xs-3">
													<input type = "text" class = "form-control" name = "curriNickname">
												</td>
											</tr>
											<tr>
												<th colspan = "1" class = "col-xs-1">시작일</th>
												<td colspan = "2" class = "col-xs-5">
													 <div class="input-group border-inputcolor ">
												        <input type="text" class=" form-control border-none" name="startDate" id="startDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
												        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
											        </div>
												</td>
												<th colspan = "1" class = "col-xs-1">종료일</th>
												<td colspan = "2" class = "col-xs-5">
													 <div class="input-group border-inputcolor ">
												        <input type="text" class=" form-control border-none" name="endDate" id="endDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
												        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
											        </div>
												</td>
											</tr>
											<tr id = "tr_testDate" >
												<th class = "col-xs-1">전형일시</th>
												<td class = "col-xs-1" >
													 <div class="input-group border-inputcolor" style = "width : 170px;">
												        <input type="text" class=" form-control border-none" name="testDate" id="testDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
												        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
											        </div>
												</td>
												<td class = "col-xs-1" id = "td_testDate" style = "width : 200px !important;">
													<div style = "float : left; ">
											        	<select class = "form-control " id = "testTime" name = "testTime">
															<option value = "--:--">--:--</option>
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
													</div>
													<div class = "pull-right" style = "float : right; vertical-align: middle; margin:2px 0px 1px 0px !important; ">
														<button class = "glyphicon glyphicon-plus border-none" style = "background-color : transparent; " id = "addTestDateBtn"></button>
														<button class = "glyphicon glyphicon-remove border-none " style = "background-color : transparent; "></button>
													</div>
												</td>
<!-- 												<td> -->
<!-- <!-- 													<span class = "glyphicon glyphicon-remove"></span> --> 
<!-- 												</td> -->
												<!-- 
												<td  style = "width : 20%;">
													 <div class="input-group border-inputcolor ">
												        <input type="text" class=" form-control border-none" name="testDate2" id="testDate2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
												        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
											        </div>
												</td>
												<td style ="width : 10%;">
											        <select class = "form-control " id = "testTime2" name = "testTime2">
														<option value = "--:--">--:--</option>
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
												</td>
												<td  style = "width : 20%;">
													 <div class="input-group border-inputcolor ">
												        <input type="text" class=" form-control border-none" name="testDate3" id="testDate3" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
												        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
											        </div>
												</td>
												<td style ="width : 10%;">
											        <select class = "form-control " id = "testTime3" name = "testTime2">
														<option value = "--:--">--:--</option>
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
												</td>
												 -->
<!-- 												<td> -->
<!-- 													 <div class="input-group border-inputcolor "> -->
<!-- 												        <input type="text" class=" form-control border-none" name="testDate" id="testDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD"> -->
<!-- 												        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span> -->
<!-- 											        </div> -->
<!-- 												</td> -->
<!-- 												<td> -->
<!-- 											        <select class = "form-control " id = "testTime" name = "testTime"> -->
<!-- 														<option value = "0">전체</option> -->
<!-- 														<option value = "1">08:00</option> -->
<!-- 														<option value = "2">09:00</option> -->
<!-- 														<option value = "3">10:00</option> -->
<!-- 														<option value = "3">11:00</option> -->
<!-- 														<option value = "3">12:00</option> -->
<!-- 														<option value = "3">13:00</option> -->
<!-- 														<option value = "3">14:00</option> -->
<!-- 														<option value = "3">15:00</option> -->
<!-- 														<option value = "3">16:00</option> -->
<!-- 														<option value = "3">17:00</option> -->
<!-- 														<option value = "3">18:00</option> -->
<!-- 														<option value = "3">19:00</option> -->
<!-- 														<option value = "3">20:00</option> -->
<!-- 														<option value = "3">21:00</option> -->
<!-- 														<option value = "3">22:00</option> -->
<!-- 														<option value = "3">23:00</option> -->
<!-- 													</select> -->
<!-- 												</td> -->
											</tr>
											<tr >
												<th class = "col-xs-1">강의시간</th>
												<td colspan="3" class = "col-xs-7">
													<input type="text" class="form-control" name = "time">
												</td>
												<th class = "col-xs-1">정원</th>
												<td class = "col-xs-3">
													<input type="text" class="form-control w140 pull-left" name = "maxCnt">명
												</td>
											</tr>
											<tr>
												<th class = "col-xs-1">교육비용</th>
												<td class = "col-xs-3">
													<input type="text" class="form-control" name = "price">
												</td>
												<th class = "col-xs-1">교육비지원</th>
												<td class = "col-xs-3">
													<input type="text" class="form-control" name = "support">
												</td>
												<th class = "col-xs-1">문의</th>
												<td class = "col-xs-3">
													<input type="text" class="form-control" name = "managerInfo">
												</td>
											</tr>
											<tr>
												<th class = "col-xs-1">상태</th>
												<td colspan="3" class = "col-xs-7" >
													<div class="radio-group">
														<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="0">준비중</label>
														<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="1">모집중</label>
														<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="2">모집마감</label>
														<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="3">수업중</label>
														<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="4">종료</label>
													</div>
												</td>
												<th class = "col-xs-1">기수</th>
												<td class = "col-xs-3">
													<input type="text" class="form-control " name = "gisuName">
												</td>
											</tr>
										</tbody>
									</table>
								</div><!-- /.sub-box -->
								<div class="sub-toolbox clearfix text-center"> 
									<button class="btn btn-primary" id = "editCurriBtn">수정</button>
								</div><!-- sub-toolbox -->
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-12 -->
					</div><!-- /.tab_1 row2(1번탭 하단) -->
				</div><!-- editCurriDiv -->
			</div><!-- /.innerBox -->
		</div><!-- /.sub-body -->
	</div><!-- sub-box -->
</div><!-- /.tab_1 -->



<!-- 패키지 보기 모달 -->
<!-- 모달 시작! -->
<div class = "modal fade" id = "packageViewModal" >
	<div class = " modal-dialog">
		<div class = "modal-content">
			<div class = "modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class = "modal-title" id = "packageViewModalLabel">패키지선택</h4>
			</div><!-- /.modal-header -->
			<div class = "modal-body">
				<div class = "sub-box">
					<div class = "cate-outter bordered">
						<div class = "scroll">
							<div class = "tab-content-custom" style = "height : 500px;">
								<ul id = "modalTree" class = "ztree"></ul>
							</div><!-- /.tab-content-custom -->
						</div><!-- /.modal scroll -->
					</div><!-- /.cate-outter bordered -->
				</div><!-- /.sub-box -->
			</div><!-- /.modal-body -->
			<div class = "modal-footer">
				<button type = "button" class = "btn btn-default" id = "modalSelectBtn" >선택</button>
				<button type = "button" class = "btn btn-default" id = "modalCancelBtn" data-dismiss = "modal" >취소</button>
			</div><!-- /.modal-footer -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal-fade -->
<!-- /.모달 끝 --> 
<!-- /.패키지보기 모달 -->


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
							<select name = "curriCate" id = "curriculumCate_no" class = "form-control">
								<c:forEach items = "${workType }" var = "workType">
									<option id = "${workType.curriculumCate_no }" name = "${workType.curriculumCate_no }" value = "${workType.curriculumCate_no }">${workType.cateName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리명</th>
						<td>
							<input type = "text" class = "form-control" name = "cateName" value = "" id = "cateName">
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