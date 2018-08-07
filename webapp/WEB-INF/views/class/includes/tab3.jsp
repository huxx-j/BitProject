<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-xs-4">
        <div class="box-body">
            <div class="sub-box">
                <div class="sub-title">팀 리스트
                    <button id="addTeam" class="btn btn-default btn-cate-search w100" style="float: right" type="button">팀 추가</button>
                </div> <%--/.sub-title--%>
            </div> <%--/.sub-box--%>
            <br/>
            <div id="teamListDiv" class="sub-body">
            <%--팀 리스트 뿌려질 자리--%>
            </div> <%--/.sub-body--%>
        </div> <%--/.box-body--%>
    </div> <%--/.col-xs-4--%>
    <div class="col-xs-8">
        <div id="pjtDetailDiv">
            <%--상세정보 뿌려질 자리--%>
        </div> <%--/.col-xs-8--%>
    </div> <%--/.row--%>
</div>

<!-- Modal -->
<div class="modal fade" id="selectTeamMember" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="sub-box">
                    <div class="sub-body">
                        <div class="sub-title">팀원 선택
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div> <%--/.sub-title--%>
                    </div> <%--/.sub-body--%>
                </div> <%--/.sub-box--%>
            </div> <%--/.modal-header--%>
            <div class="modal-body">
                <div id="memberDiv" class="sub-body">
                    <%--테이블 들어가는 자리--%>
                </div> <%--/.sub-body--%>

                <div class="sub-toolbox clearfix text-center">
                    <button id="memeberAddBtn" type="button" class="btn btn-primary" onclick="chk()">추가</button>
                    <button type="button" class="btn btn-secondary pull-right" data-dismiss="modal">닫기</button>
                </div> <%--/.sub-toolbox clearfix text-centerr--%>
            </div> <%--/.modal-body--%>
        </div> <%--/.modal-content--%>
    </div> <%--/.modal-dialog modal-dialog-centered--%>
</div> <%--/.Modal--%>