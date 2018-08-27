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
			width: 404px !important;
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
<body class="hold-transition popup_page"  id="pop">

<div class="wrapper">
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		
		<!-- Main content -->
		<section class="content">
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
									</div><!-- sub-body -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-2 -->
							
							<!--  의뢰상세 -->
							<div class="col-xs-6 right-nopadding" >
								<form id="formJobRequest">
									<div class="sub-box">
										<div class="sub-toolbox">
											<div class="row">
												<div class="col-xs-8">
													<span class="sub-title">모집부문 및 자격요건</span>
												</div>
												
												<div class="col-xs-4">
													<span class="receiptDate">접수일:&nbsp;<sapn id="req_receiptDate"></sapn></span>
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
															<input class="form-control" type="text" id="req_major">
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
																<input type="text" id="req_careerYear" class="form-control w40"><span>년 이상</span>
															</div>
														</td>
													</tr>
													<tr>
														<th>우대사항</th>
														<td colspan="5">
															<input class="form-control" type="text" id="req_advantage">
														</td>
													</tr>
													<tr>
														<th>모집인원</th>
														<td colspan="5" class="form-inline">
															총원&nbsp;<input class="form-control w40" type="text" id="req_hireCnt">명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															남자&nbsp;<input class="form-control w40" type="text" id="req_hireCnt_M">명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															여자&nbsp;<input class="form-control w40" type="text" id="req_hireCnt_F">명
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
																<span>계약기간</span><input type="text" id="req_internTerm" class="form-control w40"><span>개월</span>
															</div>
															
														</td>
													</tr>
													<tr>
														<th>근무지</th>
														<td colspan="3">
															<input class="form-control" type="text" id="req_workPlace">
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
															<input class="form-control devInput" type="text" id="req_useOS">
														</td>
														
														
													<tr>	
														<td colspan="3" class="form-inline">
															<span class="trTitle">사용 DB</span>
															<input class="form-control devInput" type="text" id="req_useDB">
														</td>
													</tr>
													<tr>
														<td colspan="3" class="form-inline">
															<span class="trTitle">사용 언어</span>
															<input class="form-control devInput" type="text" id="req_useLang">
														</td>
													</tr>
													<tr>
														<td colspan="3" class="form-inline">
															<span class="trTitle">기타</span>
															<input class="form-control devInput" type="text" id="req_userETC">
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
															<input class="form-control" type="text" id="req_procedures">
														</td>
													</tr>
													<tr>
														<th>제출서류</th>
														<td colspan="5">
															<input class="form-control" type="text" id="req_reqDocument">
														</td>
													</tr>
													<tr>
														<th>요구사항</th>
														<td colspan="5">
															<input class="form-control" type="text" id="req_reqDetail">
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
															<input class="form-control" type="text" id="req_mgrName">
														</td>
														<th>부서</th>
														<td>
															<input class="form-control" type="text" id="req_department">
														</td>
														<th>직책</th>
														<td>
															<input class="form-control" type="text" id="req_position">
														</td>
													</tr>
													<tr>
														<th>전화번호</th>
														<td>
															<input class="form-control" type="text" id="req_cellPhone">
														</td>
														<th>휴대폰</th>
														<td>
															<input class="form-control" type="text" id="req_fax">
														</td>
														<th>팩스</th>
														<td>
															<input class="form-control" type="text" id="fax">
														</td>
													</tr>
													<tr>
														<th>이메일</th>
														<td  colspan="5">
															<input class="form-control" type="text" id="req_email">
														</td>
													</tr>
												</thead>
											</table>
										</div>
										<!-- /.sub-body -->
									</div>
									<!--/.sub-box -->
									
									<div class="sub-box">
										
										<div class="sub-body">
											<table class="table table-hover table-condensed">
												<colgroup>
													<col width="60px" />
													<col width="" />
												</colgroup>
												<thead>
													<tr>
														<th>메모</th>
														<td>
															<input class="form-control" type="text" id="req_memo">
														</td>
													</tr>
												</thead>
											</table>
										</div>
										<!-- /.sub-body -->
									</div>
									<!--/.sub-box -->	
								</form>	
							</div>
							<!-- /.col-xs-7 -->
							
							<!-- 지원자리스트 -->
							<div class="col-xs-4">
								<div class="sub-box">
									<div class="sub-title">지원자리스트</div>
								</div><!-- /.sub-box -->
								<div class="sub-body">
									<div class="innerBox bordered scroll" style="height: 700px;">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="30px" />
												<col width="82px" />
												<col width="44px" />
												<col width="" />
												<col width="38px" />
												<col width="40px" />
											</colgroup>			
											<thead>
												<tr>
													<th>&nbsp;</th>
													<th>기수</th>
													<th>이름</th>
													<th>지원일자</th>
													<th>결과</th>
													<th>X</th>
												</tr>
											</thead>
											<tbody id="interViewerList">
												<!-- jquery로 출력 -->
											</tbody>										
										</table>
									</div>
								</div>
								<!-- /.sub-body -->
								
							</div><!-- /.col-xs-3 -->
							
						</div><!-- /.row -->
					</div><!-- body -->
				</div><!-- /.col-xs-12 -->	
			</div><!-- /.row -->
			<!-- /.하단 -->
			
		</section>
	</div><!-- /.content-wrapper -->
	
	
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
</div><!-- /.wrapper -->

