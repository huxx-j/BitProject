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
													<ul id = "treeDemo2" class = "ztree"></ul>
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
									</ul><!-- /.nav nav-tabs -->
									<!-- /.상단 탭 영역 끝 -->
									<!-- 탭 내용 박스 -->
									<div class = "tab-content">
										<!-- 1번 탭 내용 -->
										<div class = "tab-pane active" id = "tab_1">
											<form action = "${pageContext.request.contextPath }/curri/addCurri" method = "post">
												<!-- 1번탭 상단 -->
												<div class = "row"><!-- tab_1 row1 -->
													<div class = "col-xs-12">
														<div class = "sub-box">
															<table class = "table table-condensed">
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
																			<select class = "form-control input-sm" id = "workType" name = "workType">
																				<option value = "국가기간">국가기간</option>
																				<option value = "핵심역량">핵심역량</option>
																				<option value = "방학단기">방학단기</option>
																			</select>
																		</td>
																		<th>선택패키지</th>
																		<td>
																			<input type = "hidden" name = "package_no" style = "border:none;">
																			<input type = "form-control input-sm" readonly name = "packageName" style = "border:none; width : 60%;" >
																			<button type = "button" class = "btn btn-default btn-cate btn-lg pull-right" data-toggle = "modal" data-target = "#packageViewModal">패키지보기</button>
																		</td>
																	</tr>
																</tbody>
															</table>
															
															<!-- 모달 시작! -->
															<div class = "modal fade" id = "packageViewModal" tabindex = "-1" role = "dialog" aria-labelledby ="packageViewModalLabel" aria-hidden = "true" style = "overflow-y : scroll; overflow-x : hidden;">
																<div class = " modal-dialog">
																	<div class = "modal-content">
																		<div class = "modal-header">
																			<button type = "button" class = "close" data-dismiss = "modal">
																				<span aria-hidden = "true">x</span>
																				<span class = "sr-only">Close</span>
																			</button>
																			<h4 class = "modal-title" id = "packageViewModalLabel">패키지선택</h4>
																		</div><!-- /.modal-header -->
																		<div class = "modal-body">
																			<div class = "scroll">
																				<div class = "tab-content-custom" style = "height : 500px;">
																					<div class "row">
																						<ul id = "treeDemo2" class = "ztree"></ul>
																					</div><!-- /.row -->
																				</div><!-- /.tab-content-custom -->
																			</div><!-- /.modal scroll -->
																		</div><!-- /.modal-body -->
																		<div class = "modal-footer">
																			<button type = "button" class = "btn btn-default" style = "padding: 2px 5px; margin : auto;">선택</button>
																			<button type = "button" class = "btn btn-default " data-dismiss = "modal" style = "padding : 2px 5px;">취소</button>
																		</div><!-- /.modal-footer -->
																	</div><!-- /.modal-content -->
																</div><!-- /.modal-dialog -->
															</div><!-- /.modal-fade -->
															<!-- /.모달 끝 --> 
														</div><!-- /.sub-box -->
													</div><!-- /.col-xs-12 -->	
												</div><!-- /.tab_1 row1(1번탭 상단) -->
												
												<div class = "row">
													<div class = "col-xs-12">
														<div class = "sub-box">
															<div class = "sub-title" style = "padding : 10px 0 0 0;">
																기본정보
															</div><!-- /.sub-title -->
															<div class = "sub-box">
																<table class = "table table-condensed">
																	<tr>
																		<th>교육과정명</th>
																		<td colspan = "3">
																			<input type = "hidden" type = "text" name = "curriculum_no">
																			<input class = "form-control input-sm" type = "text" style = "width : 98%;" name = "curriName">
																		</td>
																		<th>과목별명</th>
																		<td>
																			<input type = "text" class = "form-control input-sm" style = "width : 98%;" name = "curriNickname">
																		</td>
																	</tr>
																	<tr>
																		<th>시작일</th>
																		<td>
																			<div class="input-group" class = "form-control input-sm" style="border: 1px solid #d2d6de">
																				<input type="text" class="form-control input-sm " name="startDate" id="date2"  data-select="datepicker" style="border: none; ">
				                                                                <span class="input-group-btn">
				                                                                    <button type="button" class="btn" data-toggle="datepicker" style="border: none;  background-color: rgba(255,255,255,0)"  id="testDatepicker">
				                                                                   		<label for="date2"><i class="fa fa-calendar"></i></label>
			                                                                   		</button>
				                                                                </span>
	
																			</div>
																		</td>
																		<th>종료일</th>
																		<td>
																			<div class="input-group" class = "form-control input-sm" style = "border : 1px solid #d2d6de">
																				<input type="text" class="form-control input-sm " name="endDate" id="date1"  data-select="datepicker" style="border: none; ">
																				<span class="input-group-btn">
				                                                                    <button type="button" class="btn" data-toggle="datepicker" style="border: none;  background-color: rgba(255,255,255,0)"  id="testDatepicker">
				                                                                    	<label for="date1"><i class="fa fa-calendar"></i></label>
			                                                                   		</button>
				                                                                </span>
	
																			</div>
																		</td>
																		<th>전형일</th>
																		<td>
																			<div class="input-group" class = "form-control input-sm" style = "border : 1px solid #d2d6de">
																				<input type="text" class="form-control input-sm " name="testDate" id="date3"  data-select="datepicker" style="border: none; ">
																				<span class="input-group-btn">
				                                                                    <button type="button" class="btn" data-toggle="datepicker" style="border: none;  background-color: rgba(255,255,255,0)"  id="testDatepicker">
				                                                                    	<label for="date3"><i class="fa fa-calendar"></i></label>
			                                                                   		</button>
				                                                                </span>
	
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
																			<input type="text" class="form-control input-sm " style = "float:left; width : 150px;"name = "maxCnt"<%--  value="${curri.num }" --%>>명
																		</td>
																	</tr>
																	<tr>
																		<th>교육비용</th>
																		<td>
																			<input type="text" class="form-control input-sm" name = "price"<%--  value="${curri.money }" --%>>
																		</td>
																		<th>교육비지원</th>
																		<td>
																			<input type="text" class="form-control input-sm" name = "support" <%-- value="${curri.support }" --%>>
																		</td>
																		<th>문의</th>
																		<td>
																			<input type="text" class="form-control input-sm" name = "managerInfo" <%-- value="${curri.inquiry }" --%>>
																		</td>
																	</tr>
																	<tr>
																		<th>상태</th>
																		<td colspan="3"><label class="form-controll-static"><input class="" type="radio" name="state" value="준비중" <%-- ${curri.state == '준비중'?'checked':'' } --%>>준비중</label>
																			<label class="form-controll-static"><input class="" type="radio" name="state" value="모집중" <%-- ${curri.state == '모집중'?'checked':'' } --%>>모집중</label>
																			<label class="form-controll-static"><input class="" type="radio" name="state" value="모집마감" <%-- ${curri.state == '모집마감'?'checked':'' } --%>>모집마감</label>
																			<label class="form-controll-static"><input class="" type="radio" name="state" value="수업중" <%-- ${curri.state == '수업중'?'checked':'' } --%>>수업중</label>
																			<label class="form-controll-static"><input class="" type="radio" name="state" value="종료" <%-- ${curri.state == '종료'?'checked':'' } --%>>종료</label>
																		</td>
																		<th>기수</th>
																		<td><input type="text" class="form-control input-sm" name = "gisuName"></td>
																	</tr>
																</table>
															</div><!-- /.sub-box -->
														</div><!-- /.sub-box -->
													</div><!-- /.col-xs-12 -->
												</div><!-- /.tab_1 row2(1번탭 하단) -->
															<div class = "sub-toolbox text-center">
																<input type = "submit" class = "btn btn-primary" value = "저장" >
																<a href = "${pageContext.request.contextPath }/curri">
																	<button type = "button" class = "btn btn-default pull-right" >취소</button>
																</a>
															</div><!-- /.sub-toolbox text-center -->
											</form><!-- /.tab_1 form -->
										</div><!-- /.tab_1 -->
										<!-- /.1번탭 -->
										
										
										
									</div><!-- /.tab-content -->
									<!-- /.탭 내용 박스 끝 -->
								</div><!-- /.nav-tabs-custom -->
								<!-- 탭 박스 외곽 끝 -->
							</div><!-- col-xs-9 -->
							<!-- /.교육과정 정보 영역 끝 -->
							
							
						</div><!-- /.row -->
					</div>
				</div>
			
			</div>
		
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
        $.fn.zTree.init($("#treeDemo2"), setting, zNodes);
    });

    function package(treeId, treeNode, clickFlag) {
        var curriculum_no=treeNode.web;
        console.log(curriculum_no);
        $.ajax({
            url : "${pageContext.request.contextPath }/curri/"+curriculum_no,
            type : "POST",
            data : {"curriculum_no": curriculum_no},
            dataType : "json",
            success : function(CurriculumVo) {
                console.log(CurriculumVo);
                $("#workType").val(CurriculumVo.workType).prop("selected",true),
                $("input[name='package_no']").val(CurriculumVo.package_no),
                $("input[name='packageName']").val(CurriculumVo.packageName),
                $("input[name='curriculum_no']").val(CurriculumVo.curriculum_no),
				$("input[name='curriName']").val(CurriculumVo.curriName),
				$("input[name='curriNickname']").val(CurriculumVo.curriNickname),
				$("input[name='startDate']").val(CurriculumVo.startDate),
				$("input[name='endDate']").val(CurriculumVo.endDate),
				$("input[name='testDate']").val(CurriculumVo.testDate),
				$("input[name='time']").val(CurriculumVo.time),
				$("input[name='maxCnt']").val(CurriculumVo.maxCnt),
				$("input[name='price']").val(CurriculumVo.price),
				$("input[name='support']").val(CurriculumVo.support),
				$("input[name='managerInfo']").val(CurriculumVo.managerInfo),
				$("input[name='gisuName']").val(CurriculumVo.gisuName),
				$("input[name='state'][value="+CurriculumVo.state+"]").attr("checked",true)
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
