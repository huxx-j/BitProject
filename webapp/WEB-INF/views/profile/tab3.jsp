<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-12 left-nopadding">
	
	<div class="sub-box">
		<div class="sub-title">직장근무경력</div>
		
		<div class="sub-body" id="">
			<table class="table table-hover table-condensed">
				<colgroup>
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
				</colgroup>
				<thead>
					<tr>
						<th>기간(부터)</th>
						<th>기간(까지)</th>
						<th>회사명</th>
						<th>부서</th>
						<th>직위</th>
						<th>담당업무</th>
						<th>퇴직사유</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="0" end="3" step="1" var="i">
					<tr>
						<td>
							<div class="input-group border-inputcolor">
    							<input type="text" class="input-sm form-control border-none" name="date1" id="date11" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
    							<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
							</div>
						</td>
						<td>
							<div class="input-group border-inputcolor">
    							<input type="text" class="input-sm form-control border-none" name="date1" id="date11" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
    							<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
							</div>
						</td>
						<td><input type="text" id="" class="form-control" name=""></td>	
						<td><input type="text" id="" class="form-control" name=""></td>
						<td><input type="text" id="" class="form-control" name=""></td>
						<td><input type="text" id="" class="form-control" name=""></td>
						<td><input type="text" id="" class="form-control" name=""></td>
					</tr>
					</c:forEach>
				</tbody>
				
				
				
			</table>
		</div><!-- /.sub-body -->
	</div><!-- /.sub-box -->
	
	
	<div class="sub-box">
		<div class="sub-title">수행프로젝트</div>
		<div class="sub-body" id="">
			<table class="table table-hover table-condensed">
				<colgroup>
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<td>
							<textarea class="form-control" name="" id="" style="height: 100px;" ></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- /.sub-body -->	
	</div><!-- /.sub-box -->
	
	
	
	
</div><!-- /.col-xs-12 -->