<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">
    $(document).ready(function () {
        var selectValue = $("#workTypeSelect option:selected").val();
        $.ajax({
            url: "/api/cm/getcurri",
            type: "post",
            data: {"workType": selectValue},
            dataType: "json",
            success: function (list) {
                $("#curriSelect").remove();
                var str = "";
                str += "<select id='curriSelect' style='width: 90%'></select>";

                $("#curriTd").append(str);

                for (var i = 0; i < list.length; i++) {
                    renderCurri(list[i])
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

    //업무 구분별 과목 불러오는 스크립트
    $("#workTypeSelect").change(function () {
        var selectValue = $("#workTypeSelect option:selected").val();

        $.ajax({
            url: "/api/cm/getcurri",
            type: "post",
            data: {"workType": selectValue},
            dataType: "json",
            success: function (list) {
                $("#curriSelect").remove();
                var str = "";
                str += "<select id='curriSelect' style='width: 90%'></select>";

                $("#curriTd").append(str);

                for (var i = 0; i < list.length; i++) {
                    console.log(list[i])
                    renderCurri(list[i])
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });

    });

    function renderCurri(curri) {
        var str = "";
        str += "<option value='" + curri.curriculum_no + "'>" + curri.curriName + "</option>";

        $("#curriSelect").append(str);
    };


    //수업관리 정보 뿌려주는 스크립트
    $("#curriSearchBtn").on("click", function () {
        removeReport();
        removeSaveBtn();
        removeCurrentCurriInfo();

        var currival = $("#curriSelect option:selected").val();
        $.ajax({
            url: "/api/cm/getcurriinfo",
            type: "post",
            data: {"currival": currival},
            dataType: "json",
            success: function (map) {
                rederInfo(map);
                $("#selectedCurri").val($("#curriSelect option:selected").val())

            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

    function rederInfo(map) {
        $("#curriNameInfo").text(map.vo.curriName);
        $("#gisuInfo").text(map.gisu);
        $("#periodFrInfo").text(map.vo.periodFr);
        $("#periodToInfo").text(map.vo.periodTo);
    }

    //수업일지 불러오는 스크립트
    $("#reportCallBtn").on("click", function () {

        if ($("#selectedCurri").val() != $("#curriSelect option:selected").val()){
            alert("조회 버튼을 눌러주세요")
        } else {
            removeReport();
            removeSaveBtn();
            renderSaveBtn();
            removeCurrentCurriInfo();
            renderCurrentCurriInfo();
            $("#selectedDate").val($("#reportDate").val());
            $("#selectedCurriNo").val($("#curriSelect option:selected").val());
            lectureReportVo = {
                curriculum_no: $("#curriSelect option:selected").val(),
                date: $("#reportDate").val()
            };

            $.ajax({
                url: "/api/cm/getLectureReport",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify(lectureReportVo),
                dataType: "json",
                success: function (list) {
                    if (list.length == 0) {
                        alert("불러올 데이터가 없습니다.")
                    } else {
                        for (var i = 0; i < list.length; i++) {
                            // console.log(list.toString());
                            renderLectureReport(list[i], i + 1)
                        }
                    }
                },
                error: function (XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });
        }
    });

    function renderLectureReport(LectureReportVo, i) {
        $("#sub" + i).val(LectureReportVo.subject);
        $("#con" + i).val(LectureReportVo.content);
        $("#t" + i).val(LectureReportVo.instructor);
        $("#note" + i).val(LectureReportVo.eTC);
    }

    function removeReport() {
        for (var i = 1; i < 12; i++) {
            $("#sub" + i).val("");
            $("#con" + i).val("");
            $("#t" + i).val("");
            $("#note" + i).val("");
        }
    }


    //수업일지 저장하는 스크립트
    $("#lectureReportSaveBtn").on("click", function () {
        
        var countUpdate = 0;
        var countInsert = 0;
        var count =0;
        for (var i = 1; i < 12; i++) {
            report = {
                subject: $("#sub" + i).val(),
                content: $("#con" + i).val(),
                instructor: $("#t" + i).val(),
                eTC: $("#note" + i).val(),
                period : $("#period" + i).text(),
                date : $("#selectedDate").val(),
                curriculum_no : $("#selectedCurri").val()
            };

            $.ajax({
                url: "/api/cm/saveLectureReport",
                type: "post",
                contentType: "application/json",
                async : false,
                data: JSON.stringify(report),
                dataType: "json",
                success: function (result) {
                    console.log(result)
                    if(result==2) {
                        countUpdate++;
                    } else if (result==1) {
                        countInsert++;
                    } else if (result==0) {
                        count++;
                    }
                },
                error: function (XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });

        }
        alert(countUpdate +"개 항목 업데이트 / "+ countInsert + "개 항목 저장 완료")
    })

    //저장버튼 생성 스크립트
    function renderSaveBtn() {
        str="";
        str+="<button id='lectureReportSaveBtn' type='button' class='btn btn-primary'>저장</button>"

        $("#saveBtnToolbox").append(str);
    }

    function removeSaveBtn() {
        $("#lectureReportSaveBtn").remove();
    }

    function renderCurrentCurriInfo() {
        $("#currentCurriInfo").val($("#reportDate").val()+" / "+$("#curriNameInfo").text());
    }

    function removeCurrentCurriInfo() {
        $("#currentCurriInfo").val("");
    }

    //프로젝트
    //수업을 듣는 학생들명단 불러오는 스크립트
    $("#addTeam").on("click", function () {

        if ($("#selectedCurri").val() != $("#curriSelect option:selected").val()){
            alert("조회 버튼을 눌러주세요")
        } else {
            var curriNo = $("#selectedCurri").val();
            removeMemberTable();
            renderTable();
            removePjtDetail();
            renderAddTeam();
            $.ajax({
                url: "/api/cm/getMemberName",
                type: "post",
                data: {"curriNo" : curriNo},
                dataType: "json",
                success: function (result) {

                    for (var i=0; i<result.length; i++) {
                        renderMemberTable(result[i]);
                    }
                    $("#totalMembers").val(result.length);
                },
                error: function (XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });
        }
    });
    function renderTable() {
        str="";
        str+="<table id='memberTable' class='table table-bordered'>";
        str+="<tr><th class='a_c' style='width:100px;'>이름</th>";
        str+="<th class='a_c' style='width:130px;'>생년월일</th>";
        str+="<th class='a_c' style='width:90px;'>성별</th>";
        str+="<th class='a_c' style='width:90px;'>선택</th></tr>";
        str+="</table>";

        $("#memberDiv").append(str);
    }

    function renderMemberTable(userVo) {
        str="";
        str+="<tr><td class='a_c'>"+userVo.nameHan+"</td>";
        str+="<td class='a_c'>"+userVo.studResNum+"</td>";
        str+="<td class='a_c'>"+userVo.gender+"</td>";
        str+="<td class='a_c'><input name='memberChk' id='"+userVo.user_no+"' type='checkbox' value='"+userVo.nameHan+"'></td></tr>";

        $("#memberTable").append(str);
    }

    function removeMemberTable() {
        $("#memberTable").remove()
    }

    //조원 선택 스크립트 (모달)
    function chk() {
        str="";
        id="";
        $("input[name=memberChk]:checked").each(function () {
            str += $(this).val() + "　" ;
            id += $(this).attr("id")+" ";
        });
        $("#membersName").text(str);
        $("#membersId").val(id);
        $("#selectTeamMember").modal('hide');
    }

    function renderAddTeam() {
        str="";
        str+="<div id='pjtDetail' class='pjt_detail'>" +
            "            <div class='box'>" +
            "                <div class='box-header with-border'>" +
            "                    <h3 class='box-title'> 프로젝트 팀 추가</h3>" +
            "                </div>" +
            "                <!-- /.box-header -->" +
            "                <div class='box-body'>" +
            "                    <table class='table table-bordered'>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width: 15%;'>프로젝트명</th>" +
            "                            <td colspan='2' style='width: 85%'><input id='projectName' type='text' style='width: 100%'></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width: 8%'>조원</th>" +
            "                            <td id='membersName' style='width: 42%'></td>" +
            "                            <td style='width: 10%'>" +
            "                                <button class='btn btn-primary btn-call-se' type='button' data-toggle='modal'" +
            "                                        data-target='#selectTeamMember'>팀원선택" +
            "                                </button>" +
            "                                <input id='membersId' type='hidden'>" +
            "                            </td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>파일</th>" +
            "                            <td colspan='2'><input id='projectFile'  type='file'></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>개요</th>" +
            "                            <td colspan='2'><textarea id='outline' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>설계의<br>" +
            "                                주안점" +
            "                            </th>" +
            "                            <td colspan='2'><textarea id='focus' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>응용분야</th>" +
            "                            <td colspan='2'><textarea id='applyField' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>사용기술</th>" +
            "                            <td colspan='2'><textarea id='useTechnique' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                    </table>" +
            "                </div>" +
            "                <div class='sub-toolbox text-center'>" +
            "                    <button type='button' class='btn btn-primary'>저장</button>" +
            "                </div>" +
            "            </div>" +
            "        </div>";

        $("#pjtDetailDiv").append(str);
    }

    function removePjtDetail() {
        $("#pjtDetail").remove()
    }


</script>