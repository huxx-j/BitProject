<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>TCOMS ver2</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <c:import url="/WEB-INF/views/includes/link.jsp" />
    <c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/class.css">

    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/pg-calendar/demo/css/style.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/pg-calendar/demo/css/ui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/pg-calendar/dist/css/pignose.calendar.min.css">
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <c:import url="/WEB-INF/views/includes/header.jsp" />
    <c:import url="/WEB-INF/views/includes/aside.jsp" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <section class="content-header">
            <h1> 수업관리 </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"><i class="fa fa-dashboard"></i> 학사과정 업무</a></li>
                <li class="active">수업관리</li>
            </ol>
        </section>

        <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-body" style="padding-right: 36px">
                    <div class="box-header with-border">
                        <h3 class="box-title"> 교육과정검색</h3>
                    </div>
                    <!-- /.box-header -->
                    <%--<div class="box-body">--%>
                        <table class="table table-condensed">
                            <tr>
                                <th style="width: 20%">업무구분</th>
                                <th colspan="2">교육과정(반) 명</th>
                                <%--<th style="width: 40%; border-left: hidden">--%>
                                    <%--<label class="form-controll-static"><input type="radio" name="ra_sel" value="all">전체</label>--%>
                                    <%--<label class="form-controll-static"><input type="radio" name="ra_sel" value="ongoing" checked>수업중</label>--%>
                                <%--</th>--%>
                            </tr>
                            <tr>
                                <td><select class="form-control" id="workTypeSelect" style="width:100%">
                                    <c:forEach items="${workType}" var="wt"> <!-- 업무 구분 셀렉트박스안에 출력하는 코드 -->
                                        <option id="${wt}" value="${wt}">${wt}</option>
                                    </c:forEach>
                                </select></td>
                                <td style="border-right: none !important; width: 130px;">
                                    <div class="radio-group w100 disp-inline">
                                        <label class="radiobox"><input type="radio" name="ra_sel" value="all">전체</label>
                                        <label class="radiobox"><input type="radio" name="ra_sel" value="ongoing" checked>수업중</label>
                                    </div>
                                </td>
                                <td id="curriTd" style="border-left: none !important;">
                                    <select class="form-control" id="curriSelect" style="width: 100%">
                                    </select>
                                </td>
                            </tr>
                        </table>
                    <%--</div>--%>
                    <div class="sub-toolbox text-center">
                        <button type="button" class="btn btn-primary" id="curriSearchBtn">조회</button>
                    </div>
                </div>
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title"> 수업관리</h3>
                        <input id="selectedCurri" type="hidden">
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="padding-right: 36px">
                        <table class="table table-condensed">
                            <tr>
                                <th style="width: 8%; text-align: center">과정구분</th>
                                <td id="curriNameInfo" style="width: 42%"></td>
                                <th style="width: 8%; text-align: center">기수</th>
                                <td id="gisuInfo" style="width: 42%"></td>
                            </tr>
                            <tr>
                                <th style="width: 8%; text-align: center">개강일</th>
                                <td id="periodFrInfo" style="width: 42%"></td>
                                <th style="width: 8%; text-align: center">종강일</th>
                                <td id="periodToInfo" style="width: 42%"></td>
                            </tr>
                        </table>
                    </div>
                <%--</div>--%>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box-body">

                        <!-- Custom Tabs -->
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab_1" data-toggle="tab">수업일지</a></li>
                                <li><a href="#tab_2" data-toggle="tab">이론평가</a></li>
                                <li><a href="#tab_3" data-toggle="tab">프로젝트관리</a></li>
                                <li><a href="#tab_4" data-toggle="tab">강의평가</a></li>
                                <li><a href="#tab_5" data-toggle="tab">학생관리</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1">
                                    <c:import url="includes/tab1.jsp" />
                                </div>
                                <div class="tab-pane" id="tab_2">
                                    <c:import url="includes/tab2.jsp" />
                                </div>
                                <div class="tab-pane" id="tab_3">
                                   <c:import url="includes/tab3.jsp" />
                                </div>
                                <div class="tab-pane" id="tab_4">
                                    <c:import url="includes/tab4.jsp" />
                                </div>
                                <div class="tab-pane" id="tab_5">
                                    <c:import url="includes/tab5.jsp" />
                                </div>
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- nav-tabs-custom -->
                    </div>
                    </div>
                    <!-- /.col -->
                </div>
            </div>
            </div>
        </div>
        </section>

    </div>
    <!-- /.content-wrapper -->

    <c:import url="/WEB-INF/views/includes/footer.jsp" />

    <div class="control-sidebar-bg"></div>



</div>
<!-- ./wrapper -->


</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/pg-calendar/dist/js/pignose.calendar.full.min.js"></script>

<c:import url="includes/classscript.jsp" />
