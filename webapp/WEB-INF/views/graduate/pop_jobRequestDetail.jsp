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


	<style type="text/css">
		.trTitle {
			display: inline-block;
			width: 52px;
		}
		
		.devInput{
			width: 406px !important;
			float:right;
		}
		
		.receiptDate{
			font-size: 14px;
    		font-weight: 400;
    		margin: 0px 0px 0px 0px;
    		padding: 0px 0px 0px 0px;
    		height: 25px !important;
    		display: table-cell;
    		vertical-align: bottom;
		}
	</style>





</head>
<body class="hold-transition popup_page">

<div class="wrapper" id="pop_jobRequest">
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		
		<!-- Main content -->
		<section class="content">
			<form id="formJobRequest" method="post" action="${pageContext.request.contextPath}/jobrequest/updateJobRequest">
				<!-- 상단 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-body">	
						
							<div class="row">
								<!-- 위에테이블-->
								<div class="col-xs-12">
									<div class="sub-box">
										<div class="sub-title">기업정보</div>
										<div class="sub-body" id="companyForm">
											<table class="table table-condensed">
												<colgroup>
													<col width="70px" />
													<col width="" />
													<col width="70px" />
													<col width="" />
													<col width="70px" />
													<col width="" />
													<col width="70px" />
													<col width="" />
												</colgroup>
												
												<tbody>
													<tr>
														<th>회사명</th>
														<td colspan="3">
															<input class="form-control" type="text" name="compName" id="req_compName" value="">
														</td>
														<th>설립년도</th>
														<td>
															<input class="form-control" type="text" name="openDate" id="req_openDate" value="">
														</td>
														<th>사업자번호</th>
														<td>
															<input class="form-control" type="text" name="compResNum" id="req_compResNum" value="">
														</td>
													</tr>
													<tr>
														<th>주력사업</th>
														<td colspan="7">
															<input class="form-control" type="text" name="business" id="req_business" value="">
														</td>
													</tr>
													<tr>
														<th>자본금</th>
														<td>
															<input class="form-control" type="text" name="capital" id="req_capital" value="">
														</td>
														<th>연매출액</th>
														<td>
															<input class="form-control" type="text" name="yearSell" id="req_yearSell" value="">
														</td>
														<th>직원수</th>
														<td>
															<input class="form-control" type="text" name="staffCnt" id="req_staffCnt" value="">
														</td>
														<th>상장여부</th>
														<td>
															<select class="form-control" name="isStock" id="req_isStock">
																<option value="" >선택</option> 
																<option value="1" >상장</option> 
																<option value="0" >비상장</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>회사주소</th>
														<td>
															<input class="form-control w100 pull-left" type="text" name="postCode" id="req_postCode" value="">	<!-- 우편번호 -->
															<button class="btn btn-default btn-h25 pull-left" type="button">찾기</button>
														</td>
														<td colspan="6">
															<input class="form-control" type="text" name="address" id="req_address" value=""> 
														</td>
													</tr>
													<tr>
														<th>홈페이지</th>
														<td colspan="7">
															<input class="form-control" type="text" name="homePage" id="req_homePage" value="">
														</td>
													</tr>
													<tr>
														<th>회사소개</th>
														<td colspan="3">
															<textarea class="form-control" name="introduction" id="req_introduction"></textarea>
														</td>
														<th>복지제도</th>
														<td colspan="3">
															<textarea class="form-control" name="welfare" id="req_welfare"></textarea>
														</td>
													</tr>
												</tbody>
											</table>
										</div><!-- /.sub-body -->
									</div><!-- /.sub-box -->
								</div><!-- /.col-xs-12 -->
							</div><!-- /.row -->
							
						</div><!-- body -->
					</div><!-- /.col-xs-12 -->	
				</div><!-- /.row -->
				<!-- /.상단 -->
				
				<!-- 하단 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-body">
							<div class="row">
	
								<!-- 취업의뢰리스트 -->
								<div class="col-xs-2 right-nopadding">
									<div class="sub-box">
										<div class="sub-title">취업의뢰리스트</div>
										<div class="sub-body">
											<table class="table table-hover table-condensed" class="mouse">
												<colgroup>
													<col width="" />
													<col width="" />
												</colgroup>
												<thead>
													<tr>
														<th>접수일</th>
														<!-- <th>모집부문</th> -->
													</tr>
												</thead>
												<tbody id="jobReqList">
													<c:forEach items="${jobReqList }" var="jobReqVo" >
														<c:if test="${jobReqVo.request_no eq param.request_no}">
															<tr class='mouse trSelected'  data-request_no="${jobReqVo.request_no}">
																<td>${jobReqVo.receiptDate}</td>
															</tr>
														</c:if>
														<c:if test="${jobReqVo.request_no ne param.request_no}">
															<tr class='mouse'  data-request_no="${jobReqVo.request_no}">
																<td>${jobReqVo.receiptDate}</td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
											<br><br><br><br>
											<input type="text" id="req_request_no" name="request_no" value="${param.request_no}"><br>
											<input type="text" id="req_company_no" name="company_no" value="${param.company_no}">
										</div><!-- sub-body -->
									</div><!-- /.sub-box -->
								</div><!-- /.col-xs-2 -->
								
								<!--  의뢰상세 -->
								<div class="col-xs-6 right-nopadding" >
									
										<div class="sub-box">
											<div class="sub-toolbox">
												<div class="row">
													<div class="col-xs-8">
														<span class="sub-title">모집부문 및 자격요건</span>
													</div>
													
													<div class="col-xs-4">
														<span class="receiptDate">접수일:&nbsp;<span id="req_receiptDate" class=""></span></span>
													</div>
												</div><!-- /.row -->
											</div>
														
														
											<!-- <div class="sub-title">충원계획</div> -->
											<div class="sub-body">
												<table class="table table-hover table-condensed">
													<colgroup>
														<col width="60px" />
														<col width="110px" />
														<col width="60px" />
														<col width="110px" />
														<col width="60px" />
														<col width="" />
													</colgroup>
													
													
													<tbody>
														<tr>
															<th>게시여부</th>
															<td class="clearfix">
																<div class="checkbox-group pull-left form-inline">
																	<label class="checkbox">
																		<input type="checkbox" id="req_isShow" name="isShow" value="1" >게시중
																	</label>
																</div>
															</td>
															
															<th>자격협약</th>
															<td class="clearfix">
																<div class="checkbox-group pull-left form-inline">
																	<label class="checkbox">
																		<input type="checkbox" id="req_isLicensePartnership" name="isLicensePartnership" value="YES" >협약
																	</label>
																</div>
															</td>
															
															<th>채용방법</th>
															<td>
																<div class="checkbox-group pull-left form-inline">
																	<label class="checkbox">
																		<input type="checkbox" id="req_employment" name="employment" value="1" >상시채용
																	</label>
																</div>
															</td>
														</tr>
														
														<tr>
															<th>모집부문</th>
															<td colspan="5">
																<input class="form-control" type="text" id="req_field" name="field" >
															</td>
														</tr>
														
														
														<tr>
															<th>담당업무</th>
															<td colspan="5">
																<input class="form-control" type="text" id="req_majorBiz" name="majorBiz" >
															</td>
														</tr>
														
														<tr>
															<th>학력</th>
															<td colspan="3">
																<div class="radio-group pull-left" id="req_rquirement">
																	<label class="radiobox"><input type="radio" name="requirement" value="1000">석사</label>
																	<label class="radiobox"><input type="radio" name="requirement" value="0100">대졸</label>
																	<label class="radiobox"><input type="radio" name="requirement" value="0010">전문대졸</label>
																	<label class="radiobox"><input type="radio" name="requirement" value="0001">불문</label>
																</div>
															</td>
															<th>학과</th>
															<td>
																<input class="form-control" type="text" id="req_major" name="major">
															</td>
														</tr>
														
														<tr>
															<th>경력사항</th>            <!-- form-control 넣기 -->
															<td colspan="5" class="radiobox clearfix form-inline" >
																<div class="radio-group pull-left">
																	<label class="radiobox"><input type="radio" name="career" value="0">신입,경력</label>
																	<label class="radiobox"><input type="radio" name="career" value="1">신입</label>
																	<label class="radiobox"><input type="radio" name="career" value="2">경력</label>
																</div>
																<div>
																	<input type="text" id="req_careerYear" class="form-control w40" name="careerYear"><span>년 이상</span>
																</div>
															</td>
														</tr>
														<tr>
															<th>우대사항</th>
															<td colspan="5">
																<input class="form-control" type="text" id="req_advantage" name="advantage">
															</td>
														</tr>
														<tr>
															<th>모집인원</th>
															<td colspan="5" class="form-inline">
																총원&nbsp;<input class="form-control w40" type="text" id="req_hireCnt" name="hireCnt">명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																남자&nbsp;<input class="form-control w40" type="text" id="req_hireCnt_M" name="hireCnt_M">명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																여자&nbsp;<input class="form-control w40" type="text" id="req_hireCnt_F" name="hireCnt_F">명
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- /.sub-body -->
										</div>
										<!--/.sub-box -->
										
										
										<div class="sub-box">
											<div class="sub-title">근무조건</div>
											<div class="sub-body">
												<table class="table table-hover table-condensed">
													<colgroup>
														<col width="60px" />
														<col width="310px" />
														<col width="60px" />
														<col width="" />
													</colgroup>
													<tbody>
														<tr>
															<th>고용형태</th>
															<td colspan="3" class="clearfix form-inline">												
																<div class="radio-group pull-left" id="contractType">
																	<label class="radiobox"><input type="radio" name="contractType" value="0" >정규직</label>
																	<label class="radiobox"><input type="radio" name="contractType" value="1" >계약직</label>
																</div>
																
																<div>
																	<span>계약기간</span><input type="text" id="req_internTerm" class="form-control w40" name="internTerm""><span>개월</span>
																</div>
																
															</td>
														</tr>
														<tr>
															<th>근무지</th>
															<td colspan="3">
																<input class="form-control" type="text" id="req_workPlace" name="workPlace">
															</td>
														</tr>
														<tr>
															<th>연봉</th>
															<td>
																<select class="form-control" name="salaryCode" id="req_salaryCode">
																	<option value="">선택</option> 
																	<option value="1">1000만원 이하</option> 
																	<option value="2">1000~1200만원</option>
																	<option value="3">1200~1400만원</option>
																	<option value="4">1400~1600만원</option>
																	<option value="5">1600~1800만원</option>
																	<option value="6">1800~2000만원</option>
																	<option value="7">2000~2200만원</option>
																	<option value="8">2200~2400만원</option>
																	<option value="9">2400~2600만원</option>
																	<option value="10">2600~2800만원</option>
																	<option value="11">2800~3000만원</option>
																	<option value="12">3000~3200만원</option>
																	<option value="13">3200~3400만원</option>
																	<option value="14">3400~3600만원</option>
																	<option value="15">3600~3800만원</option>
																	<option value="16">3800~4000만원</option>
																	<option value="17">4000~5000만원</option>
																	<option value="18">5000~6000만원</option>
																	<option value="19">6000~7000만원</option>
																	<option value="20">7000~8000만원</option>
																	<option value="21">8000~9000만원</option>
																	<option value="22">9000~1억원</option>
																	<option value="23">1억원 이상</option>
																</select>
															</td>
															<th>채용직급</th>
															<td>
																<select class="form-control" name="employPosition" id="req_employPosition">
																	<option value="">선택</option> 
																	<option value="0">사원(연구원)</option> 
																	<option value="1">주임/계장(연구원)</option>
																	<option value="2">대리(주임연구원)</option>
																	<option value="3">과장(선임연구원)</option>
																	<option value="4">차장(수석연구원)</option>
																	<option value="5">부장(연구연구원)</option>
																	<option value="6">임원</option>
																	<option value="7">면접후결정</option>
																</select>
															</td>
														</tr>
														
														<tr>
															<th rowspan="4">개발환경</th>
															<td colspan="3" class="form-inline">
																<span class="trTitle">사용 OS</span>
																<input class="form-control devInput" type="text" id="req_useOS" name="useOS">
															</td>
															
															
														<tr>	
															<td colspan="3" class="form-inline">
																<span class="trTitle">사용 DB</span>
																<input class="form-control devInput" type="text" id="req_useDB" name="useDB">
															</td>
														</tr>
														<tr>
															<td colspan="3" class="form-inline">
																<span class="trTitle">사용 언어</span>
																<input class="form-control devInput" type="text" id="req_useLang" name="useLang">
															</td>
														</tr>
														<tr>
															<td colspan="3" class="form-inline">
																<span class="trTitle">기타</span>
																<input class="form-control devInput" type="text" id="req_useETC" name="useETC">
															</td>
														</tr>
														
														
													</tbody>
												</table>
											</div>
											<!-- /.sub-body -->
										</div>
										<!--/.sub-box -->
										
										
										<div class="sub-box">
											<div class="sub-title">전형방법</div>
											<div class="sub-body">
												<table class="table table-hover table-condensed">
													<colgroup>
														<col width="60px" />
														<col width="" />
													</colgroup>
													<thead>
														<tr>
															<th>전형절차</th>
															<td>
																<input class="form-control" type="text" id="req_procedures" name="procedures">
															</td>
														</tr>
														<tr>
															<th>제출서류</th>
															<td colspan="5">
																<input class="form-control" type="text" id="req_reqDocument" name="reqDocument">
															</td>
														</tr>
														<tr>
															<th>요구사항</th>
															<td colspan="5">
																<input class="form-control" type="text" id="req_reqDetail" name="reqDetail">
															</td>
														</tr>
													</thead>
												</table>
											</div>
											<!-- /.sub-body -->
										</div>
										<!--/.sub-box -->
										
										<div class="sub-box">
											<div class="sub-title">담당자정보</div>
											
											<div class="sub-body">
												<table class="table table-hover table-condensed">
													<colgroup>
														<col width="60px" />
														<col width="" />
														<col width="60px" />
														<col width="" />
														<col width="60px" />
														<col width="" />
													</colgroup>
													<thead>
														<tr>
															<th>담당자</th>
															<td>
																<input class="form-control" type="text" id="req_mgrName" name="mgrName">
															</td>
															<th>부서</th>
															<td>
																<input class="form-control" type="text" id="req_department" name="department">
															</td>
															<th>직책</th>
															<td>
																<input class="form-control" type="text" id="req_position" name="position">
															</td>
														</tr>
														<tr>
															<th>전화번호</th>
															<td>
																<input class="form-control" type="text" id="req_telephone" name="telephone">
															</td>
															<th>휴대폰</th>
															<td>
																<input class="form-control" type="text" id="req_cellphone" name="cellphone">
															</td>
															<th>팩스</th>
															<td>
																<input class="form-control" type="text" id="req_fax" name="fax">
															</td>
														</tr>
														<tr>
															<th>이메일</th>
															<td  colspan="5">
																<input class="form-control" type="text" id="req_email" name="email">
															</td>
														</tr>
													</thead>
												</table>
											</div>
											<!-- /.sub-body -->
										</div>
										<!--/.sub-box -->
										
										
									
								</div>
								<!-- /.col-xs-7 -->
								
								<!-- 지원자리스트 -->
								<div class="col-xs-4">
									<div class="sub-box">
										<div class="sub-toolbox">
											<div class="row">
												<div class="col-xs-6">
													<span class="sub-title">지원자리스트</span>
												</div>
												<div class="col-xs-6">
													<button class="btn btn-default btn-h25 pull-right" type="button" id="btn_studentModal">지원자 추가</button>
												</div>
											</div><!-- /.row -->
										</div>
											<!-- /.sub-toolbox -->
									
										<div class="sub-body">
											<div class="innerBox bordered scroll" style="height: 456px;">
												<table class="table table-hover table-condensed">
													<colgroup>
														<col width="16" />
														<col width="58" />
														<col width="43" />
														<col width="" />
														<col width="33" />
														<col width="34" />
													</colgroup>		
													<thead>
														<tr>
															<th>&nbsp;</th>
															<th>기수</th>
															<th>이름</th>
															<th>지원일자</th>
															<th>결과</th>
															<th>관리</th>
														</tr>
													</thead>
													<tbody id="interViewerList">
														<!-- jquery로 출력 -->
													</tbody>										
												</table>
											</div>
										</div>
										<!-- /.sub-body -->
									</div><!-- /.sub-box -->
									
									<div class="sub-box">
										<div class="sub-title">메모</div>
									
										<div class="sub-body">
											<table class="table table-hover table-condensed">
												<colgroup>
													<col width="" />
												</colgroup>
												<thead>
													<tr>
														<td>
															<textarea class="form-control" name="memo" id="req_memo" style="height: 212px;"></textarea>
														</td>
													</tr>
												</thead>
											</table>
										</div>
										<!-- /.sub-body -->
									</div>
									<!--/.sub-box -->	
									
									
									
								</div><!-- /.col-xs-4 -->
								
							</div><!-- /.row -->
							
							<!-- 취업의뢰 저장 -->
							<div class="sub-toolbox clearfix text-center">
								<input type="submit" value="수정" class="btn btn-primary" id="btn_updateJobRequest">
							</div>
							
							<div class="space"></div><div class="space"></div><div class="space"></div><div class="space"></div>
							
						</div><!-- body -->
					</div><!-- /.col-xs-12 -->	
				</div><!-- /.row -->
				<!-- /.하단 -->
				
			</form>	
		</section>
		
	</div><!-- /.content-wrapper -->
	
	
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
</div><!-- /.wrapper -->





