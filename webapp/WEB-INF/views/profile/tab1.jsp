<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-12 left-nopadding">
	<div class="sub-box">
		<div class="sub-title">병과</div>
		
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
						<th>병과</th>
						<th>계급</th>
						<th>입대월</th>
						<th>전역월</th>
						<th>미필사유</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" id="" class="form-control" name=""></td>
						<td><input type="text" id="" class="form-control" name=""></td>
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
					</tr>
				</tbody>
				
				
			</table>
		</div><!-- /.sub-body -->
	</div><!-- /.sub-box -->
	
	<div class="sub-box">
		<div class="sub-title">학력</div>
		
		<div class="sub-body" id="">
			<table class="table table-hover table-condensed">
				<colgroup>
					<col width="5px" />
					<col width="" />
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
						<th>no</th>
						<th>기간(부터)</th>
						<th>기간(까지)</th>
						<th>학교</th>
						<th>소재지</th>
						<th>학위</th>
						<th>전공</th>
						<th>부전공</th>
						<th>졸업구분</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="0" end="3" step="1" var="i">
					<tr>
						<td class="text-center">${i}</td>
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
						<td><input type="text" id="" class="form-control" name=""></td>
					</tr>
					</c:forEach>
				</tbody>
				
				
				
			</table>
		</div><!-- /.sub-body -->
	</div><!-- /.sub-box -->
	
	
	<div class="sub-box">
		<div class="sub-title">학위논문 제목/내용</div>
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
	
	<div class="sub-box">
		<div class="sub-title">자격증/수상내역</div>
		
		<div class="sub-body" id="">
			<table class="table table-hover table-condensed">
				<colgroup>
					<col width="5px" />
					<col width="" />
					<col width="110px" />
					<col width="" />
					<col width="90px" />
				</colgroup>
				<thead>
					<tr>
						<th>no</th>
						<th>자격증/수상 명</th>
						<th>취득일자</th>
						<th>발급기관</th>
						<th>비고(점수)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="0" end="3" step="1" var="i">
					<tr>
						<td class="text-center">${i+1}</td>
						<td>
							<input type="text" id="" class="form-control" name="">
						</td>
						<td>
							<div class="input-group border-inputcolor">
    							<input type="text" class="input-sm form-control border-none" name="date1" id="date11" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
    							<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
							</div>
						</td>
						<td><input type="text" id="" class="form-control" name=""></td>	
						<td><input type="text" id="" class="form-control" name=""></td>
					</tr>
					</c:forEach>
				</tbody>
				
				
				
			</table>
		</div><!-- /.sub-body -->
	</div><!-- /.sub-box -->
	
	
</div><!-- /.col-xs-12 -->