<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

	//교육과정 카테고리 추가 버튼
	$("#addCateBtn").on("click", function(){
		$("#addCateModal").modal();
	});
	
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
	


</script>