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

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">

		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>패키지관리
				<small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">과정설계업무</a></li>
				<li class="active">패키지관리</li>
			</ol>
		</section>


		<!-- Main content -->
		<section class="content">

			<div class="row">


				<div class="col-xs-12">
					<div class="box box-body">

						<div class="row">
							<!-- 카테고리영역 -->
							<div class="col-xs-3">
								<div class="sub-box">
									<div class="cate-title">
										과목카테고리
									</div><!-- sub_title -->

									<div class="cate-outter bordered">
										<div class="cate-toolbox">
											<button type="button" class="btn btn-default btn-cate">추가</button>
											<button type="button" class="btn btn-default btn-cate pull-right">편집</button>
										</div><!-- /.cate-toolbox -->
										<div class="scroll">
											<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
											<br><br><br><br><br><br><br><br><br>
										</div><!-- /.sub-body -->
									</div><!-- /.cate-outter -->
									<div class="cate-toolbox">
										<div class="input-group input-group-sm">
											<input class="form-control" type="text">
											<span class="input-group-btn">
                      							<button class="btn btn-info btn-flat" type="button">Go!</button>
                    						</span>
										</div>
									</div><!-- /.cate-toolbox -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 -->

							<!-- 과목정보영역 -->
							<div class="col-xs-9">
								<div class="sub-box">
									<div class="sub-title">
										<ul class="nav nav-pills">
											<li class=""><a href="./11">패키지개요</a></li>
											<li class="active"><a href="./12">구성과목</a></li>
											<li class=""><a href="#">회원관리</a></li>
											<button style="float: right" id="btnAddpackage" class="btn btn-info btn-flat" type="button">패키지 추가</button>
										</ul>
									</div>
									<div class="sub-body">
										<!-- 2번메뉴내용 -->
										<table class="table table-condensed">
											<colgroup>
												<col width="80px" />
												<col width="" />
												<col width="80px" />
												<col width="" />
												<col width="250px" />
											</colgroup>

											<tbody>
											<tr>
												<th>패키지명</th>
												<td colspan="3" >
													자바 스프링 Node 960 시간
												</td>
												<th colspan="2">총 교육시간</th>
												<td style="width : 100px">
													960 시간
												</td>
											</tr>
											</tbody>
										</table>

										<br>
										<button  id="btnAddstep" style="margin-bottom:5px; float: right" class="btn btn-info btn-flat" type="button">단계 추가</button>
										<li id="step-list">

										<table class="table table-condensed">
												<colgroup>
													<col width="50px" />
													<col width="250px" />
													<col width="" />
													<col width="80px" />
													<col width="60px" />
												</colgroup>
												<tbody id='subject-list'>
											<tr >
												<td style="text-align: center">1단계</td>
												<td colspan="3" >
													<input type="text" style="width: 800px">
												</td>
												<td id='subadd' style="width: 50px">
													<button  id='btnAddsubject' class="btn btn-info btn-flat" type="button">추가</button>
												</td>
											</tr>
											<tr id="subject-item" style="height: 150px">
												<td></td>
												<td>
													<button style=" float: right;" class="btn btn-info btn-flat" type="button">과목선택</button>
												</td>
												<td>
												<textarea style="width: 490px; height: 135px;">
												</textarea>
												</td>
												<td>
													<input style="width:25px; margin-right: 5px" type="text">시간
												</td>
												<td>
													<button  id="del-subject" class="btn btn-info btn-flat" type="button">삭제</button>
												</td>
											</tr>
											</tbody>
										</table>

										</li>
										<div class="sub-toolbox text-center">
											<button type="button" class="btn btn-primary">저장</button>
										</div>
									</div>
									<!-- /.2번메뉴내용 -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-9 -->
							<!-- /.과목정보영역 -->
						</div><!-- /.row -->
					</div><!-- /.box -->
				</div><!-- /.col-xs-12 -->
			</div><!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>
	<script type="text/javascript">
        $(document).ready(function() {
            var stepCount = 2;
        });
        $("#btnAddstep").on("click",function(){
			 stepCount++;
                var str = " ";
                str += "<br><br>"
                str += "<table name=" + stepCount + " class='table table-condensed'>"
                str += "<colgroup>"
                str += "<col width='50px' />"
                str += "<col width='250px' />"
                str += "<col width='' />"
                str += "<col width='80px' />"
                str += "<col width='60px' />"
                str += "</colgroup>"
                str += "<tbody id='subject-list' >"
                str += "<tr>";
                str += "<td style='text-align: center'>" + stepCount + "단1계</td>";
                str += "<td colspan='3' >";
                str += "<input type='text' style='width: 800px'>";
                str += "</td>";
                str += "<td id='subadd' style='width: 50px'>";
                str += "<button  id='btnAddsubject' class='btn btn-info btn-flat' type='button'>추가</button>";
                str += "</td>";
                str += "</tr>";
                str += "<tr style='height: 150px'>";
                str += "<td></td>";
                str += "<td >";
                str += "<button style=' float: right;' class='btn btn-info btn-flat' type='button'>과목선택</button>";
                str += "</td>";
                str += "<td>";
                str += "<textarea style='width: 490px; height: 135px;'>";
                str += "</textarea>";
                str += "</td>";
                str += "<td>";
                str += "<input style='width:25px; margin-right: 5px' type='text'>시간";
                str += "</td>";
                str += "<td>";
                str += "<button  class='btn btn-info btn-flat' type='button'>삭제</button>";
                str += "</td>";
                str += "</tr>";
                str += "</tbody>"
                str += "</table>"
                $("#step-list").append(str);

			});

        $(document).on("click","#btnAddsubject",function() {
            var str=" ";
            str+=    "<tr style='height: 150px'>";
            str+=    "<td></td>";
            str+=    "<td>";
            str+=    "<button style=' float: right;' class='btn btn-info btn-flat' type='button'>과목선택</button>";
            str+=    "</td>";
            str+=    "<td>";
            str+=    "<textarea style='width: 490px; height: 135px;'>";
            str+=    "</textarea>";
            str+=    "</td>";
            str+=    "<td>";
            str+=    "<input style='width:25px; margin-right: 5px' type='text'>시간";
            str+=   "</td>";
            str+=   "<td>";
            str+=   "<button  class='btn btn-info btn-flat' type='button'>삭제</button>";
            str+=    "</td>";
            str+=   "</tr>";
            $("#subject-list").append(str);
        });


        $(document).on("click","#del-subject",function() {
        $("#subject-item").remove()
        });

	</script>
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>


