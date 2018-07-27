<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>TCOMS ver2</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta
			content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
			name="viewport">
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
	<%--jqgrid 사용하는 페이지용 스크립트 임포트 태그(마지막에 스크립트 임포트 태그는 삭제할것--%>

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper"><!-- Content Header (Page header) -->
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
		<section class="content">
			<div class="row" id = "row-1">
				<div class="col-xs-12">
					<div class="box box-body">
						<div class="row" id = "row-2">
							<!-- 카테고리영역 -->
							<div class="col-xs-3">
								<!-- nav_bar영역 -->

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
													<ul id="treeDemo" class="ztree"></ul>
												</div><!-- /.row -->

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
								<!-- nav_bar -->
							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 -->
							<!-- 교육과정 정보영역 -->
							<div class="col-xs-9">
								<!--탭 박스 외곽 -->
								<div class="nav-tabs-custom">
									<!-- 상단탭영역 -->
									<ul class="nav nav-tabs" id="curri-nav-tab">
										<li class="active"><a href="#tab_1" data-toggle="tab">교육과정 정보</a></li>
										<%-- 																				<li class = "active"><a href = "${pageContext.request.contextPath }/curri/curriInfo" >교육과정 정보</a></li> --%>
										<li class=""><a href="#tab_2" data-toggle="tab">홈페이지관리</a></li>
										<li class=""><a href="#tab_3" data-toggle="tab">교육생관리</a></li>
										<%-- 																				<li class = ""><a href = "${pageContext.request.contextPath }/curri/student" >교육생관리</a></li> --%>
										<li class=""><a href="#tab_4" data-toggle="tab">강사배정</a></li>
										<li class=""><a href="#tab_5" data-toggle="tab">강의실배정</a></li>
										<div class="sub-toolbox text-center">
											<a href="${pageContext.request.contextPath }/curri/addCurriBtn">
												<button type="button" class="btn btn-default pull-right" id="addCurriBtn">교육과정 추가</button>
											</a>
										</div>
									</ul>
									<!-- /.상단탭영역 -->
									<!-- /.탭내용박스 -->
									<div class="tab-content">
										<!-- 1번탭내용 -->
										<div class="tab-pane active" id="tab_1">
											<form action = "${pageContext.request.contextPath }/curri/edit/${curriculum_no}" method = "post">
												<div class="row">
													<!-- 1번탭내용 -->
													<table class="table table-condensed">
														<colgroup>
															<col class="col-xs-2" />
															<col class="col-xs-3" />
															<col class="col-xs-2" />
															<col class="col-xs-5" />
														</colgroup>
														<tbody>
														<tr>
															<th>업무구분</th>
															<td><select class="form-control input-sm" name = "workType">
																<option>국가기간</option>
																<option>국가기간</option>
																<option>국가기간</option>
															</select></td>
															<th>선택패키지</th>
															<!-- 																	<td><input type = "text" readonly value = "1" name = "package_no" style = " border:none;"> -->
															<!-- 																		<button type="button" class="btn btn-default btn-cate btn-lg pull-right" id="myBtn">패키지보기</button> -->
															<!-- 																	</td> -->
															<!-- MODAL -->
															<td><input type = "text" readonly value = "1" name = "package_no" style = " border:none;">
																<button type="button" class="btn btn-default btn-cate btn-lg pull-right" data-toggle = "modal" data-target="#packageViewModal">패키지보기</button>
															</td>
														</tr>
														</tbody>
													</table>


													<%-- 													<c:import url="/WEB-INF/views/screening/packageView_modal.jsp"></c:import> --%>
													<div class = "modal fade" id = "packageViewModal" tabindex = "-1" role = "dialog" aria-labelledby = "packageViewModalLabel" aria-hidden = "true">
														<div class = "modal-dialog">
															<div class = "modal-content">
																<div class = "modal-header">
																	<button type = "button" class = "close" data-dismiss = "modal">
																		<span aria-hidden = "true">x</span>
																		<span class = "sr-only">Close</span>
																	</button>
																	<h4 class = "modal-title" id = "packageViewModalLabel">Modal Title</h4>
																</div>
																<div class = "modal-body">
																	<div class = "nav-tabs-custom">
																		<ul class = "nav nav-tabs">
																			<li class = "active"><a href = "#packageViewTab_1" data-toggle = "tab">카테고리</a></li>
																			<li class = ""><a href = "#packageViewTab_2" data-toggle = "tab">검색</a></li>
																		</ul>
																		<div class = "tab-content">
																			<div class = "tab-pane active" id = "packageViewTab_1">
																				<div class="row">
																					<ul class="side-bar test" data-widget="tree">
																						<li class="treeview"> <a href="#"> <i class="fa fa-sort-down"></i> <span>웹과정</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
																							<ul class="treeview-menu">
																								<li class="treeview"> <a href="#"><i class="fa fa-minus"></i>자바 스프링 파이썬 960<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a></li>
																								<li class="treeview"> <a href="#"><i class="fa fa-minus"></i>자바 스프링 파이썬 720<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a></li>
																								<li class="treeview"> <a href="#"><i class="fa fa-minus"></i>자바 스프링 오라클 720<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a></li>
																							</ul>
																						</li>
																						<li class="treeview"> <a href="#"> <i class="fa fa-sort-down"></i> <span>윈도우과정</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
																							<ul class="treeview-menu">
																								<li><a href="#"><i class="fa fa-minus"></i>자바 스프링 Node 960</a></li>
																							</ul>
																						</li>
																						<li class = "treeview"><a href = "#"><i class = "fa fa-sort-down"></i><span>JSP과정<span class = "pull-right-container "><i class = "fa fa-angle-left pull-right"></i></span></span></a>
																							<ul class = "treeview-menu">
																								<li class = "treeview"><a href = "#"><i class = "fa fa-minus"></i>자바 스프링 Node 960</a></li>
																							</ul>
																						</li>
																					</ul>
																				</div><!-- /.tab-pane -->

																			</div>
																		</div>
																	</div>
																</div>
																<div class = "modal-footer">
																	<button type = "button" class = "btn btn-default" style = "padding : 2px 5px ; margin : auto;" >선택</button>
																	<button type = "button" class = "btn btn-default" data-dismiss = "modal" style = "padding : 2px 5px ;">취소</button>
																</div>
															</div>
														</div>
													</div>
													<!--모달 끝 -->

												</div>
												<!-- 1번 탭 /.row -->
												<div class="row">
													<div class="sub-box">
														<!-- /////////////////////////////////////////////////////////////////////////////// -->
														<div class="sub-title" style="padding: 10px 0 0 0;">
															기본정보
														</div>
														<!-- /.sub-title -->
														<table class="table table-condensed">
															<form action="" method="get" id="addCurriForm">
																<tr>
																	<th>교육과정명</th>
																	<td colspan="3">
																		<input type = "hidden" type = "text" value = "${curri.curriculum_no }">
																		<input class="form-control input-sm" type="text" style="width: 98%;" name = "curriName" <%-- value="${curri.curriName }" --%>>
																	</td>
																	<th>과목별명</th>
																	<td>
																		<input type="text" class="form-control input-sm" style="width: 98%;" name = "curriNickname"<%--  value = "${curri.curriNickname }" --%>>
																	</td>
																</tr>
																<tr>
																	<th>시작일</th>
																	<td>
																		<div class="input-group" class = "form-control input-sm" style="border: 1px solid #c2c2c2">

					                                                                <span class="input-group-btn">
					                                                                    <button type="button" class="btn" data-toggle="datepicker" style="border: none;  background-color: rgba(255,255,255,0)"  id="testDatepicker">
					                                                                    <label for="date2"><i class="fa fa-calendar"></i></label>
				                                                                   		</button>
					                                                                </span>
																			<input type="text" class="form-control input-sm pull-right" name="periodFr" id="date2"  data-select="datepicker" style="border: none; width:300px;">
																		</div>

																	</td>
																	<th>종료일</th>
																	<td>
																		<div class="input-group date">
																			<input type="date" class="form-control input-sm pull-right" id="datepicker" name = "periodTo" <%-- value="${curri.periodTo }" --%>>
																			<div class="input-group-addon input-sm">
																				<i class="fa fa-calendar"></i>
																			</div>

																		</div>
																	</td>
																	<th>전형일(개강일)</th>
																	<td>
																		<div class="input-group date">
																			<input type="date" class="form-control input-sm pull-right" id="datepicker" name = "startDay" <%-- value="${curri.startDay }" --%>>
																			<div class="input-group-addon input-sm">
																				<i class="fa fa-calendar"></i>
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th>강의시간</th>
																	<td colspan="3">
																		<input type="text" class="form-control input-sm " style="width: 98%;" name = "time" <%-- value="${curri.time }" --%>>
																	</td>
																	<th>정원</th>
																	<td>
																		<input type="text" class=" input-xs " name = "num"<%--  value="${curri.num }" --%>>명
																	</td>
																</tr>
																<tr>
																	<th>교육비용</th>
																	<td>
																		<input type="text" class="form-control input-sm" name = "money"<%--  value="${curri.money }" --%>>
																	</td>
																	<th>교육비지원</th>
																	<td>
																		<input type="text" class="form-control input-sm" name = "support" <%-- value="${curri.support }" --%>>
																	</td>
																	<th>문의</th>
																	<td>
																		<input type="text" class="form-control input-sm" name = "inquiry" <%-- value="${curri.inquiry }" --%>>
																	</td>
																</tr>
																<tr>
																	<th>상태</th>
																	<td colspan="3"><label class="form-controll-static"><input class="" type="radio" name="state" value="준비중" ${curri.state == '준비중'?'checked':'' }>준비중</label>
																		<label class="form-controll-static"><input class="" type="radio" name="state" value="모집중" ${curri.state == '모집중'?'checked':'' }>모집중</label>
																		<label class="form-controll-static"><input class="" type="radio" name="state" value="모집마감" ${curri.state == '모집마감'?'checked':'' }>모집마감</label>
																		<label class="form-controll-static"><input class="" type="radio" name="state" value="수업중" ${curri.state == '수업중'?'checked':'' }>수업중</label>
																		<label class="form-controll-static"><input class="" type="radio" name="state" value="종료" ${curri.state == '종료'?'checked':'' }>종료</label>
																	</td>
																	<th>기수</th>
																	<td><input type="text" class="form-control input-sm" value = "${curri.gisuName }"></td>
																</tr>
															</form>
														</table>
														<div class="sub-toolbox text-center">
															<!-- 																<button type="button" class="btn btn-primary" >수정</button> -->
															<input type = "submit" class = "btn btn-primary" value = "수정" >
														</div>
														<!-- /////////////////////////////////////////////////////////////////////////////// -->
													</div><!-- /.sub-box -->
													<!-- 																	            				</div>/.col-xs-12 -->
												</div><!-- /.row -->
											</form>
										</div>
										<!-- /.1번탭내용 tab-pane active -->
										<!-- 2번탭내용 -->
										<div class="tab-pane" id="tab_2">
											<div class = "row">
												<table class = "table table-condensed">
													<tr>
														<th>교육과정명</th>
														<td class = "col-xs-10">${curri.curriName }</td>
													</tr>
												</table>
											</div><!-- /.tab2 row1 -->
											<div class = "row" style = "padding : 10px 0 0 0;">
												<table class = "table table-condensed">
													<tr>
														<th class = "col-xs-1">메인페이지</th>
														<td class = "col-xs-5">
															<label class="form-controll-static"><input class="" type="radio" name="mainViewFlag" value="노출" <%-- ${ == '0'?'checked':'' } --%>>노출</label>
															<label class="form-controll-static"><input class="" type="radio" name="mainViewFlag" value="숨김" <%-- ${ == '1'?'checked':'' } --%>>숨김</label>
															<button type="button" class="btn btn-default btn-cate btn-lg pull-right" id="myBtn">미리보기</button>
														</td>
														<th class = "col-xs-1">상세페이지</th>
														<td class = "col-xs-5">
															<label class="form-controll-static"><input class="" type="radio" name="detailViewFlag" value="노출" <%-- ${ == '0'?'checked':'' } --%>>노출</label>
															<label class="form-controll-static"><input class="" type="radio" name="detailViewFlag" value="숨김" <%-- ${ == '1'?'checked':'' } --%>>숨김</label>
															<button type="button" class="btn btn-default btn-cate btn-lg pull-right" id="myBtn">미리보기</button>
														</td>
													</tr>

												</table>

											</div>
										</div><!-- /.tab_2 -->



										<!-- 3번탭내용 -->
										<div class="tab-pane" id="tab_3">
											<div class="row">
												<table class="table table-condensed">
													<tr>
														<th>교육과정명</th>
														<td class="col-xs-10">${curri.curriName }</td>
													</tr>
												</table>
											</div>
											<!-- /.row -->
											<div class="row">
												<div class="sub-title" style="padding: 10px 0 0 0;">
													기수부여
												</div>
												<div class="sub-box col-xs-5 curriBox">
													<div class="sub-box">
														<div class="sub-title" style="padding: 10px 0 0 0;">
															전체지원자리스트
														</div>
														<table class="table table-condensed">
															<tr>
																<th>이름</th>
																<th>생년월일</th>
																<th>성별</th>
																<th>전형결과</th>
																<th>선택</th>
															</tr>
															<c:forEach items="${applicantList }" var="applicantList">
																<tr>
																	<td>${applicantList.nameHan }</td>
																	<td>${applicantList.birthDate }</td>
																	<td>${applicantList.gender }</td>
																	<td>${applicantList.testResult }</td>
																	<td>
																		<label class="form-controll-static ">
																			<input class="" type="checkbox" name="gisuGrant" value="">
																		</label>
																	</td>
																</tr>
															</c:forEach>
														</table>
													</div>
													<!-- /.sub-box -->
												</div>
												<%-- 													<form action = "${pageContext.request.contextPath }/curri/gisuGrant" method = "post"> --%>
												<!-- 														<div class = "sub-box col-xs-2" style = "vertical-align: middle; text-align: center; padding : 150px 0 0 0;"> -->
												<!-- 															<label><input type = "button" class = "btn btn-default" value = ">"></label> -->
												<%-- 															<label style = "padding : 50px 0 0 0;"><input type = "button" class = "btn btn-default" value = "<" ></label> --%>
												<!-- 														</div> -->
												<!-- 													</form> -->
												<!-- /.sub-box col-xs-6 -->
												<div class="sub-box col-xs-5 pull-right curriBox">
													<div class="sub-box">
														<div class="sub-title" style="padding: 10px 0 0 0;">
															수강생리스트
														</div>
														<table class="table table-condensed">
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
																<td><label class="form-controll-static "><input
																		class="" type="checkbox" name="state" value=""></label>
																</td>
															</tr>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td><label class="form-controll-static "><input class="" type="checkbox" name="state" value=""></label>
																</td>
															</tr>
														</table>
														<!-- 수강생리스트 table -->
													</div>
												</div>
											</div><!-- /.row -->
											<div class="sub-toolbox text-center">
												<button type="button" class="btn btn-primary">저장</button>
											</div> <!-- /.sub-toolbox text-center -->
										</div><!-- /.tab_3 -->


										<!-- 4번탭내용 -->
										<div class="tab-pane" id="tab_4">
											<div class="row">
												<table class="table table-condensed">
													<tr>
														<th>교육과정명</th>
														<td class="col-xs-10">${curri.curriName }</td>
													</tr>
												</table>
											</div>
										</div><!-- /.tab_4 -->


										<!-- 5번탭내용 -->
										<div class="tab-pane" id="tab_5">
											<div class="row">
												<table class="table table-condensed">
													<tr>
														<th>교육과정명</th>
														<td class="col-xs-10">${curri.curriName }</td>
													</tr>
												</table>
											</div>
										</div><!-- /.tab_5 -->
									</div><!-- /.tab content -->
								</div><!-- /.nav-tabs-custom 탭박스영역 -->
							</div><!-- col-xs-9 -->
						</div><!-- row-2 -->
					</div><!-- /.box box-body -->
				</div><!-- /.col-xs-12 -->
			</div><!-- /.row-1 -->
		</section>
	</div><!-- content-wrapper -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>
<%-- <c:import url="/WEB-INF/views/includes/script.jsp"></c:import> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript">
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
        <c:forEach items="${cateList}" var="vo">
        {id:${vo.curriculumCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
        </c:forEach>
        <c:forEach items="${list}" var="vo">
        {id:${vo.curriculum_no},pId:${vo.curriculumCate_no},name:"${vo.curriName}",web:${vo.curriculum_no}},
        </c:forEach>
    ];

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    function package(treeId, treeNode, clickFlag) {
        var curriculum_no=treeNode.web;
        console.log(curriculum_no);
        $.ajax({
            url : "${pageContext.request.contextPath }/curri/"+curriculum_no,
//	        url : "${pageContext.request.contextPath }/curri/curriAjax",
            type : "POST",
            //contentType : "application/json",
            data : {"curriculum_no": curriculum_no},
            dataType : "json",
            success : function(CurriculumVo) {
                console.log(CurriculumVo);
                $("input[name='curriculum_no']").val(CurriculumVo.curriculum_no),
                    $("input[name='curriName']").val(CurriculumVo.curriName),
                    $("input[name='curriNickname']").val(CurriculumVo.curriNickname),
                    $("input[name='periodFr']").val(CurriculumVo.periodFr),
                    $("input[name='periodTo']").val(CurriculumVo.periodTo),
                    $("input[name='startDay']").val(CurriculumVo.startDay),
                    $("input[name='time']").val(CurriculumVo.time),
                    $("input[name='num']").val(CurriculumVo.num),
                    $("input[name='money']").val(CurriculumVo.money),
                    $("input[name='support']").val(CurriculumVo.support),
                    $("input[name='inquiry']").val(CurriculumVo.inquiry),
                    $("input:radio[name=state]:input[value='+state+']").attr("checked",true),
                    $("input[name='gisuName']").val(CurriculumVo.gisuName)
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }
    // 	$("#viewCurriInfo").on("click", function(){
    // 		console.log("[viewCurriInfo] IN");

    // 		/* 데이터 모으기 */
    // 		var curriculum_no = $("[name = curriculum_no]").val();
    // 		console.log(curriculum_no);
    // 		/* 리스트 요청 ajax */
    // 		$.ajax({

    // 			url : "${pageContext.request.contextPath }/WEB-INF/views/screening/includes/nav_bar.jsp",
    // 			type : "get",
    // 			/* contentType : "application/json" */
    // 	 		data : {curriculum_no : curriculum_no},
    // 			/* data : JSON.stringify(guestbookVo), */
    // 			dataType : "json",
    // // 			cache : false,
    // 			success : function(data){ //guestbookList가 apiGuestbookController의 guestbookList랑 같은 애는 아님.
    // 				/*성공시 처리해야될 코드 작성*/
    // 				console.log(data);
    // 			},
    // 			error : function(XHR, status, error) {
    // 				console.error(status + " : " + error);
    // 			}
    // 		});
    // 	});
    // });


    // // 체크박스//
    // function selectDelRow() {

    // 	var chk = document.getElementsByName("del_unit[]"); // 체크박스객체를 담는다
    // 	var len = chk.length;    //체크박스의 전체 개수
    // 	var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
    // 	var checkCnt = 0;        //체크된 체크박스의 개수
    // 	var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
    // 	var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
    // 	var cnt = 0;

    // 	for(var i=0; i<len; i++){
    // 		if(chk[i].checked == true){
    // 			checkCnt++;        //체크된 체크박스의 개수
    // 			checkLast = i;     //체크된 체크박스의 인덱스
    // 		}
    // 	}

    // 	for(var i=0; i<len; i++){

    // 		if(chk[i].checked == true){  //체크가 되어있는 값 구분

    // 			checkRow = chk[i].value;



    // 			if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,

    // 			rowid += "'"+checkRow+"'";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)

    // 			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,

    // 			if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,

    // 			rowid += "'"+checkRow+"'";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)

    // 			}else{

    // 			rowid += "'"+checkRow+"',";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)

    // 			}
    // 		}
    // 		cnt++;

    // 		checkRow = '';    //checkRow초기화.

    // 	}
    // 	alert(rowid);    //'value1', 'value2', 'value3' 의 형태로 출력된다.

    // }
    //////////////////////////////////////////////////////////////////////////

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
