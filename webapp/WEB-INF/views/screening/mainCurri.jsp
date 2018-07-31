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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="/assets/css/jquery.datepicker.css">
	<!-- 그리드 사용시 주석풀어 사용 -->
	<%-- <c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import> --%>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				교육과정관리 <small>it all starts here</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">전형관리 업무</a></li>
				<li><a href="#">교육과정관리</a></li>
			</ol>
		</section>

		<!-- Main content -->
		<section class = "content">
		
			<div class = "row">
				<div class = "col-xs-12">
					<div class = "box box-body">
						<div class = "row">
							<!-- 카테고리 영역 시작 -->
							<div class = "col-xs-3">
								<!-- 네비 바 시작 -->
								<div class = "sub-box">
									<div class = "cate-title">
										교육과정카테고리
									</div>
									<div class = "cate-outter bordered">
										<div class = "cate-toolbox">
											<button type = "button" class = "btn btn-default btn-cate">추가</button>
											<button type = "button" class = "btn btn-default btn-cate pull-right">편집</button>
										</div><!-- /.cate-toolbox -->
										<div class = "scroll">
											<div class = "tab-content-custom" style = "height:500px;">
												<div class = "row">
													<ul id = "treeDemo" class = "ztree"></ul>
												</div>
											</div><!-- /.tab-content-custom -->
										</div><!-- /.scroll -->
									</div><!-- /.cate-outter bordered -->
									<div class = "cate-toolbox">
										<div class = "input-group input-group-sm">
											<input class = "form-control" type = "text">
											<span class = "input-group-btn">
												<button class = "btn btn-info btn-flat" type = "button">Go!</button>
											</span><!-- /.input-group-btn -->
										</div><!-- /.input-group input-group-sm -->
									</div><!-- /.cate-toolbox -->
								</div><!-- /.sub-box -->
								<!-- /.네비 바 끝 -->
							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 끝 -->
							
							
							<!-- 교육과정 정보 영역 시작-->
							<div class = "col-xs-9">
								<!-- 탭박스 외곽  -->
								<div class = "nav-tabs-custom">
									<!-- 상단 탭 영역 -->
									<ul class = "nav nav-tabs" id = "curri-nav-tab">
										<li class = "active"><a href = "#tab_1" data-toggle = "tab">교육과정정보</a></li>
										<li class = ""><a href = "#tab_2" data-toggle = "tab">홈페이지관리</a></li>
										<li class = ""><a href = "#tab_3" data-toggle = "tab">교육생관리</a></li>
										<li class = ""><a href = "#tab_4" data-toggle = "tab">강사배정</a></li>
										<li class = ""><a href = "#tab_5" data-toggle = "tab">강의실배정</a></li>
										<a href = "${pageContext.request.contextPath }/curri/addCurriForm">
											<button type = "button" class = "btn btn-default btn-sm pull-right" >교육과정추가</button>
										</a>
									</ul><!-- /.nav nav-tabs -->
									<!-- /.상단 탭 영역 끝 -->
									<!-- 탭 내용 박스 -->
									<div class = "tab-content">
										<!-- 1번 탭 내용 -->
												<c:import url="/WEB-INF/views/screening/tab_curriInfo.jsp"></c:import>
											
										<!-- /.1번탭 -->
										
										<!-- 2번탭 영역 시작 -->
										<div class = "tab-pane" id = "tab_2">
											<div class = "row">
												<div class = "col-xs-12">
													<table class = "table table-condensed">
														<tr>
															<th>교육과정명</th>
															<td class = "col-xs-10">
																<input type = "text" class = "form-control " readonly name = "curriName">
															</td>
														</tr>
													</table>
												</div><!-- /.col-xs-12 -->
											</div><!-- /.row 2번탭 상단-->
											<div class = "row" style = "padding : 10px 0 0 0;">
												<div class = "col-xs-12">
													<table class = "table table-condensed" >
														<tr>
															<th class = "col-xs-1">메인페이지</th>
															<td class = "col-xs-5">
																<label class = "form-control-static"><input type = "radio" name = "mainViewFlag" value = "노출">노출</label>
																<label class = "form-control-static"><input type = "radio" name = "mainViewFlag" value = "숨김">숨김</label>
																<button type = "button" class = "btn btn-default btn-cate btn-lg pull-right" id = "myBtn">미리보기</button>
															</td>
															<th class = "col-xs-1">상세페이지</th>
															<td>
																<label class = "form-control-static"><input type = "radio" name = "detailViewFlag" value = "노출">노출</label>
																<label class = "form-control-static"><input type = "radio" name = "detailViewFlag" value = "숨김">숨김</label>
																<button type = "button" class = "btn btn-default btn-cate btn-lg pull-right" id = "myBtn">미리보기</button>
															</td>
														</tr>
													</table>
												</div><!-- /.col-xs-12 -->
											</div><!-- /.row 2번탭 하단 -->
										</div><!-- /.tab_2 -->
										<!-- /.2번탭 끝 -->
										
										
										<!-- 3번탭 영역 시작 -->
										<div class = "tab-pane" id = "tab_3">
											<div class = "row">
												<div class = "col-xs-12">
													<table class = "table table-condensed">
														<tr>
															<th>교육과정명</th>
															<td class = "col-xs-10"><input type = "text" class = "form-control" readonly name = "curriName"></td>
														</tr>
													</table>
												</div><!-- /.col-xs-12" -->
											</div><!-- /.row 3번탭 상단 -->
											<div class = "row" style = "padding = 10px 0 0 0;">
												<div class = "col-xs-12" >
													<div class = "sub-box">
														<div class = "sub-title" style = "padding : 10px 0 0 0;">
															기수부여
														</div>
														<div class = "row">
															<div class = "col-xs-12">
																<div class = "col-xs-5">
																	<div class = "sub-box" style = "border : 1px solid; border-color: #d2d6de; padding: 10px;">
																		<div class = "sub-title">
																			전체지원자리스트
																		</div><!-- /.sub-title -->
																		<div class = "sub-box">
																			<table class = "table table-condensed">
																				<tr>
																					<th>이름</th>
																					<th>생년월일</th>
																					<th>성별</th>
																					<th>전형결과</th>
																					<th>선택</th>
																				</tr>
																				<tr>
																					<td><input type = "text" class = "form-control " name = "nameHan" style = "border : none;"></td>
																					<td><input type = "text" class = "form-control " name = "birthDate" style = "border : none;"></td>
																					<td><input type = "text" class = "form-control " name = "gender" style = "border : none;"></td>
																					<td><input type = "text" class = "form-control " name = "testResult" style = "border : none;"></td>
																					<td>
																						<label class = "form-control-static"><input type = "checkbox" class = "" name = "gisuGrant" value = ""></label>
																					</td>
																				</tr>
																			</table>
																		</div><!-- /.sub-box -->
																	</div><!-- /.sub-box -->
																</div><!-- /.col-xs-5 좌측-->
																<div class = "col-xs-2">
																	<button type = "button" class = "btn btn-default" value = "">></button>
																	<button type = "button" class = "btn btn-default" value = ""><</button>
																</div><!-- /.col-xs-2 -->
																<div class = "col-xs-5" style = "border : 1px solid; border-color: #d2d6de; padding: 10px;">
																	<div class = "sub-box">
																		<div class = "sub-title">
																			수강생리스트
																		</div><!-- /.sub-title -->
																		<div class = "sub-box">
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
																						<label class = "form-control-static"><input type = "checkbox" class = "" name = "gisuGrant" value = ""></label>
																					</td>
																				</tr>
																			</table>
																		</div><!-- /.sub-box -->
																	</div><!-- /.sub-box -->
																</div><!-- /.col-xs-5 우측 -->
															</div><!-- /.col-xs-12 -->
														</div><!-- /.row  -->
													</div><!-- /.sub-box -->
													<div class = "sub-toolbox text-center">
														<button type = "button" class = "btn btn-primary">저장</button>
													</div><!-- /.sub-toolbox text-center -->
												</div><!-- /.col-xs-12 -->
											</div><!-- /.row 3번탭 하단 -->
										</div><!-- /.tab_3 -->
										<!-- /.3번탭 끝 -->
										
										
										<!-- 4번탭 영역 시작 -->
										<div class = "tab-pane" id = "tab_4">
											<div class = "row">
												<div class = "col-xs-12">
													<table class = "table table-condensed">
														<tr>
															<th>교육과정명</th>
															<td class = "col-xs-10"><input type = "text" class = "form-control " readonly name = "curriName"></td>
														</tr>
													</table>
												</div><!-- /.col-xs-12" -->
											</div><!-- /.row 4번탭 상단 -->
											<div class = "row">
												<div class = "col-xs-12">
												
												</div><!-- /.col-xs-12 -->
											</div><!-- /.row 4번탭 하단 -->
										</div><!-- /.tab_4 -->
										<!-- /.4번탭 끝 -->
										
										
										<!-- 5번탭 영역 시작 -->
										<div class = "tab-pane" id = "tab_5">
											<div class = "row">
												<div class = "col-xs-12">
													<table class = "table table-condensed">
														<tr>
															<th>교육과정명</th>
															<td class = "col-xs-10"><input type = "text" class = "form-control " readonly name = "curriName"></td>
														</tr>
													</table>
												</div><!-- /.col-xs-12" -->
											</div><!-- /.row 5번탭 상단 -->
											<div class = "row">
												<div class = "col-xs-12">
												
												</div><!-- /.col-xs-12 -->
											</div><!-- /.row 5번탭 하단 -->
										</div><!-- /.tab_5 -->
										<!-- /.5번탭 끝 -->


										
									</div><!-- /.tab-content -->
									<!-- /.탭 내용 박스 끝 -->
								</div><!-- /.nav-tabs-custom -->
								<!-- 탭 박스 외곽 끝 -->
							</div><!-- col-xs-9 -->
							<!-- /.교육과정 정보 영역 끝 -->
							
							
						</div><!-- /.row -->
					</div><!-- /.box -->
				</div>
			
			</div><!-- /.row -->
		
		</section>
		<!-- /.content -->
		
		
	</div><!-- content-wrapper -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>

