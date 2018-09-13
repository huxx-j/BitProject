<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

	//기수부여
	function gisuGrant(){
		$("input[name=gisuGrant]:checked").each(function(){
			var applicant_no = $(this).attr("id");
			$("#renderApplicantList").find("#tr"+applicant_no).remove();
	       	$.ajax({
	            url : "${pageContext.request.contextPath }/curri/gisuGrant",
	            type : "POST",
	            data : {"applicant_no": applicant_no},
	            dataType : "json",
	            success : function(applicantVo) {
	            	var str = "";
				    str += "<tr id='tr" + applicantVo.applicant_no + "'>";
				    str += "	<td><label class = 'form-control-static'><input type = 'checkbox' name = 'gisuRemove' class = 'gisuRemoveCheckbox' id = '" + applicantVo.applicant_no + "' value = '" + applicantVo.nameHan +"'></label></td>";
					str += "	<td>" + applicantVo.nameHan + "</td>";    	
				    str += "	<td>" + applicantVo.studResNum +"</td>";
				    str += " 	<td>" + applicantVo.gender + "</td>";
				    str += "	<td>" + applicantVo.testResult +"</td>";
				 	str += "</tr>";
				 	$("#gisuGrantList").append(str); //앞에 초기화 한번 해주고 시작해야 함.(리스트 계속 밑으로 추가됨)
				},
	            error : function(XHR, status, error) {
	                console.error(status + " : " + error);
				}
			});
		});
	}
	
	// 기수 제거
	function gisuRemove(){
	  	$("input[name=gisuRemove]:checked").each(function(){
	  		var applicant_no = $(this).attr("id");
	       	$("#gisuGrantList").find("#tr"+applicant_no).remove();
	       	$.ajax({
	              url : "${pageContext.request.contextPath }/curri/gisuRemove",
	              type : "POST",
	              data : {"applicant_no": applicant_no},
	              dataType : "json",
	              success : function(applicantVo) {
	            	  var str = "";
	            	  str += "<tr id = 'tr"+ applicantVo.applicant_no + "'>";
	            	  str += "	<td><label class = 'form-control-static'><input type = 'checkbox' name = 'gisuGrant' class = 'gisuGrantCheckbox' id = '" + applicantVo.applicant_no + "' value = '" + applicantVo.nameHan +"'></label></td>";
	            	  str += "	<td>" + applicantVo.nameHan + "</td>";    	
	            	  str += "	<td>" + applicantVo.studResNum +"</td>";
	            	  str += " 	<td>" + applicantVo.gender + "</td>";
	            	  str += "	<td>" + applicantVo.testResult +"</td>";
	            	  str += "</tr>";
	            	  $("#renderApplicantList").append(str); //앞에 초기화 한번 해주고 시작해야 함.(리스트 계속 밑으로 추가됨)
	              },
	              error : function(XHR, status, error) {
	                  console.error(status + " : " + error);
	              }
	          });
	  	});
	}

	//기수부여 저장 버튼
	$("#gisuGrantSaveBtn").on("click", function(){
		//전체지원자리스트(Flag = 0)
		$("input[name=gisuGrant]").each(function(){
			var applicant_no = $(this).attr("id");
			console.log("remove" + applicant_no);
			$.ajax({
				url : "${pageContext.request.contextPath}/curri/gisuRemoveSave",
				type : "post",
				data : {"applicant_no" : applicant_no},
				dataType : "json",
				success : function(result){
					if(result != 0){
					}
				},
				error : function(XHR, status, error){
					console.error(status + ":" + error);
				}
				
			});//ajax
		});//each function
		
		//수강생리스트(Flag = 1)
		$("input[name=gisuRemove]").each(function(){
			var applicant_no = $(this).attr("id");
			console.log("grant" + applicant_no);
			$.ajax({
				url : "${pageContext.request.contextPath}/curri/gisuGrantSave",
				type : "post",
				data : {"applicant_no" : applicant_no},
				dataType : "json",
				success : function(result){
					if(result != 0){
					}
				},
				error : function(XHR, status, error){
					console.error(status + ":" + error);
				}
			});//ajax
		});//each function
		alert ("저장이 완료되었습니다");
		location.reload();
	});//gisuGrantSaveBtn onClick function
	
	//기수부여, 제거 전체선택
	$("#gisuGrantCheckAll").change(function(){  //"select all" change 
	    $(".gisuGrantCheckbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
	});
	
	//".checkbox" change 
	$('.gisuGrantCheckbox').change(function(){ 
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(false == $(this).prop("checked")){ //if this item is unchecked
	        $("#gisuGrantCheckAll").prop('checked', false); //change "select all" checked status to false
	    }
	    //check "select all" if all checkbox items are checked
	    if ($('.gisuGrantCheckbox:checked').length == $('.gisuGrantCheckbox').length ){
	        $("#gisuGrantCheckAll").prop('checked', true);
	    }
	});
	
	$("#gisuRemoveCheckAll").change(function(){  //"select all" change 
	    $(".gisuRemoveCheckbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
	});
	
	//".checkbox" change 
	$('.gisuRemoveCheckbox').change(function(){ 
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(false == $(this).prop("checked")){ //if this item is unchecked
	        $("#gisuRemoveCheckAll").prop('checked', false); //change "select all" checked status to false
	    }
	    //check "select all" if all checkbox items are checked
	    if ($('.gisuRemoveCheckbox:checked').length == $('.gisuRemoveCheckbox').length ){
	        $("#gisuRemoveCheckAll").prop('checked', true);
	    }
	});

</script>
