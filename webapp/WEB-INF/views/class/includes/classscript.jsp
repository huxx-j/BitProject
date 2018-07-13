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

                for(var i =0; i<list.length; i++) {
                    renderCurri(list[i])
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

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

                for(var i =0; i<list.length; i++) {
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
        str += "<option value='"+curri.curriculum_no+"'>"+ curri.curriName +"</option>";

        $("#curriSelect").append(str);
    };

    $("#curriSearchBtn").on("click", function () {
        var currival = $("#curriSelect option:selected").val();
        $.ajax({
            url: "/api/cm/getcurriinfo",
            type: "post",
            data: {"currival": currival},
            dataType: "json",
            success: function (map) {
                rederInfo(map);
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


    $("#reportDate").change(function () {
        lectureReportVo = {
            curriculum_no : $("#curriSelect option:selected").val(),
            date : $("#reportDate").val()
        } ;
        // var date = $("#reportDate").val();
        // var curriName = $("#curriSelect option:selected").val();
        // console.log(curriName);
        // console.log(date);

        $.ajax({
            url: "/api/cm/getLectureReport",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(lectureReportVo),
            dataType: "json",
            success: function (list) {
                for (var i = 0; i < list.length; i++) {
                    console.log(list.toString());
                    renderLectureReport(list[i], i+1)
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

   function renderLectureReport(LectureReportVo, i) {
       $("#sub"+i).val(LectureReportVo.subject);
       $("#con"+i).val(LectureReportVo.content);
       $("#t"+i).val(LectureReportVo.instructor);
       $("#note"+i).val(LectureReportVo.note);
   }
</script>