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
                            <td style="width: 55%"> </td>
                        </tr>
                        <tr>
                            <th style="width: 8%; text-align: center">과제</th>
                            <td style="width: 42%"><input type="file"></td>
                        </tr>
                    </table>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table class="table table-bordered">
                        <tr>
                            <th class="a_c" style="width: 5%">No</th>
                            <th class="a_c" style="width: 15%">이름</th>
                            <th class="a_c" style="width: 10%">점수</th>
                            <th class="a_c" style="width: 70%">첨부파일</th>
                        </tr>
                        <tr>
                            <td class="a_c">1</td>
                            <td class="a_c">강규범</td>
                            <td><input style="width: 100%" type="text"></td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td class="a_c">2</td>
                            <td class="a_c">강규범</td>
                            <td><input style="width: 100%" type="text"></td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td class="a_c">3</td>
                            <td class="a_c">강규범</td>
                            <td><input style="width: 100%" type="text"></td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td class="a_c">4</td>
                            <td class="a_c">강규범</td>
                            <td><input style="width: 100%" type="text"></td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td class="a_c">5</td>
                            <td class="a_c">강규범</td>
                            <td><input style="width: 100%" type="text"></td>
                            <td><input type="file"></td>
                        </tr>
                    </table>
                </div>
                <div class="sub-toolbox text-center">
                    <button type="button" class="btn btn-primary">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>


