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
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jquery.datepicker.css">


</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>태그 사용 설명서
			<small>it all starts here</small>
		</h1>
	</section>



	<!-- /.Content Header (Page header) -->

	<!-- Main content -->
	<section class="content">

		<!-- 상단 -->
		<div class="row">
			<div class="col-xs-12">

				<div class="box box-body">
                    <div class="sub-title">
                        DatePicker 사용법
                    </div>
                    <div class="sub-body">
                        <textarea style="width: 100%; height: 200px">
1. <head></head>영역에 <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jquery.datepicker.css"> 를 추가
2. 문서하단에<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.datepicker.js"/> 추가
3. 달력을 쓸 위치에
<div class="input-group border-inputcolor w140">
    <input type="text" class="input-sm form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
    <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
</div>
를 추가하면 아래와 같은 달력이 생김
태그의 가로 길이는 div의  w140클래스를 지우고 Style에서 width를 줘서 조절하면 됨 (w140은 width를 140px으로 설정한 CSS임)
input태그에 id랑 name은 바꿔도 되지만 data-select="datepicker" data-toggle="datepicker" 이거는 절대 바꾸면 안됨
id겹치게 만들지 말것!!!

</textarea>
                    </div>
							<div class="sub-body">
						        <div class="input-group border-inputcolor w140">
							        <input type="text" class="input-sm form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
							        <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
						        </div>
                                <br>

                                <h5>w100(width 100px짜리 달력)</h5>
							    <div class="input-group border-inputcolor w100">
							    	<input type="text" class="input-sm form-control border-none" name="date2" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
								    <span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
						    	</div>
					    	</div>

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
									<table id="jqGrid"></table>

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
			            		<div class="sub-body bordered scroll" style="height:150px; ">
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
								<%--					<div class="input-group">
														<input type="text" class="date-input form-control" name="date" id="date" data-select="datepicker" readonly="readonly">
														<span class="date-span input-group-btn"><button type="button" class="btn btn-primary" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
													</div>--%>
									                <%--<div class="input-group date">--%>
														<%--<input type="date" class="form-control input-sm pull-right" id="datepicker1">--%>
									                	<%--&lt;%&ndash;<div class="input-group-addon input-sm">&ndash;%&gt;--%>
															<%--<label for="datepicker1"><i class="fa fa-calendar"></i></label>--%>
									                  	<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
									                <%--</div>--%>
			                  					</td>
			                  					<th>종료일</th>
			                  					<td>
			                    					<%--<div class="input-group" style="border: 1px solid #c2c2c2">--%>
														<%--<input type="text" class="form-control input-sm pull-right" name="date" id="date"  data-select="datepicker" style="border: none">--%>
									                	<%--<div class="input-group-addon input-sm" style="border: none ">--%>
									                    	<%--<span class="input-group-btn"><button type="button" class="btn" data-toggle="datepicker" style="border: none; background-color: rgba(255,255,255,0)"><i class="fa fa-calendar"></i></button></span>--%>
									                  	<%--</div>--%>
									                <%--</div>--%>
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


</body>
</html>

<script type="text/javascript">
    $(document).ready(function() {

        var cnames = ['과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부'];

        $("#jqGrid").jqGrid({
            url: "jqgridStartMain.do",
            datatype: "local",
            colNames: cnames,
            colModel: [
                {name: 'gisu', index: 'gisu', width: 200, align: "center"},
                {name: 'name', index: 'name', width: 200, align: "center"},
                {name: 'birth', index: 'birth', width: 200, align: "center"},
                {name: 'gender', index: 'gender', width: 200, align: "center"},
                {name: 'result', index: 'result', width: 200, align: "center"},
                {name: 'phone', index: 'phone', width: 200, align: "center"},
                {name: 'appdate', index: 'appdate', width: 200, align: "center"},
                {name: 'exdate', index: 'exdate', width: 200, align: "center"},
                {name: 'school', index: 'school', width: 200, align: "center"},
                {name: 'major', index: 'major', width: 200, align: "center"},
                {name: 'yn', index: 'yn', width: 200, align: "center"}
            ],

            rowheight: 20,
            height: 300,
            rowNum: 10,
            rowList: [10, 20, 30],
            pager: '#jqGridPager',
            rownumbers: true,
			scroll: 1,
            ondblClickRow: function (rowId, iRow, iCol, e) {

                if (iCol == 1) {

                    alert(rowId + " 째줄 입니다.");
                }
            },

            viewrecords: true,
            caption: "유저 정보"


        });


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


    });


    $(function () {
        var mydata = [
            {seq:"1",gisu:"dsfjkf",name:"ㅇㄹㄴ",birth:'2018-05-05',gender:"남",result:"탈락",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서을대학교",major:"콤퓨타",yn:"미납"},
            {seq:"1",gisu:"dsfjkf",name:"ㅇㄹㄴ",birth:'2018-05-05',gender:"남",result:"탈락",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서을대학교",major:"콤퓨타",yn:"미납"}


        ];

        for (var i=0; i<=mydata.length; i++) {
            $("#jqGrid").jqGrid('addRowData', i+1, mydata[i]);
        }
    });
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.datepicker.js"></script>