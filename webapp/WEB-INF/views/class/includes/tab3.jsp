<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-xs-4">
        <div id="teamListDiv" class="box">
            <div class="box-header with-border">
                <h1 class="box-title"> 팀 리스트</h1>
                <button id="addTeam" class="btn btn-primary btn-call-se" style="float: right" type="button">팀 추가
                </button>
            </div>
        </div>
    </div>
    <div id="pjtDetailDiv" class="col-xs-8">
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