<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-12 left-nopadding">
	
	<div class="sub-box">
		<div class="sub-title">과거지원내역</div>
		<!-- sub_title -->
		
		<div class="sub-body bordered  scroll" style="height: 110px;">
			<div class="innerBox">
				<table class="table table-hover table-condensed">
					<colgroup>
						<col width="22%">
						<col width="78%">
					</colgroup>

					<thead>
					<tr>

						<th>전형일자</th>
						<th>과정명</th>
					</tr>
					</thead>
					<tbody class="">
						<c:forEach begin="0" end="2" step="1">
							<tr class="past mouse" id="56" >
								<td>2017-09-04-08:50</td>
								<td>JAVA 기반 웹표준 웹프로그래밍 고급인력 양성과정</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div><!-- ./innerBox -->
		</div>
		<!-- /.sub-body -->

	</div>
	<!-- /.sub-box -->
	
	
	<div class="sub-box">
		<!-- sub_title -->
		<div class="sub-title">프로젝트 상세</div>
		<!-- /.sub_title -->
		<!-- sub_body -->
		<div class="sub-body" id="">
			
			<table class="table table-condensed">
				<colgroup>
					<col width="80px" />
					<col width="" />
				</colgroup>

				<tbody>
				<tr>
					<th>프로젝트명</th>
					<td>프로젝트명</td>
				</tr>
				<tr>
					<th>조원</th>
					<td>조원1,  조원2,  조원3</td>
				</tr>
				<tr>
					<th>파일</th>
					<td>ㅁㅁㅁㅁ.zip</td>
				</tr>
				<tr>
					<th>개요</th>
					<td>
						<textarea class="form-control" name="" id="" style="height: 80px;" ></textarea>
					</td>
				</tr>
				<tr>
					<th>설계의주안점</th>
					<td>
						<textarea class="form-control" name="" id="" style="height: 80px;" ></textarea>
					</td>
				</tr>
				<tr>
					<th>응용분야</th>
					<td>
						<textarea class="form-control" name="" id="" style="height: 80px;" ></textarea>
					</td>
				</tr>
				<tr>
					<th>사용기술</th>
					<td>
						<textarea class="form-control" name="" id="" style="height: 80px;" ></textarea>
					</td>
				</tr>
				</tbody>
			</table>
		
		</div>
		<!-- /.sub_body -->
	</div>
	<!-- /.sub-box -->
	
	
</div><!-- /.col-xs-12 -->