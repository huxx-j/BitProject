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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">

	<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" type="text/css">--%>
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
								<div class="cate-title">
									과목카테고리
								</div><!-- cate-title -->

								<div class="cate-outter bordered">
									<div class="cate-toolbox">
										<button type="button" id="addcate" class="btn btn-default btn-cate">추가</button>
										<button type="button" class="btn btn-default btn-cate pull-right">편집</button>
									</div><!-- /.cate-toolbox -->
									<div class="scroll">

										<div class="tab-content-custom" style="height: 500px;">
											<div class="tab-pane active" id="tab_1">

												<ul id="treeDemo" class="ztree"></ul>

												<%--<ul id="cate-tree" class="side-bar test" data-widget="tree">--%>


													<%--<!-- 최하단 카테고리 조건(ajax구현 고려)--%>
												<%--<c:forEach items="${sublist}" var="sub">--%>
													<%--<ul class="treeview-menu">--%>
														<%--<li><a href="#"><i class="fa fa-circle-o"></i> ${sub.subjectName}</a></li>--%>
													<%--</ul>--%>
												<%--</c:forEach>-->--%>

													<%--<li class="treeview">--%>
														<%--<a href="#"> <i class="fa fa-circle-o"></i>C<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
														<%--<ul class="treeview-menu">--%>
																<%--<li class="treeview">--%>
																			<%--<a href="#"><i class="fa fa-circle-o"></i> C <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																			<%--<ul class="treeview-menu">--%>
																				<%--<li class="treeview">--%>
																				<%--</li>--%>
																			<%--</ul>--%>
																			<%--<a href="#"><i class="fa fa-circle-o"></i> C++ <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																			<%--<ul class="treeview-menu">--%>
																				<%--<li class="treeview">--%>
																				<%--</li>--%>
																			<%--</ul>--%>
																<%--</li>--%>
														<%--</ul>--%>
													<%--</li>--%>
													<%--<li class="treeview">--%>
														<%--<a href="#"> <i class="fa fa-circle-o"></i>JAVA<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
														<%--<ul class="treeview-menu">--%>
															<%--<li class="treeview">--%>
																<%--<a href="#"><i class="fa fa-circle-o"></i> JAVA <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																<%--<ul class="treeview-menu">--%>
																	<%--<li class="treeview">--%>
																		<%--<a href="#"><i class="fa fa-circle-o"></i> JAVA1 <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																		<%--<ul class="treeview-menu">--%>
																			<%--<li class="treeview">--%>
																			<%--</li>--%>
																		<%--</ul>--%>
																	<%--</li>--%>
																<%--</ul>--%>
																<%--<a href="#"><i class="fa fa-circle-o"></i> JAVA WEB <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																<%--<ul class="treeview-menu">--%>
																	<%--<li class="treeview">--%>
																		<%--<a href="#"><i class="fa fa-circle-o"></i> SPRING <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>--%>
																		<%--<ul class="treeview-menu">--%>
																			<%--<li class="treeview">--%>
																			<%--</li>--%>
																		<%--</ul>--%>
																	<%--</li>--%>
																<%--</ul>--%>
															<%--</li>--%>
														<%--</ul>--%>
													<%--</li>--%>

												<%--</ul>--%>
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
						<form id="" name="addsubject" method="get" action="${pageContext.request.contextPath}/subject/add">
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
													<select name='subcate' class='form-control input-sm'>
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
											<input type="submit" value="저장" class="btn btn-primary">
										</div>
									</div>
								</div>
								<!-- /.탭내용박스 -->
							</div><!--/.탭 박스 외곽 -->
						</form>
						</div><!-- /.col-xs-9 -->
						<!-- /.과목정보영역 -->
					</div><!-- /.row -->

			</div><!-- /.col-xs-12 -->
	</section>
		</div><!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
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
</div>
</body>
</html>
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
            enable:true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: subject,  // 마우스 클릭 콜백함수 지정
            beforeDrag: beforeDrag,
            beforeDrop: beforeDrop,
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
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.edit.drag.autoExpandTrigger = $("#callbackTrigger").attr("checked");
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

    // zTree 초기화

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);

        $("#callbackTrigger").bind("change", {}, setTrigger);

		<!--이름 수정,삭제용-->
        setEdit();
         $("#remove").bind("change", setEdit);
         $("#rename").bind("change", setEdit);
         $("#removeTitle").bind("propertychange", setEdit)
             .bind("input", setEdit);
         $("#renameTitle").bind("propertychange", setEdit)
             .bind("input", setEdit);
    });


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


<%--<script type="text/javascript">--%>

    <%--$(document).ready(function() {--%>
        <%--console.log("정상실행");--%>
		<%--var str=" ";--%>
    	<%--str+= "<select class='form-control input-sm'>";--%>
        <%--str+= "<c:forEach items="${list}" var="vo">";--%>
        <%--str+= " <option> ${vo.cateName} </option> </c:forEach>";--%>
        <%--str+= "</select>";--%>
        <%--$("#subjectCate-list").append(str);--%>
		<%--console.log("정상실행2");--%>
		<%--start();--%>
        <%--var objectValue="${list}";--%>
        <%--console.log(objectValue);--%>
    <%--});--%>

 <%--function start(){--%>
     <%--var str="";--%>

	 <%--str+="<c:forEach items='${list}' var='vo1'><c:if test='${vo1.depth eq 1}'>";--%>
	 <%--str+="<li class=\"treeview\">";--%>
	 <%--str+="<a href=\"#\"> <i class=\"fa fa-circle-o\"></i>${vo1.cateName}<span class=\"pull-right-container\"> <i class=\"fa fa-angle-left pull-right\"></i> </span> </a>";--%>
     <%--str+="<ul class='treeview-menu'>";--%>
     <%--str+="<li class=\"treeview\">";--%>
	 <%--str+="</c:if><c:forEach items='${list}' var='vo2'><c:if test='${vo1.subjectCate_no eq vo2.parentCode}'>";--%>
	 <%--str+= "<a href=\"#\"> <i class=\"fa fa-circle-o\"></i>${vo2.cateName}<span class=\"pull-right-container\"> <i class=\"fa fa-angle-left pull-right\"></i> </span> </a>";--%>
     <%--str+="<ul class='treeview-menu'>";--%>
     <%--str+="<li class=\"treeview\">";--%>
	 <%--str+="<c:forEach items='${nonlist}' var='no'><c:if test='${vo2.subjectCate_no eq no}'>";--%>
	 <%--str += "</li>";--%>
	 <%--str += "</ul></c:if></c:forEach></c:if></c:forEach><c:forEach items='${mdlist}' var='md'><c:if test='${vo1.groupCode eq md.groupCode}'><c:if test='${vo1.depth eq md.depth}'><c:if test='${vo1.orderCode eq md.orderCode}'>"--%>
	 <%--for(var i=1;i<=${md.depth};i++)--%>
	 <%--{	str += "</li>";--%>
	 	<%--str += "</ul>";--%>
	 <%--}--%>
	 <%--str+="<c:if test='${vo1.orderCode eq md.orderCode}'> </li></c:if></c:if></c:if></c:if></c:forEach></c:forEach>";--%>
     <%--$("#cate-tree").append(str);--%>
 <%--}--%>

    <%--jqgrid사용시 삭제할것--%>