<!---------------- 지원자 추가 Modal!!! ---------------->
<div class="modal fade" id="studentModal">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<!-- modal-header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>	
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">지원자 추가</h4>
			
			</div>
			<!-- /.modal-header -->
			
			
			<div class="modal-body">
				
				<!-- 검색영역 -->
				<div class="sub-box">
					<div class="sub-body">
						<form id="formStudentList" method="" action="">
							<table class="table table-condensed">
								<colgroup>
									<col width="80px" />
									<col width="150px" />
									<col width="250px" />
									<col width="" />
								</colgroup>
								<tbody>
									<tr>
										<th class="text-center">수료생검색</th>
										<td>
											<select class="form-control" name="studentCondition" id="studentCondition">
												<option value="">선택</option> 
												<option value="kisu">기수</option> 
												<option value="name">이름</option>
												<option value="curri">교육과정명</option>
												<option value="birth">생년월일</option>
											</select>
										</td>
										<td><input class="form-control" type="text" name="keyword" value="">
										<td><button type="button" class="btn btn-primary btn-h25" id="btn_modal_search">검색</button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div><!-- /.sub-body -->
					
				</div><!-- /.sub-box 검색영역 끝-->
				
				<div class="space"></div>
				<div class="space"></div>
				<div class="space"></div>
				
				<!-- 하단부분 -->
				<div class="sub-box">
					<div class="sub-body">
						<!-- 업체정보 테이블 -->
						<table id="jqGridModal" class="mouse">		
						</table>

						<!-- 페이징 -->
						<div id="jqGridPagerModal"></div>
						
					</div><!-- /.sub-body -->
					
				</div><!-- /.sub-box 하단영역 끝-->
				
				
			</div>
			<!-- /.modal-body -->
			
			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-4"></div>
					<div class="col-xs-4 text-center">
						<button type="button" class="btn btn-primary" id="btn_studentSelect">선택</button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
					</div>
				</div>
      		</div>
			
									
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!---------------- 지원자 추가 Modal!!! ---------------->






