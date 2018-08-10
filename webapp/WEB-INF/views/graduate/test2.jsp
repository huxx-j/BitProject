<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>TCOMS ver2</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta
			content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
			name="viewport">
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>
	<%--<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>--%>
	<%--jqgrid 사용하는 페이지용 스크립트 임포트 태그(마지막에 스크립트 임포트 태그는 삭제할것--%>

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
				지원자관리 <small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">전형업무관리</a></li>
				<li class="active">지원자관리</li>
			</ol>
		</section>
		<!-- /.Content Header (Page header) -->

		<!-- Main content -->
		<section class="content">

			<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12">

					<div class="box box-body">
						<div class="row">
							<div class="col-xs-12">

								<div class="sub-box">
									<div class="sub-title">회사개요</div>
									<!-- sub_title -->

									<div class="sub-body">
										<table class="table table-condensed">

											<colgroup>
												<col width="100px" />
												<col width="" />
												<col width="100px" />
												<col width="" />
											</colgroup>

											<thead>

											<tr>
												<th>일련번호</th>
												<td><input type="text" readonly style="width: 300px"
														   name="text" value=""></td>
												<th>갱신날짜</th>
												<td><input type="text" style="width: 300px" readonly
														   name="text1" value=""></td>
											</tr>

											<tr>
												<th>회사명</th>
												<td><input type="text" style="width: 300px" name=""
														   value=""></td>
												<th>설립년도</th>
												<td><input type="text" style="width: 100px" name=""
														   value="">년 <select name="">
													<option value="1">1학년</option>
													<option value="2">2학년</option>
													<option value="3">3학년</option>
													<option value="4">4학년</option>
												</select>월 <select name="">
													<option value="1">1학년</option>
													<option value="2">2학년</option>
													<option value="3">3학년</option>
													<option value="4">4학년</option>
												</select>일</td>
											</tr>
											<tr>
												<th>주력사업</th>
												<td><input type="text" style="width: 300px" name=""
														   value=""></td>
												<th>홈페이지</th>
												<td><input type="text" style="width: 300px" name=""
														   value=""></td>
											</tr>
											<tr>
												<th>자본금</th>
												<td><input type="text" style="width: 270px" name=""
														   value="">억원</td>
												<th>연매출액</th>
												<td><input type="text" style="width: 270px" name=""
														   value="">억원</td>
											<tr>
												<th>직원수</th>
												<td><input type="text" style="width: 280px" name=""
														   value="">명</td>
												<th>상장여부</th>
												<td><select name="">
													<option value="1">상장</option>
													<option value="1">비상장</option>
												</select></td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td><input type="text" style="width: 250px" name=""
														   value=""> <input type="button" name="" value="찾기"></td>
												<th>주소</th>
												<td><input type="text" style="width: 300px" name=""
														   value="">
											</tr>
											<tr>
												<th>회사소개</th>
												<td><textarea style="width: 300px"></textarea></td>
												<th>복지사항</th>
												<td><textarea style="width: 300px"></textarea></td>
											</tr>
											</thead>

										</table>
									</div>

									<div class="row">

										<div class="sub-title"></div>
										<div class="col-xs-3">
											<!-- sub_title -->
											<div class="sub-body bordered scroll" style="height: 150px;">
												<table class="table table-hover table-condensed">
													<colgroup>
														<col width="" />
														<col width="" />
													</colgroup>

													<thead>
													<tr>
														<th colspan="3" style="text-align: center;">추천의뢰
															리스트</th>
													</tr>
													<tr>
														<th>번호</th>
														<th>일련번호</th>
														<th>신청일</th>
													</tr>
													</thead>

													<tbody>

													<tr>
														<td>1</td>
														<td>14238</td>
														<td>2018-07-08</td>

													</tr>
													</tbody>

												</table>
											</div>
										</div>


										<!--탭 박스 외곽 -->


										<div class="nav-tabs-custom">
											<div class="col-xs-9">
												<!-- 상단탭영역 -->
												<ul class="nav nav-tabs">
													<li class="active"><a href="#tab_1" data-toggle="tab">추천
														의뢰서</a></li>
													<li class=""><a href="#tab_2" data-toggle="tab">지원자
														명단</a></li>
												</ul>
												<!-- /.상단탭영역 -->
												<div class="row">
													<!-- /.탭내용박스 -->
													<div class="tab-content">
														<!-- 1번탭내용 -->
														<div class="col-xs-8">
															<div class="tab-pane active" id="tab_1">
																<!-- 1번탭내용 -->
																<div style="margin: 5px 0 5px 0;">
																	<label class="form-controll-static"><input
																			type="text" class="form-control input-sm" readonly
																			value="14238" style="text-align: center;"></label> <label
																		class="form-controll-static"><input
																		type="checkbox" name="state" value="">상시채용</label>
																</div>

																<table class="table table-condensed">
																	<%--    <colgroup>
                                               <col width="120px" />
                                               <col width="" />
                                            </colgroup>  --%>

																	<tbody>
																	<tr>
																		<th rowspan="8" style="line-height: 100%;">충원계획</th>
																		<th>모집부문</th>
																		<td><input type="text" style="width: 250px"
																				   name="" value=""></td>
																	<tr>
																		<th>모집인원</th>
																		<td><input type="text" readonly
																				   style="width: 40px" value="총원"> <input
																				type="text" style="width: 65px" name="" value="">
																			<input type="text" readonly style="width: 30px"
																				   value="남"> <input type="text"
																									 style="width: 65px" name="" value=""> <input
																					type="text" readonly style="width: 30px" value="여">
																			<input type="text" style="width: 65px" name=""
																				   value=""></td>
																	</tr>
																	<tr>
																		<th>근무지</th>
																		<td><input type="text" style="width: 250px"
																				   name="" value=""></td>
																	</tr>
																	<tr>
																		<th>담당업무</th>
																		<td><input type="text" style="width: 250px"
																				   name="" value=""></td>
																	</tr>
																	<tr>
																		<th>사용 OS</th>
																		<td><input type="text" style="width: 250px"
																				   name="" value=""></td>
																	</tr>
																	<tr>
																		<th>사용언어</th>
																		<td><input type="text" style="width: 250px"
																				   name="" value=""></td>
																	</tr>
																	<tr>
																		<th>사용 DB</th>
																		<td><input type="text" style="width: 250px"
																				   name="" value=""></td>
																	</tr>
																	<tr>
																		<th>기타</th>
																		<td><input type="text" style="width: 250px"
																				   name="" value=""></td>
																	</tr>
																	</tbody>
																</table>
															</div>
														</div>


														<div class="col-xs-4">
															<div class="tab-content">
																<!-- 1번탭내용 -->
																<div class="tab-pane active" id="tab_2">
																	<!-- 1번탭내용 -->
																	<div style="margin: 5px 0 5px 0;">
																		<label class="form-controll-static"><input
																				type="text" class="form-control input-sm" readonly
																				value="자격증협약"
																				style="text-align: center; padding: 0px; width: 80px;"></label>
																		<label class="form-controll-static"><input
																				class="" type="radio" name="state" value="">예</label>
																		<label class="form-controll-static"><input
																				class="" type="radio" name="state" value="">아니오</label>
																	</div>
																	<div class="sub-box">
																		<div class="sub-title">자격요건</div>
																		<div>
																			<label class="form-controll-static"><input
																					type="checkbox" name="state" value="">석사</label> <label
																				class="form-controll-static"><input
																				type="checkbox" name="state" value="">대졸</label> <label
																				class="form-controll-static"><input
																				type="checkbox" name="state" value="">전대졸</label> <label
																				class="form-controll-static"><input
																				type="checkbox" name="state" value="">불문</label>
																		</div>
																		<table class="table table-condensed">
																			<tbody>
																			<tr>
																				<th class="col-xs-1">학과</th>
																				<td class="col-xs-2"
																					style="width: 10%; text-align: center;">무관</td>
																			<tr>
																			</tbody>
																		</table>
																	</div>
																	<!-- sub-box(자격요건) -->

																	<div class="sub-box">
																		<div class="sub-title">급여</div>

																		<table class="table table-condensed">
																			<tbody>
																			<tr>
																				<th class="col-xs-3">월급</th>
																				<td class="col-xs-7">3,000</td>
																				<td class="col-xs-2">만원</td>
																			</tr>
																			<tr>
																				<th class="col-xs-3">상여</th>
																				<td class="col-xs-7"></td>
																				<td class="col-xs-2">%</td>
																			</tr>
																			<tr>
																				<th class="col-xs-3">연봉</th>
																				<td class="col-xs-7"></td>
																				<td class="col-xs-2">만원</td>
																			</tr>
																			</tbody>
																		</table>
																	</div>
																	<!-- sub-box (급여) -->
																</div>
															</div>

														</div>

													</div>
												</div>
												<!-- row? -->
												<div class="row" style="margin: 5px 0 5px 0;">
													<div class="col-xs-7">
														<div class="pull-right">
															<label class="form-controll-static "><input
																	type="text" class="form-control input-sm" readonly
																	value="고용형태"
																	style="text-align: center; padding: 0px; width: 80px;"></label>
															<label class="form-controll-static"><input
																	class="" type="radio" name="state" value="">정규직</label>
															<label class="form-controll-static"><input
																	class="" type="radio" name="state" value="">계약직</label>
														</div>
													</div>
													<div class="col-xs-5">
														<label class="form-controll-static "><input
																type="text" class="form-control input-sm" readonly
																value="경력사항"
																style="text-align: center; padding: 0px; width: 80px;"></label>
														<label class="form-controll-static"><input
																type="checkbox" name="state" value="">신입</label> <label
															class="form-controll-static"><input
															type="checkbox" name="state" value="">경력</label> <label
															class="form-controll-static"><input type="text"
																								name="state" value="" style="width: 50px;">년 이상</label>
													</div>
												</div>
												<!-- row(고용형태, 경력사항 줄) -->

												<div class="row">

													<div class="col-xs-12" style="margin: 1px 0 1px 0;">
														<table class="table table-condensed">
															<tbody>
															<tr>
																<th rowspan="3" class="col-xs-1">전형방법</th>
																<th class="col-xs-1">전형절차</th>
																<td></td>
															</tr>
															<tr>
																<th class="col-xs-1">제출서류</th>
																<td></td>
															</tr>
															<tr>
																<th class="col-xs-1">요구사항</th>
																<td></td>
															</tr>
															</tbody>
														</table>
													</div>
												</div>
												<!-- row(전형방법, 연락처 줄) -->

												<div class="row">
													<div class="col-xs-12" style="margin: 1px 0 1px 0;">
														<table class="table table-condensed">
															<tbody>
															<tr>
																<th rowspan="3" class="col-xs-1">연락처</th>
																<th class="col-xs-1">전화번호</th>
																<td class="col-xs-3"></td>
																<th class="col-xs-1">팩스</th>
																<td class="col-xs-3"></td>
																<th class="col-xs-1">휴대폰</th>
																<td></td>
															</tr>
															<tr>
																<th class="col-xs-1">e-mail</th>
																<td colspan="5"></td>
															</tr>
															<tr>
																<th class="col-xs-1">담당자</th>
																<td></td>
																<th class="col-xs-1">부서</th>
																<td></td>
																<th class="col-xs-1">직책</th>
																<td></td>
															</tr>
															</tbody>
														</table>
													</div>
												</div>
												<!-- row(전형방법, 연락처 줄) -->
												<div class="row">
													<div class="col-xs-12" style="margin: 1px 0 1px 0;">
														<table class="table table-condensed">
															<tr>
																<th class="col-xs-2">기타 사항</th>
																<td class="col-xs-10"></td>
															</tr>
														</table>

													</div>
												</div>
												<!-- row(기타사항) -->

												<div class="row">
													<div class="col-xs-12" style="margin: 1px 0 1px 0;">
														<div class="col-xs-4 pull-left">
															<label class="form-controll-static "><input
																	type="text" class="form-control input-sm" readonly
																	value="신청일"
																	style="text-align: center; padding: 0px; width: 80px;"></label>
															<label> <select class="form-control input-sm">
																<option>2018-06-27</option>
																<option>2018-06-27</option>
																<option>2018-06-27</option>
																<option>2018-06-27</option>
															</select>
															</label> <label class="form-controll-static"><input
																type="checkbox" name="state" value="">게시하기</label>
														</div>

														<div class="col-xs-3">
															<button type="button" class="btn btn-default pull-right"
																	style="padding: 1px;">블랙리스트</button>
														</div>

														<div class="col-xs-5 " style="padding: none;">
															<div class="pull-right">
																<button type="button" class="btn btn-default "
																		style="padding: 1px;">재 게시하기</button>
																<button type="button" class="btn btn-default "
																		style="padding: 1px;">추가</button>
																<button type="button" class="btn btn-default "
																		style="padding: 1px;">취소</button>
															</div>
														</div>
													</div>


												</div>
												<!-- row(신청일 줄) -->

											</div>
										</div>
									</div>







								</div>
								<!-- sub-box -->

								<div class="sub-box">
									<div class="row">
										<div class="col-xs-12">
											<div class="pull-right">
												<button type="button" class="btn btn-default "
														style="padding: 0;">프린트</button>
												<button type="button" class="btn btn-default "
														style="padding: 0;">검색</button>
												<button type="button" class="btn btn-default "
														style="padding: 0;">추가</button>
												<button type="button" class="btn btn-default "
														style="padding: 0;">삭제</button>
												<button type="button" class="btn btn-default "
														style="padding: 0;">저장</button>
												<button type="button" class="btn btn-default "
														style="padding: 0;">취소</button>
												<button type="button" class="btn btn-default "
														style="padding: 0;">종료</button>


											</div>
										</div>

									</div>


								</div>
							</div>
							<!-- /.col-xs-12 -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box -->

				</div>
				<!-- /.col-xs-12 -->
			</div>
		</section>
	</div>






	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<script>
    function viewPackage() {
        var newWindow;
        var popUrl = "${pageContext.request.contextPath}/curri/curriPopUp";
        newWindow = window
            .open(
                popUrl,
                "새 창",
                "width = 700, height = 600, toolbar = no, menubar = no, scrollbars = no, resizable = yes")

    }
  
</script>
