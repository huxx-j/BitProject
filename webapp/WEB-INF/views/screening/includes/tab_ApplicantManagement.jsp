<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class = "tab-pane" id = "tab_3">
	<div class = "sub-box">
		<div class = "sub-body">
			<div class = "innerBox">
				<div class = "row">
					<div class = "col-xs-12">
						<table class = "table table-condensed">
							<tr>
								<th>교육과정명</th>
								<td class = "col-xs-10"><input type = "text" class = "form-control" readonly name = "curriName"></td>
							</tr>
						</table>
					</div><!-- /.col-xs-12" -->
				</div><!-- /.row 3번탭 상단 -->
				<div class = "row" style = "padding: 10px 0 0 0;">
					<div class = "col-xs-12" >
						<div class = "sub-box">
							<div class = "sub-title" >
								기수부여
							</div>
							<div class = "row">
								<div class = "col-xs-12" >
									<div class = "col-xs-5" style = "border : 1px solid; border-color: #d2d6de; padding: 10px;">
										<div class = "sub-box" style = "height : 500px;"  >
											<div class = "sub-title">
												전체지원자리스트
											</div><!-- /.sub-title -->
											<div class = "sub-box" style="overflow-x:hidden; overflow-y:auto; height : 95%;">
												<table class = "table table-condensed text-center" >
													<colgroup>
														<col width = "30px"/>
														<col width = "60px"/>
														<col width = "90px"/>
														<col width = "60px"/>
														<col width = "120px"/>
													</colgroup>
													<thead>
														<tr>
															<th><div class = "checkbox-group form-inline"><label class = "checkbox"><input type = "checkbox" class = "text-center" name = "gisuGrantCheckAll" id = "gisuGrantCheckAll" ></label></div></th>
															<th>이름</th>
															<th>생년월일</th>
															<th>성별</th>
															<th>전형결과</th>
														</tr>
													</thead>
													<tbody id = "renderApplicantList">
													
													</tbody>
												</table>
											</div><!-- /.sub-box -->
										</div><!-- /.sub-box -->
									</div><!-- /.col-xs-5 좌측-->
									<div class = "col-xs-2 text-center" style = "height : 500px; display: table;" >
										<div class = "button_group" style = "vertical-align: middle; display: table-cell;">
											<button type = "button" class = "btn btn-sub glyphicon glyphicon-chevron-right" value = "gisuGrant" onClick = "gisuGrant()"></button>
											<br>
											<br>
											<button type = "button" class = "btn btn-sub glyphicon glyphicon-chevron-left" value = "gisuRemove" onClick = "gisuRemove()"></button>
										</div>
									</div><!-- /.col-xs-2 -->
									<div class = "col-xs-5" style = "border : 1px solid; border-color: #d2d6de; padding: 10px;">
										<div class = "sub-box" style = "height : 500px;" >
											<div class = "sub-title">
												수강생리스트
											</div><!-- /.sub-title -->
											<div class = "sub-box" style="overflow-x:hidden; overflow-y:auto; height : 95%;">
												<table class = "table table-condensed text-center" >
													<colgroup>
														<col width = "30px"/>
														<col width = "60px"/>
														<col width = "90px"/>
														<col width = "60px"/>
														<col width = "120px"/>
													</colgroup>
													<thead>
														<tr>
															<th><div class = "checkbox-group form-inline"><label class = "checkbox"><input type = "checkbox" class = "text-center" name = "gisuRemoveCheckAll" id = "gisuRemoveCheckAll"></label></div></th>
															<th>이름</th>
															<th>생년월일</th>
															<th>성별</th>
															<th>전형결과</th>
														</tr>
													</thead>
													<tbody id = "gisuGrantList">
													
													</tbody>
													
												</table>
											</div><!-- /.sub-box -->
										</div><!-- /.sub-box -->
									</div><!-- /.col-xs-5 우측 -->
								</div><!-- /.col-xs-12 -->
							</div><!-- /.row  -->
						</div><!-- /.sub-box -->
						<div class = "sub-toolbox text-center">
							<button type = "button" class = "btn btn-primary" id = "gisuGrantSaveBtn" >저장</button>
						</div><!-- /.sub-toolbox text-center -->
					</div><!-- /.col-xs-12 -->
				</div><!-- /.row 3번탭 하단 -->
			</div><!-- /.innerBox -->
		</div><!-- /.sub-body -->
	</div><!-- /.sub-box -->
</div><!-- /.tab_3 -->
