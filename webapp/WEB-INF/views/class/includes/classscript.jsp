<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>(function (e, t, n) {
    var r = e.querySelectorAll("html")[0];
    r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2")
})(document, window, 0);</script>

<script type="text/javascript">
    $(document).ready(function () {
        var selectValue = $("#workTypeSelect option:selected").val();
        $.ajax({
            url: "${pageContext.request.contextPath }/api/cm/getCurri",
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
            url: "${pageContext.request.contextPath}/api/cm/getCurri",
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
        removeTeamList();
        removePjtDetail()

        var currival = $("#curriSelect option:selected").val();
        //수업관리 정보 불러오는 ajax
        $.ajax({
            url: "${pageContext.request.contextPath}/api/cm/getCurriInfo",
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
        jqGridUserInfo(currival);
    });

    function ajaxGetTeamList(currival) {
        $.ajax({
            url: "${pageContext.request.contextPath}/api/cm/getTeamList",
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
            $("#selectedDate").val($("#reportDate").val());
            $("#selectedCurriNo").val($("#curriSelect option:selected").val());
            lectureReportVo = {
                curriculum_no: $("#curriSelect option:selected").val(),
                date: $("#reportDate").val()
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/api/cm/getLectureReport",
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
                url: "${pageContext.request.contextPath}/api/cm/saveLectureReport",
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
    });

    //저장버튼 생성 스크립트
    function renderSaveBtn() {
        str = "";
        str += "<button id='lectureReportSaveBtn' type='button' class='btn btn-primary'>저장</button>"

        $("#saveBtnToolbox").append(str);
    }

    function removeSaveBtn() {
        $("#lectureReportSaveBtn").remove();
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
            url: "${pageContext.request.contextPath}/api/cm/getMemberName",
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
            "                 <form id='projectFileForm' method='post' action='/api/cm/saveProjectDetail' enctype='multipart/form-data'>" +
            "                    <table class='table table-bordered'>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width:150px;'>프로젝트명</th>" +
            "                            <td colspan='2'><input id='detailProjectName' name='detailProjectName' type='text' style='width: 100%'></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>조원</th>" +
            "                            <td id='membersName'></td>" +
            "                            <td style='width: 100px'>" +
            "                                <button class='btn btn-primary btn-call-se' type='button' data-toggle='modal'" +
            "                                        data-target='#selectTeamMember'>팀원선택" +
            "                                </button>" +
            "                                <input id='membersId' name='membersId' type='hidden'>" +
            "                                <input id='detailPjtNo' name='detailPjtNo' type='hidden' value='0'>" +
            "                                <input id='detailCurriNo' name='detailCurriNo' type='hidden' value='" + curriNo + "'>" +
            "                            </td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>파일</th>" +
            "                            <td colspan='2' style='padding:7px 0 2px 8px;'><input type='file' name='projectFile' id='projectFile' class='inputfile inputfile-6' onchange='pushProjectFileName()' />" +
            "                                <label for='projectFile'><span id='projectFileName'>파일을 선택하세요</span> <h5> 파일선택 &hellip;</h5></label></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>개요</th>" +
            "                            <td colspan='2'><textarea id='outline' name='outline' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>설계의<br>" +
            "                                주안점" +
            "                            </th>" +
            "                            <td colspan='2'><textarea id='focus' name='focus' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>응용분야</th>" +
            "                            <td colspan='2'><textarea id='applyField' name='applyField' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>사용기술</th>" +
            "                            <td colspan='2'><textarea id='useTechnique' name='useTechnique' style='width: 100%; height: 70px; resize: none'></textarea></td>" +
            "                        </tr>" +
            "                    </table>" +
            "                </div>" +
            "                <div class='sub-toolbox text-center'>" +
            "                    <button id='detailSaveBtn' type='button' class='btn btn-primary'>저장</button>" +
            "                </div>" +
            "        </form>" +
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
            "                    <div id='teamMembers' class='box-body teamList-box'>" + projectVo.membersName + "</div>" +
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
        var curriNo = $("#selectedCurri").val();

        ajaxTeamDetail(project_no, curriNo);
    });

    function ajaxTeamDetail(project_no, curriNo) {
        $.ajax({
            url: "${pageContext.request.contextPath}/api/cm/getProjectDetail",
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
    }


    function renderTeamDetail(projectVo) {

        str = "";
        str += "<div id='pjtDetail' class='pjt_detail'>" +
            "                <div class='box-header with-border'>" +
            "                    <h1 class='box-title'> 프로젝트 상세정보 </h1>" +
            "                </div>" +
            "                <!-- /.box-header -->" +
            "                <div class='box-body'>" +
            "                 <form id='projectFileForm' method='post' action='/api/cm/saveProjectDetail' enctype='multipart/form-data'>" +
            "                    <table class='table table-bordered'>" +
            "                        <tr>" +
            "                            <th class='a_c' style='width:150px'>프로젝트명</th>" +
            "                            <td colspan='2'><input id='detailProjectName' name='detailProjectName' type='text' style='width: 100%' value='" + projectVo.projectName + "'></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>조원</th>" +
            "                            <td id='membersName'>" + projectVo.membersName + "</td>" +
            "                            <td style='width: 100px'>" +
            "                                <button class='btn btn-primary btn-call-se' type='button' data-toggle='modal'" +
            "                                        data-target='#selectTeamMember'>팀원수정" +
            "                                </button>" +
            "                                <input id='file_no' name='file_no' type='hidden' value='" + projectVo.file_no + "'> " +
            "                                <input id='membersId' name='membersId' type='hidden' value='" + projectVo.membersNo + "'>" +
            "                                <input id='detailPjtNo' name='detailPjtNo'  type='hidden' value='" + projectVo.project_no + "'>" +
            "                                <input id='detailCurriNo' name='detailCurriNo' type='hidden' value='" + projectVo.curriculum_no + "'>" +
            "                            </td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>파일</th>" +
            "                            <td colspan='2' style='padding:7px 0 2px 8px;'><input type='file' name='projectFile' id='projectFile' class='inputfile inputfile-6' onchange='pushProjectFileName()' />" +
            "                                <label for='projectFile'><span id='projectFileName'>파일을 선택하세요</span> <h5> 파일선택 &hellip;</h5></label>" +
            "                               <span>" + projectVo.fileName + "</span>" +
            "                           </td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>개요</th>" +
            "                            <td colspan='2'><textarea id='outline' name='outline' style='width: 100%; height: 70px; resize: none'>" + projectVo.outline + "</textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>설계의<br>" +
            "                                주안점" +
            "                            </th>" +
            "                            <td colspan='2'><textarea id='focus' name='focus' style='width: 100%; height: 70px; resize: none'>" + projectVo.focus + "</textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>응용분야</th>" +
            "                            <td colspan='2'><textarea id='applyField' name='applyField' style='width: 100%; height: 70px; resize: none'>" + projectVo.applyField + "</textarea></td>" +
            "                        </tr>" +
            "                        <tr>" +
            "                            <th class='a_c'>사용기술</th>" +
            "                            <td colspan='2'><textarea id='useTechnique' name='useTechnique' style='width: 100%; height: 70px; resize: none'>" + projectVo.useTechnique + "</textarea></td>" +
            "                        </tr>" +
            "                    </table>" +
            "                </div>" +
            "                <div class='sub-toolbox text-center'>" +
            "                    <input id='detailSaveBtn' type='button' class='btn btn-primary' value='수정'>" +
            "                </div>" +
            "        </form>" +
            "        </div>";

        $("#pjtDetailDiv").append(str);
    }

    //프로젝트 첨부파일 이름 span에 넣어주는 태그
    function pushProjectFileName() {
        if (typeof $("#projectFile")[0].files[0] == "undefined") {
            document.getElementById("projectFileName").innerHTML = "파일을 선택하세요";
        } else {
            document.getElementById("projectFileName").innerHTML = $("#projectFile")[0].files[0].name;
        }
    }

    // document.getElementById("projectFileName").innerHTML = $("#projectFile")[0].files[0].name;


    $(document).on("click", "#detailSaveBtn", function () {
        var currival = $("#pjtcurriculum_no").val();
        var projectFileFormData = new FormData($("#projectFileForm")[0]);
        var projectNo = 0;
        var membersId = $("#membersId").val();
        if (membersId == "") {
            alert("팀원을 선택해주세요")
        } else {

            $.ajax({
                url: "${pageContext.request.contextPath}/api/cm/saveProjectDetail",
                type: "post",
                processData: false,
                contentType: false,
                // cache: false,
                enctype: "multipart/form-data",
                async: false,
                data: projectFileFormData,
                dataType: "json",
                success: function (result) {
                    projectNo = result;
                },
                error: function (XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });
            removeTeamList();
            ajaxGetTeamList(currival);
            removePjtDetail();
            ajaxTeamDetail(projectNo, currival);

            // $("#projectFileForm").submit();
        }
    });


    //이론평가 탭
    function ajaxRenderSubjectList(currival) {
        $.ajax({
            url: "${pageContext.request.contextPath}/api/cm/getSubjectList",
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
        str += "<div name='subList' class='col-md-12 subList' data='" + scoreVo.subInStep_no + "' data-subname='" + scoreVo.subjectName + "'>" +
            "                        <div class='box box-subjectlist'>" +
            "                            <div class='small-box'>" +
            "                                <a href='#' class='small-box-footer cursor-pointer'><h5>" + scoreVo.subjectName + "</h5></a>" +
            "                            </div>" +
            "                        </div>" +
            "                    </div>";

        $(".sub_list").append(str);
    }

    function removeSubjectList() {
        $("div[name=subList]").remove();
    }

    $(document).on("click", "div[name=subList]", function () {
        removeScoreTable();
        renderScoreTableTh();
        var subName = $(this).attr("data-subname");
        var sisNo = $(this).attr("data");
        var curriNo = $("#selectedCurri").val();
        $("#subName").text(subName);
        $("#iCurriNo").val(curriNo);
        $("#iSisNo").val(sisNo);
        removeTestUploadTd();

        $.ajax({
            url: "${pageContext.request.contextPath}/api/cm/getSisInfo",
            type: "post",
            // contentType: "application/json",
            async: false,
            data: {"sisNo": sisNo},
            dataType: "json",
            success: function (result) {
                renderTestUploadTd(sisNo,result);
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });



        scoreVo = {
            "subInStep_no": sisNo,
            "curriculum_no": curriNo
        };

        $.ajax({
            url: "${pageContext.request.contextPath}/api/cm/getSutudentInScore",
            type: "post",
            contentType: "application/json",
            async: false,
            data: JSON.stringify(scoreVo),
            dataType: "json",
            success: function (result) {

                for (var i = 0; i < result.length; i++) {
                    renderScoreTableTd(result[i], i + 1);
                }
                renderscoreSaveBtn();

                $("#iSutdNo").val(result.length);
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

    function renderTestUploadTd(sisNo, fileVo) {
        str = "";
        str += "<td class='testFileUploadTd' style='padding: 4px 0 0 8px'>" +
            "   <form id='testForm' method='post' action='/api/cm/saveTest' enctype='multipart/form-data'>" +
            "       <input type='file' name='testFile' id='testFile' class='inputfile inputfile-6' onchange='pushTestFileName()'>" +
            "       <label for='testFile'><span id='testFileName'>파일을 선택하세요</span> <h5> 파일선택 &hellip;</h5></label>" +
            "       <input id='testSisNo' name='testSisNo' type='hidden' value='"+sisNo+"'>" +
            "       <input id='testFileNo' name='testFileNo' type='hidden' value='"+fileVo.file_no+"'>" +
            "       <span>"+fileVo.fileName+"</span>" +
            "   </form>" +
            "</td>";

        $(".testFileUploadTr").append(str);
    }

    function removeTestUploadTd() {
        $(".testFileUploadTd").remove();

    }

    function renderScoreTableTh() {
        str = "";
        str += "<tr class='scoreTable'>" +
            "       <th class='a_c' style='width: 5%'>No</th>" +
            "       <th class='a_c' style='width: 15%'>이름</th>" +
            "       <th class='a_c' style='width: 10%'>점수</th>" +
            "       <th class='a_c' style='width: 70%'>첨부파일</th>" +
            "   </tr>";

        $("#score-table").append(str);
    }

    function renderscoreSaveBtn() {
        strBtn = "";
        strBtn = "<button name='scoreSaveBtn' type='button' class='btn btn-primary'>저장</button>";

        $("#scoreSaveBtn").append(strBtn);
    }

    function renderScoreTableTd(ScoreVo, i) {
        str = "";
        str += "<tr class='scoreTable'>" +
            "       <td class='a_c' style='padding-top: 10px'>" + i + "</td>" +
            "       <td class='a_c' style='padding-top: 10px'>" + ScoreVo.nameHan + "</td>" +
            "       <td><input id='iScore" + i + "' name='iScore' style='width: 100%' type='text' value='" + ScoreVo.score + "' onchange='chgScore(" + i + ")'></td>" +
            "       <td style='padding:7px 0 2px 8px ;'>" +
            "       <form id='scoreForm" + i + "' method='post' action='/api/cm/saveScore' enctype='multipart/form-data'>" +
            "       <input type='file' name='studTestFile' id='studTestFile" + i + "' class='inputfile inputfile-6' onchange='pushStudTestFileName(" + i + ")'>" +
            "       <label for='studTestFile" + i + "'><span id='studTestFileName" + i + "'>파일을 선택하세요</span> <h5> 파일선택 &hellip;</h5></label>" +
            "       <input id='hScore" + i + "' name='hScore' type='hidden' value='" + ScoreVo.score + "'>" +
            "       <input id='iUserNo" + i + "' name='iUserNo' type='hidden' value='" + ScoreVo.user_no + "'>" +
            "       <input id='iSisNo" + i + "' name='iSisNo' type='hidden' value='" + $("#iSisNo").val() + "'>" +
            "       <input id='iCurriNo" + i + "' name='iCurriNo' type='hidden' value='" + $("#iCurriNo").val() + "'>" +
            "       <input id='iScoreNo" + i + "' name='iScoreNo' type='hidden' value='" + ScoreVo.score_no + "' prefix='0'>" +
            "       <input id='iFileNo"+i+"' name='iFileNo' type='hidden' value='"+ScoreVo.file_no+"' prefix='0'>" +
            "       <span>"+ScoreVo.fileName+"<span></form></td>" +
            "   </form>" +
            "   </tr>";

        $("#score-table").append(str);
    }

    function chgScore(i) {
        $("#hScore" + i).val($("#iScore" + i).val());
    }

    //학생들 평가파일 이름 span에 넣어주는 태그
    function pushStudTestFileName(i) {
        if (typeof $("#studTestFile" + i)[0].files[0] == "undefined") {
            document.getElementById("studTestFileName" + i).innerHTML = "파일을 선택하세요";
        } else {
            document.getElementById("studTestFileName" + i).innerHTML = $("#studTestFile" + i)[0].files[0].name;
        }
    }

    //평가문제 파일 이름 span에 넣어주는 태그
    function pushTestFileName() {
        if (typeof $("#testFile")[0].files[0] == "undefined") {
            document.getElementById("testFileName").innerHTML = "파일을 선택하세요";
        } else {
            document.getElementById("testFileName").innerHTML = $("#testFile")[0].files[0].name;
        }
    }

    function removeScoreTable() {
        $(".scoreTable").remove();
        $("button[name=scoreSaveBtn]").remove();
    }

    $(document).on("click", "button[name=scoreSaveBtn]", function () {
        var studNo = $("#iSutdNo").val();
        var formData = new FormData($("#testForm")[0]);
        var url = "${pageContext.request.contextPath}/api/cm/saveTest";
        ajaxSaveScore(url,formData);

        for (var i = 1; i <= studNo; i++) {
            formData = new FormData($("#scoreForm" + i)[0]);
            url = "${pageContext.request.contextPath}/api/cm/saveScore";
            ajaxSaveScore(url,formData);
        }
    });

    function ajaxSaveScore(url,formData) {
        $.ajax({
            url: url,
            type: "post",
            processData: false,
            contentType: false,
            // cache: false,
            enctype: "multipart/form-data",
            async: false,
            data: formData,
            dataType: "json",
            success: function (result) {

            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }



    //학생관리 탭

    function jqGridUserInfo(currival) {
        removeJqGridTable();
        renderJqGridTable();
        var cnames = ['번호', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부'];

        $("#jqGrid").jqGrid({
            url: "jqgridStartMain.do",
            datatype: "local",
            colNames: cnames,
            colModel: [
                {name: 'user_no', index: 'user_no', width: 10, hidden: true},
                {name: 'gisuName', index: 'gisuName', width: 150, align: "center"},
                {name: 'nameHan', index: 'nameHan', width: 100, align: "center"},
                {name: 'studResNum', index: 'studResNum', width: 100, align: "center"},
                {name: 'gender', index: 'gender', width: 60, align: "center"},
                {name: 'testResult', index: 'testResult', width: 95, align: "center"},
                {name: 'handphone', index: 'handphone', width: 150, align: "center"},
                {name: 'applyDay', index: 'applyDay', width: 100, align: "center"},
                {name: 'testDay', index: 'testDay', width: 100, align: "center"},
                {name: 'school', index: 'school', width: 140, align: "center"},
                {name: 'major', index: 'major', width: 140, align: "center"},
                {name: 'deposit', index: 'deposit', width: 60, align: "center"}
            ],

            // rowheight: 50,
            height: 300,
            rownumbers: true,
            ondblClickRow: function () {
                var rowId = $("#jqGrid").getGridParam("selrow");
                var userNo = $("#jqGrid").getRowData(rowId).user_no; //선택한 줄의 User_no을 가져오는 코드
                console.log(userNo)
                alert("나중에 " + userNo + "")
            },
            viewrecords: true
            // caption: "유저 정보"
        });

        /* ajax로 DB에서 정보 긁어서 뿌려주는 코드 */
        $(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/api/cm/getUserInfo",
                type: "post",
                // contentType: "application/json",
                // async: false,
                data: {"curriNo": currival},
                dataType: "json",
                success: function (result) {
                    for (var i = 0; i < result.length; i++)
                        $("#jqGrid").jqGrid('addRowData', i + 1, result[i]);
                },
                error: function (XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });
        });
    }

    function renderJqGridTable() {
        str = "";
        str = "<table id='jqGrid'></table>";

        $("div[name=jqgrid]").append(str);
    }

    function removeJqGridTable() {
        $("#gbox_jqGrid").remove();
    }



    //수업일지탭 달력 선택시 인풋태그에 출력해주는 스크립트
    $(function () {
        $('#wrapper .version strong').text('v' + $.fn.pignoseCalendar.version);

        function onSelectHandler(date, context) {
            var $element = context.element;
            var $calendar = context.calendar;
            // var $box = $element.siblings('#reportDate').show();
            var text = '';

            if (date[0] !== null) {
                text += date[0].format('YYYY-MM-DD');
            }

            if (date[0] !== null && date[1] !== null) {
                text += ' ~ ';
            }
            else if (date[0] === null && date[1] == null) {
                text += 'nothing';
            }

            if (date[1] !== null) {
                text += date[1].format('YYYY-MM-DD');
            }
            $("#reportDate").val(text);
            // $box.text(text);
        }

        // Default Calendar 셀랙트 이벤트 핸들러
        $('.calendar').pignoseCalendar({
            lang : 'ko',
            select: onSelectHandler
        });
    });


</script>
