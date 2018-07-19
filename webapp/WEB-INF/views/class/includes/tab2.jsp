<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-xs-3">
        <div class="box">
            <div class="sub_list">
                    <div class="box-header with-border">
                        <h1 class="box-title"> 과목리스트</h1>
                    </div>
                <%--과목리스트 뿌려질 자리--%>
            </div>
        </div>
    </div>
    <div class="col-xs-9">
        <div class="eval_data">
            <div class="box">
                <div class="box-header with-border">
                    <h1 class="box-title"> 과목별 평가 자료</h1>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table class="table table-bordered">
                        <tr>
                            <th style="width: 8%; text-align: center">과정명</th>
                            <td id="subName" style="width: 55%"> 과목리스트에서 과목명을 선택해주세요
                                <input id="iSisNo" type="hidden">
                                <input id="iCurriNo" type="hidden">
                                <input id="iSutdNo" type="hidden">
                            </td>
                        </tr>
                        <tr>
                            <th class="a_c">과제</th>
                            <td style="padding: 4px 0 0 8px">
                                <input type="file" name="testFile" id="testFile" class="inputfile inputfile-6" onchange="pushTestFileName()" />
                                <label for="testFile"><span id="testFileName">파일을 선택하세요</span> <h5> 파일선택 &hellip;</h5></label>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="score-table" class="table table-bordered">
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
                    </table>
                </div>
                <div id="scoreSaveBtn" class="sub-toolbox text-center">
                    <%--저장 버튼 뿌려질 자리--%>
                </div>
            </div>
        </div>
    </div>
</div>
