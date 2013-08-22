$(document).ready(function(){
$(".niceCheck").mousedown(
function() {
     changeCheck($(this));
});


$(".niceCheck").each(
function() {
    changeCheckStart($(this));
});
});

function changeCheck(el)
{
     var el = el,
          input = el.find("input").eq(0);
   	 if(!input.attr("checked")) {
		el.css("background-position","0 -17px");	
		input.attr("checked", true)
                DisableOtherBet(null);
	} else {
		el.css("background-position","0 0");	
		input.attr("checked", false)
	}
     return true;
}

function changeCheckStart(el){
var el = el,
		input = el.find("input").eq(0);
      if(input.attr("checked")) {
		el.css("background-position","0 -17px");	
		}
     return true;
}


$(document).ready(function(){
//    Первый стол
$("#Table1User1Check").mousedown(
function() {
TableUserChangeCheck($("#Table1User1CheckBackground"),$("#Table1User1Check"));
});
$("#Table1User1Check").each(
function() {
    TableUserChangeCheckStart($("#Table1User1CheckBackground"),$("#Table1User1Check"));
});

$("#Table1User2Check").mousedown(
function() {
TableUserChangeCheck($("#Table1User2CheckBackground"),$("#Table1User2Check"));
});
$("#Table1User2Check").each(
function() {
    TableUserChangeCheckStart($("#Table1User2CheckBackground"),$("#Table1User2Check"));
});

$("#Table1User3Check").mousedown(
function() {
TableUserChangeCheck($("#Table1User3CheckBackground"),$("#Table1User3Check"));
});
$("#Table1User3Check").each(
function() {
    TableUserChangeCheckStart($("#Table1User3CheckBackground"),$("#Table1User3Check"));
});

$("#Table1User4Check").mousedown(
function() {
TableUserChangeCheck($("#Table1User4CheckBackground"),$("#Table1User4Check"));
});
$("#Table1User4Check").each(
function() {
    TableUserChangeCheckStart($("#Table1User4CheckBackground"),$("#Table1User4Check"));
});

// Второй стол

$("#Table2User1Check").mousedown(
function() {
TableUserChangeCheck($("#Table2User1CheckBackground"),$("#Table2User1Check"));
});
$("#Table2User1Check").each(
function() {
    TableUserChangeCheckStart($("#Table2User1CheckBackground"),$("#Table2User1Check"));
});

$("#Table2User2Check").mousedown(
function() {
TableUserChangeCheck($("#Table2User2CheckBackground"),$("#Table2User2Check"));
});
$("#Table2User2Check").each(
function() {
    TableUserChangeCheckStart($("#Table2User2CheckBackground"),$("#Table2User2Check"));
});

$("#Table2User3Check").mousedown(
function() {
TableUserChangeCheck($("#Table2User3CheckBackground"),$("#Table2User3Check"));
});
$("#Table2User3Check").each(
function() {
    TableUserChangeCheckStart($("#Table2User3CheckBackground"),$("#Table2User3Check"));
});

$("#Table2User4Check").mousedown(
function() {
TableUserChangeCheck($("#Table2User4CheckBackground"),$("#Table2User4Check"));
});
$("#Table2User4Check").each(
function() {
    TableUserChangeCheckStart($("#Table2User4CheckBackground"),$("#Table2User4Check"));
});

$("#Table2User5Check").mousedown(
function() {
TableUserChangeCheck($("#Table2User5CheckBackground"),$("#Table2User5Check"));
});
$("#Table2User5Check").each(
function() {
    TableUserChangeCheckStart($("#Table2User5CheckBackground"),$("#Table2User5Check"));
});

$("#Table2User6Check").mousedown(
function() {
TableUserChangeCheck($("#Table2User6CheckBackground"),$("#Table2User6Check"));
});
$("#Table2User6Check").each(
function() {
    TableUserChangeCheckStart($("#Table2User6CheckBackground"),$("#Table2User6Check"));
});

// Третий стол

$("#Table3User1Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User1CheckBackground"),$("#Table3User1Check"));
});
$("#Table3User1Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User1CheckBackground"),$("#Table3User1Check"));
});

$("#Table3User2Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User2CheckBackground"),$("#Table3User2Check"));
});
$("#Table3User2Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User2CheckBackground"),$("#Table3User2Check"));
});

$("#Table3User3Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User3CheckBackground"),$("#Table3User3Check"));
});
$("#Table3User3Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User3CheckBackground"),$("#Table3User3Check"));
});

$("#Table3User4Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User4CheckBackground"),$("#Table3User4Check"));
});
$("#Table3User4Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User4CheckBackground"),$("#Table3User4Check"));
});

$("#Table3User5Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User5CheckBackground"),$("#Table3User5Check"));
});
$("#Table3User5Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User5CheckBackground"),$("#Table3User5Check"));
});

$("#Table3User6Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User6CheckBackground"),$("#Table3User6Check"));
});
$("#Table3User6Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User6CheckBackground"),$("#Table3User6Check"));
});

$("#Table3User7Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User7CheckBackground"),$("#Table3User7Check"));
});
$("#Table3User7Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User7CheckBackground"),$("#Table3User7Check"));
});

$("#Table3User8Check").mousedown(
function() {
TableUserChangeCheck($("#Table3User8CheckBackground"),$("#Table3User8Check"));
});
$("#Table3User8Check").each(
function() {
    TableUserChangeCheckStart($("#Table3User8CheckBackground"),$("#Table3User8Check"));
});
});

function DisableOtherBet(CurrentBet){
for(var i = 1; i < 5; i++)
    if($("#Table1User"+i.toString()+"Check") != CurrentBet)
    DisableCheck($("#Table1User"+i.toString()+"Check"+"Background"),$("#Table1User"+i.toString()+"Check"));

for(var i = 1; i < 7; i++)
    if($("#Table2User"+i.toString()+"Check") != CurrentBet)
    DisableCheck($("#Table2User"+i.toString()+"Check"+"Background"),$("#Table2User"+i.toString()+"Check"));

for(var i = 1; i < 9; i++)
    if($("#Table3User"+i.toString()+"Check") != CurrentBet)
    DisableCheck($("#Table3User"+i.toString()+"Check"+"Background"),$("#Table3User"+i.toString()+"Check"));

}

function DisableCheck(el,input){
    el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");	
    input.attr("checked", false)
}

function TableUserChangeCheck(el,input)
{
     var el = el,input = input;
   	 if(!input.attr("checked")) {
             var exp = document.getElementById("ExpressCheck");
             if(exp.getAttribute("checked"))
                 DisableOtherBet(input);
		el.css("background","-moz-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-webkit-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-o-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-ms-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","linear-gradient(top, #d52711 0%, #d76255 100%)");
                input.attr("checked", true)
	} else {
                el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");	
                input.attr("checked", false)
	}
     return true;
}

function TableUserChangeCheckStart(el,input){
var el = el,input = input;
      if(input.attr("checked")) {
          el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
          el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
          el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
          el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
          el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");	
		
    }
     return true;
}