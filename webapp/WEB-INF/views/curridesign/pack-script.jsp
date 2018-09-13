<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
    var level=0;
    var step=0;
    // zTree 설정
    function deleteCate(id){
        $.ajax({
            url : "${pageContext.request.contextPath }/package/delCate",
            type : "POST",
            //contentType : "application/json",
            data : {"id": id},
            dataType : "json",
            success : function(c) {
                $("input[name='CateName']").val("카테고리를 선택");
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    function UpdateCate(name,id,pId){
        console.log(name+id+pId);
        packageCateVo={
            cateName : name,
            packageCate_no :id,
            parentCode : pId
        }
        $.ajax({
            url : "${pageContext.request.contextPath }/package/updateCate",
            type : "post",
            contentType : "application/json",
            data : JSON.stringify(packageCateVo),
            dataType : "json",
            success : function() {
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    $("#packageadd").on("click", function() {
        var formData = $("#package").serialize();
        console.log("드가이씨1")
        $.ajax({
            cache : false,
            url : "${pageContext.request.contextPath}/package/packageadd",
            type : 'POST',
            data : formData,
            success:function(PackageVo){
                console.log("드가이씨2")
            },
            error : function(xhr,status) {
                console.error(status + " : " + error);

            }
        });
    });

    $(document).on("click","#update-packinfo",function() {
        packageVo={
            Package_no:$("#prevInfo").val(),
            PackageCate_no: $("input[name='PackageCate_no']").val(),
            UseStatus: $("select[name='UseStatus']").val(),
            PackageName: $("input[name='PackageName']").val(),
            Goal: $("textarea[name='Goal']").val(),
            Content: $("textarea[name='Content']").val(),
            Qualification: $("textarea[name='Qualification']").val(),
            TotalTime:$("input[name='TotalTime']").val()
        }
        $("input[name=PackageNameInStep]").val(packageVo.PackageName);
        $("input[name=TotalTimeInStep]").val(packageVo.TotalTime);
        console.log(packageVo);
        $.ajax({
            url : "${pageContext.request.contextPath }/package/updatePackage",
            type : "POST",
            contentType : "application/json",
            data : JSON.stringify(packageVo),
            dataType : "json",
            success : function(package_no) {
                console.log(package_no);
                $("input[name='steplist[0].Package_no']").val(package_no);
                $("button[name='btnaddstep']").val(package_no);
            }
        });
        //$("#packageTab a:last").tab('show');
    });


    $(document).on("click","input[name='addpackage']",function() {
        packageVo={
            PackageCate_no: $("input[name='PackageCate_no']").val(),
            UseStatus: $("select[name='UseStatus']").val(),
            PackageName: $("input[name='PackageName']").val(),
            Goal: $("textarea[name='Goal']").val(),
            Content: $("textarea[name='Content']").val(),
            Qualification: $("textarea[name='Qualification']").val(),
            TotalTime:$("input[name='TotalTime']").val()
        }
        $("input[name=PackageNameInStep]").val(packageVo.PackageName);
        $("input[name=TotalTimeInStep]").val(packageVo.TotalTime);
        console.log(packageVo);
        $.ajax({
            url : "${pageContext.request.contextPath }/package/addPackage",
            type : "POST",
            contentType : "application/json",
            data : JSON.stringify(packageVo),
            dataType : "json",
            success : function(package_no) {
                console.log(package_no);
                $("input[name='steplist[0].Package_no']").val(package_no);
                $("button[name='btnaddstep']").val(package_no);
            }
        });
        $("#packageTab a:last").tab('show');
    });


    //패키지 클릭시 발동되는 함수
    function package(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
        console.log(no);
        if(no<=10000){
            packageselect(no);
        }
        else{
            packageCateSelect(no);
        }
    }
    function packageCateSelect(no){
        $.ajax({
            url : "${pageContext.request.contextPath }/package/getPackageCate",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(PackageCateVo) {
                console.log(PackageCateVo);
                CaseA();
                $("input[name='PackageCate_no']").val(PackageCateVo.packageCate_no),
                    $("input[name='CateName']").val(PackageCateVo.cateName)
                fristStepDraw();
            }
        });
    }
    function packageselect(no){
        $.ajax({
            url : "${pageContext.request.contextPath }/package/getPackageVo",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(PackageVo) {
                var str=" ";
                $("#update-packinfo").remove();
                $("input[name='del-package']").remove();
                $("#update-pack").remove();
                $("input[name='del-package']").remove();
                $("#addpackage").remove();
                $("#cancel").remove();
                $("#submit").remove();
                $("#cancel").remove();
                $("#stepadd").remove();
                $("#btnAddPackage").remove();
                str+="<input type='button' id ='update-packinfo' value='수정' class='btn btn-primary' >";
                $("#primary").append(str);
                str='<input type="button" name="del-package" value="삭제" class="btn btn-default btn-sub pull-right">';
                $("#default").append(str);
                str="<input type='submit' value='수정' id ='stepadd' class='btn btn-primary' >";
                $("#primary2").append(str);
                str='<input type="button" name="del-package" value="삭제" class="btn btn-default btn-sub pull-right">';
                $("#default2").append(str);
                str='<button id="btnAddPackage" class="btn btn-default btn-h25 pull-right" type="button">패키지 추가</button>';
                $("#btnzone").append(str);
                clean();
                console.log(PackageVo);
                for(var i=0;i<PackageVo.steplist.length;i++) {
                    for (var j = 0; j < PackageVo.steplist[i].sublist.length; j++) {
                        if(i==0 && j==0){
                        }
                        else if (j == 0) {
                            console.log("첫번째");
                            StepInPack(i,j,PackageVo.steplist[i].sublist[j],PackageVo.steplist[i],PackageVo.steplist[i].sublist[j].subject_no);
                        }
                        else if(j==PackageVo.steplist[i].sublist.length-1){
                            $("button[name='btnAddsubject"+i+"']").val(j);
                            SubInStep(i,j,PackageVo.steplist[i].sublist[j],PackageVo.steplist[i].sublist[j].subject_no);
                        }
                        else {
                            console.log(i,j);
                            SubInStep(i,j,PackageVo.steplist[i].sublist[j],PackageVo.steplist[i].sublist[j].subject_no);
                        }
                    }
                }

                if(PackageVo.useStatus == 0 ){$("#UserStatus0").prop("checked", true);}
                else if(PackageVo.useStatus == 1 ){$("#UserStatus1").prop("checked", true);}
                $("#prevInfo").val(PackageVo.package_no),
                    $("input[name='PackageCate_no']").val(PackageVo.packageCate_no),
                    $("input[name='CateName']").val(PackageVo.cateName),
                    $("input[name='PackageName']").val(PackageVo.packageName),
                    $("input[name='PackageNameInStep']").val(PackageVo.packageName),
                    $("textarea[name='Goal']").val(PackageVo.goal),
                    $("textarea[name='Content']").val(PackageVo.content),
                    $("textarea[name='Qualification']").val(PackageVo.qualification),
                    $("input[name='TotalTime']").val(PackageVo.totalTime),
                    $("input[name='TotalTimeInStep']").val(PackageVo.totalTime),
                    $("select[name='UseStatus']").val(PackageVo.useStatus),
                    $("input[name='steplist[0].Package_no']").val(PackageVo.package_no),
                    $("input[name='steplist[0].Step_no']").val(PackageVo.steplist[0].step_no),
                    $("input[name='steplist[0].StepName']").val(PackageVo.steplist[0].stepName),
                    $("input[name='SubjectName00']").val(PackageVo.steplist[0].sublist[0].subjectName),
                    $("input[name='steplist[0].sublist[0].Subject_no']").val(PackageVo.steplist[0].sublist[0].subject_no),
                    $("input[name='steplist[0].sublist[0].SubInStep_no']").val(PackageVo.steplist[0].sublist[0].subInStep_no),
                    $("textarea[name='steplist[0].sublist[0].Content']").val(PackageVo.steplist[0].sublist[0].content),
                    $("input[name='steplist[0].sublist[0].SubHour']").val(PackageVo.steplist[0].sublist[0].subHour)

                if(PackageVo.referenceCnt>0){
                    cleanButton();

                }
                totaltime();

            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }
    function cleanButton() {
        //버튼없애기! 참조받는 패키지일시 발똥!
        for (var i = 0; i < 100; i++) {
            $("#btnAddstep").remove();
            $("#btnAddsubject").remove();
            $("#selectsub").remove();
            $("#del-subject").remove();
            $("#deletestep").remove();//attr("readonly",true);
            $("#stepadd").remove();
            $("input[name='del-package']").remove();
            $("#time:eq(" + i + ")").attr("readonly", true);
        }
    }

    $(document).on("click","input[name='del-package']",function(){
        var no=$("#prevInfo").val();
        console.log(no);
        $.ajax({
            url : "${pageContext.request.contextPath }/package/delPackage",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function() {
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
        location.reload();
    });
        //$("#time").attr("style","border: none;");

    //깨끗히 지우는 함수
    function clean(){
        // $("input[name='steplist[0].StepName']").val(" ");
        // $("input[name='SubjectName00']").val(" ");
        // $("textarea[name='steplist[0].sublist[0].Content']").val(" ");
        // $("input[name='steplist[0].sublist[0].SubHour']").val(" ");
         $("tr[name='die']").remove();
         $("table[name='die']").remove();
         $("#btnAddstep").remove();
        fristStepDraw();
    }
    //패키지 추가 클릭시 발동되는 함수
    function CaseA(){
        str=" ";
        $("input[name='PackageNameInStep']").val(" ");
        $("input[name='TotalTimeInStep']").val(" ");
        $("input[name='PackageName']").val(" ");
        $("textarea[name='Goal']").val("");
        $("textarea[name='Content']").val("");
        $("textarea[name='Qualification']").val("");
        $("input[name='TotalTime']").val("");
        $("select[name='UseStatus']").val("");
        $("input[name='steplist[0].StepName']").val(" ");
        $("input[name='SubjectName00']").val(" ");
        $("textarea[name='steplist[0].sublist[0].Content']").val(" ");
        $("input[name='steplist[0].sublist[0].SubHour']").val(" ");
        $("tr[name='die']").remove();
        $("table[name='die']").remove();
        $("#btnAddPackage").remove();
        $("#addpackage").remove();
        $("#cancel").remove();
        $("#submit").remove();
        $("#cancel").remove();
        $("#update-packinfo").remove();
        $("input[name='del-package']").remove();
        $("#update-pack").remove();
        $("input[name='del-package']").remove();
        $("#btnAddstep").remove();
        $("#stepadd").remove();
        str+= '<input type="button" value="저장" id="addpackage" name="addpackage" class="btn btn-primary">';
        $("#primary").append(str);
        str='<input type="button" value="취소" name="cancel"id="cancel"  class="btn btn-default btn-sub pull-right">';
        $("#default").append(str);
        str= '<input type="submit" value="저장" id="stepadd" class="btn btn-primary">';
        $("#primary2").append(str);
        str='<input type="button" value="취소" name="cancel"id="cancel" class="btn btn-default btn-sub pull-right">';
        $("#default2").append(str);

        $("#packageTab a:first").tab('show');
    }
    $(document).on("click","#btnAddPackage",function () {
        CaseA();
        fristStepDraw();
    });

    $("#addcate").on("click",function(){
        $("#pop").modal();
    });

    $("#btn_cancel").on("click",function(){
        $("#pop").modal("hide");
    });

    $("#selectCate").on("click",function () {
        $("#pop2").modal();
    })
    $("#selectCategory").on("click",function () {
        $("#pop3").modal();
    })

    function packagecate(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
        $.ajax({
            url : "${pageContext.request.contextPath }/package/getPackageCate",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(PackageCateVo) {
                console.log(PackageCateVo.cateName);
                console.log(PackageCateVo.packageCate_no);
                $("#category").val(PackageCateVo.cateName),
                    $("#cate_no").val(PackageCateVo.packageCate_no)
                $("#pop3").modal("hide");
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    $("#save").on("click", function() {
        var PackageCate_no = $("#PackageCate_no").val();
        var CateName = $("#CateName").val();
        console.log(PackageCate_no);
        console.log(CateName);

        $.ajax({
            url : "${pageContext.request.contextPath }/package/addPackageCate",
            type : "post",
            data : {"PackageCate_no": PackageCate_no, "CateName": CateName},
            dataType : "json",
            success : function(c) {
                location.reload();
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
        $("#pop").modal("hide");

    });

    $(document).on("change",".time",function() {
            console.log("발똥");
            var time = 0;
            var cost = $(this).val();
            cost = cost.replace(/[^0-9]/g, "");
            $(this).val(cost);
            $(".time").each(function () {
                if ($(this).val() != "") {
                    time += parseInt($(this).val());
                    console.log(time);
                }
            });
        if ($("input[name='TotalTimeInStep']").val() < time) {
            alert("과목 시간의 합이 패키지 총 시간을 넘었습니다.");
            $(this).val("");
        }
        else {
            $("input[name='Time']").val(time);
        }
    });

    $(document).on("click","#del-subject",function() {
        console.log("삭제");
        var sub=$(this).data("sub");
        var step=$(this).data("step");
        var val=$("button[name='btnAddsubject"+step+"']").val();
        console.log(val);
        console.log("#subject-item" + step + sub);
        $("#subject-item" + step + sub).remove();
        $("button[name='btnAddsubject"+step+"']").val(val-1);
    });

    $(document).on("click","#deletestep" ,function (){
        var val = $(this).val();
        console.log("단계삭제");
        $("#steptable" + val).remove();

    });


    $(document).on("click","#selectsub",function(){
        var sub=$(this).data("sub");
        var step=$(this).data("step");
        console.log(sub);
        console.log(step);
        $("#sub").val(sub);
        $("#step").val(step);
        $("#pop2").modal();
    });
    function insertStep() {

        for (var i = 0; i <= step; i++) {
            StepInPackVo = {
                Step_no: $("input[name='steplist[" + i + "].Step_no']").val(),
                Package_no: $("input[name='steplist[" + i + "].Package_no']").val(),
                StepName: $("input[name='steplist[" + i + "].StepName']").val(),
                Level: $("input[name='steplist[" + i + "].Level']").val()

            }
            console.log(StepInPackVo);
            for (var j = 0; j <= ($('#subject-list' + i + ' tr').length - 1); j++) {
                SubInStepVo = {
                    Subject_no: $("input[name='steplist[" + i + "].sublist[" + j + "].Subject_no']").val(),
                    SubInStep_no: $("input[name='steplist[" + i + "].sublist[" + j + "].SubInStep_no']").val(),
                    Content: $("textarea[name='steplist[" + i + "].sublist[" + j + "].Content']").val(),
                    SubHour: $("input[name='steplist[" + i + "].sublist[" + j + "].SubHour']").val()
                }
                alert(i+"-"+j);
                console.log(SubInStepVo);
            }
        }
    }

    function check() {
        for (var i = 0; i <= step; i++) {
            if ($("input[name='steplist[" + i + "].StepName']").val() == "") {
                alert((i+1) + "단계 이름을 입력하세요.");
                return false;
            }
            for (var j = 0; j <= ($('#subject-list' + i + ' tr').length - 1); j++) {
                if ($("input[name='steplist[" + i + "].sublist[" + j + "].Subject_no']").val() == 0) {
                    alert((i+1) + "단계" + (j+1) + "번째 과목을 선택하세요.");
                    return false;
                }
                else if ($("textarea[name='steplist[" + i + "].sublist[" + j + "].Content']").val() == "") {
                    alert((i+1) + "단계" + (j+1) + "번쨰 과목 설명을 입력하세요.");
                    return false;
                }
                else if ($("input[name='steplist[" + i + "].sublist[" + j + "].SubHour']").val()== "") {
                    alert((i+1) + "단계" + (j+1) + "번쨰 과목 시간을 입력하세요.");
                    return false;
                }
            }
        }
    }

    function subject(treeId, treeNode, clickFlag) {
        var no=treeNode.web;
        var sub=$("#sub").val();
        var step=$("#step").val();
        var str ="";
        console.log(no);
        console.log(sub);
        console.log(step);
        $.ajax({
            url : "${pageContext.request.contextPath }/subject/getSubjectVo",
            type : "POST",
            //contentType : "application/json",
            data : {"no": no},
            dataType : "json",
            success : function(SubjectVo) {
                $("input[name='SubjectName"+step+sub+"']").val(SubjectVo.subjectName),
                    $("input[name='steplist["+step+"].sublist["+sub+"].Subject_no']").val(SubjectVo.subject_no)
                $("#pop2").modal("hide");
            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////
    // 단계,과목을 화면에 그리기 위한 스크립트 draw                                                 //
    //////////////////////////////////////////////////////////////////////////////////////////////////
    function fristStepDraw() {
        var str=" ";
        str+='<button  id="btnAddstep" name="btnaddstep" style="margin-bottom:5px; float: right" class="btn btn-default pull-right" type="button" value="" >단계 추가</button>'
        str+='<table id ="steptable" name = "die" class="table table-condensed">';
        str+="   <caption><button type='button' id='deletestep' class='btn btn-default btn-sm' value='0'>단계 삭제</button></caption>";
        str+='<colgroup>';
        str+='<col width="50px" />';
        str+='   <col width="250px" />';
        str+='   <col width="" />';
        str+='   <col width="80px" />';
        str+='    <col width="60px" />';
        str+='    </colgroup>';
        str+="  <tbody id='subject-list0'>";
        str+='   <input type="hidden" name ="steplist[0].Package_no">';
        str+='    <input type="hidden"" name="steplist[0].Level" value="1">';
        str+='    <input type="hidden" name="steplist[0].Step_no" value="0">';
        str+='    <tr>';
        str+='    <th style="text-align: center">단계명</th>';
        str+='   <th colspan="3" >';
        str+='    <input type="text" name="steplist[0].StepName" style="width: 800px">';
        str+='   </th>';
        str+='    <th style="width: 50px">';
        str+='    <button  id="btnAddsubject" name="btnAddsubject0" class="btn btn-default pull-right" type="button" data-step="0" data-sub="0">추가</button>';
        str+='    </th>';
        str+='    </tr>';
        str+='   <tr id="subject-item00" name="die" style="height: 150px">';
        str+='   <td></td>';
        str+='   <td>';
        str+='    <%--<textarea type="text" style="overflow:hidden; resize: none; border: none;" name="SubjectName00" readonly></textarea>--%>';
        str+='    <input type="text" style="border: none;" name="SubjectName00" readonly>';
        str+=' <input type="hidden" name="steplist[0].sublist[0].Subject_no" value="0">';
        str+='    <input type="hidden" name="steplist[0].sublist[0].SubInStep_no" value="0">';
        str+='    <button style=" float: right;" id="selectsub" class="btn btn-default pull-right" data-step="0" data-sub="0" type="button">과목선택</button>';
        str+='    </td>';
        str+='    <td>';
        str+='   <textarea name="steplist[0].sublist[0].Content" style="width: 490px; height: 135px;">';
        str+='    </textarea>';
        str+='   </td>';
        str+='    <td>';
        str+='   <input id="time" class="time" name="steplist[0].sublist[0].SubHour" style="width:30px; margin-right: 5px" type="text" >시간';
        str+='    </td>';
        str+='    <td>';
        str+='   <button  id="del-subject" class="btn btn-default pull-right" type="button" data-val="0">삭제</button>';
        str+='   </td>';
        str+='   </tr>';
        str+='    </tbody>';
        str+='    </table>';
        str+='   </div>';
        $("#step-list").append(str);
    }

    $(document).on("click","#btnAddstep",function(){
        var pack=$(this).val();
        level++;
        step++;
        var sub=0;
        console.log("step:"+step);
        console.log("sub:"+sub);
        var str=" ";
        str+=  "<table id='steptable"+step+"' class='table table-condensed'>";
        str+=  "<caption><button type='button' id='deletestep' class='btn btn-default btn-sm' value="+step+">단계 삭제</button></caption>";
        str+=  "<colgroup>";
        str+=  "<col width='50px' />";
        str+=   "<col width='250px' />";
        str+=  "<col width='' />";
        str+=  "<col width='80px' />";
        str+=  "<col width='60px' />";
        str+=  "</colgroup>";
        str+=  '<tbody id=subject-list'+step+'>';
        //str+=   "<input type='text' name='steplist["+step+"].Package_no' value='"+pack+"' >";
        str+=   "<input type='hidden' name='steplist["+step+"].Level' value='"+(step+1)+"' >";
        str+=  "<tr>";
        str+=	  "<th style='text-align: center'>단계명</th>";
        str+=    "<th colspan='3' >";
        str+=    "<input name='steplist["+step+"].StepName' type='text' style='width: 800px'>";
        str+=    "</th>";
        str+=    "<th style='width: 50px'>";
        str+=    "<button  id='btnAddsubject' name='btnAddsubject"+step+"' class='btn btn-default pull-right' type='button' data-step='"+step+"' data-sub='"+sub+"' value='"+sub+"'>추가</button>";
        str+=    "</th>";
        str+=    "</tr>";
        str+=    "<tr id=subject-item"+step+sub+" style='height: 150px'>";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+step+sub+'" style="border: none" readonly>';
        str+=	'<input type="hidden" name="steplist['+step+'].sublist['+sub+'].Subject_no">';
        str+=	'<input type="hidden" name="steplist['+step+'].sublist['+sub+'].SubInStep_no" value="0">';
        str+=    "<button style='float: right;' id='selectsub' data-step='"+step+"' data-sub='"+sub+"' class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+step+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+step+"].sublist["+sub+"].SubHour' style='width:30px; margin-right: 5px' type='text'>시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button  id='del-subject' class='btn btn-default pull-right' type='button'  data-step='"+step+"' data-sub='"+sub+"' value=0>삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        str+=  "</tbody>";
        str+=  "</table>";
        $("#step-list").append(str);

    });

    $(document).on("click","#btnAddsubject",function() {
        var instep=$(this).data("step");
        sub=$(this).val();
        console.log(instep);
        sub++;
        var str=" ";
        str+=    "<tr id=subject-item"+instep+sub+" style='height:150px'>";
        str+=   "<input type='hidden' name='hide' data-val="+sub+">";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+instep+sub+'" style="border: none" readonly>';
        str+=	'<input type="hidden" name="steplist['+instep+'].sublist['+sub+'].Subject_no">';
        str+=	'<input type="hidden" name="steplist['+instep+'].sublist['+sub+'].SubInStep_no" value="0">';
        str+=    "<button style=' float: right;' id='selectsub' data-step='"+instep+"' data-sub='"+sub+"' class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+instep+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+instep+"].sublist["+sub+"].SubHour'  style='width:30px; margin-right: 5px' type='text'>시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button id='del-subject' class='btn btn-default pull-right' type='button' data-step='"+instep+"' data-sub='"+sub+"' value=0 >삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        console.log(sub);
        $("#subject-list"+instep).append(str);
        $("button[name='btnAddsubject"+instep+"']").val(sub);
    });


    function StepInPack(stepNo,subNo,sublist,stepvo,selectsubno) {
        console.log(sublist);
        console.log(stepvo);
        var pack = stepvo.package_no;
        step=stepNo;
        sub=subNo;
        var str=" ";
        str+=  "<table id='steptable"+step+"' name = 'die'  class='table table-condensed'>";
        str+=  "<caption><button type='button' id='deletestep' class='btn btn-default btn-sm' value="+step+">단계 삭제</button></caption>";
        str+=  "<colgroup>";
        str+=  "<col width='50px' />";
        str+=   "<col width='250px' />";
        str+=  "<col width='' />";
        str+=  "<col width='80px' />";
        str+=  "<col width='60px' />";
        str+=  "</colgroup>";
        str+=  '<tbody id=subject-list'+step+'>';
        str+=   "<input type='hidden' name='steplist["+step+"].Package_no' value='"+pack+"' >";
        str+=   "<input type='hidden' name='steplist["+step+"].Level' value='"+(step+1)+"' >";
        str+=   "<input type='hidden' name='steplist["+step+"].Step_no' value='"+stepvo.step_no+"' >";
        str+=  "<tr>";
        str+=	  "<th style='text-align: center'>단계명</th>";
        str+=    "<th colspan='3' >";
        str+=    "<input type='text' name='steplist["+step+"].StepName' value='"+stepvo.stepName+"' style='width: 800px'  >";
        str+=    "</th>";
        str+=    "<th style='width: 50px'>";
        str+=    "<button  id='btnAddsubject' name='btnAddsubject"+step+"' class='btn btn-default pull-right' type='button' data-step='"+step+"' data-sub='"+sub+"' value='"+sub+"'>추가</button>";
        str+=    "</th>";
        str+=    "</tr>";
        str+=    "<tr id=subject-item"+step+sub+" style='height: 150px'>";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+step+sub+'" style="border: none"  value="'+sublist.subjectName+'" readonly>';
        str+=	'<input type="hidden" name="steplist['+step+'].sublist['+sub+'].Subject_no" value="'+selectsubno+'">';
        str+=	'<input type="hidden" name="steplist['+step+'].sublist['+sub+'].SubInStep_no" value="'+sublist.subInStep_no+'">';
        str+=    "<button style=' float: right;' id='selectsub'data-step='"+step+"' data-sub='"+sub+"'  class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+step+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>"+sublist.content+"";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+step+"].sublist["+sub+"].SubHour' style='width:30px; margin-right: 5px' type='text'value="+sublist.subHour+">시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button  id='del-subject' class='btn btn-default pull-right' type='button' data-step='"+step+"' data-sub='"+sub+"' value='"+sublist.subInStep_no+"'>삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        str+=  "</tbody>"
        str+=  "</table>"
        $("#step-list").append(str);
    }

    function SubInStep(instepNo,SubNo,sublist,selectsubno) {
        var instep=$(this).data("val");
        instep=instepNo;
        sub=SubNo;
        //$(this).data("sub").val(sub);
        var str=" ";
        str+=    "<tr name='die' id=subject-item"+instep+sub+" style='height:150px'>";
        str+=   "<input type='hidden' name='hide' data-val="+sub+">";
        str+=    "<td></td>";
        str+=    "<td>";
        str+=	'<input type="text" name="SubjectName'+instep+sub+'" style="border: none"  value="'+sublist.subjectName+'"  readonly>';
        str+=	'<input type="hidden" name="steplist['+instep+'].sublist['+sub+'].Subject_no" value="'+selectsubno+'">';
        str+=	'<input type="hidden" name="steplist['+instep+'].sublist['+sub+'].SubInStep_no" value="'+sublist.subInStep_no+'">';
        str+=    "<button style=' float: right;' id='selectsub' data-step='"+step+"' data-sub='"+sub+"'  class='btn btn-default pull-right' type='button'>과목선택</button>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<textarea name='steplist["+instep+"].sublist["+sub+"].Content' style='width: 490px; height: 135px;'>"+sublist.content+"";
        str+=    "</textarea>";
        str+=    "</td>";
        str+=    "<td>";
        str+=    "<input id='time' class='time' name='steplist["+instep+"].sublist["+sub+"].SubHour'  style='width:30px; margin-right: 5px' type='text'  value='"+sublist.subHour+"'>시간";
        str+=   "</td>";
        str+=   "<td>";
        str+=   "<button id='del-subject' class='btn btn-default pull-right' type='button' data-step='"+instep+"' data-sub='"+sub+"' value='"+sublist.subInStep_no+"'>삭제</button>";
        str+=    "</td>";
        str+=   "</tr>";
        $("#subject-list"+instep).append(str);
    }




    //////////////////////////////////////////////////////////////////////////////////////////////////
    // 카테고리를 위한 스크립트 (ztree오픈소스)                                                     //
    //////////////////////////////////////////////////////////////////////////////////////////////////

    var setting = {
        edit:{
            drag:{
                autoExpandTrigger: true,
                prev: dropPrev,
                inner: dropInner,
                next: dropNext
            },
            enable:true,
            editNameSelectAll: true,
            showRemoveBtn: showRemoveBtn, //showRemoveBtn
            showRenameBtn: showRenameBtn  //showRenameBtn
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: package, // 마우스 클릭 콜백함수 지정
            beforeDrag: beforeDrag,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove,
            beforeRename: beforeRename,
            onRename:onRename,
            onRemove: onRemove,
            beforeDragOpen: beforeDragOpen,
            onDrag: onDrag,
            onDrop: onDrop,
            onExpand: onExpand
        }
    };
    //패키지 카테고리용 노드
    var zNodes= [
        <c:forEach items="${packcatelist}" var="vo">
        <c:if test="${vo.packageCate_no eq 10000}">
        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.packageCate_no}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
        </c:if>
        <c:if test="${vo.packageCate_no ne 10000}">
        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.packageCate_no}",icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png" ,iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
        </c:if>
        </c:forEach>
        <c:forEach items="${packlist}" var="vo">
        {id:${vo.package_no},pId:${vo.packageCate_no},name:"${vo.packageName}",web:"${vo.package_no}",icon:"${pageContext.request.contextPath}/assets/css/img/item.png"},
        </c:forEach>
    ];

    <!--삭제 수정용-->
    function beforeEditName(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        setTimeout(function() {
            if (confirm(" '" + treeNode.name + "'을(를) 수정 하시겠습니까?")) {
                setTimeout(function() {
                    zTree.editName(treeNode);
                }, 0);
            }
        }, 0);
        return false;
    }

    <!--삭제 수정용(삭제확인 메세지 출력 및 삭제 전 노드 정보 출력)-->
    function beforeRemove(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp;이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId);
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        return confirm(" '" + treeNode.name + "'을(를) 삭제 하시겠습니까?");
    }
    <!--삭제 수정용(삭제 후 노드 정보 출력)-->
    function onRemove(e, treeId, treeNode) {
        console.log("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp;이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId);
        deleteCate(treeNode.id);
    }
    <!--삭제 수정용(수정전 데이터 출력 밑 공백체크)-->
    function beforeRename(treeId, treeNode, newName, isCancel) {
        className = (className === "dark" ? "":"dark");
        console.log((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId+(isCancel ? "</span>":""));


        if (newName.length == 0) {
            setTimeout(function() {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.cancelEditName();
                alert("공백은 입력할수 없습니다.");
            }, 0);
            return false;
        }
        return true;
    }
    <!--삭제 수정용(수정 후 데이터 출력)-->
    function onRename(e, treeId, treeNode, isCancel) {
        console.log((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId + (isCancel ? "</span>":""));
        UpdateCate(treeNode.name,treeNode.id,treeNode.pId);
    }
    <!--삭제 수정용(시작노드 삭제 아이콘 없애는 코드)-->
     function showRemoveBtn(treeId, treeNode) {
         var show=true;
         if(treeNode.id<=10000){ show=false;}
         return show;
     }
    <!--삭제 수정용(마지막 노드 수정 아이콘 없애는 코드-->
     function showRenameBtn(treeId, treeNode) {
         var show=true;
         if(treeNode.id<10000){ show=false;}
         return show;
     }
    <!--삭제 수정용-->
    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='"+className+"'>"+str+"</li>");
        if(log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    
    <!--삭제 수정용-->
    function getTime() {
        var now= new Date(),
            h=now.getHours(),
            m=now.getMinutes(),
            s=now.getSeconds(),
            ms=now.getMilliseconds();
        return (h+":"+m+":"+s+ " " +ms);
    }
    <!--삭제 수정용-->
    var newCount = 1;
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);

        if (btn) btn.bind("click", function(){
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
            return false;
        });
    };
    <!--삭제 수정용-->
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };
    <!--삭제 수정용-->
    function selectAll() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
    }
    <!--드래그용 함수-->
    function dropPrev(treeId, nodes, targetNode) {
        var pNode = targetNode.getParentNode();
        if (pNode && pNode.dropInner === false) {
            return false;
        }
        else {
            for (var i=0,l=curDragNodes.length; i<l; i++) {
                var curPNode = curDragNodes[i].getParentNode();
                if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
                    return false;
                }
            }
        }
        return true;
    }
    <!--드래그용 함수-->
    function dropInner(treeId, nodes, targetNode) {
        if (targetNode && targetNode.dropInner === false) {
            return false;
        } else {
            for (var i=0,l=curDragNodes.length; i<l; i++) {
                if (!targetNode && curDragNodes[i].dropRoot === false) {
                    return false;
                } else if (curDragNodes[i].parentTId && curDragNodes[i].getParentNode() !== targetNode && curDragNodes[i].getParentNode().childOuter === false) {
                    return false;
                }
            }
        }
        return true;
    }
    <!--드래그용 함수-->
    function dropNext(treeId, nodes, targetNode) {
        var pNode = targetNode.getParentNode();
        if (pNode && pNode.dropInner === false) {
            return false;
        } else {
            for (var i=0,l=curDragNodes.length; i<l; i++) {
                var curPNode = curDragNodes[i].getParentNode();
                if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
                    return false;
                }
            }
        }
        return true;
    }

    var log, className = "dark", curDragNodes, autoExpandNode;

    <!--드래그용 함수-->
    function beforeDrag(treeId, treeNodes) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" beforeDrag ] drag: " + treeNodes[0].id + " nodes." +treeId.toString());
        for (var i=0,l=treeNodes.length; i<l; i++) {
            if (treeNodes[i].drag === false) {
                curDragNodes = null;
                return false;
            } else if (treeNodes[i].parentTId && treeNodes[i].getParentNode().childDrag === false) {
                curDragNodes = null;
                return false;
            }
        }
        curDragNodes = treeNodes;
        return true;
    }
    <!--드래그용 함수-->
    function beforeDragOpen(treeId, treeNode) {
        console.log("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " +  "이름:" + treeNode.name + "/ID:" + treeNode.id+"/pId:"+treeNode.pId+" nodes." );
        autoExpandNode = treeNode;
        return true;
    }
    <!--드래그용 함수-->
    function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
        className = (className === "dark" ? "":"dark");
        showLog("[ "+getTime()+" beforeDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
        showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"));
        return true;
    }

    <!--드래그용 함수(드래그 할때 해당 노드정보 출력)-->
    function onDrag(event, treeId, treeNodes) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length +  "이름:" + treeNodes + "/ID:" + treeNodes[0].id+"/pId:"+treeNodes.pId+" nodes." );
        UpdateCate(treeNodes[0].name,treeNodes[0].id,treeNodes[0].pId);
    }

    <!--드래그용 함수(드롭할때 해당 노드 정보 출력)-->
    function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
        className = (className === "dark" ? "":"dark");
        console.log("[ "+getTime()+" onDrop ]; moveType:" + moveType + "/ID:" + treeNodes[0].id+" /pId:" + treeNodes[0].pId);
        updateCate(treeNodes[0].name,treeNodes[0].id,treeNodes[0].pId);
        console.log("target: " + (targetNode ? targetNode.name +targetNode.id +targetNode.toString() : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
        //UpdateCate(treeNode.name,treeNode.id,treeNode.pId);
    }

    <!--드래그용 함수-->
    function onExpand(event, treeId, treeNode) {
        if (treeNode === autoExpandNode) {
            className = (className === "dark" ? "":"dark");
            console.log("[ "+getTime()+" onExpand ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name);
        }
    }

    <!--드래그용 함수-->
    function setTrigger() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.edit.drag.autoExpandTrigger = $("#callbackTrigger").attr("checked");
    }

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#callbackTrigger").bind("change", {}, setTrigger);
        $("#selectAll").bind("click", selectAll);
        fristStepDraw();
    });


    //과목 카테고리용 세팅
    var setting2 = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: subject
        }
    };
    //과목 카테고리용 노드
    var zNodes2= [
        <c:forEach items="${subcatelist}" var="vo">
        <c:if test="${vo.subjectCate_no eq 10000}">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
        </c:if>
        <c:if test="${vo.subjectCate_no ne 10000}">
        {id:${vo.subjectCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png"},
        </c:if>
        </c:forEach>
        <c:forEach items="${sublist}" var="vo">
        {id:${vo.subject_no},pId:${vo.subjectCate_no},name:"${vo.subjectName}",web:"${vo.subject_no}"},
        </c:forEach>
    ];
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo2"), setting2, zNodes2);
    });

    //카테고리 선택용 노드
    var setting3 = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: packagecate
        }
    };
    //과목 카테고리용 노드
    var zNodes3= [
        <c:forEach items="${packcatelist}" var="vo">
        <c:if test="${vo.packageCate_no eq 10000}">
        {id:${vo.packageCate_no} , pId:${vo.parentCode}, name:"${vo.cateName}",web:"${vo.packageCate_no}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png",iconOpen: "${pageContext.request.contextPath}/assets/css/img/OpenCate.png"},
        </c:if>
        <c:if test="${vo.packageCate_no ne 10000}">
        {id:${vo.packageCate_no} , pId:${vo.parentCode},name:"${vo.cateName}", web:"${vo.packageCate_no}",open:true,icon:"${pageContext.request.contextPath}/assets/css/img/CloseCate.png"},
        </c:if>
        </c:forEach>
    ];
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo3"), setting3, zNodes3);
    });
</script>