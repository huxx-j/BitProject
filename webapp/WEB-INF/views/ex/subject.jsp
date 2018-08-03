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
				<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
								<div class="sub-box">
									<div class="sub-toolbox clearfix">
										<button  id="btnAddsubject" class="btn btn-default pull-right" type="button">과목 추가</button>
									</div>
									
									<div class="sub-body">
										<table class="table table-condensed">
											<colgroup>
												<col width="120px" />
												<col width="" />
											</colgroup>
											<tbody>
											<tr>
												<th>과목 카테고리</th>
												<td>
													<select name='subcate' class='form-control'>
													<c:forEach items="${list}" var="vo">
														<option> ${vo.cateName} </option>
													</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>과목 명</th>
												<td>
													<div class="clearfix">
													<div class="input-group border-inputcolor w140 pull-left">
														<input class="input-datepicker form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
														<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
													</div>
													<div class="pull-left"> &nbsp;&nbsp; - &nbsp;&nbsp;</div>
													<div class="input-group border-inputcolor w140 pull-left">
														<input class="input-datepicker form-control border-none" name="date1" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
														<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
													</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>과목 개요</th>
												<td><textarea name="Outline" class="form-control" rows="6" placeholder=""></textarea></td>
											</tr>
	
											</tbody>
										</table>
									</div><!-- /.sub-body -->
									<div class="sub-toolbox clearfix text-center">
										<input type="submit" value="수정" class="btn btn-primary">
										<input type="submit" value="삭제" class="btn btn-default btn-sub pull-right">
									</div>
								</div><!-- /.sub-box -->
							</div><!-- /.col-xs-9 -->
							<!-- /.과목정보영역 -->
						</div><!-- /.row -->
					</div><!-- /.box box-body -->
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
				<select name='subcate' id="SubjectCate_no" class='form-control input-sm'>
					<c:forEach items="${list}" var="vo">
						<option  value="${vo.subjectCate_no}"> ${vo.cateName} </option>
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
<!-- /.모달창영역 -->	
<!-- ***************************************** -->

</body>

<!-- 자바스트립트영역 -->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/build/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript">
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
                enable: true,
            }
        },
        callback: {
            beforeClick: subject,      // 마우스 클릭 콜백함수 지정
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

    var zNodes= [
        <c:forEach items="${list}" var="vo">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
        </c:forEach>
        <c:forEach items="${sublist}" var="vo">
        {id:${vo.subject_no},pId:${vo.subjectCate_no},name:"${vo.subjectName}",web:"${vo.subject_no}"},
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
        UpdateCate(treeNode.name,treeNode.id,treeNode.pId);
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
        console.log("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length +  "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId+" nodes." );
    }

    <!--드래그용 함수(드롭할때 해당 노드 정보 출력)-->
    function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" onDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType + "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId);
        console.log("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
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





    // zTree 초기화
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#callbackTrigger").bind("change", {}, setTrigger);
        $("#selectAll").bind("click", selectAll);
    });
    function UpdateCate(name,id,pId){
        subjectCateVo={
            CateName : name,
            SubjectCate_no :id,
            ParentCode : pId
        }
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/updateCate",
            type : "POST",
            //contentType : "application/json",
            data : subjectCateVo,
            dataType : "json",
            success : function(SubjectVo) {
                console.log(SubjectVo);
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });

    }
	function subject(treeId, treeNode, clickFlag) {
	    var no=treeNode.web;
	    console.log(no);
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/subajax",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
           dataType : "json",
            success : function(SubjectVo) {
                console.log(SubjectVo);
                $("input[name='SubjectName']").val(SubjectVo.subjectName),
                $("textarea[name='Outline']").val(SubjectVo.outline),
                $("select[name='subcate']").val(SubjectVo.subjectCate_no)
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
        var SubjectCate_no = $("#SubjectCate_no").val();
        var CateName = $("#CateName").val();
		console.log(SubjectCate_no);
        console.log(CateName);
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/addcate",
            type : "post",
			async: false,
            // contentType : "application/json",
            data : {"SubjectCate_no": SubjectCate_no, "CateName": CateName},
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
</script>
</html>
<script type="text/javascript" src="/assets/js/jquery.datepicker.js"/>