<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	//화면 로딩 
	$(document).ready(function(){
	    var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
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
			editNameSelectAll : true,
            showRemoveBtn : showRemoveBtn, //showRemoveBtn
            showRenameBtn : showRenameBtn  //showRenameBtn
		},
	    data: {
	       		simpleData: {
	            enable: true,
	       		}
	    },
	    callback: {
			        beforeClick: curriculum,  // 마우스 클릭 콜백함수 지정
			        beforeDrag : beforeDrag,
		            beforeEditName : beforeEditName,
		            beforeRemove : beforeRemove,
		            beforeRename : beforeRename,
		            onRename : onRename,
		            onRemove : onRemove,
		            beforeDragOpen : beforeDragOpen,
		            onDrag : onDrag,
		            onDrop : onDrop,
		            onExpand : onExpand
	    },
	};
	
	var zNodes= [
		  <c:forEach items="${cateList}" var="vo">
    	  <c:if test="${vo.curriculumCate_no eq 10000}">
          {id:${vo.curriculumCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.curriculumCate_no}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
          </c:if>
          <c:if test="${vo.curriculumCate_no ne 10000}">
          {id:${vo.curriculumCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.curriculumCate_no}",icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
          </c:if>
          </c:forEach>
          <c:forEach items="${list}" var="vo">
          {id:${vo.curriculum_no},pId:${vo.curriculumCate_no},name:"${vo.curriName}",web:${vo.curriculum_no}, icon:"${pageContext.request.contextPath}/assets/css/img/item.png"},
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
        console.log("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length +  "이름:" + treeNodes + "/ID:" + treeNodes[0].id+"/pId:"+treeNodes.pId+" nodes." );
        UpdateCate(treeNodes[0].name,treeNodes[0].id,treeNodes[0].pId);
    }
    
    <!--드래그용 함수(드롭할때 해당 노드 정보 출력)-->
    function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" onDrop ]; moveType:" + moveType + "/ID:" + treeNodes[0].id+" /pId:" + treeNodes[0].pId);
        updateCate(treeNodes[0].name,treeNodes[0].id,treeNodes[0].pId);
        console.log("target: " + (targetNode ? targetNode.name +targetNode.id +targetNode.toString() : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
    }

    <!--드래그용 함수-->
    function onExpand(event, treeId, treeNode) {
        if (treeNode === autoExpandNode) {
            className = (className === "dark" ? "":"dark");
            showLog("[ "+getTime()+" onExpand ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name);
        }
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
//         fristStepDraw();
    });
    
    <!--삭제 수정용(삭제 후 노드 정보 출력)-->
    function onRemove(e, treeId, treeNode) {
        console.log("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp;이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId);
        deleteCate(treeNode.id);
    }
	
	// 교육과정 클릭 시 정보 뿌려줌
	function curriculum(treeId, treeNode, clickFlag) {
		var curriculum_no=treeNode.web;
		$.ajax({
	        url : "${pageContext.request.contextPath }/curri/"+curriculum_no,
	        type : "POST",
	        dataType : "json",
	        success : function(curriAllVo) {
	            $("#curriculumCate_no").val(curriAllVo.curriculumVo.curriculumCate_no).prop("selected",true),
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
				$("#testTime0").val(""),
				$("#testTime1").val(""),
				$("#testTime2").val("")
				
				 var listLen = curriAllVo.curriculumVo.testInfoList.length;
				 for(var i = 0; i < listLen; i++){
					 $("#testDate"+[i]).val(curriAllVo.curriculumVo.testInfoList[i].testDate);
					 $("#testTime"+[i]).val(curriAllVo.curriculumVo.testInfoList[i].testTime).prop("selected", true);
				 };
	        },
	        error : function(XHR, status, error) {
	            console.error(status + " : " + error);
	        }
	    });
	}
	
	
	////////////////////////////////////////////////////////////////////
	// 패키지 보기 모달창
	var settingModal2 = {
	   data: {
	       simpleData: {
	           enable: true
	       }
	   },
	   callback: {
	       beforeClick: package2
	   }
	};
	
	var zNodesModal2= [
		 <c:forEach items="${packageCateList}" var="vo">
	        <c:if test="${vo.packageCate_no eq 10000}">
	        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.packageCate_no}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
	        </c:if>
	        <c:if test="${vo.packageCate_no ne 10000}">
	        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.packageCate_no}",icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png" ,iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
	        </c:if>
	        </c:forEach>
	        <c:forEach items="${packageList}" var="vo">
	        {id:${vo.package_no},pId:${vo.packageCate_no},name:"${vo.packageName}",web:"${vo.package_no}",icon:"${pageContext.request.contextPath}/assets/css/img/item.png"},
	        </c:forEach>
	];
	
	$(document).ready(function(){
	   $.fn.zTree.init($("#modalTree2"), settingModal2, zNodesModal2);
	});
	
	function package2(treeId, treeNode, clickFlag) {
		var package_no=treeNode.web;
		$("#package_no").val(package_no);
	}
	
	$("#modalSelectBtn2").on("click", function(){
		var package_no = $("#package_no").val();
		console.log(package_no);
		$.ajax({
			url : "${pageContext.request.contextPath }/curri/viewPackageAjax",
			type : "POST",
			data : {"package_no": package_no},
			dataType : "json",
			success : function(packageVo) {
				console.log(packageVo.packageName);
				$("input[name='packageName']").val(packageVo.packageName);
				$("input[name='package_no']").val(packageVo.package_no);
				$("#packageViewModal2").modal("hide");
			},
			error : function(XHR, status, error) {
			console.error(status + " : " + error);
			}
		});
	});
	
	$("#modalCancelBtn2").on("click", function(){
	   $("#packageViewModal2").modal("close"); // 모달창 감추기
	});
	
	/////////////////////////////////////////////////////////////////////////////////////////////////

	//커리큘럼 추가(저장버튼)
	$("#addCurriBtn").on("click", function(){
		var curriculumCate_no = $("#curriculumCate_no option:selected").val();
		console.log(curriculumCate_no);
		var package_no = $("input[name=package_no]").val();
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
		var testDateCnt = 3;
		var testInfoList = []; //배열
		var testInfoVo = {}; //객체 (new랑 같은 의미)
		var sucCnt = 0;
		for(var i = 0; i < testDateCnt; i++){
			if(($("#testDate"+i).val() != "" && $("#testDate"+i).val() != null) 
					|| ($("#testTime"+i).val() != "" && $("#testTime"+i).val() != null)){
				if(($("#testDate"+i).val() != "" && $("#testDate"+i).val() != null) 
						&& ($("#testTime"+i).val() != "" && $("#testTime"+i).val() != null)){
					var testInfoVo = {	testDate : $("#testDate"+i).val(),
										testTime : $("#testTime"+i).val()
									 }; 
					testInfoList[sucCnt] = testInfoVo;
					sucCnt += 1;
				}else if(($("#testDate"+i).val() == null || $("#testDate"+i).val() == "")
						|| ($("#testTime"+i).val() == null || $("#testTime"+i).val() == "")){
					alert("전형일시를 정확히 입력해주세요.");
					return false;
				}
			}
		}
		
		curriculumVo = { 	curriculumCate_no : $("#curriculumCate_no option:selected").val(),
							package_no : $("input[name=package_no]").val(),
							packageName : $("input[name=packageName]").val(),
							curriculum_no : $("input[name=curriculum_no]").val(),
							curriName : $("input[name=curriName]").val(),
							curriNickname : $("input[name=curriNickname]").val(),
							startDate : $("input[name=startDate]").val(),
							endDate : $("input[name=endDate]").val(),
							time : $("input[name=time]").val(),
							maxCnt : $("input[name=maxCnt]").val(),
							price : $("input[name=price]").val(),
							support : $("input[name=support]").val(),
							managerInfo : $("input[name=managerInfo]").val(),
							state : $("input[type=radio]:checked").val(),
							gisuName : $("input[name=gisuName]").val(),
							testInfoList : testInfoList
		 				};
		
		jQuery.ajaxSettings.traditional = true;
		var confirmSaveMsg = confirm("저장하시겠습니까?");
		if(confirmSaveMsg){
			$.ajax({
				url : "${pageContext.request.contextPath}/curri/addCurri",
				type : "post",
		        contentType: "application/json",
				data : JSON.stringify(curriculumVo), 
	 		 	dataType : "json",
				success : function(result){
					
					if(result != 0){
// 						alert("저장이 완료되었습니다.");
		   				var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
						treeObj.refresh();
						location.reload();
						var confirmMsg = confirm("계속 추가하시겠습니까?")
						if(confirmMsg){
								
							}else{
								location.replace("${pageContext.request.contextPath}/curri/")
							}
						}else{
							alert("다시 시도해주세요.");
						}
				},
				error : function(XHR, status, error){
	 				console.error(status + " : " + error);
	 			}
			});//ajax
		}else{
			return;
		}
	});//addCurriBtn onClick

	function updateCate(name, id, pId){
		console.log(name+id+pId);
		curriculumCateVo = {cateName : name, curriculumCate_no : id, parentCode : pId}
		$.ajax({
			url : "${pageContext.request.contextPath}/curri/updateCate",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(curriculumCateVo),
			dataType : "json",
			success : function(result){
				if(result == 1){
					alert("수정이 완료되었습니다.");
					location.reload();
				}
			},
			error : function(XHR, status, error){
				console.error(status + " : " + error);
			}
		});
	}
	
    function deleteCate(id){
    	$.ajax({
    		url : "${pageContext.request.contextPath}/curri/deleteCate",
    		type : "post",
    		data : {curriculumCate_no : id},
    		dataType : "json",
    		success : function(result){
    			if(result == 1){
    				alert("삭제가 완료되었습니다.");
    				location.reload();
    			}
    		},
    		error : function(XHR, status, error){
    			console.error(status + " : " + error);
    		}
    	});// ajax
    }// function
    
	// 교육과정 카테고리 추가 버튼
  	$("#addCateBtn").on("click", function(){
  		$("#addCateModal").modal();
  	});
    
  	// 카테고리 추가 버튼 (진행중)
  	$("#addCateSaveBtn").on("click", function(){
  	    event.preventDefault();
		var curriculumCate_no = $("#curriculumCate_no2 option:selected").val();
  		var cateName = $("input[name=cateName2]").val();
  		$.ajax({
  			url : "${pageContext.request.contextPath}/curri/addCurriCate",
  			type : "post",
  			dataType : "json",
  			data : {"curriculumCate_no" : curriculumCate_no, "cateName" : cateName},
  			success : function(){
  				location.reload();
  			},
  			error : function(XHR, status, error){
  				console.error(status + " : " + error);
  			}
  		});
  		$("#addCateModal").modal("close");
  	});
  	
  	$("#emptyTbl").on("click", function(){
  		emptyTblFnc();
  	});
  	
  	function emptyTblFnc(){
		$("#curriculumCate_no").prop('selectedIndex', '0'),
        $("input[name='package_no']").val(""),
        $("input[name='packageName']").val(""),
        $("input[name='curriculum_no']").val(""),
		$("input[name='curriName']").val(""),
		$("input[name='curriNickname']").val(""),
		$("input[name='startDate']").val(""),
		$("input[name='endDate']").val(""),
		$("input[name='time']").val(""),
		$("input[name='maxCnt']").val(""),
		$("input[name='price']").val(""),
		$("input[name='support']").val(""),
		$("input[name='managerInfo']").val(""),
		$("input[name='gisuName']").val(""),
     	$("input[name='state']").attr("checked", false), /* radio button 초기화 */
		$("input[name='mainViewFlag']").attr("checked",false), /* radio button 초기화 */
		$("input[name='detailViewFlag']").attr("checked",false), /* radio button 초기화 */

		//전형일 초기화
		$("#testDate0").val(""),
		$("#testDate1").val(""),
		$("#testDate2").val(""),
		$("#testTime0").prop('selectedIndex', '0'),
		$("#testTime1").prop('selectedIndex', '0'),
		$("#testTime2").prop('selectedIndex', '0')
  	}
</script>
