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
			width: 137px !important;
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
									<div class="sub-body">
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
														<input class="form-control" type="text" value="${companyVo.compName}">
													</td>
													<th>설립년도</th>
													<td>
														<input class="form-control" type="text" value="${companyVo.openDate}">
													</td>
													<th>사업자번호</th>
													<td>
														<input class="form-control" type="text" value="${companyVo.compResNum}">
													</td>
												</tr>
												<tr>
													<th>주력사업</th>
													<td colspan="7">
														<input class="form-control" type="text" value="${companyVo.business}">
													</td>
												</tr>
												<tr>
													<th>자본금</th>
													<td>
														<input class="form-control" type="text" value="${companyVo.capital}">
													</td>
													<th>연매출액</th>
													<td>
														<input class="form-control" type="text" value="${companyVo.yearSell}">
													</td>
													<th>직원수</th>
													<td>
														<input class="form-control" type="text" value="${companyVo.staffCnt}">
													</td>
													<th>상장여부</th>
													<td>
														<select class="form-control" name="stockMarket">
														
															<option value="1"<c:if test="${companyVo.stockMarket eq 1}">selected</c:if>>상장</option> 
															<option value="0"<c:if test="${companyVo.stockMarket eq 0}">selected</c:if>>비상장</option>
															
														</select>
													</td>
												</tr>
												<tr>
													<th>회사주소</th>
													<td>
														<input class="form-control w100 pull-left" type="text" value="${companyVo.postCode}">	<!-- 우편번호 -->
														<button class="btn btn-default btn-h25 pull-left" type="button">찾기</button>
													</td>
													<td colspan="6">
														<input class="form-control" type="text" value="${companyVo.address}"> 
													</td>
												</tr>
												<tr>
													<th>홈페이지</th>
													<td colspan="7">
														<input class="form-control" type="text" value="${companyVo.homePage}">
													</td>
												</tr>
												<tr>
													<th>회사소개</th>
													<td colspan="3">
														<textarea class="form-control">${companyVo.introduction}</textarea>
													</td>
													<th>복지제도</th>
													<td colspan="3">
														<textarea class="form-control">${companyVo.welfare}</textarea>
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
													<th>코드</th>
													<th>접수일</th>
												</tr>
											</thead>
											<tbody id="employmentContent">
												<c:forEach items="${jobRequestList}" var="jobRequestVo">
												<tr class="mouse requestInfo" data-request_no="${jobRequestVo.request_no}">
													<td>${jobRequestVo.company_no}/${jobRequestVo.request_no}</td>
													<td>${jobRequestVo.receiptDate}</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div><!-- sub-body -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-2 -->
							
							<!--  의뢰상세 -->
							<div class="col-xs-7 right-nopadding">
								<div class="sub-box">
									<div class="sub-toolbox">
										<div class="row">
											<div class="col-xs-9">
												<span class="sub-title">모집부문 및 자격요건</span>
											</div>
											
											<div class="col-xs-3">
												<span class="receiptDate">접수일:&nbsp;2018-05-05</span>
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
																<input type="checkbox" name="post" value="1">게시중
															</label>
														</div>
													</td>
													
													<th>자격증</th>
													<td>
														<input class="form-control" type="text" id="field">
													</td>
													
													<th>접수일</th>
													<td>
														<input class="form-control" type="text" id="field">
													</td>
												</tr>
												
												<tr>
													<th>모집부문</th>
													<td colspan="5">
														<input class="form-control" type="text" id="field">
													</td>
												</tr>
												
												
												<tr>
													<th>담당업무</th>
													<td colspan="5">
														<input class="form-control" type="text" id="field">
													</td>
												</tr>
												
												<tr>
													<th>학력</th>
													<td colspan="3">
														<div class="radio-group pull-left" >
															<label class="radiobox">
																<input type="radio" name="comCondition">석사
															</label>
															<label class="radiobox">
																<input type="radio" name="comCondition">대졸
															</label>
															<label class="radiobox">
																<input type="radio" name="comCondition">전문대졸
															</label>
															<label class="radiobox">
																<input type="radio" name="comCondition">불문
															</label>
														</div>
													</td>
													<th>학과</th>
													<td>
														<input class="form-control" type="text" id="major">
													</td>
												</tr>
												
												<tr>
													<th>경력사항</th>            <!-- form-control 넣기 -->
													<td colspan="5" class="radiobox clearfix form-inline" >
														<div class="radio-group pull-left">
															<label class="radiobox"><input type="radio" name="career" checked="checked">신입,경력</label>
															<label class="radiobox"><input type="radio" name="career">신입</label>
															<label class="radiobox"><input type="radio" name="career">경력</label>
														</div>
														<div>
															<input type="text" id="career" class="form-control w40"><span>년 이상</span>
														</div>
													</td>
												</tr>
												<tr>
													<th>우대사항</th>
													<td colspan="5">
														<input class="form-control" type="text" id="advantage">
													</td>
												</tr>
												<tr>
													<th>모집인원</th>
													<td colspan="5" class="form-inline">
														총원&nbsp;<input class="form-control w40" type="text" id="hireCnt">명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														남자&nbsp;<input class="form-control w40" type="text" id="hireCnt">명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														여자&nbsp;<input class="form-control w40" type="text" id="hireCnt">명
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
													<td colspan="3" class="clearfix">												
														<div class="radio-group pull-left" id="contractType">
															<label class="radiobox"><input type="radio" name="contractType" value="" checked="checked">정규직</label>
															<label class="radiobox"><input type="radio" name="contractType" value="" >계약직</label>
														</div>
													</td>
												</tr>
												<tr>
													<th>근무지</th>
													<td colspan="3">
														<input class="form-control" type="text" id="workPlace">
													</td>
												</tr>
												<tr>
													<th>연봉</th>
													<td>
														<select class="form-control" name="stockMarket" id="yearIncome">
															<option value="0">1000만원 이하</option> 
															<option value="1">1000~1200만원</option>
															<option value="2">1200~1400만원</option>
															<option value="3">1400~1600만원</option>
															<option value="4">1600~1800만원</option>
															<option value="5">1800~2000만원</option>
															<option value="6">2000~2200만원</option>
															<option value="7">2200~2400만원</option>
															<option value="8">2400~2600만원</option>
															<option value="9">2600~2800만원</option>
															<option value="10">2800~3000만원</option>
															<option value="11">3000~3200만원</option>
															<option value="12">3200~3400만원</option>
															<option value="13">3400~3600만원</option>
															<option value="14">3600~3800만원</option>
															<option value="15">3800~4000만원</option>
															<option value="16">4000~5000만원</option>
															<option value="17">5000~6000만원</option>
															<option value="18">6000~7000만원</option>
															<option value="19">7000~8000만원</option>
															<option value="20">8000~9000만원</option>
															<option value="21">9000~1억원</option>
															<option value="22">1억원 이상</option>
														</select>
													</td>
													<th>채용직급</th>
													<td>
														<select class="form-control" name="stockMarket" id="employPosition">
															<option value="사원">사원(연구원)</option> 
															<option value="주임">주임/계장(연구원)</option>
															<option value="대리">대리(주임연구원)</option>
															<option value="과장">과장(선임연구원)</option>
															<option value="차장">차장(수석연구원)</option>
															<option value="부장">부장(연구연구원)</option>
															<option value="임원">임원</option>
															<option value="면접후결정">면접후결정</option>
														</select>
													</td>
												</tr>
												
												<tr>
													<th rowspan="4">개발환경</th>
													<td colspan="3" class="form-inline">
														<span class="trTitle">사용 OS</span>
														<input class="form-control devInput" type="text" id="useOS">
													</td>
												<tr>	
													<td colspan="3" class="form-inline">
														<span class="trTitle">사용 DB</span>
														<input class="form-control devInput" type="text" id="useDB">
													</td>
												</tr>
												<tr>
													<td colspan="3" class="form-inline">
														<span class="trTitle">사용 언어</span>
														<input class="form-control devInput" type="text" id="useLang">
													</td>
												</tr>
												<tr>
													<td colspan="3 class="form-inline">
														<span class="trTitle">기타</span>
														<input class="form-control devInput" type="text" id="userETC">
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
														<input class="form-control" type="text" id="procedures">
													</td>
												</tr>
												<tr>
													<th>제출서류</th>
													<td colspan="5">
														<input class="form-control" type="text" id="reqDocument">
													</td>
												</tr>
												<tr>
													<th>요구사항</th>
													<td colspan="5">
														<input class="form-control" type="text" id="reqDetail">
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
														<input class="form-control" type="text" id="mrgName">
													</td>
													<th>부서</th>
													<td>
														<input class="form-control" type="text" id="department">
													</td>
													<th>직책</th>
													<td>
														<input class="form-control" type="text" id="position">
													</td>
												</tr>
												<tr>
													<th>전화번호</th>
													<td>
														<input class="form-control" type="text" id="telephone">
													</td>
													<th>휴대폰</th>
													<td>
														<input class="form-control" type="text" id="cellPhone">
													</td>
													<th>팩스</th>
													<td>
														<input class="form-control" type="text" id="fax">
													</td>
												</tr>
												<tr>
													<th>이메일</th>
													<td  colspan="5">
														<input class="form-control" type="text" id="email">
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
							<div class="col-xs-3">
								<div class="sub-box">
									<div class="sub-title">지원자리스트</div>
								</div><!-- /.sub-box -->
								<div class="sub-body">
									<div class="innerBox bordered scroll" style="height: 700px;">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="20px" />
												<col width="82px" />
												<col width="44px" />
												<col width="" />
												<col width="38px" />
												<col width="20px" />
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
											<tbody id="applicantList">
												<tr>
													<td>&nbsp;</td>
													<td>기수</td>
													<td>이름</td>
													<td>지원일자</td>
													<td>결과</td>
													<td>X</td>
												</tr>
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

