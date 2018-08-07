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
									<!-- <div class="cate-title">
										패카지카테고리
									</div> --><!-- cate-title -->

									<div class="bordered">

										<div class="cate-toolbox-top clearfix">
											<button type="button" id="addcate" class="btn btn-default btn-cate pull-right">추가</button>
											<button type="button" class="btn btn-default btn-cate pull-right">편집</button>
										</div><!-- /.cate-toolbox -->

										<div class="scroll">

											<!-- 카테고리 메인영역 -->
											<div class="cate-box">
												<div class="" id="">

													<ul id="treeDemo" class="ztree">

													</ul>
												</div>

											</div>
											<!-- /.카테고리 메인영역 -->


										</div><!-- /.scroll -->

										<div class="cate-toolbox-bottom">
											<div class="input-group input-group-sm">
												<input class="form-control cate-search-input" type="text">
												<span class="input-group-btn">
		                     							<button class="btn btn-default btn-cate-search" type="button">검색</button>
		                   						</span>
											</div>
										</div><!-- /.cate-toolbox -->
									</div><!-- /.bordered -->

								</div><!-- /.sub-box -->

							</div><!-- /.col-xs-3 -->
							<!-- /.카테고리영역 -->

							<!-- 과목정보영역 -->
							<div class="col-xs-9">

								<!--탭 박스 외곽 -->
								<div class="nav-tabs-custom">

									<!-- 상단탭영역 -->
									<ul class="nav nav-tabs" id="packageTab">
										<li class="active"><a href="#tab_1" data-toggle="tab">패키지 개요</a></li>
										<li class=""><a href="#tab_2" data-toggle="tab">구성 과목</a></li>
										<button id="btnAddPackage" class="btn btn-default btn-sm pull-right" type="button">패키지 추가</button>
									</ul>

									<!-- /.상단탭영역 -->

									<!-- /.탭내용박스 -->
									<div class="tab-content">
										<!-- 1번탭내용 -->
										<div class="tab-pane active" id="tab_1">
											<form id="package" name="package" method="get">
											<div class="sub-box">
												<div class="sub-body">
														<table class="table table-condensed">
															<colgroup>
																<col width="120px" />
																<col width="480px" />
																<col width="120px" />
																<col width="" />
															</colgroup>

															<tbody>
															<tr>
																<th>패키지사용여부</th>
																<td colspan="3">
																	<div class="radio-group">
																		<label class="radiobox"><input class="" type="radio" name="UseStatus" value="0">준비중</label>
																		<label class="radiobox"><input class="" type="radio" name="UseStatus" value="1">모집중</label>
																	</div>
																</td>
															</tr>
															<tr>
																<th>패키지카테고리</th>
																<td colspan="3">
																	<select name ="strPackageCate_no" class="form-control">
																		<c:forEach items="${packcatelist}" var="vo">
																			<option value='${vo.packageCate_no}'>${vo.cateName}</option>
																		</c:forEach>
																	</select>
																</td>
															</tr>
															<tr>
																<th>패키지명</th>
																<td><input name="PackageName" class="form-control" type="text" placeholder="" ></td>
																<th>총 시간</th>
																<td class="form-inline"><input name="TotalTime" class="form-control w60" type="text" placeholder=""><span> 시간</span>
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

												</div><!-- /.sub-body -->

												<div class="sub-toolbox clearfix text-center">
													<div id="button">
													<div id="inner-button">
													<input type="button" value="저장" id="addpackage" class="btn btn-primary" onclick="javascript_:addPackage();">
													</div>
													</div>
												</div>
											</div><!-- /.sub-box -->
											</form>
										</div>
										<!-- /.1번탭내용 -->

										<!-- 2번탭내용 -->
										<div class="tab-pane" id="tab_2">
											<div class="sub-body">

													<!-- 2번메뉴내용 -->
												<form id="subject" name="subject" method="post" action="${pageContext.request.contextPath}/package/addStep">
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
															<td name='PackageName' style="width : 400px" colspan="3" value="">
																<input name="PackageNameInStep" type="text" readonly style="border: none; width: 500px">
															</td>
															<th style="width : 100px" colspan="2">총 교육시간</th>
															<td name='TotalTime' style="width : 200px" value="">
																<input name="Time" type="text"  style="width: 35px; border: none" readonly>/<input name="TotalTimeInStep" type="text"  readonly style="border: none;width: 35px">시간
															</td>
														</tr>
														</tbody>
													</table>

													<br>
													<button  id="btnAddstep" style="margin-bottom:5px; float: right" class="btn btn-default pull-right" type="button">단계 추가</button>
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
															<input type="text" name ="steplist[0].Package_no">
															<input type='text' name="steplist[0].Level" value="1">
															<tr >
																<td style="text-align: center">1단계</td>
																<td colspan="3" >
																	<input type="text" name="steplist[0].StepName" style="width: 800px">
																</td>
																<td style="width: 50px">
																	<button  id='btnAddsubject' class="btn btn-default pull-right" type="button" data-step="0" data-sub="0">추가</button>
																</td>
															</tr>
															<tr id="subject-item0" style="height: 150px">
																<td></td>
																<td>
																	<input type="text" name="SubjectName00" style="border: none" readonly>
																	<input type="text" name="steplist[0].sublist[0].Subject_no">
																	<button style=" float: right;" id="selectsub" class="btn btn-default pull-right" data-val="00" type="button">과목선택</button>
																</td>
																<td>
												<textarea name="steplist[0].sublist[0].Content" style="width: 490px; height: 135px;">
												</textarea>
																</td>
																<td>
																	<input id='time' class='time' name="steplist[0].sublist[0].SubHour" style="width:30px; margin-right: 5px" type="text">시간
																</td>
																<td>
																	<button  id="del-subject" class="btn btn-default pull-right" type="button" data-val="0">삭제</button>
																</td>
															</tr>
															</tbody>
														</table>

													</li>
												<div class="sub-toolbox clearfix text-center">
													<div id="button2">
														<div id="inner-button2">
															<input type="submit" value="저장" id="stepadd" class="btn btn-primary">
														</div>
													</div>
												</div>

											</div>

										</div>
										<!-- /.2번메뉴내용 -->


									</div>
									<!-- /.탭내용박스 -->
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
<!-- ./wrapper -->

