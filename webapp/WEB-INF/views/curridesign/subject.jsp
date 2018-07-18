<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		ul{
			list-style-type: none;
		}

	</style>
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
					<form id="" name="joinForm" method="get" action="${pageContext.request.contextPath}/subject/add">
					<div class="row">
						<!-- 카테고리영역 -->
						<div class="col-xs-3">
							<div class="sub-box">
								<div class="cate-title">
									과목카테고리
								</div><!-- cate-title -->

								<div class="cate-outter bordered">
									<div class="cate-toolbox">
										<button type="button" class="btn btn-default btn-cate">추가</button>
										<button type="button" class="btn btn-default btn-cate pull-right">편집</button>
									</div><!-- /.cate-toolbox -->
									<div class="scroll">

										<div class="tab-content-custom" style="height: 500px;">
											<div class="tab-pane active" id="tab_1">
												<ul id="cate-tree" class="side-bar test" data-widget="tree">


													<!-- 최하단 카테고리 조건(ajax구현 고려)
												<c:forEach items="${sublist}" var="sub">
													<ul class="treeview-menu">
														<li><a href="#"><i class="fa fa-circle-o"></i> ${sub.subjectName}</a></li>
													</ul>
												</c:forEach>-->
													<li class="treeview">
														<a href="#"> <i class="fa fa-circle-o"></i>데이터베이스<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
														<ul class="treeview-menu">
																<li class="treeview">
																<a href="#"><i class="fa fa-circle-o"></i> JAVA <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
																	<ul class="treeview-menu">
																		<li class="treeview">
																			<a href="#"><i class="fa fa-circle-o"></i> JAVA-1 <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
																			<ul class="treeview-menu">
																				<li class="treeview">
																				</li>
																			</ul>
																			<a href="#"><i class="fa fa-circle-o"></i> JAVA-2 <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
																			<ul class="treeview-menu">
																				<li class="treeview">
																				</li>
																			</ul>
																		</li>
																	</ul>
																	<a href="#"><i class="fa fa-circle-o"></i> JAVA2 <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
																	<ul class="treeview-menu">
																	<li class="treeview">
																		<a href="#"><i class="fa fa-circle-o"></i> JAVA2 <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
																	</li>
																</ul>
																</li>
														</ul>
													</li>

												</ul>
												</ul>
											</div>

											<!-- /.tab-pane -->
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

								<div class="tab-content">

									<button  id="btnAddsubject" style="margin-bottom:5px; float: right" class="btn btn-info btn-flat" type="button">과목 추가</button>
										<table class="table table-condensed">
											<colgroup>
												<col width="120px" />
												<col width="" />
											</colgroup>

											<tbody>

											<tr>
												<th>과목 카테고리</th>
												<td>
													<select class='form-control input-sm'>
													<c:forEach items="${list}" var="vo">
														<option> ${vo.cateName} </option>
													</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>과목 명</th>
												<td><input name="SubjectName" class="form-control input-sm" type="text" placeholder=""></td>
											</tr>
											<tr>
												<th>과목 개요</th>
												<td><textarea name="Outline" class="form-control" rows="6" placeholder=""></textarea></td>
											</tr>

											</tbody>
										</table>
										<div class="sub-toolbox text-center">
											<input type="submit" value="저장"class="btn btn-primary">
										</div>
									</div>


								</div>
								<!-- /.탭내용박스 -->
							</div><!--/.탭 박스 외곽 -->
						</div><!-- /.col-xs-9 -->
						<!-- /.과목정보영역 -->
					</div><!-- /.row -->

			</div><!-- /.col-xs-12 -->
		</div><!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<script type="text/javascript">

    $(document).ready(function() {
        console.log("정상실행");
		var str=" ";
    	str+= "<select class='form-control input-sm'>";
        str+= "<c:forEach items="${list}" var="vo">";
        str+= " <option> ${vo.cateName} </option> </c:forEach>";
        str+= "</select>";
        $("#subjectCate-list").append(str);
		console.log("정상실행2");
		start();
        var objectValue="${list}";
        console.log(objectValue);
    });

 function start(){
     var k=1;
     var str="";
		str+="<c:forEach items='${list}' var='vo1'>";

		str+="<c:if test='${vo1.depth ne 1}'>";
     		str+="<ul class='treeview-menu'>";
 		str+="</c:if>";

	 	str+="<li class=\"treeview\">";
	 	str+="<a href=\"#\"> <i class=\"fa fa-circle-o\"></i>${vo1.cateName}<span class=\"pull-right-container\"> <i class=\"fa fa-angle-left pull-right\"></i> </span> </a>";
	 	str+="<ul class='treeview-menu'>";
     	str+="<li class=\"treeview\">";

				str+="<c:forEach items='${list}' var='vo1'>";
     			str+="<c:if test='${vo1.subjectCate_no eq vo2.parentCode}'>";
     			str+="<a href=\"#\"> <i class=\"fa fa-circle-o\"></i>${vo2.cateName}<span class=\"pull-right-container\"> <i class=\"fa fa-angle-left pull-right\"></i> </span> </a>";
     			str+="<ul class='treeview-menu'>";
     			str+="<li class='treeview'>";
     str+="<c:forEach items="${mdlist}" var="md">";
     str+="<c:if test='${vo2.groupCode eq md.groupCode}'>";
     str+="<c:if test='${vo2.depth eq md.depth}'>";
	 for(var i=1;i<${md.depth};i++)
     {
         str += "</li>";
         str += "</ul>";
     }
	 str+="</c:if>";
     str+="<c:if test='${vo2.depth ne md.depth}'>";
     for(var i=1;i<${vo2.depth};i++)
     {
         str += "</li>";
         str += "</ul>";
     }
     str+="</c:if>";
     str+="</c:if>";
     str+="</c:forEach>";
     			str+="</c:if>";
     			str+="</c:forEach>";
				str+=" </li>";
				str+="</ul>";
				str+="</li>";
				str+="<c:if test='${vo1.depth ne 1}'>";
	 			str+="</ul>";
 				str+="</c:if>";
     			str+="</c:forEach>";
     $("#cate-tree").append(str);
 }




    function makeCate(str,depth){
		if(depth==3)
		    return str;
         str+="<a href=\"#\"> <i class=\"fa fa-circle-o\"></i>${vo2.cateName}<span class=\"pull-right-container\"> <i class=\"fa fa-angle-left pull-right\"></i> </span> </a>";
        str+="<ul class='treeview-menu'>";
        str+="<li class='treeview'>";
        makeCate(str,depth)
        str+="</li>";
        str+="</ul>";
        return str;
	}

</script>
    <%--jqgrid사용시 삭제할것--%>

