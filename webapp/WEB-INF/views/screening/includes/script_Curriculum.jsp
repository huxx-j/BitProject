<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
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

    var zNodes= [
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

    //교육과정 클릭 시 정보 뿌려줌
    function package(treeId, treeNode, clickFlag) {
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
				$("input[name='detailViewFlag'][value="+curriAllVo.curriculumVo.detailViewFlag+"]").attr("checked",true)
				
// 				지원자 리스트 테이블 초기화
//                 $("#renderApplicantList").find("tr:gt(0)").remove();
//                 $("#renderApplicantList").remove(); //표 틀까지 다 지움
                
                //이전 리스트 삭제(비워줌)(html은 안해도 되지만 그래도 확실히 비우기 위해서)
                $("#renderApplicantList").empty();
				var str = ""; //append 하려면 for문 안에 넣어야함.
				for (var i = 0; i < curriAllVo.applicantList.length; i++){
			     	str += "<tr>";
					str += "	<td>" + curriAllVo.applicantList[i].nameHan + "</td>";    	
			    	str += "	<td>" + curriAllVo.applicantList[i].birthDate +"</td>";
			    	str += " 	<td>" + curriAllVo.applicantList[i].gender + "</td>";
			    	str += "	<td>" + curriAllVo.applicantList[i].testResult +"</td>";
			    	str += "	<td><label class = 'form-control-static'><input type = 'checkbox' name = 'gisuGrant' id = '" + curriAllVo.applicantList.applicant_no + "'></label></td>";
			 		str += "</tr>";
// 			 		$("#renderApplicantList").append(str); //앞에 초기화 한번 해주고 시작해야 함.(리스트 계속 밑으로 추가됨)
				}
					$("#renderApplicantList").html(str); //renderApplicantList 비우고 붙임 str이 목록 길이만큼이어야함.
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
       
    }
    
    
    
    //커리큘럼 수정 버튼
//     $("#editCurriBtn").unbind("click").bind("click", function(){
	$("#editCurriBtn").on("click", function(){
		console.log("editCurriBtn");
// 		console.log(curriName);	
		var cateName = $("#cateName option:selected").val();
		var curriculumCate_no = $("input[name=curriculumCate_no]").val();
		var package_no = $("input[name=package_no]").val();
		var packageName = $("input[name=packageName]").val();
		var curriculum_no = $("input[name=curriculum_no]").val();
		var curriName = $("input[name=curriName]").val();
		var curriNickname = $("input[name=curriNickname]").val();
		var startDate = $("input[name=startDate]").val();
		var endDate = $("input[name=endDate]").val();
		var time = $("input[name=time]").val();
		var maxCnt = $("input[name=maxCnt]").val();
		var price = $("input[name=price]").val();
		var support = $("input[name=support]").val();
		var managerInfo = $("input[name=managerInfo]").val();
		var state = $("input[type=radio]:checked").val();
		var gisuName = $("input[name=gisuName]").val();
		console.log("cateName="+cateName, "package_no="+package_no, "curriculumCate_no="+curriculumCate_no, 
					"packageName="+packageName, "curriculum_no="+curriculum_no, "curriName="+curriName,
					"curriNickname="+curriNickname, "startDate="+startDate, "endDate="+endDate, 
					"time="+time, "maxCnt="+maxCnt, "price="+price, "support="+support, "managerInfo="+managerInfo,
					"state="+state, "gisuName="+gisuName);
/*  			 
		curriVo = 	{ cateName : $("input[name='cateName']").val(),
					 package_no : $("input[name='package_no']").val(),
					 packageName : $("input[name='packageName']").val(),
					 curriculum_no : $("input[name='curriculum_no']").val(),
					 curriName : $("input[name='curriName']").val(),
					 curriNickname : $("input[name='curriNickname']").val(),
					 startDate : $("input[name='startDate']").val(),
					 endDate : $("input[name='endDate']").val(),
					 time : $("input[name='time']").val(),
					 maxCnt : $("input[name='maxCnt']").val(),
					 support : $("input[name='support']").val(),
					 managerInfo : $("input[name='managerInfo']").val(),
					 state : $("input[name='state']").val(),
					 gisuName : $("input[name='gisuName']").val()};
*/ 		
		alert("수정하시겠습니까?");
		$.ajax({
			url : "${pageContext.request.contextPath}/curri/edit",
			type : "post",
//  			data : JSON.stringify(curriVo), //@RequestBody(ModelAttribute대신)
		
 			data : {cateName : cateName, curriculumCate_no : curriculumCate_no, package_no : package_no, packageName : packageName,
					curriculum_no : curriculum_no, curriName : curriName, curriNickname : curriNickname,
					startDate : startDate, endDate : endDate, time : time, maxCnt : maxCnt, price : price,
					support : support, managerInfo : managerInfo, state : state, gisuName : gisuName},
					
 			dataType : "json",
 			success : function(result){
//	 				console.log("성공"+curriVo);
					console.log(result);
					if(result != 0){
		 				alert("수정이 완료되었습니다");
					}else{
		 				alert("실패!");
					}
 			},
 			error : function(XHR, status, error){
 				console.error(status + " : " + error);
 			}
		}); //ajax		
	});// onClick function
   
    
    ////////////////////////////////////////////////////////////////////
	 //패키지 보기 모달창
    var settingModal = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: subject
        }
    };
    var zNodesModal= [
    	  <c:forEach items="${cateList}" var="vo">
          {id:${vo.curriculumCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}"},
          </c:forEach>
          <c:forEach items="${list}" var="vo">
          {id:${vo.curriculum_no},pId:${vo.curriculumCate_no},name:"${vo.curriName}",web:${vo.curriculum_no}},
          </c:forEach>
    ];
    $(document).ready(function(){
        $.fn.zTree.init($("#modalTree"), settingModal, zNodesModal);
    });

    function subject(treeId, treeNode, clickFlag) {
        var package_no=treeNode.web;
//         var locate=$("#locate").val();
//         var str ="";
        console.log(package_no);
        $.ajax({
            url : "${pageContext.request.contextPath }/curri/viewPackageAjax",
            type : "POST",
            //contentType : "application/json",
            data : {"package_no": package_no},
            dataType : "json",
            success : function(packageVo) {
            	
            	$("input[name='packageName']").val(packageVo.packageName),
            	$("input[name='package_no']").val(packageVo.package_no)
            	
//             	$("#packageViewModal").modal("hide");
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }
    
    $("#modalSelectBtn").on("click", function(){
        $("#packageViewModal").modal("hide"); // 모달창 감추기
    });
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    /* 

    function gisuGrant(){
//     	str = "";
    	id = "";
    	$("input[name=gisuGrant]:checked").each(function(){
//     		str += $(this).val() + ", ";
    		id += $(this).attr("id") + ",";
    	});
    	id = id.slice(0, -1);
    	console.log(id);
    	$("#")
    	
    }
    
    function renderGisuGrant(){
    	
    	 $("#renderApplicantList").empty();
   		var str = ""; //append 하려면 for문 안에 넣어야함.
   		for (var i = 0; i < curriAllVo.applicantList.length; i++){
   	     	str += "<tr>";
   			str += "	<td>" + curriAllVo.applicantList[i].nameHan + "</td>";    	
   	    	str += "	<td>" + curriAllVo.applicantList[i].birthDate +"</td>";
   	    	str += " 	<td>" + curriAllVo.applicantList[i].gender + "</td>";
   	    	str += "	<td>" + curriAllVo.applicantList[i].testResult +"</td>";
   	    	str += "	<td><label class = 'form-control-static'><input type = 'checkbox' name = 'gisuGrant' id = '" + curriAllVo.applicantList.applicant_no + "'></label></td>";
   	 		str += "</tr>";
//    		$("#renderApplicantList").append(str); //앞에 초기화 한번 해주고 시작해야 함.(리스트 계속 밑으로 추가됨)
   		}
   			$("#renderApplicantList").html(str); //renderApplicantList 비우고 붙임 str이 목록 길이만큼이어야함.
    }
    
    
     */
   
  
    
  </script>
