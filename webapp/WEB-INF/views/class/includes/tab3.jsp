<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div id="teamListDiv" class="col-xs-4">
        <div class="box">
            <div class="box-header with-border">
                <h1 class="box-title"> 팀 리스트</h1>
                <button id="addTeam" class="btn btn-primary btn-call-se" style="float: right" type="button">팀 추가
                </button>
            </div>
            <%--<div>--%>
                <%--<div class="box box-success cursor-pointer">--%>
                    <%--<div class="box-header with-border">--%>
                        <%--<h3 class="box-title">1조 : 비트아카데미 홈페이지 Admin</h3>--%>
                    <%--</div>--%>
                    <%--<div class="box-body"> 장성우, 문승환, 이서현, 배진현, 문희준</div>--%>
                    <%--<div class="small-box">--%>
                        <%--<a class="small-box-footer cursor-pointer">--%>
                            <%--More info <i class="fa fa-arrow-circle-right"></i>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div>--%>
                <%--<div class="box box-default">--%>
                    <%--<div class="box-header with-border">--%>
                        <%--<h3 class="box-title">1조 : 비트아카데미 홈페이지 Admin</h3>--%>
                    <%--</div>--%>
                    <%--<div class="box-body"> 장성우, 문승환, 이서현, 배진현, 문희준</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div>--%>
                <%--<div class="box box-default">--%>
                    <%--<div class="box-header with-border">--%>
                        <%--<h3 class="box-title">1조 : 비트아카데미 홈페이지 Admin</h3>--%>
                    <%--</div>--%>
                    <%--<div class="box-body"> 장성우, 문승환, 이서현, 배진현, 문희준</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
    <div id="pjtDetailDiv" class="col-xs-8">
        <%--<div class="pjt_detail">--%>
            <%--<div class="box">--%>
                <%--<div class="box-header with-border">--%>
                    <%--<h3 class="box-title"> 상세정보</h3>--%>


                <%--</div>--%>
                <%--<!-- /.box-header -->--%>
                <%--<div class="box-body">--%>
                    <%--<table class="table table-bordered">--%>
                        <%--<tr>--%>
                            <%--<th class="a_c" style="width: 15%;">프로젝트명</th>--%>
                            <%--<td colspan="2" style="width: 85%"><input id="projectName" type="text" style="width: 100%"></td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th class="a_c" style="width: 8%">조원</th>--%>
                            <%--<td id="membersName" style="width: 42%"></td>--%>
                            <%--<td style="width: 10%">--%>
                                <%--<button class="btn btn-primary btn-call-se" type="button" data-toggle="modal"--%>
                                        <%--data-target="#selectTeamMember">팀원선택--%>
                                <%--</button>--%>
                                <%--<input id="membersId" type="hidden">--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th class="a_c">파일</th>--%>
                            <%--<td colspan="2"><input id="projectFile"  type="file"></td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th class="a_c">개요</th>--%>
                            <%--<td colspan="2"><textarea id="outline" style="width: 100%; height: 70px; resize: none"></textarea></td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th class="a_c">설계의<br>--%>
                                <%--주안점--%>
                            <%--</th>--%>
                            <%--<td colspan="2"><textarea id="focus" style="width: 100%; height: 70px; resize: none"></textarea></td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th class="a_c">응용분야</th>--%>
                            <%--<td colspan="2"><textarea id="applyField" style="width: 100%; height: 70px; resize: none"></textarea></td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th class="a_c">사용기술</th>--%>
                            <%--<td colspan="2"><textarea id="useTechnique" style="width: 100%; height: 70px; resize: none"></textarea></td>--%>
                        <%--</tr>--%>
                    <%--</table>--%>
                <%--</div>--%>
                <%--<div class="sub-toolbox text-center">--%>
                    <%--<button type="button" class="btn btn-primary">저장</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="selectTeamMember" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title col-xs-10" id="exampleModalCenterTitle">팀원 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="memberDiv" class="box-body">
                    <%--테이블 들어가는 자리--%>
                </div>
            </div>
            <div class="modal-footer">
                <button id="memeberAddBtn" type="button" class="btn btn-primary" onclick="chk()">추가</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>