</body>


<script type="text/javascript">


/* 화면 처음 로딩될때 */
$(document).ready(function() {
	var request_no = "${param.request_no}";
	jobRequestFetcher(request_no);
	
});


/* 취업의뢰리스트 클릭시 다른 취업의뢰 정보 출력*/
$("#jobReqList").on("click","tr",  function(){
	$this = $(this);
	var request_no = $this.data("request_no");
	
	console.log(request_no);
	jobRequestFetcher(request_no);
	
	/* 선택된 테이블 표시하기 */
	trSelected($this);
	
});

/* 면접자리스트 두번클릭 */
$("#interViewerList").on("dblclick", "tr", function(){
	$this = $(this);
	var user_no = $this.data("user_no");

	console.log($this.attr("class"));
	
	if($this.attr("class") != "noData"){ //지원자클릭시 노란색으로
		/* trSelected($this); */
		//프로필 창 로드
		console.log("프로필용 유저번호" + user_no);
	}
});	



/* 지원자리스트 마우스오버 */
$("#interViewerList").on("mouseenter", "tr",  function(){
	$this = $(this);
	$this.find(".td_btn_del_area").html("<span class='label label-danger'>X</span>");
});

/* 지원자리스트 마우스아웃 */
$("#interViewerList").on("mouseleave","tr",  function(){
	$this = $(this);
	$this.find(".td_btn_del_area").empty();
});

