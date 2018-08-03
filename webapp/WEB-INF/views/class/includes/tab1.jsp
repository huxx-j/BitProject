<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-xs-12">
        <div class="col-xs-3" style="padding-left:0; padding-right: 0">
            <div class="box-header with-border a_c"> 강의일자
                <input id="reportDate" class="form-control disp-inline" type="text" value="${date}" placeholder="날짜를 선택하세요" style="margin-left: 10px; width: 40%">
                <button id="reportCallBtn" type="button" class="btn btn-default btn-call" style="margin-left: 10px"> 불러오기</button>
                <input id="selectedCurriNo" type="hidden">
                <input id="selectedDate" type="hidden">
            </div> <%--/.box-header with-border a_c--%>
            <div class="calendar"> <%--pignose calendar--%>
                <%--pignose calendar 자리--%>
            </div> <%--/.pignose calendar--%>
        </div> <%--/.col-xs-3--%>
        <div class="col-xs-9">
            <table class="table table-condensed"> <%--수업일지 테이블--%>
                <tr>
                    <th style="width: 42px; text-align: center">교시</th>
                    <th style="width: 104px; text-align: center">시간</th>
                    <th style="width: 121px; text-align: center">훈련과목</th>
                    <th style="width: 398px; text-align: center">훈련내용</th>
                    <th style="width: 100px; text-align: center">담당교사</th>
                    <th style="width: 141px; text-align: center">비고</th>
                </tr>
                <tr>
                    <td id="period1" class="a_c">1</td>
                    <td class="a_c">09:00 ~ 09:50</td>
                    <td class="a_c"><input id="sub1" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con1" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t1" class="form-control disp-inline" style="width: 70%;" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>
                    <td class="a_c"><input id="note1" class="form-control" type="text"></td>
                </tr>
                <tr>
                    <td id="period2" class="a_c">2</td>
                    <td class="a_c">10:00 ~ 10:50</td>
                    <td class="a_c"><input id="sub2" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con2" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t2" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>
                    <td class="a_c"><input class="form-control" id="note2" type="text"></td>
                </tr>
                <tr>
                    <td id="period3" class="a_c">3</td>
                    <td class="a_c">11:00 ~ 11:50</td>
                    <td class="a_c"><input id="sub3" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con3" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t3" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input class="form-control" id="note3" type="text"></td>
                </tr>
                <tr>
                    <td colspan="6" class="line-table"></td>
                </tr>
                <tr>
                    <td id="period4" class="a_c">4</td>
                    <td class="a_c">13:00 ~ 13:50</td>
                    <td class="a_c"><input id="sub4" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con4" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t4" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input id="note4" class="form-control" type="text"></td>
                </tr>
                <tr>
                    <td id="period5" class="a_c">5</td>
                    <td class="a_c">14:00 ~ 14:50</td>
                    <td class="a_c"><input id="sub5" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con5" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t5" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input id="note5" class="form-control" type="text"></td>
                </tr>
                <tr>
                    <td id="period6" class="a_c">6</td>
                    <td class="a_c">15:00 ~ 15:50</td>
                    <td class="a_c"><input id="sub6" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con6" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t6" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input id="note6" class="form-control" type="text"></td>
                </tr>
                <tr>
                    <td id="period7" class="a_c">7</td>
                    <td class="a_c">16:00 ~ 16:50</td>
                    <td class="a_c"><input id="sub7" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con7" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t7" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input id="note7" class="form-control" type="text"></td>
                </tr>
                <tr>
                    <td id="period8" class="a_c">8</td>
                    <td class="a_c">17:00 ~ 17:50</td>
                    <td class="a_c"><input id="sub8" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con8" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t8" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input id="note8" class="form-control" type="text"></td>
                </tr>
                <tr>
                    <td colspan="6" class="line-table"></td>
                </tr>
                <tr>
                    <td id="period9" class="a_c">9</td>
                    <td class="a_c">19:00 ~ 19:50</td>
                    <td class="a_c"><input id="sub9" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con9" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t9" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input class="form-control" id="note9" type="text"></td>
                </tr>
                <tr>
                    <td id="period10" class="a_c">10</td>
                    <td class="a_c">20:00 ~ 20:50</td>
                    <td class="a_c"><input id="sub10" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con10" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t10" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input id="note10" class="form-control" type="text"></td>
                </tr>
                <tr>
                    <td id="period11" class="a_c">11</td>
                    <td class="a_c">21:00 ~ 21:50</td>
                    <td class="a_c"><input id="sub11" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="con11" class="form-control" style="width: 100%" type="text"></td>
                    <td class="a_c"><input id="t11" class="form-control disp-inline" style="width: 70%" type="text" readonly>
                        &ensp;
                        <input type="checkbox"></td>

                    <td class="a_c"><input id="note11" class="form-control" type="text"></td>
                </tr>
            </table> <%--/.수업일지 테이블--%>
            <div id="saveBtnToolbox" class="sub-toolbox text-center">
                <%--세이브 버튼자리--%>
            </div> <%--/.saveBtnToolbox--%>
        </div> <%--/.col-xs-9--%>
    </div> <%--/.col-xs-12--%>
</div> <%--/.row--%>