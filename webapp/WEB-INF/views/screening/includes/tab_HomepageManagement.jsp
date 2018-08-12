<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class = "tab-pane" id = "tab_2">
	<div class = "sub-box">
		<div class = "sub-body">
			<div class = "innerBox">
				<div class = "row">
					<div class = "col-xs-12">
						<table class = "table table-condensed">
							<tr>
								<th>교육과정명</th>
								<td class = "col-xs-10">
									<input type = "text" class = "form-control " readonly name = "curriName">
								</td>
							</tr>
						</table>
					</div><!-- /.col-xs-12 -->
				</div><!-- /.row 2번탭 상단-->
				
				<div class = "space"></div>
				
				<div class = "row">
					<div class = "col-xs-12">
						<table class = "table table-condensed" >
							<tr>
								<th class = "col-xs-2">메인페이지</th>
								<td class = "col-xs-4">
									<label class="radiobox"><input type="radio" name="mainViewFlag" value="0">노출</label>
									<label class="radiobox"><input type="radio" name="mainViewFlag" value="1">숨김</label>
<!-- 									<label class = "form-control-static"><input type = "radio" name = "mainViewFlag" value = "노출">노출</label> -->
<!-- 									<label class = "form-control-static"><input type = "radio" name = "mainViewFlag" value = "숨김">숨김</label> -->
									<button type = "button" class = "btn btn-default btn-sm pull-right" id = "myBtn">미리보기</button>
								</td>
								<th class = "col-xs-2">상세페이지</th>
								<td class = "col-xs-4">
									<label class="radiobox"><input type="radio" name="detailViewFlag" value="0">노출</label>
									<label class="radiobox"><input type="radio" name="detailViewFlag" value="1">숨김</label>
									
<!-- 									<label class = "form-control-static"><input type = "radio" name = "detailViewFlag" value = "노출">노출</label> -->
<!-- 									<label class = "form-control-static"><input type = "radio" name = "detailViewFlag" value = "숨김">숨김</label> -->
									<button type = "button" class = "btn btn-default btn-sm pull-right" id = "myBtn">미리보기</button>
								</td>
							</tr>
						</table>
					</div><!-- /.col-xs-12 -->
				</div><!-- /.row 2번탭 하단 -->
			</div><!-- /.innerBox -->
		</div><!-- /.sub-body -->
	</div><!-- /.sub-box -->
</div><!-- /.tab_2 -->