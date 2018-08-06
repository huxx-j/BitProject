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
							<!-- 카테고리영역 -->
							<div class="col-xs-3">
								<div class="sub-box">
									<div class="cate-title">
										교육과정카테고리
									</div><!-- cate-title -->
									
									
									<div class = "bordered">
										<div class = "cate-toolbox-top clearfix">
											<button type = "button" id = "addcate" class = "btn btn-default btn-cate">추가</button>
											<button type = "button" class = "btn btn-default btn-cate pull-right">편집</button>
										</div><!-- /.cate-toolbox -->
										
										<div class = "scroll">
											<!-- 카테고리 메인영역 -->
											<div class = "cate-box">
												<div class = "" id = "">
													<ul id = "treeDemo_addCurri" class = "ztree"></ul>
												</div>
											</div><!-- /.cate-box -->
											<!-- /.카테고리 메인영역 -->
										</div><!-- /.scroll -->
										<div class = "cate-toolbox-bottom">
											<div class = "input-group input-group-sm">
												<input class = "form-control cate-search-input" type = "text">
												<span class = "input-group-btn">
													<button class = "btn btn-default btn-cate-search" type = "button">검색</button>
												</span>
											</div><!-- /.input-group input-group-sm -->
										</div><!-- /.cate-toolbox-bottom -->
									</div><!-- /.cate-outter bordered -->
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
										<div class = "tab-pane active" id = "tab_1_addCurri">
											<div class = "sub-box">
												<div class = "sub-body" id = "addCurriForm">
													<div class = "innerBox">
														<div class = "addCurriDiv">
															<!-- 탭 상단 -->
															<div class = "row">
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
																						<input type = "hidden" name = "curriculumCate_no"  style = "border:none;">
																						<select class = "form-control " id = "cateName" name = "cateName">
																							<option value = "국가기간">국가기간</option>
																							<option value = "핵심역량">핵심역량</option>
																							<option value = "방학단기">방학단기</option>
																						</select>
																					</td>
																					<th>선택패키지</th>
																					<td>
																						<input type = "hidden" name = "package_no"  style = "border:none;">
																						<input type = "form-control " readonly name = "packageName" style = "border : none; width : 60%;" >
																						<button type = "button" class = "btn btn-default btn-sm pull-right" data-toggle = "modal" data-target = "#packageViewModal">패키지보기</button>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div><!-- /.sub-box -->
																</div><!-- /.col-xs-12 -->
															</div><!--/.row --><!-- /.탭 상단 -->
															
															<div class = "space"></div>
															<div class = "row">
																<div class = "col-xs-12">
																	<div class = "sub-box">
																		<div class = "sub-title">
																			기본정보
																		</div><!-- /.sub-title -->
																		<div class = "sub-body">
																			<table class = "table table-condensed">
																				<tr>
																					<th>교육과정명</th>
																					<td colspan = "3">
																						<input type = "hidden"  name = "curriculum_no">
																						<input class = "form-control" type = "text"  name = "curriName">
																					</td>
																					<th>과목별명</th>
																					<td>
																						<input type = "text" class = "form-control" name = "curriNickname">
																					</td>
																				</tr>
																				<tr>
																					<th>시작일</th>
																					<td>
																						 <div class="input-group border-inputcolor ">
																					        <input type="text" class=" form-control border-none" name="startDate" id="startDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																					        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																				        </div>
																					</td>
																					<th>종료일</th>
																					<td>
																						 <div class="input-group border-inputcolor ">
																					        <input type="text" class=" form-control border-none" name="endDate" id="endDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																					        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																				        </div>
																					</td>
																				</tr>
																				<tr>
																					<th>강의시간</th>
																					<td colspan="3">
																						<input type="text" class="form-control" name = "time">
																					</td>
																					<th>정원</th>
																					<td>
																						<input type="text" class="form-control w140 pull-left" name = "maxCnt">명
																					</td>
																				</tr>
																				<tr>
																					<th>교육비용</th>
																					<td>
																						<input type="text" class="form-control" name = "price">
																					</td>
																					<th>교육비지원</th>
																					<td>
																						<input type="text" class="form-control" name = "support">
																					</td>
																					<th>문의</th>
																					<td>
																						<input type="text" class="form-control" name = "managerInfo">
																					</td>
																				</tr>
																				<tr>
																					<th>상태</th>
																					<td colspan="3">
																						<div class="radio-group">
																							<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="0">준비중</label>
																							<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="1">모집중</label>
																							<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="2">모집마감</label>
																							<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="3">수업중</label>
																							<label class="radiobox"><input id = "state" class="state" type="radio" name="state" value="4">종료</label>
																						</div>
																					</td>
																					<th>기수</th>
																					<td><input type="text" class="form-control " name = "gisuName"></td>
																				</tr>
																			</table>
																		</div><!-- /.sub-box -->
																		<div class = "sub-toolbox clearfix text-center">
																			<input type = "submit" class = "btn btn-primary" value = "저장" >
																			<a href = "${pageContext.request.contextPath }/curri">
																				<button type = "button" class = "btn btn-default pull-right" >취소</button>
																			</a>
																		</div><!-- /.sub-toolbox text-center -->
																	</div><!-- /.sub-box -->
																</div><!-- /.col-xs-12 -->
															</div><!-- /.tab_1 row2(1번탭 하단) -->
														</div><!-- /.addCurriDiv -->
													</div><!-- /.innerBox -->
												</div><!-- /.sub-body -->
											</div><!-- /.sub-box -->
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
//화면 로딩
	$(document).ready(function(){
	    var treeObj = $.fn.zTree.init($("#treeDemo_addCurri"), setting_addCurri, zNodes_addCurri);
	    console.log(treeObj);
	});
		
	//교육과정 카테고리 탭
	var setting_addCurri = {
		edit:{
			drag:{
				autoExpandTrigger:true,
				prev:dropPrev,
				inner:dropInner,
				next:dropNext
			},
			enable:true
		},
	    data: {
	        simpleData: {
	            enable: true,
	        }
	    },
	    callback: {
	        beforeClick: package,  // 마우스 클릭 콜백함수 지정
	        beforeDrag: beforeDrag,
	        beforeDrop: beforeDrop,
	        beforeDragOpen: beforeDragOpen,
	        onDrag: onDrag,
	        onDrop: onDrop,
	        onExpand: onExpand
	    },
	};
	
	var zNodes_addCurri= [
		  <c:forEach items="${cateList}" var="vo">
	      {id:${vo.curriculumCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
	      </c:forEach>
	      <c:forEach items="${list}" var="vo">
	      {id:${vo.curriculum_no},pId:${vo.curriculumCate_no},name:"${vo.curriName}",web:${vo.curriculum_no}},
	      </c:forEach>
	];
	
	function dropPrev(treeId, nodes, targetNode) {
	    var pNode = targetNode.getParentNode();
	    if (pNode && pNode.dropInner === false) {
	    return false;
	}
	else {
	    for (var i=0,l=curDragNodes.length; i<l; i++) {
	        var curPNode = curDragNodes[i].getParentNode();
	        if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
	            return false;
	        }
	    }
	}
	    return true;
	}
	
	function dropInner(treeId, nodes, targetNode) {
	    if (targetNode && targetNode.dropInner === false) {
	        return false;
	    } else {
	        for (var i=0,l=curDragNodes.length; i<l; i++) {
	            if (!targetNode && curDragNodes[i].dropRoot === false) {
	                return false;
	            } else if (curDragNodes[i].parentTId && curDragNodes[i].getParentNode() !== targetNode && curDragNodes[i].getParentNode().childOuter === false) {
	                return false;
	            }
	        }
	    }
	    return true;
	}
	
	function dropNext(treeId, nodes, targetNode) {
	    var pNode = targetNode.getParentNode();
	    if (pNode && pNode.dropInner === false) {
	        return false;
	    } else {
	        for (var i=0,l=curDragNodes.length; i<l; i++) {
	            var curPNode = curDragNodes[i].getParentNode();
	            if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
	                return false;
	            }
	        }
	    }
	    return true;
	}
	
	var log, className = "dark", curDragNodes, autoExpandNode;
	
	function beforeDrag(treeId, treeNodes) {
	    className = (className === "dark" ? "":"dark");
	    showLog("[ "+getTime()+" beforeDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length + " nodes." );
	    for (var i=0,l=treeNodes.length; i<l; i++) {
	        if (treeNodes[i].drag === false) {
	            curDragNodes = null;
	            return false;
	        } else if (treeNodes[i].parentTId && treeNodes[i].getParentNode().childDrag === false) {
	            curDragNodes = null;
	            return false;
	        }
	    }
	    curDragNodes = treeNodes;
	    return true;
	}
	
	function beforeDragOpen(treeId, treeNode) {
	    autoExpandNode = treeNode;
	    return true;
	}
	
	function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
	    className = (className === "dark" ? "":"dark");
	    showLog("[ "+getTime()+" beforeDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
	    showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"));
	    return true;
	}
	
	function onDrag(event, treeId, treeNodes) {
	    className = (className === "dark" ? "":"dark");
	    showLog("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length + " nodes." );
	}
	
	function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
	    className = (className === "dark" ? "":"dark");
	    showLog("[ "+getTime()+" onDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
	    showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
	}
	
	function onExpand(event, treeId, treeNode) {
	    if (treeNode === autoExpandNode) {
	        className = (className === "dark" ? "":"dark");
	        showLog("[ "+getTime()+" onExpand ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name);
	    }
	}
	
	function showLog(str) {
	    if (!log) log = $("#log");
	    log.append("<li class='"+className+"'>"+str+"</li>");
	    if(log.children("li").length > 8) {
	        log.get(0).removeChild(log.children("li")[0]);
	    }
	}
	
	function getTime() {
	    var now= new Date(),
	        h=now.getHours(),
	        m=now.getMinutes(),
	        s=now.getSeconds(),
	        ms=now.getMilliseconds();
	    return (h+":"+m+":"+s+ " " +ms);
	}
	function setTrigger() {
	    var zTree_addCurri = $.fn.zTree.getZTreeObj("treeDemo_addCurri");
	    zTree_addCurri.setting.edit.drag.autoExpandTrigger = $("#callbackTrigger").attr("checked");
	}
	
	<!--이름수정, 삭제용-->
	function setEdit() {
	    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	        remove = $("#remove").attr("checked"),
	        rename = $("#rename").attr("checked"),
	        removeTitle = $.trim($("#removeTitle").get(0).value),
	        renameTitle = $.trim($("#renameTitle").get(0).value);
	    zTree.setting.edit.showRemoveBtn = remove;
	    zTree.setting.edit.showRenameBtn = rename;
	    zTree.setting.edit.removeTitle = removeTitle;
	    zTree.setting.edit.renameTitle = renameTitle;
	    console.log(['setting.edit.showRemoveBtn = ' + remove, 'setting.edit.showRenameBtn = ' + rename,
	        'setting.edit.removeTitle = "' + removeTitle +'"', 'setting.edit.renameTitle = "' + renameTitle + '"']);
	}
	
	<!--이름수정, 삭제용-->
	function showCode(str) {
	    var code = $("#code");
	    code.empty();
	    for (var i=0, l=str.length; i<l; i++) {
	        code.append("<li>"+str[i]+"</li>");
	    }
	}


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


    //달력1
    $("#startDate").datepicker();
    //달력2
    $("#endDate").datepicker();
    $("#testDate").datepicker();

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
