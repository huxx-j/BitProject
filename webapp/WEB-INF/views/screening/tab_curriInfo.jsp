<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class = "tab-pane active" id = "tab_1">
	<div class="sub-box">
		<div class="sub-body">
			<div class = "innerBox">
				<form action = "${pageContext.request.contextPath }/curri/edit/${curriculum_no}" method = "post">
					<!-- 1번탭 상단 -->
					<div class = "row"><!-- tab_1 row1 -->
						<div class = "col-xs-12">
							<div class = "sub-box">
								<table class = "table table-condensed">
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
												<select class = "form-control " id = "workType" name = "workType">
													<option value = "국가기간">국가기간</option>
													<option value = "핵심역량">핵심역량</option>
													<option value = "방학단기">방학단기</option>
												</select>
											</td>
											<th>선택패키지</th>
											<td>
												<input type = "hidden" name = "package_no"  style = "border:none;">
												<input type = "form-control " readonly name = "packageName" style = "border : none; width : 60%;" >
												<button type = "button" class = "btn btn-default btn-sm pull-right" data-toggle = "modal" data-target = "#packageViewModal">패키지보기</button>
											</td>
										</tr>
									</tbody>
								</table>
								
								<!-- 모달 시작! -->
								<div class = "modal fade" id = "packageViewModal" tabindex = "-1" role = "dialog" aria-labelledby ="packageViewModalLabel" aria-hidden = "true" style = "overflow-y : scroll; overflow-x : hidden;">
									<div class = " modal-dialog">
										<div class = "modal-content">
											<div class = "modal-header">
												<button type = "button" class = "close" data-dismiss = "modal">
													<span aria-hidden = "true">x</span>
													<span class = "sr-only">Close</span>
												</button>
												<h4 class = "modal-title" id = "packageViewModalLabel">패키지선택</h4>
											</div><!-- /.modal-header -->
											<div class = "modal-body">
												<div class = "scroll">
													<div class = "tab-content-custom" style = "height : 500px;">
														<div class "row">
															<ul id = "treeDemo" class = "ztree"></ul>
														</div><!-- /.row -->
													</div><!-- /.tab-content-custom -->
												</div><!-- /.modal scroll -->
											</div><!-- /.modal-body -->
											<div class = "modal-footer">
												<button type = "button" class = "btn btn-default" style = "padding: 2px 5px; margin : auto;">선택</button>
												<button type = "button" class = "btn btn-default " data-dismiss = "modal" style = "padding : 2px 5px;">취소</button>
											</div><!-- /.modal-footer -->
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal-fade -->
								<!-- /.모달 끝 --> 
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
									<table class = "table table-condensed">
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
											        <input type="text" class=" form-control border-none" name="startDate" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
											        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
										        </div>
<!-- 																						<div class="input-group" class = "form-control input-sm" style="border: 1px solid #d2d6de"> -->
<!-- 																							<input type="text" class="form-control input-sm " name="startDate" id="date2"  data-select="datepicker" style="border: none; "> -->
<!-- 							                                                                <span class="input-group-btn"> -->
<!-- 							                                                                    <button type="button" class="btn" data-toggle="datepicker" style="border: none;  background-color: rgba(255,255,255,0)"  id="testDatepicker"> -->
<!-- 							                                                                   		<label for="date2"><i class="fa fa-calendar"></i></label> -->
<!-- 						                                                                   		</button> -->
<!-- 							                                                                </span> -->

<!-- 																						</div> -->
											</td>
											<th>종료일</th>
											<td>
												 <div class="input-group border-inputcolor ">
											        <input type="text" class=" form-control border-none" name="endDate" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
											        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
										        </div>
											<!-- 
												<div class="input-group" class = "form-control input-sm" style = "border : 1px solid #d2d6de">
													<input type="text" class="form-control input-sm " name="endDate" id="date1"  data-select="datepicker" style="border: none; ">
													<span class="input-group-btn">
                                                                 <button type="button" class="btn" data-toggle="datepicker" style="border: none;  background-color: rgba(255,255,255,0)"  id="testDatepicker">
                                                                 	<label for="date1"><i class="fa fa-calendar"></i></label>
                                                               		</button>
                                                             </span>

												</div> -->
											</td>
											<th>전형일</th>
											<td>
											
												 <div class="input-group border-inputcolor ">
											        <input type="text" class=" form-control border-none" name="testDate" id="date3" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
											        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
										        </div>
										        <!-- 
												<div class="input-group" class = "form-control input-sm" style = "border : 1px solid #d2d6de">
													<input type="text" class="form-control input-sm " name="testDate" id="date3"  data-select="datepicker" style="border: none; ">
													<span class="input-group-btn">
                                                                 <button type="button" class="btn" data-toggle="datepicker" style="border: none;  background-color: rgba(255,255,255,0)"  id="testDatepicker">
                                                                 	<label for="date3"><i class="fa fa-calendar"></i></label>
                                                               		</button>
                                                             </span>

												</div> -->
											</td>
										</tr>
										<tr>
											<th>강의시간</th>
											<td colspan="3">
												<input type="text" class="form-control" name = "time" <%-- value="${curri.time }" --%>>
											</td>
											<th>정원</th>
											<td>
												<input type="text" class="form-control w140 pull-left" name = "maxCnt"<%--  value="${curri.num }" --%>>명
											</td>
										</tr>
										<tr>
											<th>교육비용</th>
											<td>
												<input type="text" class="form-control" name = "price"<%--  value="${curri.money }" --%>>
											</td>
											<th>교육비지원</th>
											<td>
												<input type="text" class="form-control" name = "support" <%-- value="${curri.support }" --%>>
											</td>
											<th>문의</th>
											<td>
												<input type="text" class="form-control" name = "managerInfo" <%-- value="${curri.inquiry }" --%>>
											</td>
										</tr>
										<tr>
											<th>상태</th>
											<td colspan="3">
												<div class="radio-group">
													<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="준비중">준비중</label>
													<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="모집중">모집중</label>
													<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="모집마감">모집마감</label>
													<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="수업중">수업중</label>
													<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="종료">종료</label>
												</div>
											</td>
											<th>기수</th>
											<td><input type="text" class="form-control " name = "gisuName"></td>
										</tr>
									</table>
								</div><!-- /.sub-box -->
								
								<div class="sub-toolbox clearfix text-center">
									<input type="submit" value="수정" class="btn btn-primary">
								</div><!-- sub-toolbox -->
								
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-12 -->
					</div><!-- /.tab_1 row2(1번탭 하단) -->
				</form><!-- /.tab_1 form -->
			</div><!-- /.innerBox -->
		</div><!-- /.sub-body -->
	</div><!-- sub-box -->
	
	
	
	
	
	
</div><!-- /.tab_1 -->