<!-- ***************************************** -->
<!-- 모달창영역 -->
<!-- 카테고리 추가 모달창-->
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
								<c:forEach items="${packcatelist}" var="vo">
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
</div><!-- /.modal -->

<!--과목선택 모달창-->
<div class="modal fade" id="pop2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<input type="hidden" id="step" value="">
				<input type="hidden" id="sub" value="">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">과목 선택</h4>
			</div>
			<div class="modal-body">
				<ul id="treeDemo2" class="ztree"></ul>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- /.모달창영역 -->
<!-- ***************************************** -->

</body>

<!-- 자바스트립트영역 -->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.exedit.js"></script>

<script type="text/javascript">
	var sub=0;
	var step=0;
    // zTree 설정
    var setting = {
        edit:{
            drag:{
                autoExpandTrigger: true,
                prev: dropPrev,
                inner: dropInner,
                next: dropNext
            },
            enable:true,
            editNameSelectAll: true,
            showRemoveBtn: true, //showRemoveBtn
            showRenameBtn: true  //showRenameBtn
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: package, // 마우스 클릭 콜백함수 지정
            beforeDrag: beforeDrag,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove,
            beforeRename: beforeRename,
            onRename:onRename,
            onRemove: onRemove,
            beforeDragOpen: beforeDragOpen,
            onDrag: onDrag,
            onDrop: onDrop,
            onExpand: onExpand
        }
    };
    //패키지 카테고리용 노드
    var zNodes= [
        <c:forEach items="${packcatelist}" var="vo">
        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
        </c:forEach>
        <c:forEach items="${packlist}" var="vo">
        {id:${vo.package_no},pId:${vo.packageCate_no},name:"${vo.packageName}",web:"${vo.package_no}"},
        </c:forEach>
    ];

    <!--삭제 수정용-->
    function beforeEditName(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        setTimeout(function() {
            if (confirm(" '" + treeNode.name + "'을(를) 수정 하시겠습니까?")) {
                setTimeout(function() {
                    zTree.editName(treeNode);
                }, 0);
            }
        }, 0);
        return false;
    }

    <!--삭제 수정용(삭제확인 메세지 출력 및 삭제 전 노드 정보 출력)-->
    function beforeRemove(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp;이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId);
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        return confirm(" '" + treeNode.name + "'을(를) 삭제 하시겠습니까?");
    }
    <!--삭제 수정용(삭제 후 노드 정보 출력)-->
    function onRemove(e, treeId, treeNode) {
        console.log("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp;이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId);
    }
    <!--삭제 수정용(수정전 데이터 출력 밑 공백체크)-->
    function beforeRename(treeId, treeNode, newName, isCancel) {
        className = (className === "dark" ? "":"dark");
        console.log((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId+(isCancel ? "</span>":""));


        if (newName.length == 0) {
            setTimeout(function() {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.cancelEditName();
                alert("공백은 입력할수 없습니다.");
            }, 0);
            return false;
        }
        return true;
    }
    <!--삭제 수정용(수정 후 데이터 출력)-->
    function onRename(e, treeId, treeNode, isCancel) {
        console.log((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId + (isCancel ? "</span>":""));
        updateCate(treeNode.name,treeNode.id,treeNode.pId);
    }
    <!--삭제 수정용(시작노드 삭제 아이콘 없애는 코드)-->
    // function showRemoveBtn(treeId, treeNode) {
    //     return !treeNode.isFirstNode;
    // }
    <!--삭제 수정용(마지막 노드 수정 아이콘 없애는 코드-->
    // function showRenameBtn(treeId, treeNode) {
    //     return !treeNode.isLastNode;
    // }
    <!--삭제 수정용-->
    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='"+className+"'>"+str+"</li>");
        if(log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    <!--삭제 수정용-->
    function getTime() {
        var now= new Date(),
            h=now.getHours(),
            m=now.getMinutes(),
            s=now.getSeconds(),
            ms=now.getMilliseconds();
        return (h+":"+m+":"+s+ " " +ms);
    }
    <!--삭제 수정용-->
    var newCount = 1;
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);

        if (btn) btn.bind("click", function(){
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
            return false;
        });
    };
    <!--삭제 수정용-->
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };
    <!--삭제 수정용-->
    function selectAll() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
    }
    <!--드래그용 함수-->
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
    <!--드래그용 함수-->
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
    <!--드래그용 함수-->
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

    <!--드래그용 함수-->
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
    <!--드래그용 함수-->
    function beforeDragOpen(treeId, treeNode) {
        console.log("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " +  "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId+" nodes." );
        autoExpandNode = treeNode;
        return true;
    }
    <!--드래그용 함수-->
    function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
        className = (className === "dark" ? "":"dark");
        showLog("[ "+getTime()+" beforeDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
        showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"));
        return true;
    }

    <!--드래그용 함수(드래그 할때 해당 노드정보 출력)-->
    function onDrag(event, treeId, treeNodes) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length +  "이름:" + treeNodes + "/ID:" + treeNodes.id+"/pId:"+treeNodes.pId+" nodes." );
    }

    <!--드래그용 함수(드롭할때 해당 노드 정보 출력)-->
    function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" onDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType + "이름:" + treeNodes.toString() + "/ID:" + treeNodes+"/pId:"+treeNodes);
        console.log("target: " + (targetNode ? targetNode.name +targetNode.id +targetNode.toString() : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
        //UpdateCate(treeNode.name,treeNode.id,treeNode.pId);
    }

    <!--드래그용 함수-->
    function onExpand(event, treeId, treeNode) {
        if (treeNode === autoExpandNode) {
            className = (className === "dark" ? "":"dark");
            console.log("[ "+getTime()+" onExpand ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name);
        }
    }
    <!--드래그용 함수-->
    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='"+className+"'>"+str+"</li>");
        if(log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    <!--드래그용 함수-->
    function getTime() {
        var now= new Date(),
            h=now.getHours(),
            m=now.getMinutes(),
            s=now.getSeconds(),
            ms=now.getMilliseconds();
        return (h+":"+m+":"+s+ " " +ms);
    }
    <!--드래그용 함수-->
    function setTrigger() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.edit.drag.autoExpandTrigger = $("#callbackTrigger").attr("checked");
    }
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#callbackTrigger").bind("change", {}, setTrigger);
        $("#selectAll").bind("click", selectAll);
    });


    //////////////////////////////////////////////////////////////////////////////////////////////////
    //과목 카테고리용 세팅
    var setting2 = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: subject
        }
    };
    //과목 카테고리용 노드
    var zNodes2= [
        <c:forEach items="${subcatelist}" var="vo">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",open:true},
        </c:forEach>
        <c:forEach items="${sublist}" var="vo">
        {id:${vo.subject_no},pId:${vo.subjectCate_no},name:"${vo.subjectName}",web:"${vo.subject_no}"},
        </c:forEach>
    ];
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo2"), setting2, zNodes2);
    });

    function subject(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
        var sub=$("#sub").val();
        var step=$("#step").val();
        var str ="";
        console.log(no);
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/getSubjectaVo",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(SubjectVo) {
                $("input[name='SubjectName"+sub+"']").val(SubjectVo.subjectName),
                    $("input[name='steplist['"+step+"'].sublist['"+sub+"'].Subject_no']").val(SubjectVo.subject_no)
                    $("#pop2").modal("hide");
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    function updateCate(name,id,pId){
        console.log(name+id+pId);
        subjectCateVo={
            cateName : name,
            packageCate_no :id,
            parentCode : pId
        }
        $.ajax({
            url : "${pageContext.request.contextPath }/package/updateCate",
            type : "post",
            contentType : "application/json",
            data : JSON.stringify(subjectCateVo),
            dataType : "json",

            success : function(SubjectCateVo) {
                console.log(PackageCateVo);
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });

    }
    $("#packageadd").on("click", function() {
        var formData = $("#package").serialize();
        console.log("드가이씨1")
		$.ajax({
			cache : false,
			url : "${pageContext.request.contextPath}/package/packageadd",
			type : 'POST',
			data : formData,
			success:function(PackageVo){
				console.log("드가이씨2")
			},
			error : function(xhr,status) {
            console.error(status + " : " + error);
		}
		});
    });
    function addPackage(){
		packageVo={
		    PackageCate_no: $("select[name='strPackageCate_no']").val(),
			UseStatus: $("select[name='UseStatus']").val(),
		    PackageName: $("input[name='PackageName']").val(),
            Goal: $("textarea[name='Goal']").val(),
			Content: $("textarea[name='Content']").val(),
            Qualification: $("textarea[name='Qualification']").val(),
            TotalTime:$("input[name='TotalTime']").val()
		}
        $("input[name=PackageNameInStep]").val(packageVo.PackageName);
        $("input[name=TotalTimeInStep]").val(packageVo.TotalTime);
		console.log(packageVo);
        $.ajax({
            url : "${pageContext.request.contextPath }/package/addPackage",
            type : "POST",
            //contentType : "application/json",
            data : packageVo,
            dataType : "json",
            success : function(package_no) {
                console.log(package_no);
                $("input[name='steplist[0].Package_no']").val(package_no);
			}
        });
        $("#packageTab a:last").tab('show');
    }

    function package(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
        $.ajax({
            url : "${pageContext.request.contextPath }/package/getPackageVo",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(PackageVo) {
                var str=" ";
                $("#inner-button").remove();
                str+="<div id='inner-button'>";
                str+="<input type='button' value='수정' class='btn btn-primary' style='margin-left: 60px'>";
                str+='<input type="submit" value="삭제" class="btn btn-default btn-sub pull-right">';
                str+="</div>";
                $("#button").append(str);
				str=" ";
                $("#inner-button2").remove();
                str+="<div id='inner-button2'>";
                str+="<input type='button' value='수정' class='btn btn-primary' style='margin-left: 60px'>";
                str+='<input type="submit" value="삭제" class="btn btn-default btn-sub pull-right">';
                str+="</div>";
                $("#button2").append(str);
                    $("input[name='steplist[0].StepName']").val(" ");
                    $("input[name='SubjectName00']").val(" ");
                    $("textarea[name='steplist[0].sublist[0].Content']").val(" ");
                    $("input[name='steplist[0].sublist[0].SubHour']").val(" ");
                $("div[name='die']").remove();
				$("tr[name='die']").remove();
                $("table[name='die']").remove();

				for(var i=0;i<PackageVo.steplist.length;i++) {
                    for (var j = 0; j < PackageVo.steplist[i].sublist.length; j++) {
                        if(i==0 && j==0){
                        }
                        else if (j == 0) {
                            console.log("첫번째");
                            //console.log(PackageVo.steplist[i].sublist[j]);

                           StepInPack(i,j,PackageVo.steplist[i].sublist[j],PackageVo.steplist[i]);
                        }
                        else {
                            console.log(i,j);
                            SubInStep(i,j,PackageVo.steplist[i].sublist[j]);
                           // console.log(PackageVo.steplist[i].sublist[j]);
                        }
                    }
                }
                //console.log(PackageVo);
                $("select[name='strPackageCate_no']").val(PackageVo.packageCate_no).prop("selected",true),
                    $("input[name='PackageName']").val(PackageVo.packageName),
                    $("input[name='PackageNameInStep']").val(PackageVo.packageName),
                    $("textarea[name='Goal']").val(PackageVo.goal),
                    $("textarea[name='Content']").val(PackageVo.content),
                    $("textarea[name='Qualification']").val(PackageVo.qualification),
                    $("input[name='TotalTime']").val(PackageVo.totalTime),
                    $("input[name='TotalTimeInStep']").val(PackageVo.totalTime),
                    $("select[name='UseStatus']").val(PackageVo.useStatus),
					$("input[name='steplist[0].StepName']").val(PackageVo.steplist[0].stepName),
				    $("input[name='SubjectName00']").val(PackageVo.steplist[0].sublist[0].subjectName),
                    $("textarea[name='steplist[0].sublist[0].Content']").val(PackageVo.steplist[0].sublist[0].content),
                    $("input[name='steplist[0].sublist[0].SubHour']").val(PackageVo.steplist[0].sublist[0].subHour)
					},
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    $("#btnAddPackage").on("click",function () {
        str=" ";
        $("input[name='PackageName']").val(" ");
            $("textarea[name='Goal']").val("");
            $("textarea[name='Content']").val("");
            $("textarea[name='Qualification']").val("");
            $("input[name='TotalTime']").val("");
            $("select[name='UseStatus']").val("");
        $("#inner-button").remove();
        str+="<div id='inner-button'>";
        str+= '<input type="submit" value="저장" class="btn btn-primary">';
        str+="</div>";
        $("#button").append(str);
		str=" ";
        $("#inner-button2").remove();
        str+="<div id='inner-button2'>";
        str+= '<input type="submit" value="저장" class="btn btn-primary">';
        str+="</div>";
        $("#button2").append(str);

		$("#packageTab a:first").tab('show');

    });

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
            url : "${pageContext.request.contextPath }/package/addPackageCate",
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



    $(document).on("click","#btnAddstep",function(){
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
        str+=   "<input type='text' name='steplist.["+step+"].Package_no' value='+pack+' >";
        str+=   "<input type='text' name='steplist.["+step+"].Level' value='+step+' >";
        str+=  "<tr>";
        str+=	  "<td style='text-align: center'>"+(step+1)+"단계</td>";
        str+=    "<td colspan='3' >";
        str+=    "<input name='steplist["+step+"].StepName' type='text' style='width: 800px'>";
        str+=    "</td>";
        str+=    "<td style='width: 50px'>";
        str+=    "<button  id='btnAddsubject' class='btn btn-default pull-right' type='button' data-val="+step+" >추가</button>";
        str+=    "</td>";
        str+=    "</tr>";
        str+=    "<tr id=subject-item"+sub+" style='height: 150px'>";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+step+sub+'" style="border: none" readonly>';
        str+=	'<input type="text" name="steplist['+step+'].sublist['+sub+'].Subject_no">';
        str+=    "<button style=' float: right;' id='selectsub' data-val='"+step+sub+"' class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+step+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+step+"].sublist["+sub+"].SubHour' style='width:30px; margin-right: 5px' type='text'>시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button  id='del-subject' class='btn btn-default pull-right' type='button' data-val="+sub+">삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        str+=  "</tbody>";
        str+=  "</table>";
        $("#step-list").append(str);
    });

    $(document).on("click","#btnAddsubject",function() {
        var instep=$(this).data("val");
        console.log(instep);
        sub++;
        var str=" ";
        str+=    "<tr id=subject-item"+sub+" style='height:150px'>";
        str+=   "<input type='hidden' name='hide' data-val="+sub+">";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+instep+sub+'" style="border: none" readonly>';
        str+=	'<input type="text" name="steplist['+instep+'].sublist['+sub+'].Subject_no">';
        str+=    "<button style=' float: right;' id='selectsub' data-val='"+instep+sub+"'class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+instep+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+instep+"].sublist["+sub+"].SubHour'  style='width:30px; margin-right: 5px' type='text'>시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button id='del-subject' class='btn btn-default pull-right' type='button' data-val="+sub+">삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        console.log(sub);
        $("#subject-list"+instep).append(str);
    });

    $(document).on("change",".time",function(){
        console.log("발똥");
        var time=0;
        $(".time").each(function () {
            if ($(this).val() !="") {
                time += parseInt($(this).val());
                console.log(time);
            }
        });
        $("input[name=Time]").val(time);
    });
    $(document).on("click","#del-subject",function() {
        var sub=$(this).data("val");
        console.log(sub);
        $("#subject-item"+sub).remove()
    });

    $(document).on("click","#selectsub",function(){
        var sub=$(this).data("sub");
        var step=$(this).data("step");
        console.log(sub);
        console.log(step);
        $("#sub").val(sub);
        $("#step").val(step);
        $("#pop2").modal();
    });

    function StepInPack(stepNo,subNo,sublist,stepvo) {
        console.log(sublist);
        console.log(stepvo);
        step=stepNo;
        sub=subNo;
        var str=" ";
        str+= "<div name='die'><br><br></div>";
        str+=  "<table id='"+step+"' name = 'die'  class='table table-condensed'>";
        str+=  "<colgroup>";
        str+=  "<col width='50px' />";
        str+=   "<col width='250px' />";
        str+=  "<col width='' />";
        str+=  "<col width='80px' />";
        str+=  "<col width='60px' />";
        str+=  "</colgroup>";
        str+=  '<tbody id=subject-list'+step+'>';
        str+=   "<input type='hidden' name='steplist.["+step+"].Package_no'  >";
        str+=   "<input type='hidden' name='steplist.["+step+"].Level' value='+step+' >";
        str+=  "<tr>";
        str+=	  "<td style='text-align: center'>"+(step+1)+"단계</td>";
        str+=    "<td colspan='3' >";
        str+=    "<input type='text' name='steplist["+step+"].StepName' value='"+stepvo.stepName+"' style='width: 800px'  >";
        str+=    "</td>";
        str+=    "<td style='width: 50px'>";
        str+=    "<button  id='btnAddsubject' class='btn btn-default pull-right' type='button' data-val="+step+" >추가</button>";
        str+=    "</td>";
        str+=    "</tr>";
        str+=    "<tr id=subject-item"+sub+" style='height: 150px'>";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+step+sub+'" style="border: none"  value="'+sublist.subjectName+'" readonly>';
        str+=	'<input type="hidden" name="steplist['+step+'].sublist['+sub+'].Subject_no">';
        str+=    "<button style=' float: right;' id='selectsub' data-val='"+step+sub+"' class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+step+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>"+sublist.content+"";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+step+"].sublist["+sub+"].SubHour' style='width:30px; margin-right: 5px' type='text' value="+sublist.subHour+">시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button  id='del-subject' class='btn btn-default pull-right' type='button' data-val="+sub+">삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        str+=  "</tbody>"
        str+=  "</table>"
        $("#step-list").append(str);
    }

    function SubInStep(instepNo,SubNo,sublist) {
        var instep=$(this).data("val");
        instep=instepNo;
        sub=SubNo;
        var str=" ";
        str+=    "<tr name='die' id=subject-item"+sub+" style='height:150px'>";
        str+=   "<input type='hidden' name='hide' data-val="+sub+">";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+instep+sub+'" style="border: none"  value="'+sublist.subjectName+'"  readonly>';
        str+=	'<input type="hidden" name="steplist['+instep+'].sublist['+sub+'].Subject_no">';
        str+=    "<button style=' float: right;' id='selectsub' data-val='"+instep+sub+"'class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+instep+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>"+sublist.content+"";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+instep+"].sublist["+sub+"].SubHour'  style='width:30px; margin-right: 5px' type='text' value='"+sublist.subHour+"'>시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button id='del-subject' class='btn btn-default pull-right' type='button' data-val="+sub+">삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        $("#subject-list"+instep).append(str);
    }
</script>


</html>