</body>


<script type="text/javascript">
/* 화면 처음 로딩될때 */
$(document).ready(function() {
	var request_no = "${param.request_no}";
	console.log(request_no);
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
      		
      		$("#req_hireCnt").val(jobRequestVo.hireCnt) /* 모집인원 전체 */ 
      		$("#req_hireCnt_M").val(jobRequestVo.hireCnt_M) /* 모집인원 남 */ 
      		$("#req_hireCnt_F").val(jobRequestVo.hireCnt_F) /* 모집인원 여 */
      		
      		/* 고용형태 0-->계약직 1-->정규직 2--> */
      		$("input:radio[name='contractType'][value="+jobRequestVo.contractType+"]").prop("checked", true) ;
      		
			/* 계약기간  InternTerm 해야함*/
      		$("#req_workPlace").val(jobRequestVo.workPlace); /* 근무지 */
      		$("#req_salaryCode").val(jobRequestVo.salaryCode).prop("selected", "selected"); /* 연봉 */
      		
      		$("#req_employPosition").val(jobRequestVo.employPosition).prop("selected", "selected"); /* 채용직급 */
      		
      		$("#req_useOS").val(jobRequestVo.useOS); /* OS */
      		$("#req_useDB").val(jobRequestVo.useDB); /* DB */
      		$("#req_useLang").val(jobRequestVo.useLang); /* 언어 */
      		$("#req_useETC").val(jobRequestVo.userETC) /* 기타 */
      		
      		$("#req_procedures").val(jobRequestVo.procedures); /* 전형절차 */
      		$("#req_reqDocument").val(jobRequestVo.reqDocument); /* 제출서류 */
      		$("#req_reqDetail").val(jobRequestVo.reqDetail); /* 요구사항 */
      		
      		$("#req_mgrName").val(jobRequestVo.mgrName); /* 담당자 */
      		$("#req_department").val(jobRequestVo.department); /* 부서 */
      		$("#req_position").val(jobRequestVo.position); /* 직책 */
      		$("#req_telephone").val(jobRequestVo.telephone); /* 전화번호 */
      		$("#req_cellPhone").val(jobRequestVo.cellPhone); /* 휴대폰 */
      		$("#req_fax").val(jobRequestVo.fax); /* 팩스 */
      		$("#req_email").val(jobRequestVo.email); /* 이메일 */
      		
      		$("#req_memo").val(jobRequestVo.memo); /* 이메일 */
      	
      		
      		/* 지원면접자리스트 */
      		interViewerListRender(jobRequestVo.interViewerList);

        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
	
}


/* 면접자리스트 두번클릭 */
$("#interViewerList").on("dblclick", "tr", function(){
	$this = $(this);
	console.log($this.attr("class"));
	if($this.attr("class") != "noData"){
		trSelected($this);
		console.log("in");
		//프로필 창 로드	
	}
});	


$("#interViewerList").on("mouseover","tr",  function(){
	console.log("AAAA");
	$this = $(this);
	$this.find(".btn_del_interViewer").text("X");
});

$("#interViewerList").on("mouseleave","tr",  function(){
	console.log("AAAA");
	$this = $(this);
	$this.find(".btn_del_interViewer").text("");
});

$("#interViewerList").on("click", ".btn_del_interViewer", function(){
	$this = $(this);
	var interview_no = $this.data("interview_no");
	console.log(interview_no);
	alert(interview_no + "삭제하시겠습니까?");
});

/* 
$("#interViewerList>tr").mouseover(function(){
	$(this).css("color", "red");
}
$("#test").mouseleave(function(){$(this).css("color", "black");}
 */

/* 면접학생리스트 */
function interViewerListRender(interViewerList) {
	var str = "";
	
	if(interViewerList.length > 0){
		for (var i=0; i<interViewerList.length; i++) {
			var no = i+1;
			var interViewerVo = interViewerList[i];
			str +=  "<tr class='mouse'>"+
						"<td>" + no +"</td>" +
						"<td>" + interViewerVo.gisuName + "</td>" +
						"<td>" + interViewerVo.nameHan + "</td>" +
						"<td>" + interViewerVo.applyDate + "</td>" +
						"<td>" + interViewerVo.result + "</td>" +
						"<td class='btn_del_interViewer' data-interview_no="+interViewerVo.interview_no+">" +  "</td>"
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


function formClear(formID){
	console.log($(formID));
	
	$("#"+formID)[0].reset(); 

}

</script>


</html>

	