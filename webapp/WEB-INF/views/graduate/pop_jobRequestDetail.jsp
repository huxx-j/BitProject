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
										<table class="table table-hover table-condensed">
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
											<tbody>
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
							
							<!-- 취업의뢰상세 -->
							<div class="col-xs-7 right-nopadding">
								<div class="sub-box">
									<div class="sub-title">충원계획</div>
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
													<th>회사명</th>
													<td>
														<input class="form-control" type="text" id="compName">
													</td>
													<th>신청일</th>
													<td>
														<input class="form-control" type="text" id="receiptDate">		
													</td>
													<th>게시여부</th>
													<td>
														<input class="form-control" type="text" id="post">
													</td>
												</tr>
												<tr>
													<th>모집인원</th>
													<td><input class="form-control" type="text" id="recruitment"></td>
													<th>고용형태</th>
													<td colspan="3">
														<div class="radio-group pull-left" id="contractType">
															<label class="radiobox">
																<input type="radio">정규직
															</label>
															<label class="radiobox">
																<input type="radio">계약직
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<th>근무지</th>
													<td colspan="5">
														<input class="form-control" type="text" id="address">
													</td>
												</tr>
												<tr>
													<th>담당업무</th>
													<td colspan="5">
														<input class="form-control" type="text" id="business">
													</td>
												</tr>
												<tr>
													<th>개발환경</th>
													<td colspan="5">
														<input class="form-control" type="text">
														<input class="form-control" type="text">
														<input class="form-control" type="text">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>연봉</th>
													<td>
														<input class="form-control" type="text" id="yearIncome">
													</td>
													<th>채용직급</th>
													<td colspan="3">
														<input class="form-control" type="text" id="position">
													</td>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.sub-body -->
								</div>
								<!--/.sub-box -->
								
								
								<div class="sub-box">
									<div class="sub-title">자격요건</div>
									<div class="sub-body">
										<table class="table table-hover table-condensed">
											<colgroup>
												<col width="60px" />
												<col width="310px" />
												<col width="60px" />
												<col width="" />
											</colgroup>
											<thead>
												<tr>
													<th>학력</th>
													<td>
														<div class="radio-group pull-left">
															<label class="radiobox">
																<input type="radio">석사
															</label>
															<label class="radiobox">
																<input type="radio">대졸
															</label>
															<label class="radiobox">
																<input type="radio">전문대졸
															</label>
															<label class="radiobox">
																<input type="radio">불문
															</label>
														</div>
													</td>
													<th>학과</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>경력사항</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>우대사항</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>담당업무</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
											</thead>
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
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>제출서류</th>
													<td colspan="5">
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>요구사항</th>
													<td colspan="5">
														<input class="form-control" type="text">
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
														<input class="form-control" type="text">
													</td>
													<th>부서</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>직책</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>전화번호</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>휴대폰</th>
													<td>
														<input class="form-control" type="text">
													</td>
													<th>팩스</th>
													<td>
														<input class="form-control" type="text">
													</td>
												</tr>
												<tr>
													<th>이메일</th>
													<td  colspan="5">
														<input class="form-control" type="text">
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
      		
        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
	
	
});

</script>

</html>

	