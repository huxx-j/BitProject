<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

$(document).ready(function () {
	
	var selectValue = $("#workTypeSelect option:selected").val();
	   console.log("ajsdfhijashdfahdfuihsadijfb");
	$.ajax({
	        url: "${pageContext.request.contextPath}/api/apply/getcurri",
	        type: "post",
	        data: {"workType": selectValue},
	        dataType: "json",
	        success: function (list) {
	        	console.log("지원자 관리 들어갔다 왔어요");
	            $("#curriSelect").remove();
	            var str = "";
	            str += "<select id='curriSelect' style='width: 90%'></select>";
	
	            $("#curriTd").append(str);
	
	            for (var i = 0; i < list.length; i++) {
	                renderCurri(list[i])
	            }
	        },
	        error: function (XHR, status, error) {
	            console.error(status + " : " + error)
	        }
	    });

//업무 구분별 과목 불러오는 스크립트
$("#workTypeSelect").change(function () {
    var selectValue = $("#workTypeSelect option:selected").val();

    $.ajax({
        url: "/api/apply/getcurri",
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
            console.error(status + " : " + error)
        	}
   	 });

	});

	function renderCurri(curri) {
	    var str = "";
	    str += "<option value='" + curri.curriculum_no + "'>" + curri.curriName + "</option>";
	
	    $("#curriSelect").append(str);
	};

	


});
	
	
$(document).on("click","#applySearch",function(){
    var selectValue = $("#curriSelect option:selected").val();
	console.log("클릭됨"+selectValue);
	$.ajax({
        url: "/api/apply/search",
        type: "post",
        data: {"selectValue": selectValue},
        dataType: "json",
        success: function (list) {
          console.log("search 잘 들어갔다 나옴");
          
        },
        error: function (request,status,error) {
        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
   	 });


});	
	
var cnames = ['번호', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰', '지원일자', '전형일자', '학교', '전공', '입금여부'];

$("#jqGrid").jqGrid({
    url: "jqgridStartMain.do",
    datatype: "local",
    colNames: cnames,
    colModel: [
        {name: 'seq', index: 'seq', width: 50, align: "center"},
        {name: 'gisu', index: 'gisu', width: 100, align: "center"},
        {name: 'name', index: 'name', width: 100, align: "center"},
        {name: 'birth', index: 'birth', width: 100, align: "center"},
        {name: 'gender', index: 'gender', width: 50, align: "center"},
        {name: 'result', index: 'result', width: 80, align: "center"},
        {name: 'phone', index: 'phone', width: 150, align: "center"},
        {name: 'appdate', index: 'appdate', width: 100, align: "center"},
        {name: 'exdate', index: 'exdate', width: 100, align: "center"},
        {name: 'school', index: 'school', width: 150, align: "center"},
        {name: 'major', index: 'major', width: 150, align: "center"},
        {name: 'yn', index: 'yn', width: 80, align: "center"}
    ],
    rowheight: 20,
    height: 230,
    rowNum: 15,
    rowList: [10, 20, 30],
    pager: '#jqGridPager',
    rownumbers: true,
    ondblClickRow: function (rowId, iRow, iCol, e) {

        if (iCol == 1) {

            alert(rowId + " 째줄 입니다.");
        }
    },

    viewrecords: true,
    /* caption: "유저 정보" */


});


/* ajax로 DB에서 정보 긁어서 뿌려주는 코드 */

// $(function () {
//
//     $.ajax({
//         url: "/api/getuserinfo",
//         type: "post",
//         dataType: "json",
//         success: function (result) {
//             console.log(result);
//
//             for (var i = 0; i<result.length; i++)
//                 $("#jqGrid").jqGrid('addRowData', i+1, result[i]);
//         },
//         error: function (XHR, status, error) {
//             console.error(status + " : " + error);
//         }
//     });
//
// });


$(function () {
var mydata = [
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    {seq:"1",gisu:"KUKA18_RD01",name:"이서현",birth:'1987-05-13',gender:"여",result:"합격",phone:"010-6565-5644",appdate:"2018-06-50",exdate:"2018-21-56",school:"서울대학교",major:"컴퓨터공학과",yn:"미납"},
    
];

for (var i=0; i<=mydata.length; i++) {
    $("#jqGrid").jqGrid('addRowData', i+1, mydata[i]);
}
});	
	
</script>