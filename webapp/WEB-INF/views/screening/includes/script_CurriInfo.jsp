<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

	
	
	//커리큘럼 수정 버튼
	// $("#editCurriBtn").unbind("click").bind("click", function(){
	$("#editCurriBtn").on("click", function(){
		console.log("editCurriBtn");
// 		var testTimeCnt = $("input[name=testTimeCnt]").val();
	//		console.log(curriName);	
		var cateName = $("#cateName option:selected").val();
		var curriculumCate_no = $("input[name=curriculumCate_no]").val();
		var package_no = $("input[name=package_no]").val();
		var packageName = $("input[name=packageName]").val();
		var curriculum_no = $("input[name=curriculum_no]").val();
		var curriName = $("input[name=curriName]").val();
		var curriNickname = $("input[name=curriNickname]").val();
		var startDate = $("input[name=startDate]").val();
		var endDate = $("input[name=endDate]").val();
		
		var testDateCnt = $(".testTimeDiv").index($(".testTimeDiv").last());
		var testInfoList = []; //배열
		var testInfoVo = {}; //객체 (new랑 같은 의미)
// 		var testDate = [];
// 		var testTime = [];
		for(i = 0; i < testDateCnt+1; i++){
			var testInfoVo = {	testDate : $("#testDate"+i).val(),
								testTime : $("#testTime"+i).val()
							 }; 
// 			testDate[i] = $("#testDate"+i).val();
// 			testTime[i] = $("#testTime"+i).val();
// 			testDate.push($("td ").eq(i).val());
			testInfoList[i] = testInfoVo;
		}
		var time = $("input[name=time]").val();
		var maxCnt = $("input[name=maxCnt]").val();
		var price = $("input[name=price]").val();
		var support = $("input[name=support]").val();
		var managerInfo = $("input[name=managerInfo]").val();
		var state = $("input[type=radio]:checked").val();
		var gisuName = $("input[name=gisuName]").val();
// 		console.log("cateName="+cateName, "package_no="+package_no, "curriculumCate_no="+curriculumCate_no, 
// 					"packageName="+packageName, "curriculum_no="+curriculum_no, "curriName="+curriName,
// 					"curriNickname="+curriNickname, "startDate="+startDate, "endDate="+endDate, "testDate="+testDate, "testTime="+testTime,
// 					"time="+time, "maxCnt="+maxCnt, "price="+price, "support="+support, "managerInfo="+managerInfo,
// 					"state="+state, "gisuName="+gisuName);
		 curriculumVo = { 
		 					cateName : $("#cateName option:selected").val(),
							curriculumCate_no : $("#curriculumCate_no option:selected").val(),
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
		console.log(curriculumVo);
		alert("수정하시겠습니까?");
		$.ajax({
			url : "${pageContext.request.contextPath}/curri/edit",
			type : "post",
	        contentType: "application/json",
				data : JSON.stringify(curriculumVo), //@RequestBody(ModelAttribute대신)
// 				data : {cateName : cateName, curriculumCate_no : curriculumCate_no, package_no : package_no, packageName : packageName,
// 					curriculum_no : curriculum_no, curriName : curriName, curriNickname : curriNickname,
// 					startDate : startDate, endDate : endDate, testDate : testDate, testTime : testTime, time : time, maxCnt : maxCnt, price : price,
// 					support : support, managerInfo : managerInfo, state : state, gisuName : gisuName},
				dataType : "json",
				success : function(result){
	// 				console.log("성공"+curriVo);
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
			location.reload();
			treeObj.refresh();

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
	        beforeClick: package
	    }
	};
	var zNodesModal= [
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
	    $.fn.zTree.init($("#modalTree"), settingModal, zNodesModal);
	});
	
	
	function package(treeId, treeNode, clickFlag) {
	    $("#modalSelectBtn").on("click", function(){
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
	            	$("#packageViewModal").modal("hide");
	            },
	            error : function(XHR, status, error) {
	                console.error(status + " : " + error);
	            }
	        });
	    });
	}
	
	$("#modalCancelBtn").on("click", function(){
	    $("#packageViewModal").modal("close"); // 모달창 감추기
	});
	//////////////////////////////////////////////////////////////////////////////////////////////////

	//교육과정 카테고리 추가 버튼
	$("#addCateBtn").on("click", function(){
		$("#addCateModal").modal();
	});
	//카테고리 추가 버튼 (진행중)
	$("#addCateSaveBtn").on("click", function(){
	    event.preventDefault();
		var curriculumCate_no = $("#curriculumCate_no").val();
		var cateName = $("input[name=cateName]").val();
		console.log(curriculumCate_no, cateName);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/curri/addCurriCate",
			type : "post",
			dataType : "json",
			data : {"curriculumCate_no" : curriculumCate_no, "cateName" : cateName},
			success : function(){
				
			},
			error : function(XHR, status, error){
				console.error(status + " : " + error);
			}
			
		});
		location.reload();
		$("#addCateModal").modal("close");
	});
	
	/* 
	$("#testTimeTd").on("click", ".addTestDateBtn", function(){
			console.log("버튼이 먹히긴 먹힌다는 증거이다.");
			var testTimeCnt = $("input[name=testTimeCnt]").val();
			testTimeCnt++;
			$("input[name=testTimeCnt]").val(testTimeCnt);
			
			var row = "";
			row += "<div class='pull-left form-inline testTimeDiv w280' id = 'testTimeDiv"+testTimeCnt+"' style = ' margin-bottom:3px;'>";
			row += "	<span class='input-group border-inputcolor w140 input-datepicker'>";
			row += "		<input type='text' class= 'abc form-control border-none ' id='testDate"+testTimeCnt+"'  data-select='datepicker' data-toggle='datepicker' placeholder='YYYY-MM-DD'>";
			row += "		<span class='input-group-btn'><button type='button' class='btn btn-date border-none' data-toggle='datepicker'><i class='fa fa-calendar'></i></button></span>";
			row += "	</span>";
			row += "	<span>";
			row += "		<select class='form-control w60 testTime' name = 'testTime"+testTimeCnt+"'>";
			row += "			<option value = '--:--'>--:--</option>";
			row += "			<option value = '08:00'>08:00</option>";
			row += "			<option value = '09:00'>09:00</option>";
			row += "			<option value = '10:00'>10:00</option>";
			row += "			<option value = '11:00'>11:00</option>";
			row += "			<option value = '12:00'>12:00</option>";
			row += "			<option value = '13:00'>13:00</option>";
			row += "			<option value = '14:00'>14:00</option>";
			row += "			<option value = '15:00'>15:00</option>";
			row += "			<option value = '16:00'>16:00</option>";
			row += "			<option value = '17:00'>17:00</option>";
			row += "			<option value = '18:00'>18:00</option>";
			row += "			<option value = '19:00'>19:00</option>";
			row += "			<option value = '20:00'>20:00</option>";
			row += "			<option value = '21:00'>21:00</option>";
			row += "			<option value = '22:00'>22:00</option>";
			row += "			<option value = '23:00'>23:00</option>";
			row += "		</select>";
			row += "	</span>";
			row += "	<span>";
			row += "		<button class = 'glyphicon glyphicon-plus border-none addTestDateBtn' style = 'background-color : transparent;' ></button>";
			row += "		<button class = 'glyphicon glyphicon-remove border-none removeTestDateBtn' style = 'background-color : transparent;'></button>";
			row += "	</span>";
			row += "</div>";
			
			$("#testTimeTd").append(row);
	});
			 */
			 
	//전형일 삭제버튼
	/* 
 	$("#testTimeTd").on("click", ".removeTestDateBtn", function(){
		$(this).parent().parent().remove();
	}); 
	 */
	

 	$(document).ready(function () {
 		$("#testTimeTd").on("click", ".input-datepicker", function(){
 	 		$(this).datepicker(); 
 		});
  	});

	
	
	

</script>