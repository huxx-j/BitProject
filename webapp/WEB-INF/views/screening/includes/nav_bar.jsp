<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<div class = "sub-box">
	<div class = "cate-title">
		교육과정카테고리
	</div><!-- cate-title -->

	<div class = "cate-outter bordered">
		<div class = "cate-toolbox">
			<button type = "button" class = "btn btn-default btn-cate">추가</button>
			<button type = "button" class = "btn btn-default btn-cate pull-right">편집</button>
		</div><!-- /.cate-toolbox -->
		<div class = "scroll">
			<!-- /////////////////////////////////////////////////// -->
			   <div class="tab-content-custom" style="height: 500px;">
<!-- 			   		<div class="tab-pane active" id="tab_1"> -->
			   		<div class="row">
                                 <ul class="side-bar test" data-widget="tree">
                                    <li class="treeview"> <a href="#"> <i class="fa fa-circle-o"></i> <span>기초언어</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
                                       <ul class="treeview-menu">
                                          <li><a href="#"><i class="fa fa-circle-o"></i> C언어</a></li>
                                          <li class="treeview"> <a href="#"><i class="fa fa-circle-o"></i> JAVA <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
                                             <ul class="treeview-menu">
<%--                                                 <li><a href="${pageContext.request.contextPath }/curri/1" target="_self"><i class="fa fa-circle-o"></i><input type = "hidden" id = "viewCurriInfo" name = "curriculum_no" value = "1"> JAVA BASIC</a></li> --%>
<%--                                                 <li class="treeview"> <a href="${pageContext.request.contextPath }/curri/${curriculum_no}"><i class="fa fa-circle-o"></i><input type = "hidden" id = "viewCurriInfo"  name = "curriculum_no" value = "2">  JAVA EXPERT<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a> --%>
<!--                                                    <ul class="treeview-menu"> -->
<%--                                                       <li><a href="${pageContext.request.contextPath }/curri/${curriculum_no}"><i class="fa fa-circle-o"></i><input type = "hidden" id = "viewCurriInfo" name = "curriculum_no" value = "3">  JAVA WEB</a></li> --%>
<%--                                                       <li><a href="${pageContext.request.contextPath }/curri/${curriculum_no}"><i class="fa fa-circle-o"></i><input type = "hidden" id = "viewCurriInfo"  name = "curriculum_no" value = "4">  SPRING</a></li> --%>
<!--                                                    </ul> -->
<!--                                                 </li> -->
                                                <li><a href="${pageContext.request.contextPath }/curri/1" target="_self"><i class="fa fa-circle-o"></i><input type = "hidden" id = "viewCurriInfo" name = "curriculum_no" value = "1"> JAVA BASIC</a></li>
                                                <li class="treeview"> <a href="${pageContext.request.contextPath }/curri/${curriculum_no}"><i class="fa fa-circle-o"></i>  JAVA EXPERT<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
                                                   <ul class="treeview-menu">
                                                      <li><a href="${pageContext.request.contextPath }/curri/2"><i class="fa fa-circle-o"></i><input type = "hidden" id = "viewCurriInfo" name = "curriculum_no" value = "2">  JAVA WEB</a></li>
                                                      <li><a href="${pageContext.request.contextPath }/curri/3"><i class="fa fa-circle-o"></i><input type = "hidden" id = "viewCurriInfo"  name = "curriculum_no" value = "3">  SPRING</a></li>
                                                   </ul>
                                                </li>
                                             </ul>
                                          </li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> PYTHON</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> RUBY</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> SWIFT</a></li>
                                       </ul>
                                    </li>
                                    <li class="treeview"> <a href="#"> <i class="fa fa-circle-o"></i> <span>데이터베이스</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
                                       <ul class="treeview-menu">
                                          <li><a href="#"><i class="fa fa-circle-o"></i> Oracle</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> MySql</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> MsSql</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> NoSql</a></li>
                                       </ul>
                                    </li>
                                    <li class="treeview"> <a href="#"> <i class="fa fa-circle-o"></i> <span>데이터베이스</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
                                       <ul class="treeview-menu">
                                          <li><a href="#"><i class="fa fa-circle-o"></i> Oracle</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> MySql</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> MsSql</a></li>
                                          <li><a href="#"><i class="fa fa-circle-o"></i> NoSql</a></li>
                                       </ul>
                                    </li>
                                 </ul>
				</div><!-- /.tab-pane -->

			</div><!-- tab-content -->
			<!-- /////////////////////////////////////////////////// -->
		</div><!-- /.scroll -->
	
	</div><!-- /.cate-outter -->
	
	<div class = "cate-toolbox">
		<div class = "input-group input-group-sm">
			<input class = "form-control" type = "text">
				<span class = "input-group-btn">
					<button class = "btn btn-info btn-flat" type = "button">Go!</button>
				</span>
		</div>
	</div><!-- /.cate-toolbox -->
</div><!-- /.sub-box -->
