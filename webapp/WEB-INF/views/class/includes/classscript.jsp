<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">
    $(document).ready(function () {
        var selectValue = $("#workTypeSelect option:selected").val();
        $.ajax({
            url: "/api/cm/getCurri",
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
            url: "/api/cm/getCurri",
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
        removeTeamList();
        removePjtDetail()

        var currival = $("#curriSelect option:selected").val();
        //수업관리 정보 불러오는 ajax
        $.ajax({
            url: "/api/cm/getCurriInfo",
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

        //이론평가탭 과목리스트 뿌리는 ajax스크립트
        ajaxRenderSubjectList(currival);
        //프로젝트 탭 팀 리스트 뿌리는 ajax스크립트
        ajaxGetTeamList(currival);

    });

    function ajaxGetTeamList(currival) {
        $.ajax({
            url: "/api/cm/getTeamList",
            type: "post",
            data: {"currival": currival},
            dataType: "json",
            success: function (list) {
                for (var i = 0; i < list.length; i++) {
                    renderTeamList(list[i])
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    function rederInfo(map) {
        $("#curriNameInfo").text(map.vo.curriName);
        $("#gisuInfo").text(map.gisu);
        $("#periodFrInfo").text(map.vo.periodFr);
        $("#periodToInfo").text(map.vo.periodTo);
    }

    //수업일지 불러오는 스크립트
    $("#reportCallBtn").on("click", function () {

        if ($("#selectedCurri").val() != $("#curriSelect option:selected").val()) {
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
        var count = 0;
        for (var i = 1; i < 12; i++) {
            report = {
                subject: $("#sub" + i).val(),
                content: $("#con" + i).val(),
                instructor: $("#t" + i).val(),
                eTC: $("#note" + i).val(),
                period: $("#period" + i).text(),
                date: $("#selectedDate").val(),
                curriculum_no: $("#selectedCurri").val()
            };

            $.ajax({
                url: "/api/cm/saveLectureReport",
                type: "post",
                contentType: "application/json",
                async: false,
                data: JSON.stringify(report),
                dataType: "json",
                success: function (result) {
                    console.log(result)
                    if (result == 2) {
                        countUpdate++;
                    } else if (result == 1) {
                        countInsert++;
                    } else if (result == 0) {
                        count++;
                    }
                },
                error: function (XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });

        }
        alert(countUpdate + "개 항목 업데이트 / " + countInsert + "개 항목 저장 완료")
    })

    //저장버튼 생성 스크립트
    function renderSaveBtn() {
        str = "";
        str += "<button id='lectureReportSaveBtn' type='button' class='btn btn-primary'>저장</button>"

        $("#saveBtnToolbox").append(str);
    }

    function removeSaveBtn() {
        $("#lectureReportSaveBtn").remove();
    }

    function renderCurrentCurriInfo() {
        $("#currentCurriInfo").val($("#reportDate").val() + " / " + $("#curriNameInfo").text());
    }

    function removeCurrentCurriInfo() {
        $("#currentCurriInfo").val("");
    }

    //프로젝트
    //수업을 듣는 학생들명단 불러오는 스크립트
    $("#addTeam").on("click", function () {

        if ($("#selectedCurri").val() != $("#curriSelect option:selected").val()) {
            alert("조회 버튼을 눌러주세요")
        } else {
            var curriNo = $("#selectedCurri").val();
            removeMemberTable();
            renderTable();
            removePjtDetail();
            renderAddTeam(curriNo);
            callMemberTable(curriNo);
        }
    });

    function callMemberTable(curriNo) {
        $.ajax({
            url: "/api/cm/getMemberName",
            type: "post",
            data: {"curriNo": curriNo},
            dataType: "json",
            success: function (result) {

                for (var i = 0; i < result.length; i++) {
                    renderMemberTable(result[i]);
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    function renderTable() {
        str = "";
        str += "<table id='memberTable' class='table table-bordered'>";
        str += "<tr><th class='a_c' style='width:100px;'>이름</th>";
        str += "<th class='a_c' style='width:130px;'>생년월일</th>";
        str += "<th class='a_c' style='width:90px;'>성별</th>";
        str += "<th class='a_c' style='width:90px;'>선택</th></tr>";
        str += "</table>";

        $("#memberDiv").append(str);
    }

    function renderMemberTable(userVo) {
        str = "";
        str += "<tr><td class='a_c'>" + userVo.nameHan + "</td>";
        str += "<td class='a_c'>" + userVo.studResNum + "</td>";
        str += "<td class='a_c'>" + userVo.gender + "</td>";
        str += "<td class='a_c'><input name='memberChk' id='" + userVo.user_no + "' type='checkbox' value='" + userVo.nameHan + "'></td></tr>";

        $("#memberTable").append(str);
    }

    function removeMemberTable() {
        $("#memberTable").remove()
    }

    //조원 선택 스크립트 (모달)
    function chk() {
        str = "";
        id = "";
        $("input[name=memberChk]:checked").each(function () {
            str += $(this).val() + ", ";
            id += $(this).attr("id") + ",";
        });
        str = str.slice(0, -2);
        id = id.slice(0, -1);
        console.log(id)
        $("#membersName").text(str);
        $("#membersId").val(id);
        $("#selectTeamMember").modal('hide');
    }

    function renderAddTeam(curriNo) {
        str = "";
        str += "<div id='pjtDetail' class='pjt_detail'>" +
            "                <div class='box-header with-border'>" +
            "                    <h1 class='box-title'> 프로젝트 팀 추가</h1>" +
            "                </div>" +
            "                <!-- /.box-header -->" +
            "                <div class='box-body'>" +
            "                    <table class='table table-bordered'>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width: 15%;'>프로젝트명</th>" +
            "                            <td colspan='2' style='width: 85%'><input id='detailProjectName' type='text' style='width: 100%'></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width: 8%'>조원</th>" +
            "                            <td id='membersName' style='width: 42%'></td>" +
            "                            <td style='width: 10%'>" +
            "                                <button class='btn btn-primary btn-call-se' type='button' data-toggle='modal'" +
            "                                        data-target='#selectTeamMember'>팀원선택" +
            "                                </button>" +
            "                                <input id='membersId' type='hidden'>" +
            "                                <input id='detailPjtNo' type='hidden'>" +
            "                                <input id='detailCurriNo' type='hidden' value='" + curriNo + "'>" +
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
            "                    <button id='detailSaveBtn' type='button' class='btn btn-primary'>저장</button>" +
            "                </div>" +
            "        </div>";

        $("#pjtDetailDiv").append(str);
    }

    function removePjtDetail() {
        $("#pjtDetail").remove()
    }

    function renderTeamList(projectVo) {
        str = "";
        str += "<div class='teamList' data='" + projectVo.project_no + "'>" +
            "                <div class='box box-success cursor-pointer' name='pjtDetail'>" +
            "                    <div class='box-header with-border'>" +
            "                        <h3 id='projectName' class='box-title'>" + projectVo.projectName + "</h3>" +
            "                    </div>" +
            "                    <div id='teamMembers' class='box-body'>" + projectVo.membersName + "</div>" +
            "                    <div class='small-box'>" +
            "                        <a href='#' class='small-box-footer cursor-pointer' name='pjtDetail'>" +
            "                            상세보기 <i class='fa fa-arrow-circle-right'></i>" +
            "                        </a>" +
            "                    <input name='project_no' id='project_no' type='hidden' value='" + projectVo.project_no + "'>" +
            "                    <input id='pjtcurriculum_no' type='hidden' value='" + projectVo.curriculum_no + "'>" +
            "                    </div>" +
            "                </div>" +
            "            </div>";


        $("#teamListDiv").append(str);
    }

    function removeTeamList() {
        $(".teamList").remove();
    }

    $(document).on("click", ".teamList", function () {
        removePjtDetail();
        var project_no = $(this).attr("data");
        var curriNo = $("#pjtcurriculum_no").val();
        console.log(curriNo)

        $.ajax({
            url: "/api/cm/getProjectDetail",
            type: "post",
            // contentType: "application/json",
            // async: false,
            data: {"project_no": project_no},
            dataType: "json",
            success: function (result) {
                renderTeamDetail(result)
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
        removeMemberTable();
        renderTable();
        callMemberTable(curriNo);
    });

    function renderTeamDetail(projectVo) {

        str = "";
        str += "<div id='pjtDetail' class='pjt_detail'>" +
            "                <div class='box-header with-border'>" +
            "                    <h1 class='box-title'> 프로젝트 상세정보 </h1>" +
            "                </div>" +
            "                <!-- /.box-header -->" +
            "                <div class='box-body'>" +
            "                    <table class='table table-bordered'>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width: 15%'>프로젝트명</th>" +
            "                            <td colspan='2' style='width: 85%'><input id='detailProjectName' type='text' style='width: 100%' value='" + projectVo.projectName + "'></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width: 8%'>조원</th>" +
            "                            <td id='membersName' style='width: 42%'>" + projectVo.membersName + "</td>" +
            "                            <td style='width: 10%'>" +
            "                                <button class='btn btn-primary btn-call-se' type='button' data-toggle='modal'" +
            "                                        data-target='#selectTeamMember'>팀원수정" +
            "                                </button>" +
            "                                <input id='membersId' type='hidden' value='" + projectVo.membersNo + "'>" +
            "                                <input id='detailPjtNo' type='hidden' value='" + projectVo.project_no + "'>" +
            "                                <input id='detailCurriNo' type='hidden' value='" + projectVo.curriculum_no + "'>" +
            "                            </td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>파일</th>" +
            "                            <td colspan='2'><input id='projectFile'  type='file'></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>개요</th>" +
            "                            <td colspan='2'><textarea id='outline' style='width: 100%; height: 70px; resize: none'>" + projectVo.outline + "</textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>설계의<br>" +
            "                                주안점" +
            "                            </th>" +
            "                            <td colspan='2'><textarea id='focus' style='width: 100%; height: 70px; resize: none'>" + projectVo.focus + "</textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>응용분야</th>" +
            "                            <td colspan='2'><textarea id='applyField' style='width: 100%; height: 70px; resize: none'>" + projectVo.applyField + "</textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>사용기술</th>" +
            "                            <td colspan='2'><textarea id='useTechnique' style='width: 100%; height: 70px; resize: none'>" + projectVo.useTechnique + "</textarea></td>" +
            "                        </tr>" +
            "                    </table>" +
            "                </div>" +
            "                <div class='sub-toolbox text-center'>" +
            "                    <button id='detailSaveBtn' type='button' class='btn btn-primary'>수정</button>" +
            "                </div>" +
            "        </div>";

        $("#pjtDetailDiv").append(str);
    }

    $(document).on("click", "#detailSaveBtn", function () {
        var currival = $("#pjtcurriculum_no").val();
        projectVo = {
            "project_no": $("#detailPjtNo").val(),
            "curriculum_no": $("#detailCurriNo").val(),
            "projectName": $("#detailProjectName").val(),
            "membersNo": $("#membersId").val(),
            "outline": $("#outline").val(),
            "focus": $("#focus").val(),
            "applyField": $("#applyField").val(),
            "useTechnique": $("#useTechnique").val()
        };

        $.ajax({
            url: "/api/cm/saveProjectDetail",
            type: "post",
            contentType: "application/json",
            async: false,
            data: JSON.stringify(projectVo),
            dataType: "json",
            success: function (result) {

            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });

        removeTeamList();
        ajaxGetTeamList(currival);
    });

    function ajaxRenderSubjectList(currival) {
        $.ajax({
            url: "/api/cm/getSubjectList",
            type: "post",
            // contentType: "application/json",
            // async: false,
            data: {"currival": currival},
            dataType: "json",
            success: function (result) {
                removeSubjectList()
                for (var i = 0; i < result.length; i++) {
                    renderSubjectList(result[i])
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    function renderSubjectList(scoreVo) {
        str = "";
        str += "<div name='subList' class='col-md-12 subList'>" +
            "                        <div class='box box-subjectlist'>" +
            "                            <div class='small-box'>" +
            "                                <a href='#' class='small-box-footer cursor-pointer'><h5>" + scoreVo.subjectName + "</h5></a>" +
            "                                <input id='sisNo' type='hidden' value='" + scoreVo.sunInStep_no + "'>" +
            "                            </div>" +
            "                        </div>" +
            "                    </div>";

        $(".sub_list").append(str);
    }

    function removeSubjectList() {
        $("div[name=subList]").remove();
    }
</script>