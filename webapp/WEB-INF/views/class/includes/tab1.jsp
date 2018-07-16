<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-xs-12">
        <div class="box box-body">
            <div class="box-header with-border"> 강의일자
                <input id="reportDate" type="date" value="${date}" style="margin-left: 10px">
                <button id="reportCallBtn" type="button" class="btn btn-primary btn-call">불러오기</button>
                <input id="selectedCurriNo" type="hidden">
                <input id="selectedDate" type="hidden">
                <input id="currentCurriInfo" class="curriInfo" type="text" disabled  <%--style="width: 60%;margin-left: 120px;border: none;background-color: transparent;font-size: 16px;"--%>>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <table class="table table-condensed">
                    <tr>
                        <th style="width: 5%; text-align: center">교시</th>
                        <th style="width: 10%; text-align: center">시간</th>
                        <th style="width: 15%; text-align: center">훈련과목</th>
                        <th style="width: 50%; text-align: center">훈련내용</th>
                        <th style="width: 10%; text-align: center">담당교사</th>
                        <th style="width: 10%; text-align: center">비고</th>
                    </tr>
                    <tr>
                        <td id="period1" class="a_c">1</td>
                        <td class="a_c">09:00 ~ 09:50</td>
                        <td class="a_c"><input id="sub1" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con1" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t1" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>
                        <td class="a_c"><input id="note1" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period2" class="a_c">2</td>
                        <td class="a_c">10:00 ~ 10:50</td>
                        <td class="a_c"><input id="sub2" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con2" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t2" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>
                        <td class="a_c"><input id="note2" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period3" class="a_c">3</td>
                        <td class="a_c">11:00 ~ 11:50</td>
                        <td class="a_c"><input id="sub3" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con3" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t3" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note3" type="text"></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="background-color: #C2C2C2"></td>
                    </tr>
                    <tr>
                        <td id="period4" class="a_c">4</td>
                        <td class="a_c">13:00 ~ 13:50</td>
                        <td class="a_c"><input id="sub4" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con4" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t4" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note4" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period5" class="a_c">5</td>
                        <td class="a_c">14:00 ~ 14:50</td>
                        <td class="a_c"><input id="sub5" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con5" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t5" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note5" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period6" class="a_c">6</td>
                        <td class="a_c">15:00 ~ 15:50</td>
                        <td class="a_c"><input id="sub6" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con6" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t6" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note6" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period7" class="a_c">7</td>
                        <td class="a_c">16:00 ~ 16:50</td>
                        <td class="a_c"><input id="sub7" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con7" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t7" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note7" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period8" class="a_c">8</td>
                        <td class="a_c">17:00 ~ 17:50</td>
                        <td class="a_c"><input id="sub8" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con8" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t8" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note8" type="text"></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="background-color: #C2C2C2 "></td>
                    </tr>
                    <tr>
                        <td id="period9" class="a_c">9</td>
                        <td class="a_c">19:00 ~ 19:50</td>
                        <td class="a_c"><input id="sub9" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con9" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t9" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note9" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period10" class="a_c">10</td>
                        <td class="a_c">20:00 ~ 20:50</td>
                        <td class="a_c"><input id="sub10" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con10" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t10" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note10" type="text"></td>
                    </tr>
                    <tr>
                        <td id="period11" class="a_c">11</td>
                        <td class="a_c">21:00 ~ 21:50</td>
                        <td class="a_c"><input id="sub11" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="con11" style="width: 100%" type="text"></td>
                        <td class="a_c"><input id="t11" style="width: 70%" type="text" readonly>
                            &ensp;
                            <input type="checkbox"></td>

                        <td class="a_c"><input id="note11" type="text"></td>
                    </tr>
                </table>
            </div>
            <div id="saveBtnToolbox" class="sub-toolbox text-center">
                <%--<button id="lectureReportSaveBtn" type="button" class="btn btn-primary">저장</button>--%>
            </div>
        </div>
    </div>
</div>