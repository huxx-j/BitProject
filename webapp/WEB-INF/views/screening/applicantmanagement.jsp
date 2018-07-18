<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>TCOMS ver2</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<c:import url="/WEB-INF/views/includes/link.jsp" />
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp" />

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

<c:import url="/WEB-INF/views/includes/header.jsp" />
<c:import url="/WEB-INF/views/includes/aside.jsp" />


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>지원자관리
			<small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
		  <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		  <li><a href="#">전형업무관리</a></li>
		  <li class="active">지원자관리</li>
		</ol>
	</section>
	<!-- /.Content Header (Page header) -->
	
	<!-- Main content -->
	<section class="content">
		
		<!-- 상단 -->
		<div class="row">
			<div class="col-xs-12">
			
				<div class="box box-body">
					<div class="row">
						<div class="col-xs-12">
							<div class="sub-box">
								<%-- <form class="search-form" method="post" action="${pageContext.request.contextPath}/api/cm/search"> --%>
									<div class="sub-title">
				              			지원자검색
				            		</div><!-- sub_title -->
									
									<div class="sub-body">
										<table class="table table-condensed">
				 							<colgroup>
												<col width="250px" />
												<col width="" />
												<col width="300px" />
											</colgroup>
				 							
				 							<thead>
				 								<tr>
				 									<th>업무구분</th>
													<th>교육과정명</th>
													<th>상태</th>
				 								</tr>
				 							</thead>	
				 							
				 							<tbody>
				 								<tr>
													<td>
				                    					<select name="workType" class="form-control input-sm" id="workTypeSelect">
				                    						<c:forEach items = "${requestScope.curriList}" var = "curriList">
				                    							<option value="${curriList.workType}" id="${curriList.workType}">${curriList.workType}</option>
				                    						</c:forEach>
				                  						</select>
				                  					</td>
				                  					<td id="curriTd">
				                    					<select name="strcurriName" class="form-control input-sm" id="curriSelect">
				                    					
					                  					</select>
				                  					</td>
				                  					<td>
				                    					<label class="form-controll-static"><input class="" type="radio" name="state" value="전체">전체</label>
			                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="모집중">모집중</label>
				                  					</td>
												</tr>
				  							</tbody>
				  						</table>
				  					</div><!-- /.sub-body -->
			  						<div class="sub-toolbox text-center">
				                        <button type="button" class="btn btn-primary" id="applySearch">조회</button>
				                    </div>
		              			<!-- </form> -->
							</div><!-- sub-box -->
						</div><!-- /.col-xs-12 -->
					</div><!-- /.row -->
				</div><!-- /.box -->
			
			</div><!-- /.col-xs-12 -->
		</div>
		<!-- /.row 상단-->
	
		<!-- 하단 -->
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-body">

					<div class="row">
						<div class="col-xs-12" >
							<div class="sub-box">
								<div class="sub-title">
			              			지원자리스트
			            		</div><!-- sub_title -->
			            		<div class="sub-body bordered scroll" style="height:300px;">
									<table id="jqGrid" style="text-align:center;"></table>

									<div id="jqGridPager"></div>
			            		</div><!-- /.sub-body -->	
			            		
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-12 -->
					</div><!-- /.row -->
					<div class="space"></div>
					<div class="row">
						<div class="col-xs-3">
							<div class="sub-box">
								<div class="sub-title">
			              			과거지원내역
			            		</div><!-- sub_title -->
			            		<div class="sub-body" style="height:150px; ">
			            			<table class="table table-hover table-condensed">
			 							<colgroup>
											<col width="" />
											<col width="" />
										</colgroup>
 							
		 								<thead>
			 								<tr>
			 									<th>전형일자</th>
												<th>과정명</th>
			 								</tr>
		 								</thead>	
		 							
	 									<tbody>
			 								<tr>
												<td>2018-05-01</td>
			                  					<td>라즈베리파이를 이용한 전문</td>
											</tr>
											<tr>
												<td>2018-05-01</td>
			                  					<td>라즈베리파이를 이용한 전문</td>
											</tr>
	  									</tbody>
  									</table>
			            		</div><!-- /.sub-body -->	
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-3 -->
						<div class="col-xs-9">
							<div class="sub-box">
								<div class="sub-title">
			              			지원내역상세
			            		</div><!-- sub_title -->
			            		<div class="sub-body">
			            			<table class="table table-condensed">
			 							<colgroup>
											<col width="80px" />
											<col width="" />
											<col width="80px" />
											<col width="" />
											<col width="250px" />
										</colgroup>
			 							
			 							<tbody>
			 								<tr>
												<th>업무구분</th>
			                  					<td colspan="3">
			                    					<select class="form-control input-sm">
			                    						<option>국가기관</option>
			                    						<option>대학캠퍼스</option>
			                  						</select>
			                  					</td>
			                  					<td rowspan="5"><textarea class="form-control" rows="9" placeholder="상담내역"></textarea></td>
			                  				</tr>
			                  				
			                  				<tr>
			                  					<th rowspan="2">교육과정명</th>
			                  					<td colspan="3">
			                    					<label class="form-controll-static"><input class="" type="radio" name="state" value="">준비중</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집중</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집마감</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">수업중</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">종료</label>
			                  					</td>
											</tr>
											<tr>
			                  					<td colspan="3">
			                    					<input class="form-control input-sm" type="text" placeholder="">
			                  					</td>
											</tr>
											
											<tr>
			                  					<th>체크박스</th>
			                  					<td colspan="3">
			                    					<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">준비중</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">모집중</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">모집마감</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">수업중</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">종료</label>
			                  					</td>
											</tr>
											
											<tr>
			                  					<th>시작일</th>
			                  					<td>
									                <div class="input-group date">
									                	<div class="input-group-addon input-sm">
									                    	<i class="fa fa-calendar"></i>
									                  	</div>
														<input type="text" class="form-control input-sm pull-right" id="datepicker">									                  	
									                </div>
			                  					</td>
			                  					<th>종료일</th>
			                  					<td>
			                    					<div class="input-group date">
									                	<div class="input-group-addon input-sm">
									                    	<i class="fa fa-calendar"></i>
									                  	</div>
														<input type="text" class="form-control input-sm pull-right" id="datepicker">									                  	
									                </div>
			                  					</td>
											</tr>
											
			  							</tbody>
			  						</table>
			            		</div><!-- /.sub-body -->	
			            		<div class="sub-toolbox text-center">
	              						<button type="button" class="btn btn-primary">저장</button>
	              				</div>
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-9 -->
					</div><!-- /.row -->
				
				</div><!-- /.box -->
			</div><!-- /.col-xs-12 -->
		</div>
		<!-- /.row 하단-->
	
	</section>
	<!-- /.Main content -->
 
 
 
