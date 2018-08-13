
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
    // zTree 설정
    function deleteCate(id){
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/delCate",
            type : "POST",
            //contentType : "application/json",
            data : {"id": id},
            dataType : "json",
            success : function() {
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    function UpdateCate(name,id,pId){
        console.log(name+id+pId);
        subjectCateVo={
            cateName : name,
            subjectCate_no :id,
            parentCode : pId

        }
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/updateCate",
            type : "post",
            contentType : "application/json",
            data : JSON.stringify(subjectCateVo),
            dataType : "json",

            success : function() {
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });

    }
    //카테고리의 패키지 혹은 취소 누를시
    function CaseA(){
        $("#btnAddsubject").remove();
        $("#update-subject").remove();
        $("#del-subject").remove();
        $("#save-subject").remove();
        $("#cancel").remove();

        str+='<button  id="btnAddsubject" class="btn btn-default btn-h25 pull-right" type="button">과목 추가</button>';
        $("#brzone").append(str);
        str="<input type='button' id='update-subject' value='수정' class='btn btn-primary' >";
        $("#primary").append(str);
        str='<button type="button" id="del-subject" value='+SubjectVo.subject_no+' class="btn btn-default btn-sub pull-right">삭제</button>';
        $("#default").append(str);
    }
    //과목 추가 누를시
    function CaseB() {
        $("#btnAddsubject").remove();
        $("#update-subject").remove();
        $("#del-subject").remove();
        $("#save-subject").remove();
        $("#cancel").remove();
        str+= '<input type="button" id="save-subject" value="저장" class="btn btn-primary">';
        $("#primary").append(str);
        str='<button type="button" id="cancel" class="btn btn-default btn-sub pull-right">취소</button>';
        $("#default").append(str);

    }
    function subject(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
       selectsubject(no);
    }

    $(document).on("click","#cancel",function() {
        var no=$("#prevInfo").val();
        selectsubject(no);
    });

    function selectsubject(no){
    $.ajax({
        url : "${pageContext.request.contextPath }/subject/getSubjectVo",
        type : "POST",
        //contentType : "application/json",
        data : {"no": no},
        dataType : "json",
        success : function(SubjectVo) {
            var str=" ";
            console.log(SubjectVo);
            CaseA();
            $("#prevInfo").val(SubjectVo.subject_no),
                $("input[name=CateName]").val(SubjectVo.cateName),
                $("input[name='SubjectName']").val(SubjectVo.subjectName),
                $("textarea[name='Outline']").val(SubjectVo.outline),
                $("select[name='subjectCate_no']").val(SubjectVo.subjectCate_no).prop("selected",true),
                $("button[name='SubjectName']").val(SubjectVo.subjectName)
        },
        error : function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
    }

    $(document).on("click","#del-subject",function(){
        var no=$("#del-subject").val();
        console.log(no);
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/delSubject",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function() {
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
        location.reload();
    });

    $(document).on("click","#btnAddsubject",function(){
        var str=" ";
        CaseB();
        // str+="<br>";
        // $("#brzone").append(str);
        // str=" ";
        $("input[name='SubjectName']").val("");
        $("textarea[name='Outline']").val("");
        $("select[name='subjectCate_no']").val("");

    })
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
            url : "${pageContext.request.contextPath }/subject/addSubjectCate",
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

    $("#selectCate").on("click",function () {
        $("#pop2").modal();
    })
    function subjectcate(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/getSubjectCate",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(SubjectCateVo) {
                console.log(SubjectCateVo.cateName);
                console.log(SubjectCateVo.subjectCate_no);
                $("#category").val(SubjectCateVo.cateName),
                    $("#cate_no").val(SubjectCateVo.subjectCate_no)
                $("#pop2").modal("hide");
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }
    $(document).on("click","#update-subject",function() {
        subjectVo={
            Subject_no:$("#prevInfo").val(),
            SubjectName: $("input[name='SubjectName']").val(),
            Outline:$("textarea[name='Outline']").val()
        }
        console.log(subjectVo);
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/updateSubject",
            type : "POST",
            //contentType : "application/json",
            data : subjectVo,
            dataType : "json",
            success : function() {
            }
        });
        location.reload();
    });
    $(document).on("click","#save-subject",function() {
        subjectVo={
            SubjectCate_no:$("input[name='subjectCate_no']").val(),
            SubjectName: $("input[name='SubjectName']").val(),
            Outline:$("textarea[name='Outline']").val()
        }
        console.log(subjectVo);
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/addSubject",
            type : "POST",
            //contentType : "application/json",
            data : subjectVo,
            dataType : "json",
            success : function() {
            }
        });
        location.reload();
    });

    //////////////////////////////////////////////////////////////////////////////////////////////////
    // 카테고리를 위한 스크립트 (ztree오픈소스)                                                     //
    //////////////////////////////////////////////////////////////////////////////////////////////////
    var setting = {
        edit:{
            drag:{
                autoExpandTrigger: true,
                prev: dropPrev,
                inner: dropInner,
                next: dropNext,


            },
            enable:true,
            editNameSelectAll: true,
            showRemoveBtn:showRemoveBtn,
            showRenameBtn:showRenameBtn
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
        <c:if test="${vo.subjectCate_no eq 10000}">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",open:true ,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
        </c:if>
        <c:if test="${vo.subjectCate_no ne 10000}">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}", icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png" ,iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
        </c:if>
        </c:forEach>
        <c:forEach items="${sublist}" var="vo">
        {id:${vo.subject_no},pId:${vo.subjectCate_no},name:"${vo.subjectName}",web:"${vo.subject_no}",icon:"${pageContext.request.contextPath}/assets/css/img/item.png"},
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
        deleteCate(treeNode.id);
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
     function showRemoveBtn(treeId, treeNode) {
        var show=true;
         if(treeNode.id<=10000){ show=false;}
         return show;
     }
    <!--삭제 수정용(마지막 노드 수정 아이콘 없애는 코드-->
     function showRenameBtn(treeId, treeNode) {
         var show=true;
         if(treeNode.id<10000){ show=false;}
         return show;
     }
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
        UpdateCate(treeNodes[0].name,treeNodes[0].id,treeNodes[0].pId);
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

    // zTree 초기화
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#callbackTrigger").bind("change", {}, setTrigger);
        $("#selectAll").bind("click", selectAll);
    });


    var setting2 = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: subjectcate
        }
    };
    //과목 카테고리용 노드
    var zNodes2= [
        <c:forEach items="${list}" var="vo">
        <c:if test="${vo.subjectCate_no eq 10000}">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.subjectCate_no}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
        </c:if>
        <c:if test="${vo.subjectCate_no ne 10000}">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode},name:"${vo.cateName}", web:"${vo.subjectCate_no}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png"},
        </c:if>
        </c:forEach>
    ];
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo2"), setting2, zNodes2);
    });
</script>
<c:forEach items="${packcatelist}" var="vo">
    <c:if test="${vo.packageCate_no eq 10000}">
        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",open:true},
    </c:if>
    <c:if test="${vo.packageCate_no ne 10000}">
        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
    </c:if>
</c:forEach>
<c:forEach items="${packlist}" var="vo">
    {id:${vo.package_no},pId:${vo.packageCate_no},name:"${vo.packageName}",web:"${vo.package_no}"},
</c:forEach>