/* 지원자리스트 삭제버튼 클릭 */
$("#interViewerList").on("click", "span", function(){
	$this = $(this);
	var interview_no = $this.parent().data("interview_no");
	
	var request_no = $("#req_request_no").val();
	
	
	//삭제실행
	var delCnt = delInterViewer(interview_no);
	console.log("*********************");
	console.log(delCnt);
	console.log("*********************");
	//삭제성공이면 리스트를 요청하여 출력한다.
	if(delCnt > 0){
		getInterViewerList(request_no);
	}
	
});

/* 면접자 삭제 */
function delInterViewer(interview_no){
	var resultValue;
	var result = confirm('삭제하시겠습니까?'); 
	if(result) { 
		$.ajax({
	    	url : "${pageContext.request.contextPath}/jobrequest/delInterViewer",
			type : "post",
			data : {"interview_no" : interview_no},
			dataType : "text",
			async : false, 
			success : function(delCnt) {
				resultValue = delCnt
			},
			error : function(request, status, error) {
	        		alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);
	        }
		});
	} 
	return resultValue;
}	

/* 면접자 리스트 출력 */
function getInterViewerList(request_no){
	$.ajax({
    	url : "${pageContext.request.contextPath}/jobrequest/getInterviewList",
		type : "post",
		data : {"request_no" : request_no},
		dataType : "json",
		success : function(interViewerList) {
       	 	console.log(interViewerList);
       	 	interViewerListRender(interViewerList);
		},
		error : function(request, status, error) {
        		alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);
        }
	});
}