$(".requestInfo").on("click", function(){
	var request_no = $(this).data("request_no");
	console.log(request_no);
	
	$.ajax({
        url: "${pageContext.request.contextPath}/jobrequest/jobRequest",
        type: "post",
        data: {"request_no": request_no},

        dataType: "json",
        success: function (jobVo) {
      		console.log(jobVo);
      		
      		$("#field").val(jobVo.field); /* 모집부문 */
      		$("#receiptDate").val(jobVo.receiptDate) /* 신청일 */ 
      		$("#post").val(jobVo.post) /* 게시여부 */ 
      		$("#hireCnt").val(jobVo.hireCnt) /* 모집인원 */ 
      		$("#contractType").val(jobVo.contractType) /* 고용형태 */ 
      		$("#workPlace").val(jobVo.WorkPlace) /* 근무지  */
      		$("#majorBiz").val(jobVo.majorBiz) /* 담당업무 */ 
      		$("#career").val(jobVo.career) /* 경력여부 */ 
      		$("#UseOS").val(jobVo.useOS) /* OS */
      		$("#UseDB").val(jobVo.useDB) /* DB */
      		$("#UseLang").val(jobVo.useLang) /* 언어 */
      		$("#userETC").val(jobVo.userETC) /* 기타 */
      		$("#yearIncome").val(jobVo.yearIncome) /* 연봉 */
      		$("#employPosition").val(jobVo.employPosition) /* 채용직급 */
      		$("#major").val(jobVo.major) /* 학과 */
      		$("#advantage").val(jobVo.advantage) /* 우대사항 */
      		$("#procedures").val(jobVo.procedures) /* 전형절차 */
      		$("#reqDocument").val(jobVo.reqDocument) /* 제출서류 */
      		$("#reqDetail").val(jobVo.reqDetail) /* 요구사항 */
      		$("#mrgName").val(jobVo.mgrName) /* 담당자 */
      		$("#department").val(jobVo.department) /* 부서 */
      		$("#position").val(jobVo.position) /* 직책 */
      		$("#telephone").val(jobVo.telephone) /* 전화번호 */
      		$("#cellPhone").val(jobVo.cellPhone) /* 휴대폰 */
      		$("#fax").val(jobVo.fax) /* FAX */
      		$("#email").val(jobVo.email) /* 이메일 */
      		
      		
      		
      		
      		
      		
        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
});

/* 한번클릭했을때 */

$("#popemploymentList").on("click","tr",function(){
		
	console.log("들어와라");
})



</script>

</html>

	