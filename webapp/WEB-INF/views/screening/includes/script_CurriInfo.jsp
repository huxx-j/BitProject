<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

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
	

	$("#addTestDateBtn").on("click", function(){
		console.log("버튼이 먹히긴 먹힌다는 증거이다.");
		var row = "";
		row += "<td class = 'col-xs-1' >";
		row += "	<div class='input-group border-inputcolor'>";
		row += "		<input type='text' class= 'form-control border-none input-group border-inputcolor' name='testDate' id='testDate' data-select='datepicker' data-toggle='datepicker' placeholder='YYYY-MM-DD'>";
		row += "	</div>";
		row += "</td>";
		row += "<td class = 'col-xs-1'  id = 'td_testDate'>";
		row += "	<div style = 'float : left;'>";
		row += "		<select class = 'form-control' id = 'testTime' name = 'testTime'>";
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
		row += "	</div>";
		row += "	<div style = 'float : right; vertical-align: middle; margin:2px 0px 1px 0px !important;'>";
		row += "		<button class = 'glyphicon glyphicon-plus border-none' style = 'background-color : transparent;' id = 'addTestDateBtn'></button>";
		row += "		<button class = 'glyphicon glyphicon-remove border-none' style = 'background-color : transparent;'></button>";
		row += "	</div>";
		row += "</td>";
		
		$("#tr_testDate").append(row);
	});

</script>