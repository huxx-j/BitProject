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
	
	<!-- 자신의 css사용시 --> 
	
	<!-- 그리드 사용시 주석풀어 사용 -->
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>지원자관리
				<small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">과정설계업무</a></li>
				<li class="active">패키지관리</li>
			</ol>
		</section>
		<!-- /.Content Header (Page header) -->
		
		<!-- Main content -->
		<section class="content">
			<!-- 상단 -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						
						<!-- 검색영역 -->
						<div class="row">
							<div class="col-xs-12">
							
								<div class="sub-box">
								
									<!-- sub_title -->
									<div class="sub-title">업체검색</div>
									
									
									<div class="sub-body">
										<table class="table table-condensed">
											<colgroup>
												<col width="120px" />
												<col width="" />
											</colgroup>		
											
											<tbody>
												<tr>
													<th>검색조건</th>
													<td>
														<div class="radio-group">
															<label class="radiobox"><input class="" type="radio" name="Availability" value="0">전체보기</label>
															<label class="radiobox"><input class="" type="radio" name="Availability" value="0">게시중만 보기</label>
															<label class="radiobox"><input class="" type="radio" name="Availability" value="0">상시채용만 보기</label>
															<label class="radiobox"><input class="" type="radio" name="Availability" value="0">신청일로 조회</label>
														</div>
														
														<%-- <!-- <달력> -->
														<div class="input-group form-inline date" style="float: left; padding-left: 20px">
															<input type="text" style="width: 125px; margin-left: 20px;" class="form-control input-sm datepicker" id="datepicker1" name="date1">
																<label for="datepicker1" style="background-image:${pageContext.request.contextPath}/assets/1.jpg">
																 	<i class="fa fa-calendar" style="position: absolute; left: 145px; top: 7px; z-index: 2"></i>
																</label>
															<input type="text" style="width: 125px; margin-left: 20px;" class="form-control input-sm datepicker" id="datepicker2" name="date2">	 
														     	<label for="datepicker2" style="background-image:${pageContext.request.contextPath}/assets/2.jpg">
														        	<i class="fa fa-calendar" style="position: absolute; left: 290px; top: 7px; z-index: 2"></i>
														        </label>
														</div> --%>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<!-- 업체검색 조회 -->
									<div class="sub-toolbox clearfix text-center">
										<input type="submit" value="검색" class="btn btn-primary" id="btn_search">
									</div>
									
								</div>
								<!-- sub-box -->
							</div>
							<!-- /.col-xs-12 -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col-xs-12 -->
			</div>
			<!-- /.row 상단-->	
			
			<!-- 하단 -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						<div class="row">
							<div class="col-xs-9">
								<div class="sub-box">
									
									<!-- sub_title -->
									<div class="sub-title">구인업체</div>
									
									<!-- sub_body -->
									<div class="sub-body bordered scroll" style="height: 400px;">
									
									
										<!-- 업체정보 테이블 -->
										<div name="jqgrid" class="box-body">
										</div>
										
									</div>
									<!-- ./sub_body -->
									
								</div>
								<!-- /.sub-box -->
								
							</div><!-- ./col-xs-9 -->
							
							
							<div class="col-xs-3">
								<div class="row">	
									<div class="col-xs-12">
										<div class="sub-box">
											<div class="sub-toolbox clearfix">
												<span class="sub-title">지원자리스트</span>
												<button class="btn btn-default btn-sm pull-right" type="button" id="insertData">지원자 추가</button>
											</div>
											<!-- sub_title -->
											
										
											<!-- sub_body -->
											<div class="sub-body">
											
												<div class="bordered scroll innerBox" style="height: 180px;">
													<table class="table table-hover table-condensed">								
														<colgroup>
															<col width="" />
															<col width="" />
														</colgroup>
																	
														<thead>
															<tr>
																<th>&nbsp;</th>
																<th>기수</th>
																<th>이름</th>
																<th>&nbsp;</th>
															</tr>
														</thead>
																						
														<!-- 내맘대로 입력값 -->
														<tbody>
															<tr>
																<td>1</td>
				                                                <td>BS_SHOT9</td>
				                                                <td>하재원</td>
				                                                <td>
				                                                	<button type="submit" class="btn btn-link deleteBtn">X</button>
				                                                </td>
				                                         	</tr>
				                                         	
				                                         	<tr>
				                                         		<td>1</td>
				                                                <td>BS_SHOT9</td>
				                                                <td>하재원</td>
				                                                <td>
				                                                	<button type="submit" class="btn btn-link deleteBtn">X</button>
				                                                </td>
				                                         	</tr>
														</tbody>
													</table>	
												</div> <!--./innerBox -->
									
																				
																		
									
									
											</div>
											<!-- ./sub_body -->
											
										</div>
										<!-- /.sub-box -->
									</div><!-- ./col-xs-12 -->
								</div>
								<div class="space"></div>
								<div class="row">	
									<div class="col-xs-12">
										<div class="sub-box">
											<div class="sub-toolbox clearfix">
												<span class="sub-title">메모</span>
												<button class="btn btn-default btn-sm pull-right" type="button">메모저장</button>
											</div>
												
											<!-- sub_body -->
											<div class="sub-body bordered">
												<textarea class="form-control" rows="10"></textarea>
											</div>
											<!-- ./sub_body -->
											
										</div>
										<!-- ./sub_body -->
									</div><!-- ./col-xs-12 -->
								</div>
								<!-- /.row-->
							</div><!-- ./col-xs-3 -->
						
						</div>
						<!-- /.row-->	
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col-xs-12 -->	
			</div>
			<!-- /.row -->
		</section>
		<!-- /.Main content -->
	</div>
	<!-- /.content-wrapper -->
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
	<div class="control-sidebar-bg"></div>
	
	<!-- Modal!!! -->
	<div class="modal fade" id="insertDataModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>	
					</button>
					<div class="sub-title">수료생</div>
				</div>
				<!-- sub_title -->
				
				<div class="sub-body">
					<table class="table table-condensed">
						<colgroup>
							<col width="100px" />
							<col width="" />
							<col width="150px" />
						</colgroup>
						
						<thead>
							<tr>
								<th>기수</th>
								<td><input type="text" name="gisu" value="">
								<th>이름</th>
								<td><input type="text" name="name" value="">
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.sub-body -->
				
				<!-- 추가 눌렀을때 조회 -->
				<div class="sub-toolbox text-center">
					<button type="submit" class="btn btn-primary" id="inquiry2">조회</button>
				</div>
				
				<!-- sub_title -->
				<div class="sub-body bordered scroll" style="height: 400px;">
					<table class="table table-hover table-condensed">
						<colgroup>
							<col width="5" />
							<col width="10" />
							<col width="10" />
							<col width="10" />
							<col width="10" />
							<col width="10" />
						</colgroup>
						
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th>선택</th>
								<th>과정</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>성별</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>1</td>
								<td><input type="checkbox"></td>
								<td class="gisu"></td>
								<td class="name"></td>
								<td>911121</td>
								<td>남</td>
							</tr>
						</tbody>
					</table>
					
					<!-- /.row -->
					<div class="space"></div>
					<div class="row">
						<!-- /.sub-body -->
						<div class="sub-toolbox text-center">
							<button type="button" class="btn btn-primary">선택</button>
							<button type="button" class="btn btn-primary">취소</button>
						</div>
					</div>
					<!-- /.sub-box -->
				</div>
			</div>
			<!-- sub-box -->
		</div>
		<!-- /.col-xs-12 -->
	</div>
</div>
</body>

<script type="text/javascript">


   $("#btn_search").on("click", function(){
	   console.log("검색클릭");
	   
   });
   
   


</script>
</html>