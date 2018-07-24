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
<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>
<%--<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>--%>
<%--jqgrid 사용하는 페이지용 스크립트 임포트 태그(마지막에 스크립트 임포트 태그는 삭제할것--%>

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

<!-- Content Wrapper. Contains page content -->

<!-- Content Wrapper. Contains page content -->
<div class = "content-wrapper">

	<!-- Content Header (Page header) -->
	<section class = "content-header">
		<h1>교육과정관리
			<small>it all starts here</small>
		</h1>
		<ol class = "breadcrumb">
			<li><a href = "#"><i class = "fa fa-dashboard"></i> Home</a></li>
			<li><a href = "#">전형관리 업무</a></li>
			<li><a href = "#">교육과정관리</a></li>
		</ol>
	</section>


	<!-- Main content -->
	<section class = "content">
	
		<div class = "row">
		
		
			<div class = "col-xs-12">
				<div class = "box box-body">
				
					<div class = "row">
						<!-- 카테고리영역 -->
						<div class = "col-xs-3">
							<!-- nav_bar영역 -->
							<c:import url="/WEB-INF/views/screening/includes/nav_bar.jsp"></c:import>
							<!-- nav_bar -->
						</div><!-- /.col-xs-3 -->
						<!-- /.카테고리영역 -->
						
						<!-- 교육과정 정보영역 -->
						<div class = "col-xs-9">
						
							<!--탭 박스 외곽 -->
							<div class = "nav-tabs-custom">
								<!-- 상단탭영역 -->
								<ul class = "nav nav-tabs">
									<li class = "active"><a href = "#tab_1" data-toggle = "tab">교육과정 추가</a></li>
									<!-- <li class = ""><a href = "#tab_2" data-toggle = "tab">홈페이지관리</a></li>
									<li class = ""><a href = "#tab_3" data-toggle = "tab">교육생관리</a></li>
									<li class = ""><a href = "#tab_4" data-toggle = "tab">강사배정</a></li>
									<li class = ""><a href = "#tab_5" data-toggle = "tab">강의실배정</a></li> -->
								</ul>
								<!-- /.상단탭영역 -->
			            		<!-- /.탭내용박스 -->
			            		<div class = "tab-content">
			            				<!-- 1번탭내용 -->
				            			<div class = "tab-pane active" id = "tab_1">
					            			<form action = "${pageContext.request.contextPath}/curri/addCurri" method = "post">
				            			
					            				<div class = "row">
					            					<!-- 1번탭내용 -->
						            				<table class = "table table-condensed">
						            				<%-- 
						            					<colgroup>
						            						<col width = "154px"/>
						            						<col width = "231px"/>
						            						<col width = "154px"/>
						            						<col width = "386px"/>
						            					</colgroup>
						            					 --%>
						            					<colgroup>
						            						<col class = "col-xs-2"/>
						            						<col class = "col-xs-3"/>
						            						<col class = "col-xs-2"/>
						            						<col class = "col-xs-5"/>
						            					</colgroup>
						            					<tbody>
						            						<tr>
						            							<th>업무구분</th>
						            							<td>
						            								<select class = "form-control input-sm" name = "workType">
						            									<option value = "국가기간">국가기간</option>
						            									<option value = "핵심역량">핵심역량</option>
						            								</select>
						            							</td>
						            							<th>선택패키지</th>
						            							<td><input type = "text" readonly name = "package_no" style = "border: none;" value = "1">
						            								<button type = "button" class = "btn btn-default btn-cate pull-right" >패키지 보기</button>
						            							</td>
						            						</tr>
						            					</tbody>
						            				</table>
						            			</div><!-- 1번 탭 /.row -->
						            			
						            			<div class = "row">
		<!-- 				            				<div class = "col-xs-12"> -->
						            					<div class = "sub-box">
							            						<div class = "sub-title" style = "padding : 10px 0 0 0;">
							            							기본정보
							            						</div><!-- /.sub-title -->
							            						<table class = "table table-condensed">
								            							<tr>
								            								<th>교육과정명</th>
								            								<td colspan = "3"><input class = "form-control input-sm" type = "text" style = "width : 98%;" name = "curriName"></td>
								            								<th>과목별명</th>
								            								<td><input type = "text" class = "form-control input-sm" style = "width : 98%;" name = "curriNickname"></td>
								            							</tr>
								            							<tr>
								            								<th>시작일</th>
								            								<td>
								            									<div class="input-group date">
																					<input type="date" class="form-control input-sm pull-right" id="datepicker" name = "periodFr">									                  	
													                				<div class="input-group-addon input-sm">
													                    				<i class="fa fa-calendar"></i>
													                  				</div>
													               				</div>
								            								</td>
								            								<th>종료일</th>
								            								<td>
								            									<div class="input-group date">
																					<input type="date" class="form-control input-sm pull-right" id="datepicker" name = "periodTo">									                  	
													                				<div class="input-group-addon input-sm">
													                    				<i class="fa fa-calendar"></i>
													                  				</div>
													               				</div>
								            								</td>
								            								<th>전형일(개강일)</th>
								            								<td>
								            									<div class="input-group date">
																					<input type="date" class="form-control input-sm pull-right" id="datepicker" name = "startDay">									                  	
													                				<div class="input-group-addon input-sm">
													                    				<i class="fa fa-calendar"></i>
													                  				</div>
													               				</div>
								            								</td>
								            							</tr>
								            							<tr>
								            								<th>강의시간</th>
								            								<td colspan = "3"><input type = "text" class = "form-control input-sm " style = "width : 98%;" name = "time"></td>
								            								<th>정원</th>
								            								<td><input type = "text" class = " input-xs " name = "num">명</td>
								            							</tr>
								            							<tr>
								            								<th>교육비용</th>
								            								<td><input type = "text" class = "form-control input-sm" name = "money"></td>
								            								<th>교육비지원</th>
								            								<td><input type = "text" class = "form-control input-sm" name = "support"></td>
								            								<th>문의</th>
								            								<td><input type = "text" class = "form-control input-sm" name = "inquiry"></td>
								            							</tr>
								            							<tr>
								            								<th>상태</th>
								            								<td colspan = "3">
								            									<label class = "form-controll-static"><input class = "" type = "radio" name = "state" value = "준비중">준비중</label>
								            									<label class = "form-controll-static"><input class = "" type = "radio" name = "state" value = "모집중">모집중</label>
								            									<label class = "form-controll-static"><input class = "" type = "radio" name = "state" value = "모집마감">모집마감</label>
								            									<label class = "form-controll-static"><input class = "" type = "radio" name = "state" value = "수업중">수업중</label>
								            									<label class = "form-controll-static"><input class = "" type = "radio" name = "state" value = "종료">종료</label>
								            								</td>
								            								<th>기수</th>
								            								<td><input type = "text" class = "form-control input-sm" name = "gisuName"></td>
								            							</tr>
							            						</table>
							            						<div class = "sub-toolbox text-center">
							            							<input type = "submit" class = "btn btn-primary" value = "저장">
		<!-- 					            							<button type = "button" class = "btn btn-primary">저장</button> -->
							            							<button type = "button" class = "btn btn-primary pull-right">취소</button>
							            						</div>
						            					</div><!-- /.sub-box -->
		<!-- 				            				</div>/.col-xs-12 -->
						            			</div><!-- /.row -->
					            			</form>	
			            			</div><!-- /.1번탭내용 tab-pane active -->
			            			
			            			<!-- 
			            			2번탭내용
			            			<div class = "tab-pane" id = "tab_2">
			            				
			            			</div>/.tab_2
			            			
			            			3번탭내용 
			            			<div class = "tab-pane" id = "tab_3">
			            				<div class = "row">
				            				<table class = "table table-condensed">
				            					<tr>
				            						<th>교육과정명</th>
				            						<td class = "col-xs-10"></td>
				            					</tr>
				            				</table>
			            				</div>/.row
			            				
			            				<div class = "row">
			            					<div class = "sub-title" style = "padding : 10px 0 0 0;">
			            						기수부여
			            					</div>
			            					<div class = "sub-box col-xs-6 curriBox">
			            						<div class = "sub-box">
			            							<div class = "sub-title" style = "padding : 10px 0 0 0;">
			            								전체지원자리스트
			            							</div>
			            							<table class = "table table-condensed">
			            								<tr>
				            								<th>이름</th>
				            								<th>생년월일</th>
				            								<th>성별</th>
				            								<th>전형결과</th>
				            								<th>선택</th>
			            								</tr>
			            								<tr>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td>
			            										<label class = "form-controll-static "><input class = "" type = "checkbox" name = "state" value = ""></label>
			            									</td>
			            								</tr>
			            								<tr>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td>
			            										<label class = "form-controll-static "><input class = "" type = "checkbox" name = "state" value = ""></label>
			            									</td>
			            								</tr>
			            							</table>
			            						</div>/.sub-box
			            					</div>/.sub-box col-xs-6
			            					<div class = "sub-box col-xs-6 pull-right curriBox">
			            						<div class = "sub-box">
			            							<div class = "sub-title" style = "padding : 10px 0 0 0;">
			            								수강생리스트
			            							</div>
			            							<table class = "table table-condensed">
			            								<tr>
			            									<th>이름</th>
			            									<th>생년월일</th>
			            									<th>성별</th>
			            									<th>전형결과</th>
			            									<th>선택</th>
			            								</tr>
			            								<tr>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td>
			            										<label class = "form-controll-static "><input class = "" type = "checkbox" name = "state" value = ""></label>
			            									</td>
			            								</tr>
			            								<tr>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td></td>
			            									<td>
			            										<label class = "form-controll-static "><input class = "" type = "checkbox" name = "state" value = ""></label>
			            									</td>
			            								</tr>
			            							</table>수강생리스트 table
			            						</div>
			            					
			            					</div>
			            				
			            				</div>/.row
            							<div class = "sub-toolbox text-center">
            								<button type = "button" class = "btn btn-primary">저장</button>
            							</div>
			            				
			            			</div>/.tab_3
			            			
			            			4번탭내용
			            			<div class = "tab-pane" id = "tab_4">
			            			
			            			
			            			
			            			</div>/.tab_4
			            			
			            			5번탭내용
			            			<div class = "tab-pane" id = "tab_5">
			            			
			            			
			            			</div>/.tab_5
			            			 -->
			            			
			            		</div><!-- /.tab content -->
							</div><!-- /.nav-tabs-custom 탭박스영역 -->
						
						
						</div>
						
					</div>
				
				</div>
			
			
			</div>
		
		
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

<%--jqgrid사용시 삭제할것--%>

