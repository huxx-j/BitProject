<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-xs-3">
        <div class="box-body">
            <div class="sub_list">
                <div class="sub-box">
                    <div class="sub-title">과목리스트</div>
                    <div class="sub-body">
                        <%--과목리스트 뿌려질 자리--%>
                    </div> <%--/.sub-body--%>
                </div> <%--/.sub-box--%>
            </div> <%--/.sub_list--%>
        </div> <%--/.box-body--%>
    </div> <%--/.col-xs-3--%>
    <div class="col-xs-9">
        <div class="eval_data">
            <div class="box-body">
                <div class="sub-box">
                    <div class="sub-title">과목별 평가 자료</div><br/>
                        <div class="sub-body">
                            <table class="table table-condensed"> <%--시험지테이블--%>
                                <tr>
                                    <th style="width: 8%; text-align: center">과정명
                                        <input id="iSisNo" name="iSisNo" type="hidden">
                                        <input id="iCurriNo" name="iCurriNo" type="hidden">
                                        <input id="iSutdNo" name="iSutdNo" type="hidden"></th>
                                    <td id="subName" style="width: 55%"> 과목리스트에서 과목명을 선택해주세요
                                    </td>
                                </tr>
                                <tr class="testFileUploadTr">
                                    <th class="a_c">과제</th>
                                    <td class="testFileUploadTd file-td">
                                        <form id="testForm" class="file-form" method="post" action="${pageContext.request.contextPath }/api/cm/saveTest" enctype="multipart/form-data">
                                            <input type="file" name="testFile" id="testFile" class="inputfile inputfile-6" onchange="pushTestFileName()" disabled="disabled">
                                            <label for="testFile"><span id="testFileName">과목 선택 후 파일을 선택하세요</span> <h5> 파일선택&hellip;</h5></label>
                                        </form>
                                    </td>
                                </tr>
                            </table> <%--/.시험지테이블--%>
                        </div> <%--/.sub-body--%>
                        <br/>
                        <div class="sub-body">
                            <table id="score-table" class="table table-condensed"> <%--점수테이블--%>
                                <tr class="scoreTable">
                                    <th class="a_c" style="width: 5%">No</th>
                                    <th class="a_c" style="width: 15%">이름</th>
                                    <th class="a_c" style="width: 10%">점수</th>
                                    <th class="a_c" style="width: 70%">첨부파일</th>
                                </tr>
                                <tr class="scoreTable">
                                    <td colspan="4" class="a_c">과목리스트에서 과목명을 선택하세요</td>
                                </tr>
                                <%--점수 테이블 뿌려질 자리--%>
                            </table> <%--/.점수테이블--%>
                        </div> <%--/.sub-body--%>
                        <div id="scoreSaveBtn" class="sub-toolbox text-center">
                            <%--저장 버튼 뿌려질 자리--%>
                        </div>
                </div> <%--/.sub-box--%>
            </div> <%--/.box-body--%>
        </div> <%--/.eval_data--%>
    </div> <%--/.col-xs-9--%>
</div> <%--/.row--%>
