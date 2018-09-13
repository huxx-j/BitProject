<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	
	$(document).ready(function(){
	    $.fn.zTree.init($("#modalTree"), settingModal, zNodesModal);
	});
	
	// 커리큘럼 수정 버튼
	$("#editCurriBtn").on("click", function(){
		var cateName = $("#cateName option:selected").val();
		var curriculumCate_no = $("#curriculumCate_no option:selected").val();
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
		if(curriName == null || curriName == ""){
			alert("교육과정명을 입력해주세요.");
			return false;
		}
		// 전형일 3개로 고정(임시)
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
		
		//달력 날짜 형식 체크
		/* 
		var datePattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;

		if(datePattern.test(startDate) == false) {

		    alert("'시작일'을 YYYY-MM-DD 형식으로 입력해주세요.");

		} else if(datePattern.test(endDate) == false){

		    alert("'시작일'을 YYYY-MM-DD 형식으로 입력해주세요.");

		}else {
			
		}
		
		 */
		var specialChar = /[`!@#$%^&*|\\\'\";\?]/gi;
		if(specialChar.test(curriName) == true){
			alert("'교육과정명'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else if(specialChar.test(curriNickname) == true){
			alert("'과목별명'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else if(specialChar.test(price) == true){
			alert("'교육비용'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else if(specialChar.test(maxCnt) == true){
			alert("'정원'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else if(specialChar.test(time) == true){
			alert("'강의시간'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else if(specialChar.test(support) == true){
			alert("'교육비지원'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else if(specialChar.test(managerInfo) == true){
			alert("'문의'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else if(specialChar.test(gisuName) == true){
			alert("'기수'에 특수기호는 입력하실 수 없습니다.")
			return false;
		}else{
			curriculumVo = { 	/* cateName : $("#cateName option:selected").val(), */
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
		}
		
		if(curriculum_no == null || curriculum_no ==""){
			alert("수정할 교육과정을 선택해주세요.");
			return false;
		}
		
		var editConfirmMsg = confirm("수정하시겠습니까?");
		if(editConfirmMsg){
			$.ajax({
				url : "${pageContext.request.contextPath}/curri/edit",
				type : "post",
		        contentType: "application/json",
					data : JSON.stringify(curriculumVo), //@RequestBody(ModelAttribute대신)
					dataType : "json",
					success : function(result){
						if(result != 0){
// 			 				alert("수정이 완료되었습니다.");
	   					    var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
							treeObj.refresh();
							location.reload();
						}else{
			 				alert("다시 시도해주세요.");
						}
					},
					error : function(XHR, status, error){
						console.error(status + " : " + error);
					}
			}); //ajax		
		}else{
			return false;
		}
	});// onClick function
	
	////////////////////////////////////////////////////////////////////
	
	// 패키지 보기 모달창
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
	
	function package(treeId, treeNode, clickFlag) {
		var package_no=treeNode.web;
		$("#package_no").val(package_no);
	}
	
	$("#modalSelectBtn").on("click", function(){
		var package_no = $("#package_no").val();
		console.log(package_no);
        $.ajax({
            url : "${pageContext.request.contextPath }/curri/viewPackageAjax",
            type : "POST",
            data : {"package_no": package_no},
            dataType : "json",
            success : function(packageVo) {
            	$("input[name='packageName']").val(packageVo.packageName);
            	$("input[name='package_no']").val(packageVo.package_no);
            	$("#packageViewModal").modal("hide");
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });
	
	
	$("#modalCancelBtn").on("click", function(){
	    $("#packageViewModal").modal("close"); // 모달창 감추기
	});
	//////////////////////////////////////////////////////////////////////////////////////////////////

	// 교육과정 카테고리 추가 버튼
	$("#addCateBtn").on("click", function(){
		$("#addCateModal").modal();
	});
	
	// 카테고리 추가 버튼 (진행중)
	$("#addCateSaveBtn").on("click", function(){
	    event.preventDefault();
// 		var curriculumCate_no = $("#curriculumCate_no").val();
		var curriculumCate_no = $("#curriculumCate_no2 option:selected").val();
		var cateName = $("input[name=cateName2]").val();
		console.log(curriculumCate_no);
		console.log(cateName);
		var specialChar = /[`!@#$%^&*|\\\'\";:\/?]/gi;
		if(specialChar.test(cateName) == true){
			alert("특수기호는 사용하실 수 없습니다.")
			return false;
		}else{
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
		}
		$("#addCateModal").modal("close");
	});
	
	$("#addCurriFormBtn").on("click", function(){
		location.replace("${pageContext.request.contextPath}/curri/addCurriForm");
	});

</script>