</div>
<!-- /.content-wrapper -->

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	<div class="control-sidebar-bg"></div>



</div>
<!-- ./wrapper -->


<script type="text/javascript">

$(document).ready(function () {
	
	var selectValue = $("#workTypeSelect option:selected").val();
	   console.log("ajsdfhijashdfahdfuihsadijfb");
	$.ajax({
	        url: "${pageContext.request.contextPath}/api/apply/getcurri",
	        type: "post",
	        data: {"workType": selectValue},
	        dataType: "json",
	        success: function (list) {
	        	console.log("지원자 관리 들어갔다 왔어요");
	            $("#curriSelect").remove();
	            var str = "";
	            str += "<select id='curriSelect' style='width: 90%'></select>";
	
	            $("#curriTd").append(str);
	
	            for (var i = 0; i < list.length; i++) {
	                renderCurri(list[i])
	            }
	        },
	        error: function (XHR, status, error) {
	            console.error(status + " : " + error)
	        }
	    });

//업무 구분별 과목 불러오는 스크립트
$("#workTypeSelect").change(function () {
    var selectValue = $("#workTypeSelect option:selected").val();

    $.ajax({
        url: "/api/apply/getcurri",
        type: "post",
        data: {"workType": selectValue},
        dataType: "json",
        success: function (list) {
            $("#curriSelect").remove();
            var str = "";
            str += "<select id='curriSelect' style='width: 90%'></select>";

            $("#curriTd").append(str);

            for (var i = 0; i < list.length; i++) {
                console.log(list[i])
                renderCurri(list[i])
            }
        },
        error: function (XHR, status, error) {
            console.error(status + " : " + error)
        	}
   	 });

	});

	function renderCurri(curri) {
	    var str = "";
	    str += "<option value='" + curri.curriculum_no + "'>" + curri.curriName + "</option>";
	
	    $("#curriSelect").append(str);
	};

	


});
	
	
$(document).on("click","#applySearch",function(){
    var selectValue = $("#curriSelect option:selected").val();
	console.log("클릭됨"+selectValue);
	$.ajax({
        url: "/api/apply/search",
        type: "post",
        data: {"selectValue": selectValue},
        dataType: "json",
        success: function (list) {
          console.log("search 잘 들어갔다 나옴");
          
        },
        error: function (request,status,error) {
        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
   	 });


});	
	
/* var cnames = ['번호', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부'];

$("#jqGrid").jqGrid({
    url: "jqgridStartMain.do",
    datatype: "local",
    colNames: cnames,
    colModel: [
        {name: 'seq', index: 'seq', width: 50, align: "center"},
        {name: 'gisu', index: 'gisu', width: 100, align: "center"},
        {name: 'name', index: 'name', width: 100, align: "center"},
        {name: 'birth', index: 'birth', width: 100, align: "center"},
        {name: 'gender', index: 'gender', width: 50, align: "center"},
        {name: 'result', index: 'result', width: 80, align: "center"},
        {name: 'phone', index: 'phone', width: 150, align: "center"},
        {name: 'appdate', index: 'appdate', width: 100, align: "center"},
        {name: 'exdate', index: 'exdate', width: 100, align: "center"},
        {name: 'school', index: 'school', width: 150, align: "center"},
        {name: 'major', index: 'major', width: 150, align: "center"},
        {name: 'yn', index: 'yn', width: 80, align: "center"}
    ],
    rowheight: 20,
    height: 230,
    rowNum: 15,
    rowList: [10, 20, 30],
    pager: '#jqGridPager',
    rownumbers: true,
    ondblClickRow: function (rowId, iRow, iCol, e) {

        if (iCol == 1) {

            alert(rowId + " 째줄 입니다.");
        }
    },

    viewrecords: true, */
    /* caption: "유저 정보" */

/* 
});
 */

/* ajax로 DB에서 정보 긁어서 뿌려주는 코드 */

// $(function () {
//
//     $.ajax({
//         url: "/api/getuserinfo",
//         type: "post",
//         dataType: "json",
//         success: function (result) {
//             console.log(result);
//
//             for (var i = 0; i<result.length; i++)
//                 $("#jqGrid").jqGrid('addRowData', i+1, result[i]);
//         },
//         error: function (XHR, status, error) {
//             console.error(status + " : " + error);
//         }
//     });
//
// });


/* $(function () {
var mydata = [
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    
];

for (var i=0; i<=mydata.length; i++) {
    $("#jqGrid").jqGrid('addRowData', i+1, mydata[i]);
}
});	
	 */
</script>
</body>
</html>


<%-- <c:import url="/WEB-INF/views/screening/applyScript.jsp" /> --%>
