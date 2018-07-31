<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		
      	<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
        	<li class="header">MAIN NAVIGATION</li>
        
	        <li class="treeview menu-open">
	        	<a href="#">
	            	<i class="fa fa-dashboard"></i><span>과정설계 업무</span>
	            	<span class="pull-right-container">
	              		<i class="fa fa-angle-left pull-right"></i>
	            	</span>
	          	</a>
	          	<ul class="treeview-menu" style="display: block">
	            	<li><a href="${pageContext.request.contextPath }/subject/main"><i class="fa fa-circle-o"></i> 과목관리</a></li>
	            	<li><a href="${pageContext.request.contextPath }/package/main"><i class="fa fa-circle-o"></i> 패키지관리</a></li>
	          	</ul>
	        </li>
        
	        <li class="treeview menu-open">
	        	<a href="#">
	            	<i class="fa fa-dashboard"></i><span>전형관리 업무</span>
	            	<span class="pull-right-container">
	              		<i class="fa fa-angle-left pull-right"></i>
	            	</span>
	          	</a>
	          	<ul class="treeview-menu" style="display: block">
	            	<li><a href="${pageContext.request.contextPath }/curri"><i class="fa fa-circle-o"></i> 교육과정관리</a></li>
	            	<li><a href="${pageContext.request.contextPath }/applicant/"><i class="fa fa-circle-o"></i> 지원자관리</a></li>
	          	</ul>
	        </li>
        
			<li class="treeview menu-open">
	        	<a href="#">
	            	<i class="fa fa-dashboard"></i><span>학사관리 업무</span>
	            	<span class="pull-right-container">
	              		<i class="fa fa-angle-left pull-right"></i>
	            	</span>
	          	</a>
	          	<ul class="treeview-menu" style="display: block">
	            	<li><a href="${pageContext.request.contextPath}/cm/"><i class="fa fa-circle-o"></i> 수업관리</a></li>
	          	</ul>
	        </li>
        
	        <li class="treeview menu-open">
	        	<a href="#">
	            	<i class="fa fa-dashboard"></i><span>출신관리 업무</span>
	            	<span class="pull-right-container">
	              		<i class="fa fa-angle-left pull-right"></i>
	            	</span>
	          	</a>
	          	<ul class="treeview-menu" style="display: block">
	            	<li><a href="${pageContext.request.contextPath}/completion/"><i class="fa fa-circle-o"></i> 수료생관리</a></li>
	            	<li><a href="${pageContext.request.contextPath}/test"><i class="fa fa-circle-o"></i> 기업취업의뢰</a></li>
	          	</ul>
	        </li>
        
	        <li class="treeview menu-open">
	        	<a href="#">
	            	<i class="fa fa-dashboard"></i><span>기초관리 업무</span>
	            	<span class="pull-right-container">
	              		<i class="fa fa-angle-left pull-right"></i>
	            	</span>
	          	</a>
	          	<ul class="treeview-menu" style="display: block">
	            	<li><a href="${pageContext.request.contextPath }/test1"><i class="fa fa-circle-o"></i> 회원관리</a></li>
	            	<li><a href="${pageContext.request.contextPath }/test2"><i class="fa fa-circle-o"></i> 강의평가</a></li>
	            	<li><a href="../../index.html"><i class="fa fa-circle-o"></i> 업무구분관리</a></li>
	          	</ul>
	        </li>
        
		</ul>
	</section>
    <!-- /.sidebar -->
</aside>

