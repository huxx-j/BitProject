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
			width: 414px !important;
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
<body class="hold-transition popup_page" >

<div class="wrapper" id="pop_profile">
	
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
								<div class="col-xs-2">
									<div class="sub-box">
										<div class="sub-title">프로필</div>
										<div class="sub-body" id="">
											<div class="bordered" style="height: 150px; margin-bottom: 3px;">
												개인프로필사진
											</div>
											<div class="text-center">
												<button type="button" class="btn btn-default btn-h25 w100" id="">사진업로드</button>
											</div>
										</div><!-- /.sub-body -->
									</div><!-- /.sub-box -->
								</div><!-- /.col-xs-2 -->
								<div class="col-xs-10 left-nopadding">
									<div class="sub-box">
										<div class="sub-title"></div>
										<div class="sub-body" id="">
											<table class="table table-hover table-condensed">
												<colgroup>
													<col width="60px" />
													<col width="260px" />
													<col width="60px" />
													<col width="100px" />
													<col width="60px" />
													<col width="" />
												</colgroup>
												
												
												<tbody>
													<tr>
														<th>아이디</th>
														<td class="">
															<input type="text" id="" class="form-control" name="">
														</td>
														
														<th>비밀번호</th>
														<td colspan="3" class="form-inline">
															<input type="text" id="" class="form-control w200" name="">
															<button type="button" class="btn btn-default btn-h25" id="btn_companyAdd">비밀번호변경</button>
														</td>
														
													</tr>
													
													<tr>
														<th>성명</th>
														<td class="form-inline">
															<span>(한)</span><input type="text" id="" class="form-control w80" name="">&nbsp;&nbsp;&nbsp;
															<span>(영)</span><input type="text" id="" class="form-control w120" name="">
														</td>
														
														<th>생년월일</th>
														<td class="">
															<input type="text" id="" class="form-control" name="">
														</td>
														
														<th>성별</th>
														<td>
															<div class="radio-group" id="">
																<label class="radiobox"><input type="radio" name="" value="0" >남</label>
																<label class="radiobox"><input type="radio" name="" value="1" >여</label>
															</div>
														</td>
													</tr>
													
													<tr>
														<th>전화번호</th>
														<td class="">
															<input type="text" id="" class="form-control" name="">
														</td>
														
														<th>핸드폰</th>
														<td class="form-inline" colspan="3">
															<input type="text" id="" class="form-control w200" name="">
															<button type="button" class="btn btn-default btn-h25" id="btn_companyAdd">문자발송</button>
														</td>
														
													</tr>
													
													<tr>
														<th>이메일</th>
														<td class="">
															<input type="text" id="" class="form-control" name="">
														</td>
														
														<th>수신여부</th>
														<td class="" colspan="3">
															<div class="radio-group" id="">
																<label class="radiobox"><input type="radio" name="" value="0" >수신</label>
																<label class="radiobox"><input type="radio" name="" value="1" >수신거부</label>
															</div>
														</td>
														
													</tr>

													<tr>
														<th rowspan="2">주민등록주소</th>
														<td class="form-inline" colspan="5">
															<input type="text" id="" class="form-control w80" name="">
															<button type="button" class="btn btn-default btn-h25" id="btn_companyAdd">우편번호검색</button>
															
														</td>
													</tr>
													
													<tr>
														<td class="" colspan="5">
															<input type="text" id="" class="form-control" name="">
														</td>
													</tr>
													
													<tr>
														<th rowspan="2">현주소</th>
														<td class="form-inline" colspan="5">
															<input type="text" id="" class="form-control w80" name="">
															<button type="button" class="btn btn-default btn-h25" id="btn_companyAdd">우편번호검색</button>
														</td>
													</tr>
													<tr>
														<td class="" colspan="5">
															<input type="text" id="" class="form-control" name="">
														</td>
													</tr>

													<tr>
														<th >SNS</th>
														<td class="" colspan="5">
															<input type="text" id="" class="form-control" name="">
														</td>
													</tr>
												</tbody>
											</table>
										</div><!-- /.sub-body -->
									</div><!-- /.sub-box -->
								</div><!-- /.col-xs-10 -->
							</div><!-- /.row -->
							<div class="space"></div>
							<div class="row">
								<div class="col-xs-12">
									<!-- Custom Tabs -->
		                            <div class="nav-tabs-custom">
			                            <ul class="nav nav-tabs">
			                                <li class="active text-center"><a href="#tab_1" data-toggle="tab">병과/학력/자격증/수상내역</a></li>
			                                <li class="text-center"><a href="#tab_2" data-toggle="tab">어학/해외경험</a></li>
			                                <li class="text-center"><a href="#tab_3" data-toggle="tab">회사경력/주요프로젝트</a></li>
			                                <li class="text-center"><a href="#tab_4" data-toggle="tab">비트수강지원</a></li>
			                                <li class="text-center"><a href="#tab_5" data-toggle="tab">비트프로젝트</a></li>
			                            </ul>
		                                <div class="tab-content">
		                                    <div class="tab-pane" id="tab_1">
		                                    	<c:import url="tab1.jsp"/>
		                                    </div> <%--/.tab1--%>
		                                    
		                                    <div class="tab-pane" id="tab_2">
		                                    </div> <%--/.tab2--%>
		                                    
		                                    <div class="tab-pane" id="tab_3">
		                                    </div> <%--/.tab3--%>
		                                    
		                                    <div class="tab-pane active" id="tab_4">
		                                   		
		                                    </div> <%--/.tab4--%>
		                                </div><!-- /.tab-content -->
		                            </div><!-- nav-tabs-custom -->						
								</div><!-- /.col-xs-12 -->
							</div><!-- /.row -->
							
							
							
						</div><!-- body -->
					</div><!-- /.col-xs-12 -->	
				
					
				
				</div><!-- /.row -->
				<!-- /.상단 -->
				
				<!-- 하단 -->
				<div class="row">
                            
                </div> <%--/.row--%>
				
			</form>	
		</section>
		
	</div><!-- /.content-wrapper -->
	
	
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
</div><!-- /.wrapper -->


</html>