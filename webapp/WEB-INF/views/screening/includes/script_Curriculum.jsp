<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
	var level=0;
	var step=0;
	//화면 로딩
    $(document).ready(function(){
        var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        console.log(treeObj);
    });

	//교육과정 카테고리 탭
    var setting = {
		edit:{
			drag:{
				autoExpandTrigger:true,
				prev:dropPrev,
				inner:dropInner,
				next:dropNext
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
            beforeClick: curriculum,  // 마우스 클릭 콜백함수 지정
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

    <!--드래그용 함수-->
    function onDrag(event, treeId, treeNodes) {
        className = (className === "dark" ? "":"dark");
        showLog("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length + " nodes." );
    }

    <!--드래그용 함수-->
    function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
        className = (className === "dark" ? "":"dark");
        showLog("[ "+getTime()+" onDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
        showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
    }

    <!--드래그용 함수-->
    function onExpand(event, treeId, treeNode) {
        if (treeNode === autoExpandNode) {
            className = (className === "dark" ? "":"dark");
            showLog("[ "+getTime()+" onExpand ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name);
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


	
	function updateCate(name, id, pId){
		console.log(name+id+pId);
// 		curriculumCateVo = {cateName : name, curriculumCate_no : id, parentCode : pId}
		$.ajax({
			url : "${pageContext.request.contextPath}/curri/updateCate",
			type : "post",
			contentType : "application/json",
			data : {cateName : name, curriculumCate_no : id, parentCode : pId},
			dataType : "json",
			success : function(result){
				if(result == 1){
					alert("수정이 완료되었습니다");
					location.reload();
				}
				console.log();
			},
			error : function(XHR, status, error){
				console.error(status + " : " + error);
			}
		});
	}
	
	
    //교육과정 클릭 시 정보 뿌려줌
    function curriculum(treeId, treeNode, clickFlag) {
        var curriculum_no=treeNode.web;
        console.log(curriculum_no);
        $.ajax({
            url : "${pageContext.request.contextPath }/curri/"+curriculum_no,
            type : "POST",
//             data : {"curriculum_no": curriculum_no}, pathVariable로 했으니까 data 안보내도 됨
            dataType : "json",
//             async: false,
            success : function(curriAllVo) {
                $("#cateName").val(curriAllVo.curriculumVo.cateName).prop("selected",true),
                $("input[name='curriculumCate_no']").val(curriAllVo.curriculumVo.curriculumCate_no),
                $("input[name='package_no']").val(curriAllVo.curriculumVo.package_no),
                $("input[name='packageName']").val(curriAllVo.curriculumVo.packageName),
                $("input[name='curriculum_no']").val(curriAllVo.curriculumVo.curriculum_no),
				$("input[name='curriName']").val(curriAllVo.curriculumVo.curriName),
				$("input[name='curriNickname']").val(curriAllVo.curriculumVo.curriNickname),
				$("input[name='startDate']").val(curriAllVo.curriculumVo.startDate),
				$("input[name='endDate']").val(curriAllVo.curriculumVo.endDate),
				
				
				$("input[name='time']").val(curriAllVo.curriculumVo.time),
				$("input[name='maxCnt']").val(curriAllVo.curriculumVo.maxCnt),
				$("input[name='price']").val(curriAllVo.curriculumVo.price),
				$("input[name='support']").val(curriAllVo.curriculumVo.support),
				$("input[name='managerInfo']").val(curriAllVo.curriculumVo.managerInfo),
				$("input[name='gisuName']").val(curriAllVo.curriculumVo.gisuName),
				
				
            	$("input[name='state']").attr("checked",false), /* radio button 초기화 */
				$("input[name='state'][value="+curriAllVo.curriculumVo.state+"]").attr("checked",true),
				$("input[name='mainViewFlag']").attr("checked",false), /* radio button 초기화 */
				$("input[name='mainViewFlag'][value="+curriAllVo.curriculumVo.mainViewFlag+"]").attr("checked",true),
				
				$("input[name='detailViewFlag']").attr("checked",false), /* radio button 초기화 */
				$("input[name='detailViewFlag'][value="+curriAllVo.curriculumVo.detailViewFlag+"]").attr("checked",true),
				
				//전형일 초기화
				$("#testDate0").val(""),
				$("#testDate1").val(""),
				$("#testDate2").val(""),
				$("#testTime0").val("--:--"),
				$("#testTime1").val("--:--"),
				$("#testTime2").val("--:--"),
// 				$("#testTime0").val(curriAllVo.curriculumVo.testInfoList[0].testTime).prop("selected", false),
// 				$("#testTime1").val(curriAllVo.curriculumVo.testInfoList[1].testTime).prop("selected", false),
// 				$("#testTime2").val(curriAllVo.curriculumVo.testInfoList[2].testTime).prop("selected", false),

				$("#testDate0").val(curriAllVo.curriculumVo.testInfoList[0].testDate),
				$("#testDate1").val(curriAllVo.curriculumVo.testInfoList[1].testDate),
				$("#testDate2").val(curriAllVo.curriculumVo.testInfoList[2].testDate),
				
				$("#testTime0").val(curriAllVo.curriculumVo.testInfoList[0].testTime).prop("selected", true),
				$("#testTime1").val(curriAllVo.curriculumVo.testInfoList[1].testTime).prop("selected", true),
				$("#testTime2").val(curriAllVo.curriculumVo.testInfoList[2].testTime).prop("selected", true)
				/* 
				for(var j = 0; j < 3; j++){
					for(var i = 0; i < curriAllVo.curriculumVo.testInfoList.length; i++){
						$("#testDate"+j).val(curriAllVo.curriculumVo.testInfoList[i].testDate);
// 						$("#testDate1").val(curriAllVo.curriculumVo.testInfoList[1].testDate),
// 						$("#testDate2").val(curriAllVo.curriculumVo.testInfoList[2].testDate),
						
						$("#testTime"+j).val(curriAllVo.curriculumVo.testInfoList[i].testTime).prop("selected", true);
// 						$("#testTime1").val(curriAllVo.curriculumVo.testInfoList[1].testTime).prop("selected", true),
// 						$("#testTime2").val(curriAllVo.curriculumVo.testInfoList[2].testTime).prop("selected", true)
					};
				}
				 */
// 				지원자 리스트 테이블 초기화
//                 $("#renderApplicantList").find("tr:gt(0)").remove();
//                 $("#renderApplicantList").remove(); //표 틀까지 다 지움
                
                //이전 리스트 삭제(비워줌)(html은 안해도 되지만 그래도 확실히 비우기 위해서)
                $("#renderApplicantList").empty();
				var str = ""; //append 하려면 for문 안에 넣어야함.
				for (var i = 0; i < curriAllVo.applicantList.length; i++){
			     	str += "<tr id = 'tr" + curriAllVo.applicantList[i].applicant_no + "'>";
			    	str += "	<td><div class = 'checkbox-group form-inline'><label class = 'checkbox'><input type = 'checkbox' name = 'gisuGrant' class = 'gisuGrantCheckbox text-center'" + curriAllVo.applicantList[i].applicant_no + "'></label></div></td>";
					str += "	<td>" + curriAllVo.applicantList[i].nameHan + "</td>";    	
			    	str += "	<td>" + curriAllVo.applicantList[i].birthDate +"</td>";
			    	str += " 	<td>" + curriAllVo.applicantList[i].gender + "</td>";
			    	str += "	<td>" + curriAllVo.applicantList[i].testResult +"</td>";
			 		str += "</tr>";
// 			 		$("#renderApplicantList").append(str); //앞에 초기화 한번 해주고 시작해야 함.(리스트 계속 밑으로 추가됨)
				}
					$("#renderApplicantList").html(str); //renderApplicantList 비우고 붙임 str이 목록 길이만큼이어야함.
					
                $("#gisuGrantList").empty();
				var str = ""; //append 하려면 for문 안에 넣어야함.
				for (var i = 0; i < curriAllVo.studentList.length; i++){
			     	str += "<tr id = 'tr" + curriAllVo.studentList[i].applicant_no + "'>";
			    	str += "	<td><div class = 'checkbox-group form-inline'><label class = 'checkbox'><input type = 'checkbox' name = 'gisuRemove' class = 'gisuRemoveCheckbox text-center'" + curriAllVo.studentList[i].applicant_no + "'></label></div></td>";
					str += "	<td>" + curriAllVo.studentList[i].nameHan + "</td>";    	
			    	str += "	<td>" + curriAllVo.studentList[i].birthDate +"</td>";
			    	str += " 	<td>" + curriAllVo.studentList[i].gender + "</td>";
			    	str += "	<td>" + curriAllVo.studentList[i].testResult +"</td>";
			 		str += "</tr>";
				}
					$("#gisuGrantList").html(str); //renderApplicantList 비우고 붙임 str이 목록 길이만큼이어야함.
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
       
    }
  </script>
