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
</script>