<!-- 자바스트립트영역 -->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<%-- <c:import url="/WEB-INF/views/includes/script.jsp"></c:import> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript">
//교육과정 카테고리 탭
    var setting = {
        data: {
            simpleData: {
                enable: true,
            }
        },
        callback: {
            beforeClick: package  // 마우스 클릭 콜백함수 지정
        },
    };

    var zNodes= [
        <c:forEach items="${cateList}" var="vo">
        {id:${vo.curriculumCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
        </c:forEach>
        <c:forEach items="${list}" var="vo">
        {id:${vo.curriculum_no},pId:${vo.curriculumCate_no},name:"${vo.curriName}",web:${vo.curriculum_no}},
        </c:forEach>
    ];

    $(document).ready(function(){
        var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        console.log(treeObj);
    });
    
    //교육과정 클릭 시 정보 뿌려줌
    function package(treeId, treeNode, clickFlag) {
        var curriculum_no=treeNode.web;
        console.log(curriculum_no);
        $.ajax({
            url : "${pageContext.request.contextPath }/curri/"+curriculum_no,
            type : "POST",
//             data : {"curriculum_no": curriculum_no},
            dataType : "json",
//             async: false,
            success : function(curriAllVo) {
                
            	console.log(curriAllVo);
            	console.log(curriAllVo.curriculumVo);
            	console.log(curriAllVo.applicantList);
            	
                console.log(curriAllVo.curriculumVo.state);
                console.log(curriAllVo.applicantList);
                
                $("#workType").val(curriAllVo.curriculumVo.workType).prop("selected",true),
                $("input[name='package_no']").val(curriAllVo.curriculumVo.package_no),
                $("input[name='packageName']").val(curriAllVo.curriculumVo.packageName),
                $("input[name='curriculum_no']").val(curriAllVo.curriculumVo.curriculum_no),
				$("input[name='curriName']").val(curriAllVo.curriculumVo.curriName),
				$("input[name='curriNickname']").val(curriAllVo.curriculumVo.curriNickname),
				$("input[name='startDate']").val(curriAllVo.curriculumVo.startDate),
				$("input[name='endDate']").val(curriAllVo.curriculumVo.endDate),
				$("input[name='testDate']").val(curriAllVo.curriculumVo.testDate),
				$("input[name='time']").val(curriAllVo.curriculumVo.time),
				$("input[name='maxCnt']").val(curriAllVo.curriculumVo.maxCnt),
				$("input[name='price']").val(curriAllVo.curriculumVo.price),
				$("input[name='support']").val(curriAllVo.curriculumVo.support),
				$("input[name='managerInfo']").val(curriAllVo.curriculumVo.managerInfo),
				$("input[name='gisuName']").val(curriAllVo.curriculumVo.gisuName),
            	$("input[name='state']").attr("checked",false), /* radio button 초기화 */
				$("input[name='state'][value="+curriAllVo.curriculumVo.state+"]").attr("checked",true)
				
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }
  	/* $(document).on("click", "#treeDemo", function(){
  		var curriculum_no = treeNode.web;
  		console.log(curriculum_no);
  		
  		$.ajax({
  			url : "${pageContext.request.contextPath}/curri/viewApplicantList/"+curriculum_no,
  			type : "POST",
  			data : {"curriculum_no" : curriculum_no},
  			dataType : "json",
  			async: false,
  			success : function(ApplicantVo){
  				console.log(ApplicantVo);
  				$("input[name = 'nameHan']").val(ApplicantVo.nameHan),
  				$("input[name = 'birthDate']").val(ApplicantVo.birthDate),
  				$("input[name = 'gender']").val(ApplicantVo.gender),
  				$("input[name = 'testResult']").val(ApplicantVo.testResult)
  			},
  			error : function(XHR, status, error){
  				console.error(status + " : " + error);
  			}
  		});
  	}); */
    //****************************************
    //**			현재 탭 유지					**
    //****************************************
    if (location.hash) {
        $('a[href=\'' + location.hash + '\']').tab('show');
    }
    var activeTab = localStorage.getItem('activeTab');
    if (activeTab) {
        $('a[href="' + activeTab + '"]').tab('show');
    }

    $('body').on('click', 'a[data-toggle=\'tab\']', function (e) {
        e.preventDefault()
        var tab_name = this.getAttribute('href')
        if (history.pushState) {
            history.pushState(null, null, tab_name)
        }
        else {
            location.hash = tab_name
        }
        localStorage.setItem('activeTab', tab_name)

        $(this).tab('show');
        return false;
    });

    $(window).on('popstate', function () {
        var anchor = location.hash ||
            $('a[data-toggle=\'tab\']').first().attr('href');
        $('a[href=\'' + anchor + '\']').tab('show');
    });
    //****************************************

    //달력1
    $("#date1").datepicker();
    //달력2
    $("#date2").datepicker();
    $("#date3").datepicker();

    $.datepicker.setDefaults({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
            '8월', '9월', '10월', '11월', '12월' ], //월 이름
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
            '7월', '8월', '9월', '10월', '11월', '12월' ], //
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        showMonthAfterYear : true,
        yearSuffix : '년',
        changeMonth : true,
        changeYear : true,
        dateFormat : "yy-mm-dd"
    });



</script>
<%--jqgrid사용시 삭제할것--%>


</html>
