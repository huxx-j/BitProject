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
				
					<!-- 상단 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="box box-body">	
							
								<div class="row">
									<!-- 위에테이블-->
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-12">
											<!-- afdafd<br>fdsafd -->
											</div><!-- /.col-xs-12 -->
										</div><!-- /.row -->
										<div class="row">
											<div class="col-xs-3 right-nopadding">
												<div class="sub-box">
													<div class="sub-title">프로필</div>
													<div class="sub-body" id="">
														<div class="bordered" style="height: 140px; width: 96%; margin-bottom: 3px;">
															개인프로필사진
														</div>
														<div class="text-center">
															<button type="button" class="btn btn-default btn-h25 w100" id="">사진업로드</button>
														</div>
													</div>
												</div>	
												
											</div><!-- /.col-xs-3 -->
											<div class="col-xs-9 left-nopadding">
												<div class="sub-box">
													<div class="sub-title"></div>
													<div class="sub-body" id="">
														<table class="table table-hover table-condensed">
															<colgroup>
																<col width="55px" />
																<col width="" />
																<col width="55px" />
																<col width="" />
															</colgroup>
															<tbody>
																<tr>
																	<th>아이디</th>
																	<td class="">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																	<th>비밀번호</th>
																	<td class="form-inline">
																		<input type="text" id="" class="form-control w90" name="">
																		<button type="button" class="btn btn-default btn-h25" id="">변경</button>
																	</td>
																</tr>
																<tr>
																	<th>성명(한)</th>
																	<td class="">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																	<th>성명(영)</th>
																	<td class="">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																</tr>
																<tr>
																	<th>생년월일</th>
																	<td class="">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																	<th>성별</th>
																	<td class="">
																		<div class="radio-group" id="">
																			<label class="radiobox"><input type="radio" name="" value="0" >남</label>
																			<label class="radiobox"><input type="radio" name="" value="1" >여</label>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th>전화번호</th>
																	<td class="">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																	<th>핸드폰</th>
																	<td class="form-inline">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																</tr>
																<tr>
																	<th>이메일</th>
																	<td class="form-inline" colspan="3">
																		<input class="form-control w220" type="text" name="" id="" value="">
																		<div class="checkbox-group pull-right">
																			<label class="checkbox">
																				<input type="checkbox" id="req_isShow" name="isShow" value="1" >이메일수신동의
																			</label>
																		</div>
																	</td>
																</tr>
																
																<tr>
																	<th rowspan="2">본적주소</th>
																	<td class="form-inline" colspan="3">
																		<input type="text" id="" class="form-control w80" name="">
																		<button type="button" class="btn btn-default btn-h25" id="btn_companyAdd">우편번호검색</button>
																	</td>
																</tr>
																<tr>
																	<td class="" colspan="3">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																</tr>
																
																<tr>
																	<th rowspan="2">현주소</th>
																	<td class="form-inline" colspan="3">
																		<input type="text" id="" class="form-control w80" name="">
																		<button type="button" class="btn btn-default btn-h25" id="btn_companyAdd">우편번호검색</button>
																	</td>
																</tr>
																<tr>
																	<td class="" colspan="3">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																</tr>
																
																<tr>
																	<th rowspan="2">SNS</th>
																	<td class="" colspan="3">
																		<input class="form-control" type="text" name="" id="" value="">
																	</td>
																</tr>
															</tbody>
														</table>
														<div class="space"></div>
													</div><!-- /.sub-body -->
												</div>	
											</div><!-- /.col-xs-9 -->
										</div><!-- /.row -->
										
										<div class="sub-box">
											<div class="sub-title">과거지원내역</div>
											<!-- sub_title -->
											
											<div class="sub-body bordered scroll" style="height: 110px;">
												<div class="innerBox">
													<table class="table table-hover table-condensed">
														<colgroup>
															<col width="22%">
															<col width="78%">
														</colgroup>
									
														<thead>
														<tr>
															<th>전형일자</th>
															<th>과정명</th>
														</tr>
														</thead>
									
														<tbody id="applicantList">
															<c:forEach begin="0" end="2" step="1">
																<tr class="past mouse" id="56" >
																	<td>2017-09-04-08:50</td>
																	<td>JAVA 기반 웹표준 웹프로그래밍 고급인력 양성과정</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
													
												</div><!-- ./innerBox -->
											</div>
											<!-- /.sub-body -->
									
										</div>
										<!-- /.sub-box -->
										
										
										<div class="sub-box">
											<div class="sub-title">상담내역</div>
											<div class="sub-body" id="">
												<table class="table table-hover table-condensed">
													<colgroup>
														<col width="" />
													</colgroup>
													<tbody>
														<tr>
															<td>
																<textarea class="form-control" name="" id="" style="height: 151px;" ></textarea>
															</td>
														</tr>
													</tbody>
												</table>
											</div><!-- /.sub-body -->	
										</div><!-- /.sub-box -->
									
									
									</div><!-- /.col-xs-6 -->
									
									<div class="col-xs-6 left-nopadding">
										<!-- Custom Tabs -->
			                            <div class="nav-tabs-custom">
				                            <ul class="nav nav-tabs">
				                                <li class="active text-center"><a href="#tab_1" data-toggle="tab">병과/학력/자격증/<br>수상내역</a></li>
				                                <li class="text-center"><a href="#tab_2" data-toggle="tab">어학성적/<br>해외연수</a></li>
				                                <li class="text-center"><a href="#tab_3" data-toggle="tab">업무경력/<br>주요프로젝트</a></li>
				                                <li class="text-center"><a href="#tab_4" data-toggle="tab">비트<br>수강지원</a></li>
				                            </ul>
			                                <div class="tab-content">
			                                    <div class="tab-pane active" id="tab_1">
			                                    	<c:import url="tab1.jsp"/>
			                                    </div> <!--/.tab1-->
			                                    
			                                    <div class="tab-pane" id="tab_2">
			                                    	<c:import url="tab2.jsp"/>
			                                    </div> <!--/.tab2-->
			                                    
			                                    <div class="tab-pane" id="tab_3">
			                                    	<c:import url="tab3.jsp"/>
			                                    </div> <!--/.tab3-->
			                                    
			                                    <div class="tab-pane" id="tab_4">
			                                    	<c:import url="tab4.jsp"/>
			                                    </div> <!--/.tab4-->
			                                    
			                                </div><!-- /.tab-content -->
			                            </div><!-- nav-tabs-custom -->									
									</div><!-- /.col-xs-10 -->
								</div><!-- /.row -->
								<div class="space"></div>
								<div class="row">
									<div class="col-xs-12">
										<div class="sub-box">
											<div class="text-center">
												<button type="button" class="btn btn-primary" id="">수정</button>
											</div>
										</div>
									</div><!-- /.col-xs-12 -->	
								</div>
								
							</div><!-- body -->
						</div><!-- /.col-xs-12 -->	
						
					
					</div><!-- /.row -->
					<!-- /.상단 -->
					
				
			</section>
			
		</div><!-- /.content-wrapper -->
		
		
		<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
	</div><!-- /.wrapper -->
	
</body>

<script type="text/javascript">
	$("#applicantList tr").on("dblclick", function(){
		console.log("탭을 여시요");
		$('#tab_4').tab('show');
		$('a[href="#tab_4"]').tab('show')
	});
</script>

</html>