/* 기업정보+취업의뢰정보 가져와서 출력 */
function jobRequestFetcher(request_no){
	
	$.ajax({
        url: "${pageContext.request.contextPath}/jobrequest/getJobRequest",
        type: "post",
        data: {"request_no": request_no},

        dataType: "json",
        success: function (jobRequestVo) {
      		console.log(jobRequestVo);
      		
      		/* 폼클리어 */
      		formClear("formJobRequest");
      		
      		/* 기업정보 */
      		$("#req_compName").val(jobRequestVo.compName); /* 회사명 */ 
      		$("#req_openDate").val(jobRequestVo.openDate); /* 설립년도 */ 
      		$("#req_compResNum").val(jobRequestVo.compResNum); /* 사업자번호 */ 
      		$("#req_business").val(jobRequestVo.business); /* 주력사업 */ 
      		$("#req_capital").val(jobRequestVo.capital); /* 자본금 */ 
      		$("#req_yearSell").val(jobRequestVo.yearSell); /* 연매출액 */ 
      		$("#req_staffCnt").val(jobRequestVo.staffCnt); /* 직원수 */
      		
      		$("#req_isStock").val(jobRequestVo.isStock).prop("selected", "selected"); /* 상장여부 */
      		
      		$("#req_postCode").val(jobRequestVo.postCode); /* 우편번호 */ 
      		$("#req_address").val(jobRequestVo.address); /* 회사주소 */ 
      		$("#req_homePage").val(jobRequestVo.homePage); /* 홈페이지 */ 
      		$("#req_introduction").val(jobRequestVo.introduction); /* 회사소개 */ 
      		$("#req_welfare").val(jobRequestVo.welfare); /* 복지제도 */ 
      		
      		
      		/* 모집부문 및 자격요건 */
      		$("#req_receiptDate").text(jobRequestVo.receiptDate); /* 신청일 */ 
      		
       		if(jobRequestVo.isShow == '1'){  /* 게시여부 1-->게시 */ 
       			$("#req_isShow").prop('checked', true) ;
      		}
        	
	        if(jobRequestVo.isLicensePartnership == 'YES'){ /* 자격증 YES-->협약  NO-->비협약  값없는경우-->비협약*/ 
				$("#req_isLicensePartnership").prop('checked', true) ;
			}
	        
	        if(jobRequestVo.employment == '1'){ /* 상시채용여부 1-->상시채용  0-->상시채용아님*/ 
				$("#req_employment").prop('checked', true) ;
			}
	        
	        /* 1000-->석사 0100-->대졸 0010-->전문대졸 0001-->불문*/ 
	        $("input:radio[name='requirement'][value="+jobRequestVo.requirement+"]").prop("checked", true) ;
	        
	        $("#req_field").val(jobRequestVo.field); /* 모집부문 */
	        $("#req_majorBiz").val(jobRequestVo.majorBiz); /* 담당업무 */
	        
      		$("#req_major").val(jobRequestVo.major); /* 학과 */
      		
      		/* 0-->신입+경력 1-->신입  2-->경력  3 null '' */
      		$("input:radio[name='career'][value="+jobRequestVo.career+"]").prop("checked", true) ;
	   		$("#req_careerYear").val(jobRequestVo.careerYear); /* 경력년수 */
	   		$("#req_advantage").val(jobRequestVo.advantage); /* 우대사항 */
      		
      		$("#req_hireCnt").val(jobRequestVo.hireCnt) /* 모집인원 전체 */ 
      		$("#req_hireCnt_M").val(jobRequestVo.hireCnt_M) /* 모집인원 남 */ 
      		$("#req_hireCnt_F").val(jobRequestVo.hireCnt_F) /* 모집인원 여 */
      		
      		/* 고용형태 0-->계약직 1-->정규직 2--> */
      		$("input:radio[name='contractType'][value="+jobRequestVo.contractType+"]").prop("checked", true) ;
      		$("#req_internTerm").val(jobRequestVo.internTerm); /* 계약기간 */
      		
      		
			/* 계약기간  InternTerm 해야함*/
      		$("#req_workPlace").val(jobRequestVo.workPlace); /* 근무지 */
      		$("#req_salaryCode").val(jobRequestVo.salaryCode).prop("selected", "selected"); /* 연봉 */
      		
      		$("#req_employPosition").val(jobRequestVo.employPosition).prop("selected", "selected"); /* 채용직급 */
      		
      		$("#req_useOS").val(jobRequestVo.useOS); /* OS */
      		$("#req_useDB").val(jobRequestVo.useDB); /* DB */
      		$("#req_useLang").val(jobRequestVo.useLang); /* 언어 */
      		$("#req_useETC").val(jobRequestVo.useETC) /* 기타 */
      		
      		$("#req_procedures").val(jobRequestVo.procedures); /* 전형절차 */
      		$("#req_reqDocument").val(jobRequestVo.reqDocument); /* 제출서류 */
      		$("#req_reqDetail").val(jobRequestVo.reqDetail); /* 요구사항 */
      		
      		$("#req_mgrName").val(jobRequestVo.mgrName); /* 담당자 */
      		$("#req_department").val(jobRequestVo.department); /* 부서 */
      		$("#req_position").val(jobRequestVo.position); /* 직책 */
      		$("#req_telephone").val(jobRequestVo.telephone); /* 전화번호 */
      		$("#req_cellphone").val(jobRequestVo.cellphone); /* 휴대폰 */
      		$("#req_fax").val(jobRequestVo.fax); /* 팩스 */
      		$("#req_email").val(jobRequestVo.email); /* 이메일 */
      		
      		$("#req_memo").val(jobRequestVo.memo); /* 메모 */
      	
      		
      		/* 히든값 변경하기 */
      		$("#req_request_no").val(request_no);
      		
      		/* 지원면접자리스트 */
      		getInterViewerList(request_no);

        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
	
}


/* 면접학생리스트 */
function interViewerListRender(interViewerList) {
	var str = "";
	
	if(interViewerList.length > 0){
		for (var i=0; i<interViewerList.length; i++) {
			var no = i+1;
			var interViewerVo = interViewerList[i];
			str +=  "<tr class='mouse' data-user_no="+ interViewerVo.user_no +">"+
						"<td class='text-center'>" + no +"</td>" +
						"<td>" + interViewerVo.gisuName + "</td>" +
						"<td>" + interViewerVo.nameHan + "</td>" +
						"<td>" + interViewerVo.applyDate + "</td>" +
						"<td class='text-center'>" + interViewerVo.result + "</td>" +
						"<td class='td_btn_del_area' data-interview_no="+interViewerVo.interview_no+"></td>"
					"</tr>"	
	    }  
	} else {
		str +=  "<tr class='noData'>"+
					"<td colspan='6' class='text-center'>지원자가 없습니다.</td>" +
				"</tr>"	
	}
	
	$("#interViewerList").empty();			
	$("#interViewerList").append(str); 	
}


/* 선택한 tr 배경색변경 */
 function trSelected($this){
	console.log("-------"); 
	console.log($this); 
	$this.siblings().removeClass("trSelected");
	$this.addClass("trSelected");
} 

/* 폼 클리어 */
function formClear(formID){
	console.log($(formID));
	
	$("#"+formID)[0].reset(); 
}


/************************************************/
/* 모달영역(지원자추가) 
/************************************************/ 
 
/* 모달호출 */ 
$("#btn_studentModal").on("click", function() {

	var request_no = $("#req_request_no").val();

	if(request_no =="" || request_no ==null ){
		alert("구인업체를 선택해 주세요");	
	}else{
		/* 폼클리어 */
  		formClear("formStudentList");
		modalGridExec();
		$("#studentModal").modal();		
	}
}); 


/* 모달창 검색 */
$("#btn_modal_search").on("click", function() {
	modalGridExec();
}); 

/* 모달창 검색 엔터키입력 */
$("input[name=keyword]").on("keydown", function (key) {
    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
    	modalGridExec();
    }
});



/* 선택버튼 클릭 */
$("#btn_studentSelect").on("click", function() {
	addInterViewerAndList();
});


/* 모달 그리드 출력하기 */
function modalGridExec() {
	
	var postData ={
			"comCondition": $('select[name=studentCondition]').val(),
			"keyword": $("input[name=keyword]").val(),
		}
		
	console.log(postData);
		
	var cnames = [ '회원번호', '지원번호', '수업번호', '기수명', '수업명', '이름', '생년월일', '성별'];
	$("#jqGridModal").jqGrid({
			url : "${pageContext.request.contextPath }/jobrequest/getStudentList",
			mtype : "post",
			postData : postData,
			datatype:"json",
			
			colNames : cnames,
			colModel : [{name: 'user_no', index: 'user_no', width: 10, hidden: true},
						{name: 'applicant_no', index: 'applicant_no', width: 10, hidden: true},
						{name: 'curriculum_no', index: 'curriculum_no', width: 10, hidden: true},
						{name: 'gisuName', index: 'gisuName', width: 100, align: "left"},
						{name: 'curriName', index: 'curriName' , width: 250, align: "left"},
						{name: 'nameHan', index: 'nameHan', width: 50, align: "center"},
						{name: 'birthDate', index: 'birthDate', width: 80, align: "left"},
						{name: 'gender', index: 'gender', width: 50, align: "left",
								formatter: function( cellvalue , options ,rowObject ){
							    	if(cellvalue == '1') return "남자";
							    	else return "여자";
								}
						}
				 	  ], 
			rowheight : 20,
			height : 443,
			width : 563,
			rowNum : 100,
			rowList : [ 100, 200, 300, 400, 500 ],
			pager : '#jqGridPagerModal',
			rownumbers : true,
			loadtext : '로딩중',
			sortname : 'nameHan',
			sortorder:"asc", 
			gridview:true,
			shrinkToFit: false,
			emptyrecords: '데이터가 없습니다.',  //데이터 없을 때
			
			/* 그리드 두번클릭했을때 선택한 학생 리스트에 적용*/
			ondblClickRow : function(rowId, iRow, iCol, e,user_no) {
				addInterViewerAndList();
			}
	});
	
	/* 그리드 파라미터값 재설정 */
	$("#jqGridModal").setGridParam({
	   	 datatype	: "json",
	   	 postData	: postData,
	   	 loadComplete	: function(data) {
	   		 console.log(data);
	   	 }
	}).trigger("reloadGrid");
}



/* 모달에서 면접자 추가후 취업의뢰상세 팝업 리스트에 적용 */
function addInterViewerAndList(){
	var rowIdM = $("#jqGridModal").getGridParam("selrow");
	var user_no = $("#jqGridModal").getRowData(rowIdM).user_no; 
	var gisuName = $("#jqGridModal").getRowData(rowIdM).gisuName;
	
	var request_no = $("#req_request_no").val();
	
	interViewerVo ={
		user_no: user_no,
		request_no: request_no,
		gisuName: gisuName
	};
	console.log("=========================");
	console.log(interViewerVo);
	if(user_no == "" || user_no == null){
		alert("수료생을 선택해 주세요");		
	}else{
		var addCnt = insertInterViewer(interViewerVo);
		
		if(addCnt > 0){
			getInterViewerList(request_no);
			$("#studentModal").modal("hide");
		}else{
			alert("등록실패");
		}	
	}
}



/* 면접자 추가하기 */
function insertInterViewer(interViewerVo){
	var resultValue;
	$.ajax({
    	url : "${pageContext.request.contextPath}/jobrequest/insertInterViewer",
		type : "post",
		data : interViewerVo,
		dataType : "text",
		async : false, 
		success : function(addCnt) {
			resultValue = addCnt;
		},
		error : function(request, status, error) {
        		alert("code:" + request.status + "\n"+ "message:"+ request.responseText + "\n"+ "error:" + error);
        }
	});
	return resultValue;
}


</script>
</html>