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
								<div class = "col-xs-12">
									<div class = "col-xs-5">
										<div class = "sub-box" style = "border : 1px solid; border-color: #d2d6de; padding: 10px;">
											<div class = "sub-title">
												전체지원자리스트
											</div><!-- /.sub-title -->
											<div class = "sub-box">
												<table class = "table table-condensed" >
													<colgroup>
														<col class = "col-xs-3">
														<col class = "col-xs-3">
														<col class = "col-xs-2">
														<col class = "col-xs-2">
														<col class = "col-xs-2">
													</colgroup>
													<thead>
														<tr>
															<th>이름</th>
															<th>생년월일</th>
															<th>성별</th>
															<th>전형결과</th>
															<th>선택</th>
														</tr>
													</thead>
													<tbody id = "renderApplicantList">
<!-- 													<tr> -->
<!-- 														<td><input type = "text" class = "form-control " name = "nameHan" style = "border : none;"></td> -->
<!-- 														<td><input type = "text" class = "form-control " name = "birthDate" style = "border : none;"></td> -->
<!-- 														<td><input type = "text" class = "form-control " name = "gender" style = "border : none;"></td> -->
<!-- 														<td><input type = "text" class = "form-control " name = "testResult" style = "border : none;"></td> -->
<!-- 														<td> -->
<!-- 															<label class = "form-control-static"><input type = "checkbox" class = "" name = "gisuGrant" value = ""></label> -->
<!-- 														</td> -->
<!-- 													</tr> -->
													
													</tbody>
												</table>
											</div><!-- /.sub-box -->
										</div><!-- /.sub-box -->
									</div><!-- /.col-xs-5 좌측-->
									<div class = "col-xs-2">
										<button type = "button" class = "btn btn-default" value = "gisuGrant" onClick = "gisuGrant()">></button>
										<button type = "button" class = "btn btn-default" value = ""><</button>
									</div><!-- /.col-xs-2 -->
									<div class = "col-xs-5" style = "border : 1px solid; border-color: #d2d6de; padding: 10px;">
										<div class = "sub-box">
											<div class = "sub-title">
												수강생리스트
											</div><!-- /.sub-title -->
											<div class = "sub-box" id = "">
												<table class = "table table-condensed" >
													<colgroup>
														<col class = "col-xs-3">
														<col class = "col-xs-3">
														<col class = "col-xs-2">
														<col class = "col-xs-2">
														<col class = "col-xs-2">
													</colgroup>
													<tr>
														<th>이름</th>
														<th>생년월일</th>
														<th>성별</th>
														<th>전형결과</th>
														<th>선택</th>
													</tr>
													<!-- 
													<tr id = "renderApplicantList">
													
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td>
															<label class = "form-control-static"><input type = "checkbox" class = "" name = "gisuGrant" value = ""></label>
														</td>
														
													</tr>
													 -->
												</table>
											</div><!-- /.sub-box -->
										</div><!-- /.sub-box -->
									</div><!-- /.col-xs-5 우측 -->
								</div><!-- /.col-xs-12 -->
							</div><!-- /.row  -->
						</div><!-- /.sub-box -->
						<div class = "sub-toolbox text-center">
							<button type = "button" class = "btn btn-primary" >저장</button>
						</div><!-- /.sub-toolbox text-center -->
					</div><!-- /.col-xs-12 -->
				</div><!-- /.row 3번탭 하단 -->
			</div><!-- /.innerBox -->
		</div><!-- /.sub-body -->
	</div><!-- /.sub-box -->
</div><!-- /.tab_3 -->






