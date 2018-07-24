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
<div class="content-wrapper">

	<!-- Content Header (Page header) -->
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
									패카지카테고리
								</div><!-- cate-title -->

								<div class="cate-outter bordered">
									<div class="cate-toolbox">
										<button type="button" class="btn btn-default btn-cate" id="addcate">추가</button>
										<button type="button" class="btn btn-default btn-cate pull-right">편집</button>
									</div><!-- /.cate-toolbox -->
									<div class="scroll">
										<div class="tab-content-custom" style="height: 500px;">


												<ul id="treeDemo" class="ztree"></ul>

										</div>
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

 							<!--탭 박스 외곽 -->
							<div class="nav-tabs-custom">

								<!-- 상단탭영역 -->
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab_1" data-toggle="tab">패키지 개요</a></li>
									<li class=""><a href="#tab_2" data-toggle="tab">구성 과목</a></li>
								</ul>
								<!-- /.상단탭영역 -->
								<!-- /.탭내용박스 -->
								<div class="tab-content">
									<!-- 1번탭내용 -->
									<div class="tab-pane active" id="tab_1">

										<form id="" name="joinForm" method="get" action="${pageContext.request.contextPath}/package/add">
										<!-- 1번탭내용 -->
										<table class="table table-condensed">
											<colgroup>
												<col width="120px" />
												<col width="" />
											</colgroup>
											<tbody>
											<tr>
												<th>패키지사용여부</th>
												<td colspan="3">
													<div class="">
														<label class="form-controll-static"><input class="" type="radio" name="Availability" value="0">준비중</label>
														<label class="form-controll-static"><input class="" type="radio" name="Availability" value="1">모집중</label>
													</div>
												</td>
											</tr>
											<tr>
												<th>패키지카테고리</th>
												<td colspan="3">
													<select name ="strPackageCate_no" class="form-control input-sm">
														<c:forEach items="${list}" var="vo">
															<option value='${vo.packageCate_no}'>${vo.cateName}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>패키지명</th>
												<td><input name="PackageName" class="form-control input-sm" type="text" placeholder=""></td>
												<th  style="width:120px";>총 시간</th>
												<td width="100px"><input style="width:50px"; name="TotalTime" class="form-control input-sm" type="text" placeholder="">
												</td>
											</tr>
											<tr>
												<th>훈련목적및목표</th>
												<td colspan="3"><textarea name="Goal" class="form-control" rows="6" placeholder=""></textarea></td>
											</tr>
											<tr>
												<th>주요훈련내용</th>
												<td colspan="3"><textarea name="Content" class="form-control" rows="6" placeholder=""></textarea></td>
											</tr>
											<tr>
												<th>훈련대상요건</th>
												<td colspan="3"><textarea name="Qualification" class="form-control" rows="6" placeholder=""></textarea></td>
											</tr>
											</tbody>
										</table>
										<div class="sub-toolbox text-center">
											<input type="submit" value="저장"class="btn btn-primary">
										</div>
									</div>
									<!-- /.1번탭내용 -->

									<!-- 2번탭내용 -->
									<div class="tab-pane" id="tab_2">
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
												<th>업무구분</th>
												<td colspan="3">
													<select class="form-control input-sm">
														<option>국가기관</option>
														<option>대학캠퍼스</option>
													</select>
												</td>
												<td rowspan="5"><textarea class="form-control" rows="9" placeholder="상담내역"></textarea></td>
											</tr>

											<tr>
												<th rowspan="2">교육과정명</th>
												<td colspan="3">
													<label class="form-controll-static"><input class="" type="radio" name="state" value="">준비중</label>
													<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집중</label>
													<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집마감</label>
													<label class="form-controll-static"><input class="" type="radio" name="state" value="">수업중</label>
													<label class="form-controll-static"><input class="" type="radio" name="state" value="">종료</label>
												</td>
											</tr>
											<tr>
												<td colspan="3">
													<input class="form-control input-sm" type="text" placeholder="">
												</td>
											</tr>

											<tr>
												<th>체크박스</th>
												<td colspan="3">
													<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">준비중</label>
													<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">모집중</label>
													<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">모집마감</label>
													<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">수업중</label>
													<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">종료</label>
												</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>
													<div class="input-group date">
														<div class="input-group-addon input-sm">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control input-sm pull-right" id="datepicker">
													</div>
												</td>
												<th>종료일</th>
												<td>
													<div class="input-group date">
														<div class="input-group-addon input-sm">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control input-sm pull-right" id="datepicker">
													</div>
												</td>
											</tr>
											</tbody>
										</table>
										<div class="sub-toolbox text-center">
											<button type="button" class="btn btn-primary">저장</button>
										</div>
									</div>
									<!-- /.2번메뉴내용 -->
								</div>
								<!-- /.탭6내용박스 -->
							</div><!--/.탭 박스 외곽 -->
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

	<div class="control-sidebar-bg"></div>
</div>
<div class="modal fade" id="pop">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">카테고리 추가</h4>
			</div>
			<div class="modal-body">
				<table class="table table-condensed">
					<tr>
						<th>위치</th>
						<td>
							<select name='subcate' id="PackageCate_no" class='form-control input-sm'>
								<c:forEach items="${list}" var="vo">
									<option  value="${vo.packageCate_no}"> ${vo.cateName} </option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리명</th>
						<td>
							<input style="width: 100%" type="text" name="CateName" value="" id="CateName">
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="save">저장</button>
				<button type="button" class="btn btn-primary" id="btn_cancel">취소</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
<!-- ./wrapper -->
</body>
</html>
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript">
    // zTree 설정
    var setting = {
        data: {
            simpleData: {
                enable: true,
            }
        },
        callback: {
            beforeClick: package  // 마우스 클릭 콜백함수 지정
        }
    };
    var zNodes= [
        <c:forEach items="${list}" var="vo">
        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
        </c:forEach>
        <c:forEach items="${packlist}" var="vo">
        {id:${vo.package_no},pId:${vo.packageCate_no},name:"${vo.packageName}",web:"${vo.package_no}"},
        </c:forEach>
    ];

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    function package(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
        console.log(no);
        $.ajax({
            url : "${pageContext.request.contextPath }/package/packajax",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(PackageVo) {
                console.log(PackageVo);
                $("input[name='PackageName']").val(PackageVo.packageName),
                    $("textarea[name='Goal']").val(PackageVo.goal),
                    $("textarea[name='Content']").val(PackageVo.content),
                    $("textarea[name='Qualification']").val(PackageVo.qualification),
                    $("input[name='TotalTime']").val(PackgeVo.totalTime),
					$("select[name='Availability']").val(PackageVo.availability)
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    $("#addcate").on("click",function(){
        $("#pop").modal();
    });

    $("#btn_cancel").on("click",function(){
        $("#pop").modal("hide");
    });

    $("#save").on("click", function() {
        event.preventDefault();
        var PackageCate_no = $("#PackageCate_no").val();
        var CateName = $("#CateName").val();
        console.log(PackageCate_no);
        console.log(CateName);
        $.ajax({
            url : "${pageContext.request.contextPath }/package/addcate",
            type : "post",
            async: false,
            // contentType : "application/json",
            data : {"PackageCate_no": PackageCate_no, "CateName": CateName},
            dataType : "json",
            success : function() {
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
        location.reload();
        $("#pop").modal("hide");
    });
</script>
    <%--jqgrid사용시 삭제할것--%>

