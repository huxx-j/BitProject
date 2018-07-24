<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 500px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">x</button>
				<h5 class="modal-title">패키지 선택</h5>
			</div>
			<div class="modal-content ">
				<div class="row">
					<div class="box box-body" style="padding: 10px 10px 10px 10px;">
						<div class="row">
							<!-- 카테고리영역 -->
							<div class="sub-box">
								<div class="cate-title">패키지선택</div>
								<!-- cate-title -->
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#tab_1">카테고리</a></li>
									<li><a data-toggle="tab" href="#tab_2">검색</a></li>
								</ul>
								<div class="cate-outter bordered">
									<div class="scroll">
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
									</div><!-- /.sub-body -->
								</div><!-- /.cate-outter -->
								<div class="cate-toolbox">
									<div class="sub-toolbox text-center">
										<button type="button" class="btn " style="background-color: #3c8dbc; border-color: #367fa9; color: white;">선택</button>
										<button type="button" class="btn pull-right" style="background-color: #3c8dbc; border-color: #367fa9; color: white;">취소</button>
									</div>
								</div>	<!-- /.cate-toolbox -->
							</div><!-- /.sub-box -->
							<!-- /.카테고리영역 -->
							<!-- 교육과정 정보영역 -->
						</div>
					</div><!-- box box-body -->
				</div>
			</div><!-- /.modal-body -->
		</div><!-- modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal-fade -->