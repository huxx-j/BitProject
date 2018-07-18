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
                            <td id="subName" style="width: 55%"> 과목리스트에서 과목명을 선택해주세요</td>
                        </tr>
                        <tr>
                            <th style="text-align: center">과제</th>
                            <td><input type="file">
                                <input id="iSisNo" type="hidden">
                                <input id="iCurriNo" type="hidden">
                                <input id="iSutdNo" type="hidden">
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


