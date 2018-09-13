<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-12 left-nopadding">
	
	<div class="sub-box">
		<!-- sub_title -->
		<div class="sub-title">지원내역상세</div>
		<!-- /.sub_title -->
		<!-- sub_body -->
		<div class="sub-body" id="">
			
			<table class="table table-condensed">
				<colgroup>
					<col width="80px" />
					<col width="" />
					<col width="80px" />
					<col width="" />
				</colgroup>

				<tbody>
				<tr>
					<th>업무구분</th>
					<td><input type="text" class="form-control" name="" readOnly="readOnly"></td>
				</tr>
				<tr>
					<th>교육과정명</th>
					<td><input type="text" class="form-control" name="" readOnly="readOnly"></td>
				</tr>

				</tbody>
			</table>
		
			
			<table class="table table-condensed">
				<colgroup>
					<col width="80px" />
					<col width="207px" />
					<col width="80px" />
					<col width="" />
				</colgroup>

				<tbody>
					<tr>
						<th>지원종류</th>
						<td><select class="form-control"
								name="applyType" id="applyType">
								<option value="전체" selected>전체</option>
								<option value="대학교" >근로자형</option>
								<option value="대학교" >내일배움카드</option>
								<option value="노동부지원">노동부지원</option>
								<option value="대학교" >노동부지원(납입)</option>
								<option value="노동부지원">노동부지원(미납입)</option>
								<option value="개인지원">재직자 환급지원</option>
								<option value="대학교" >정통부지원</option>
								<option value="일반지원" >일반지원</option>
								<option value="노동부지원">사업주훈</option>
								<option value="노동부지원">위탁(유급휴직)</option>
							</select>
						</td>
						<th>지원일자</th>
						<td>
							달력
						</td>
					</tr>
					<tr>
						<th>전형과목</th>
						<td>
							C
						</td>
						<th>전형일자</th>
						<td>
							달력
						</td>
					</tr>
						
					<tr>
						<th>전형점수</th>
						<td><input class="form-control" type="text"
						   name="testScore" id="testScore"></td>
						<th>전형결과</th>
						<td>
							<select class="form-control" name="testResult" id="testResult">
								<option>합격</option>
								<option>불합격</option>
								<option>보류</option>
								<option>미정</option>
								<option>전월합격</option>
								<option>재시험</option>
								<option>미전형</option>
								<option>조건부(과제물)</option>
								<option>불합격(과정이수)</option>
								<option>불합격(포기자)</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>면접의원의견</th>
						<td colspan="3">
							aaa
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-condensed">
				<colgroup>
					<col width="80px" />
					<col width="207px" />
					<col width="80px" />
					<col width="" />
				</colgroup>

				<tbody>

					<tr>
						<th>계좌 입금일</th>
						<td>
							<div class="input-group border-inputcolor">
                                            	<input class="input-datepicker form-control border-none" name="date1" id="date1" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD" value="">
								<span class="input-group-btn">
									<button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</td>
						<th>계좌입금액</th>
						<td><input class="form-control" type="text"
								   name="depositAmount" id="amountCalcul_1" ></td>
					</tr>

					<tr>
						<th>카드결제일</th>
						<td>
							<div class="input-group border-inputcolor">
								<input class="input-datepicker form-control border-none" name="date2" id="date2" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD" value="">
								<span class="input-group-btn">
									<button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</td>
						<th>카드결제액</th>
						<td><input type="text"
								   class="form-control pull-right" id="amountCalcul_2"
								   name="cardPayAmount" ></td>
					</tr>
					<tr>
						<th>입금여부</th>
						<td>
							<select class="form-control" name="deposit" id="deposit">
								<option>완납</option>
								<option>미납</option>
								<option>분납</option>
								<option>환불</option>
							</select>
						</td>
						<th>결제액 계</th>
						<td><input type="text"
								   class="form-control pull-right" id="amountResult"
								   name="totalPay" readOnly="readOnly">
						</td>
					</tr>
				</tbody>
			</table>
			<input type = "hidden" name="hidden_no">
			<input type = "hidden" name="hidden_currino">
		
		
		</div>
		<!-- /.sub_body -->
	</div>
	<!-- /.sub-box -->
	
	
	<div class="sub-box">
		<div class="sub-body" id="">
			<table class="table table-hover table-condensed">
				<colgroup>
					<col width="80" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th rowspan="2">수료후 희망</th>
						<td>
							<div class="checkbox-group pull-left form-inline">
								<label class="checkbox">
									<input type="checkbox" id="req_isShow" name="isShow" value="1" >취업
								</label>
								<label class="checkbox">
									<input type="checkbox" id="req_isShow" name="isShow" value="1" >해외취업
								</label>
								<label class="checkbox">
									<input type="checkbox" id="req_isShow" name="isShow" value="1" >복직
								</label>
								<label class="checkbox">
									<input type="checkbox" id="req_isShow" name="isShow" value="1" >대학원진학
								</label>
								<label class="checkbox">
									<input type="checkbox" id="req_isShow" name="isShow" value="1" >병역특례
								</label>
								<label class="checkbox">
									<input type="checkbox" id="req_isShow" name="isShow" value="1" >기타
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" name="" id="" style="height: 50px;" ></textarea>
						</td>
					</tr>
					<tr>
						<th>지원동기</th>
						<td>
							<textarea class="form-control" name="" id="" style="height: 50px;" ></textarea>
						</td>
					</tr>
					<tr>
						<th>학습내용</th>
						<td>
							<textarea class="form-control" name="" id="" style="height: 50px;" ></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- /.sub-body -->	
	</div><!-- /.sub-box -->
	
	<div class="sub-box">
		<div class="sub-title">지원경로</div>
		<div class="sub-body" id="">
			<table class="table table-hover table-condensed">
				<colgroup>
					<col width="60px" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th rowspan="3">추천인</th>
						<th>구분</th>
						<th>이름</th>
						<th>관계</th>
						<th>직업</th>
					</tr>
					<tr>
						<td>비트출신 수료자</td>
						<td>테스트박스</td>
						<td>테스트박스</td>
						<td>테스트박스</td>
					</tr>
						<tr>
						<td>비트출신 수료자</td>
						<td>테스트박스</td>
						<td>테스트박스</td>
						<td>테스트박스</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-hover table-condensed">
				<colgroup>
					<col width="60px" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>광고</th>
						<td>facebook   네이버키워드검색  네이버블로그검색  네이버지식인검색  학교포스터</td>
					</tr>
					<tr>
						<th>기타</th>
						<td>비트출신 수료자</td>
					</tr>
				</tbody>
			</table>
		</div><!-- /.sub-body -->	
	</div><!-- /.sub-box -->
	
	
	
</div><!-- /.col-xs-12 -->