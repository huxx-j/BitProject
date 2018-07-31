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
										패키지카테고리
									</div><!-- sub_title -->

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
										<form id="" name="joinForm" method="get" action="${pageContext.request.contextPath}/package/stepadd">
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
												<th  style="width : 100px">패키지명</th>
												<td style="width : 500px" colspan="3" >
													${PackageName}
												</td>
												<th style="width : 100px" colspan="2">총 교육시간</th>
												<td style="width : 100px">
													${TotalTime}
												</td>
											</tr>
											</tbody>
										</table>

										<br>
										<button  id="btnAddstep" style="margin-bottom:5px; float: right" class="btn btn-default btn-sub pull-right" type="button">단계 추가</button>
										<li id="step-list">

										<table class="table table-condensed">
												<colgroup>
													<col width="50px" />
													<col width="250px" />
													<col width="" />
													<col width="80px" />
													<col width="60px" />
												</colgroup>
												<tbody id='subject-list0'>
												<input type="hidden" name ="steplist[0].Package_no" value="${Package_no}">
												<input type='hidden' name="steplist[0].Level" value="1">
											<tr >
												<td style="text-align: center">1단계</td>
												<td colspan="3" >
													<input type="text" name="steplist[0].StepName" style="width: 800px">
												</td>
												<td style="width: 50px">
													<button  id='btnAddsubject' class="btn btn-info btn-flat" type="button" data-val="0" data-pack="${Package_no}">추가</button>
												</td>
											</tr>
											<tr id="subject-item0" style="height: 150px">
												<td></td>
												<td>
													<button style=" float: right;" class="btn btn-default btn-sub pull-right" type="button">과목선택</button>
												</td>
												<td>
												<textarea name="steplist[0].sublist[0].Content" style="width: 490px; height: 135px;">
												</textarea>
												</td>
												<td>
													<input name="steplist[0].sublist[0].SubHour" style="width:25px; margin-right: 5px" type="text">시간
												</td>
												<td>
													<button  id="del-subject" class="btn btn-default btn-sub pull-right" type="button" data-val="0">삭제</button>
												</td>
											</tr>
											</tbody>
										</table>

										</li>
										<div class="sub-toolbox text-center">
											<input type="submit" value="저장"class="btn btn-primary">
										</div>ㄴ
									</div>
									<!-- /.2번메뉴내용 -->
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-9 -->
							<!-- /.과목정보영역 -->
						</div><!-- /.row -->
					</div><!-- /.box -->
				</div><!-- /.col-xs-12 -->
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
			</div><!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
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
                url : "${pageContext.request.contextPath }/package/stepajax",
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

		var step=0;
		var sub=0;

        $(document).on("click","#btnAddstep",function(){
            var pack=$(this).data("pack");
            step++;
            sub++;
            var str=" ";
            str+= "<br><br>";
            str+=  "<table id="+step+" class='table table-condensed'>";
            str+=  "<colgroup>";
            str+=  "<col width='50px' />";
            str+=   "<col width='250px' />";
            str+=  "<col width='' />";
            str+=  "<col width='80px' />";
            str+=  "<col width='60px' />";
            str+=  "</colgroup>";
            str+=  '<tbody id=subject-list'+step+'>';
            str+=   "<input type='hidden' name='steplist.["+step+"].Package_no' value='+pack+' >";
            str+=   "<input type='hidden' name='steplist.["+step+"].Level' value='+step+' >";
            str+=  "<tr>";
            str+=	  "<td style='text-align: center'>"+(step+1)+"단계</td>";
            str+=    "<td colspan='3' >";
            str+=    "<input name='steplist["+step+"].StepName' type='text' style='width: 800px'>";
            str+=    "</td>";
            str+=    "<td style='width: 50px'>";
            str+=    "<button  id='btnAddsubject' class='btn btn-info btn-flat' type='button' data-val="+step+" >추가</button>";
            str+=    "</td>";
            str+=    "</tr>";
            str+=    "<tr id=subject-item"+sub+" style='height: 150px'>";
            str+=    "<td></td>";
            str+=    "<td>";
            str+=    "<button style=' float: right;' class='btn btn-default btn-sub pull-right' type='button'>과목선택</button>";
            str+=    "</td>";
            str+=    "<td>";
            str+=    "<textarea name='steplist["+step+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>";
            str+=    "</textarea>";
            str+=    "</td>";
            str+=    "<td>";
            str+=    "<input name='steplist["+step+"].sublist["+sub+"].SubHour' style='width:25px; margin-right: 5px' type='text'>시간";
            str+=   "</td>";
            str+=   "<td>";
            str+=   "<button  id='del-subject' class='btn btn-info btn-flat' type='button' data-val="+sub+">삭제</button>";
            str+=    "</td>";
            str+=   "</tr>";
            str+=  "</tbody>"
            str+=  "</table>"
            $("#step-list").append(str);

        });

        $(document).on("click","#btnAddsubject",function() {
            event.preventDefault();
            var instep=$(this).data("val");
            console.log(instep);
            sub++;
            var str=" ";
            str+=    "<tr id=subject-item"+sub+" style='height:150px'>";
            str+=   "<input type='hidden' name='hide' data-val="+sub+">";
            str+=    "<td></td>";
            str+=    "<td>";
            str+=    "<button style=' float: right;' class='btn btn-info btn-flat' type='button'>과목선택</button>";
            str+=    "</td>";
            str+=    "<td>";
            str+=    "<textarea name='steplist["+instep+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>";
            str+=    "</textarea>";
            str+=    "</td>";
            str+=    "<td>";
            str+=    "<input name='steplist["+instep+"].sublist["+sub+"].SubHour'  style='width:25px; margin-right: 5px' type='text'>시간";
            str+=   "</td>";
            str+=   "<td>";
            str+=   "<button id='del-subject' class='btn btn-info btn-flat' type='button' data-val="+sub+">삭제</button>";
            str+=    "</td>";
            str+=   "</tr>";
            console.log(sub);
            $("#subject-list"+instep).append(str);

        });

        $(document).on("click","#del-subject",function() {
            var sub=$(this).data("val");
            console.log(sub);
        $("#subject-item"+sub).remove()
        });

	</script>
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>


