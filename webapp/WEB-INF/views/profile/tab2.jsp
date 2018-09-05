<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-12 left-nopadding">
	<div class="row">
		<div class="col-xs-7 right-nopadding"">
			<div class="sub-box">
				<div class="sub-title">외국어</div>
				
				<div class="sub-body" id="">
					<table class="table table-hover table-condensed">
						<colgroup>
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th>과목</th>
								<th>독해</th>
								<th>작문</th>
								<th>회화</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="">영어</td>
								<td class="">셀렉트박스</td>
								<td class="">셀렉트박스</td>
								<td class="">셀렉트박스</td>
							</tr>
							<tr>
								<td class="">셀렉트박스</td>
								<td class="">셀렉트박스</td>
								<td class="">셀렉트박스</td>
								<td class="">셀렉트박스</td>
							</tr>
						</tbody>
					</table>
				</div><!-- /.sub-body -->
			</div><!-- /.sub-box -->
		</div><!-- /.col-xs-7 -->
		
		<div class="col-xs-5">
			<div class="sub-box">
				<div class="sub-title">언어시험</div>
				
				<div class="sub-body" id="">
					<table class="table table-hover table-condensed">
						<colgroup>
							<col width="" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th>시험명</th>
								<th>점수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="">섹렉트박스</td>
								<td class="">text박스</td>
							</tr>
							<tr>
								<td class="">셀렉트박스</td>
								<td class="">text박스</td>
							</tr>
						</tbody>
					</table>
				</div><!-- /.sub-body -->
			</div><!-- /.sub-box -->
		</div>
	</div><!-- /.row -->
	<div class="row">
		<div class="col-xs-12">
			<div class="sub-box">
				<div class="sub-title">해외연수</div>
				
				<div class="sub-body" id="">
					<table class="table table-hover table-condensed">
						<colgroup>
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>기간(부터)</th>
								<th>기간(까지)</th>
								<th>국가</th>
								<th>교육과정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="0" end="3" step="1">
								<tr>
									<td class="">영어</td>
									<td class="">영어</td>
									<td class="">셀렉트박스</td>
									<td class="">셀렉트박스</td>
									<td class="">셀렉트박스</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- /.sub-body -->
			</div><!-- /.sub-box -->
		</div><!-- /.col-xs-12-->
	</div><!-- /.row -->
	
	<div class="row">
		<div class="col-xs-12">
			<div class="sub-box">
				<div class="sub-title">학원교육</div>
				
				<div class="sub-body" id="">
					<table class="table table-hover table-condensed">
						<colgroup>
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>기간(부터)</th>
								<th>기간(까지)</th>
								<th>교육기간</th>
								<th>교육과정</th>
								<th>주요교육내용</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="0" end="3" step="1">
								<tr>
									<td class="">영어</td>
									<td class="">영어</td>
									<td class="">셀렉트박스</td>
									<td class="">셀렉트박스</td>
									<td class="">셀렉트박스</td>
									<td class="">셀렉트박스</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- /.sub-body -->
			</div><!-- /.sub-box -->
	
		</div><!-- /.col-xs-12-->
	</div><!-- /.row -->
	

	
</div><!-- /.col-xs-12 -->