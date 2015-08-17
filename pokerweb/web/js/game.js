$(document).ready(function(){
     $('#mycarousel').jcarousel();
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
  if($("#ExpressCheck").attr("disabled"))
        return false;
  if(input.attr("checked")) {
		el.css("background-position","0 -17px");
                input.attr("checked", false);
		}else{
                el.css("background-position","0 0px");
                input.attr("checked", true);
		    
                }
  var sum=0;
  var count=0;
           for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))    
           count++;
    
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
            count++;
   
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
  if($("#ExpressCheck").attr("checked")){
      
                      for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                      if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table1User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table1User'+i+'CheckBackground').html());
                        }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                       if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table2User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table2User'+i+'CheckBackground').html());
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table3User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table3User'+i+'CheckBackground').html());
                        }
                  }else{
                  for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table1User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table2User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table3User'+i+'CheckBackground').html())/count;
                        }}
                   $("#Factor").html(sum.toFixed(2));
     return true;
}

function changeCheckStart(el){
var el = el,
		input = el.find("input").eq(0);
      if(!input.attr("checked")) {
		el.css("background-position","0 -17px");
                input.attr("checked", false);
		}
     return true;
}


$(document).ready(function(){
   // $("").
   
   $('#Table1User1Check').hover(function () {
       if(!$('#Table1User1Check').attr("disabled"))
       if($('#Table1User1Check').attr("checked"))
           $("#Table1User1CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table1User1CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table1User1Check').attr("disabled"))
    if($('#Table1User1Check').attr("checked"))
           $("#Table1User1CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table1User1CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table1User2Check').hover(function () {
if(!$('#Table1User2Check').attr("disabled"))
       if($('#Table1User2Check').attr("checked"))
           $("#Table1User2CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table1User2CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table1User2Check').attr("disabled"))
    if($('#Table1User2Check').attr("checked"))
           $("#Table1User2CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table1User2CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table1User3Check').hover(function () {
if(!$('#Table1User3Check').attr("disabled"))
       if($('#Table1User3Check').attr("checked"))
           $("#Table1User3CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table1User3CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table1User3Check').attr("disabled"))
    if($('#Table1User3Check').attr("checked"))
           $("#Table1User3CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table1User3CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table1User4Check').hover(function () {
if(!$('#Table1User4Check').attr("disabled"))
       if($('#Table1User4Check').attr("checked"))
           $("#Table1User4CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table1User4CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table1User4Check').attr("disabled"))
    if($('#Table1User4Check').attr("checked"))
           $("#Table1User4CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table1User4CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});

$('#Table2User1Check').hover(function () {
if(!$('#Table2User1Check').attr("disabled"))
       if($('#Table2User1Check').attr("checked"))
           $("#Table2User1CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table2User1CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table2User1Check').attr("disabled"))
    if($('#Table2User1Check').attr("checked"))
           $("#Table2User1CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table2User1CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table2User2Check').hover(function () {
if(!$('#Table2User2Check').attr("disabled"))
       if($('#Table2User2Check').attr("checked"))
           $("#Table2User2CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table2User2CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table2User2Check').attr("disabled"))
    if($('#Table2User2Check').attr("checked"))
           $("#Table2User2CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table2User2CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table2User3Check').hover(function () {
if(!$('#Table2User3Check').attr("disabled"))
       if($('#Table2User3Check').attr("checked"))
           $("#Table2User3CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table2User3CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table2User3Check').attr("disabled"))
    if($('#Table2User3Check').attr("checked"))
           $("#Table2User3CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table2User3CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table2User4Check').hover(function () {
if(!$('#Table2User4Check').attr("disabled"))
       if($('#Table2User4Check').attr("checked"))
           $("#Table2User4CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table2User4CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table2User4Check').attr("disabled"))
    if($('#Table2User4Check').attr("checked"))
           $("#Table2User4CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table2User4CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table2User5Check').hover(function () {
if(!$('#Table2User5Check').attr("disabled"))
       if($('#Table2User5Check').attr("checked"))
           $("#Table2User5CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table2User5CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table2User5Check').attr("disabled"))
    if($('#Table2User5Check').attr("checked"))
           $("#Table2User5CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table2User5CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table2User6Check').hover(function () {
if(!$('#Table2User6Check').attr("disabled"))
       if($('#Table2User6Check').attr("checked"))
           $("#Table2User6CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table2User6CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table2User6Check').attr("disabled"))
    if($('#Table2User6Check').attr("checked"))
           $("#Table2User6CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table2User6CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});

$('#Table3User1Check').hover(function () {
if(!$('#Table3User1Check').attr("disabled"))
       if($('#Table3User1Check').attr("checked"))
           $("#Table3User1CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User1CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table3User1Check').attr("disabled"))
    if($('#Table3User1Check').attr("checked"))
           $("#Table3User1CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User1CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table3User2Check').hover(function () {
if(!$('#Table3User2Check').attr("disabled"))
       if($('#Table3User2Check').attr("checked"))
           $("#Table3User2CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User2CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table3User2Check').attr("disabled"))
    if($('#Table3User2Check').attr("checked"))
           $("#Table3User2CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User2CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table3User3Check').hover(function () {
if(!$('#Table2User3Check').attr("disabled"))
       if($('#Table3User3Check').attr("checked"))
           $("#Table3User3CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User3CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table2User3Check').attr("disabled"))
    if($('#Table3User3Check').attr("checked"))
           $("#Table3User3CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User3CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table3User4Check').hover(function () {
if(!$('#Table3User4Check').attr("disabled"))
       if($('#Table3User4Check').attr("checked"))
           $("#Table3User4CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User4CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table3User4Check').attr("disabled"))
    if($('#Table3User4Check').attr("checked"))
           $("#Table3User4CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User4CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table3User5Check').hover(function () {
if(!$('#Table3User5Check').attr("disabled"))
       if($('#Table3User5Check').attr("checked"))
           $("#Table3User5CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User5CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table3User5Check').attr("disabled"))
    if($('#Table3User5Check').attr("checked"))
           $("#Table3User5CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User5CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table3User6Check').hover(function () {
if(!$('#Table3User6Check').attr("disabled"))
       if($('#Table3User6Check').attr("checked"))
           $("#Table3User6CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User6CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table3User6Check').attr("disabled"))
    if($('#Table3User6Check').attr("checked"))
           $("#Table3User6CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User6CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table3User7Check').hover(function () {
if(!$('#Table3User7Check').attr("disabled"))
       if($('#Table3User7Check').attr("checked"))
           $("#Table3User7CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User7CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table3User7Check').attr("disabled"))
    if($('#Table3User7Check').attr("checked"))
           $("#Table3User7CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User7CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});
$('#Table3User8Check').hover(function () {
if(!$('#Table3User8Check').attr("disabled"))
       if($('#Table3User8Check').attr("checked"))
           $("#Table3User8CheckBackground").css("backgroundImage","url(/pic/ButtState6.png)");
       else
           $("#Table3User8CheckBackground").css("backgroundImage","url(/pic/ButtState3.png)");
},function (e) {
    if(!$('#Table3User8Check').attr("disabled"))
    if($('#Table3User8Check').attr("checked"))
           $("#Table3User8CheckBackground").css("backgroundImage", "url(/pic/ButtState4.png)");
       else
           $("#Table3User8CheckBackground").css("backgroundImage", "url(/pic/ButtState1.png)");
});

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

$("#BetUser").click(
    function (){
GetBet();
    }    
    );

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


$("#SumBetUp").click(
        function() {
    if($("#SumBetUp").attr("disabled"))
        return;
            var CurrentSum = parseFloat($("#SumBetUser").html());
            $("#SumBetUser").html(CurrentSum + 0.50);
});

$("#SumBetDown").click(
        function() {
    if($("#SumBetDown").attr("disabled"))
            return ;
//    var count = 0;
//    for(var i = 1; i < 5; i++)
//        if($("#Table1User"+i+"Check").attr("checked"))
//           count++;
//   for(var i = 1; i < 6; i++)
//        if($("#Table2User"+i+"Check").attr("checked"))
//           count++;
//   for(var i = 1; i < 9; i++)
//        if($("#Table3User"+i+"Check").attr("checked"))
//           count++;
//            var CurrentSum = parseFloat($("#SumBetUser").html());
            //if(count != 0 && ((CurrentSum - 0.50)/count) >= 4)
            if((parseFloat($("#SumBetUser").html()) - 0.50) >=4)
                $("#SumBetUser").html(parseFloat($("#SumBetUser").html()) - 0.50);
});

$("#SendNewBet").click(
        function(){
    var count=0;
           for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))    
           count++;
    
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
            count++;
   
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
    if($("#SendNewBet").attr("disabled") || count==0)
            return ;
        
    var json = { };
    json["Table1"] = { };
    json["Table2"] = { };
    json["Table3"] = { };
    json["Sum"] = $("#SumBetUser").html();
    json["Express"] = $("#ExpressCheck").attr("checked") == "checked"?true:false;
    json.Table1 = [];
    json.Table2 = [];
    json.Table3 = [];
    $("#SumBetUser").html(4.00);
    //console.log($("#ExpressCheck").attr("checked"));
    var index = 0;
    for(var i = 1; i < 5; i++){
     //   SetNoActiveButt($("#Table1User"+i+"CheckBackground"));
        if($("#Table1User"+i+"Check").attr("checked")){    
           json.Table1[index++] = i-1;
      $("#Table1User"+i+"Check").attr("checked", false);
       DisableCheck($("#Table1User"+i.toString()+"Check"+"Background"),$("#Table1User"+i.toString()+"Check"));
        }
    }        
    index = 0;
   for(var i = 1; i < 7; i++){
     //  SetNoActiveButt($("#Table2User"+i+"CheckBackground"));
        if($("#Table2User"+i+"Check").attr("checked")){
            json.Table2[index++] = i-1;
        $("#Table2User"+i+"Check").attr("checked", false);
         DisableCheck($("#Table2User"+i.toString()+"Check"+"Background"),$("#Table2User"+i.toString()+"Check"));
        }
   }
   index = 0;
   for(var i = 1; i < 9; i++){
     //  SetNoActiveButt($("#Table3User"+i+"CheckBackground"));
        if($("#Table3User"+i+"Check").attr("checked")){
           json.Table3[index++] = i-1;
       $("#Table3User"+i+"Check").attr("checked", false);
        DisableCheck($("#Table3User"+i.toString()+"Check"+"Background"),$("#Table3User"+i.toString()+"Check"));
        }
   }
      //  DisableAllBet();
        $("#Factor").html(0);
   var url = "NewBet";
   reqPrivate = new XMLHttpRequest();
   reqPrivate.open("POST", url, true);
   reqPrivate.onreadystatechange = SaveNewBetCallback;
   reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   reqPrivate.send(JSON.stringify(json));
        }
            );                
        $("#SumBetUser").click(
                function (){//$("#CloseCalculatorButt").offset({top:ui.position.top-20, left:ui.position.left+300-20})
            if($("#SumBetUser").attr("disabled"))
                return ;
           $("#Calculator").dialog({title:"Выберите ставку",height:560,width:300,maxHeight:560,maxWidth:300,minHeight:560,minWidth:300,
           drag: function(event, ui) {
       $("#CloseCalculatorButt").offset({top:ui.position.top-20, left:ui.position.left+300-20});
           }});
          $("#ModalBackCalc").css("display","");
           $("#CloseCalculatorButt").css("display","");
                }     
            );   
  
$('#Calculator').bind('dialogclose', function(event) {
     $("#ModalBackCalc").css("display","none");
     $("#CloseCalculatorButt").css("display","none");
 });
 
 $("#CloseCalculatorButt").click(function (){
    $("#Calculator").dialog("close");
 });

for(var i = 1; i < 5; i++){
    $("#Table1User"+i+"Check").attr("disabled",true);
    SetNoActiveButt($("#Table1User"+i+"CheckBackground"));
}        
for(var i = 1; i < 7; i++){
    SetNoActiveButt($("#Table2User"+i+"CheckBackground"));
    $("#Table2User"+i+"Check").attr("disabled",true);
   }
   for(var i = 1; i < 9; i++){
       SetNoActiveButt($("#Table3User"+i+"CheckBackground"));
       $("#Table3User"+i+"Check").attr("disabled",true);
   }
   $("#SumBetUser").attr("disabled",true);
   SetNoActiveButt($("#SumBetUser"));
   $("#SumBetUp").attr("disabled",true);
   SetNoActiveButt($("#SumBetUp"));
   $("#SumBetDown").attr("disabled",true);
   SetNoActiveButt($("#SumBetDown"));
   $("#SendNewBet").attr("disabled",true);
   SetNoActiveButt($("#SendNewBet"));
   
   $("#CalcButt0").click(function (){
       var NewSum = parseFloat($("#DisplayCalculator").html()) * 10;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
       
   });
   $("#CalcButt1").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+1;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt2").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+2;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt3").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+3;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt4").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+4;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt5").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+5;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt6").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+6;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt7").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+7;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt8").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+8;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   $("#CalcButt9").click(function (){
       var NewSum = (parseFloat($("#DisplayCalculator").html()) * 10)+9;
     if(NewSum<=parseFloat($("#MaxBet").html()))
         $("#DisplayCalculator").html(NewSum);
   });
   
   $("#SetMaxBet").click(function(){
       $("#DisplayCalculator").html($("#MaxBet").html());
   });
   $("#AppendSum").click(function (){
       $("#SumBetUser").html($("#DisplayCalculator").html());
       $("#Calculator").dialog('close');
       $("#DisplayCalculator").html("0");
   });
   $("#ResetBets").click(function(){
       DisableAllBet();
       
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

function DisableAllBet(){
    $("#Factor").html(0);
for(var i = 1; i < 5; i++)
    DisableCheck($("#Table1User"+i.toString()+"Check"+"Background"),$("#Table1User"+i.toString()+"Check"));

for(var i = 1; i < 7; i++)
    DisableCheck($("#Table2User"+i.toString()+"Check"+"Background"),$("#Table2User"+i.toString()+"Check"));

for(var i = 1; i < 9; i++)
    DisableCheck($("#Table3User"+i.toString()+"Check"+"Background"),$("#Table3User"+i.toString()+"Check"));

}

function DisableCheck(el,input){
    el.css("backgroundImage", "url(/pic/ButtState2.png)");
   // el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
   // el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
   // el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
   // el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
  //  el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");	
    input.attr("checked", false);
}

function TableUserChangeCheck(el,input)
{
     var el = el,input = input;
     if(!input.attr("disabled")){
         var countT1 = 0;
         var countT2 = 0;
         var countT3 = 0;
            
   	 if(!input.attr("checked")) {
            // var exp = document.getElementById("ExpressCheck");
            // if(exp.getAttribute("checked"))
                // DisableOtherBet(input);
                el.css("backgroundImage", "url(/pic/ButtState4.png)");
		//el.css("background","-moz-linear-gradient(top, #d52711 0%, #d76255 100%)");
                //el.css("background","-webkit-linear-gradient(top, #d52711 0%, #d76255 100%)");
                //el.css("background","-o-linear-gradient(top, #d52711 0%, #d76255 100%)");
                //el.css("background","-ms-linear-gradient(top, #d52711 0%, #d76255 100%)");
                //el.css("background","linear-gradient(top, #d52711 0%, #d76255 100%)");
                input.attr("checked", true);
            for(var i = 1; i < 5; i++)
                if($("#Table1User"+i+"Check").attr("checked"))
                   countT1++;
                    for(var i = 1; i < 7; i++)
                        if($("#Table2User"+i+"Check").attr("checked"))
                   countT2++;
                    for(var i = 1; i < 9; i++)
                        if($("#Table3User"+i+"Check").attr("checked"))
                   countT3++;
                 
           if(countT1>1 || countT2>1 || countT3>1)
               {
                  var sum=0;
                  $(".niceCheck").css("background-position","0 -17px");	
		$("#ExpressCheck").attr("checked", false);
		$("#ExpressCheck").attr("disabled",true);
            var count=0;
           for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))    
           count++;
    
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
            count++;
   
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
                  for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table1User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table2User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table3User'+i+'CheckBackground').html())/count;
                        }
                   $("#Factor").html(sum.toFixed(2));
                
	}else{
            var sum=0;
                  if($("#ExpressCheck").attr("checked")){
                      for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                      if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table1User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table1User'+i+'CheckBackground').html());
                        }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                       if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table2User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table2User'+i+'CheckBackground').html());
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table3User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table3User'+i+'CheckBackground').html());
                        }
                  }else{
                       var count=0;
           for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))    
           count++;
    
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
            count++;
   
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
                      var sum=0;
                  for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table1User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table2User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table3User'+i+'CheckBackground').html())/count;
                        }}
                   $("#Factor").html(sum.toFixed(2));
                $("#ExpressCheck").attr("disabled",false);
	}
              //  SetBetHand(true);
	} else {
               // el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
              //  el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
              //  el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
              //  el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
              //  el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                
                el.css("backgroundImage", "url(/pic/ButtState1.png)");
                input.attr("checked", false);
            for(var i = 1; i < 5; i++)
                if($("#Table1User"+i+"Check").attr("checked"))
                   countT1++;
                    for(var i = 1; i < 7; i++)
                        if($("#Table2User"+i+"Check").attr("checked"))
                   countT2++;
                    for(var i = 1; i < 9; i++)
                        if($("#Table3User"+i+"Check").attr("checked"))
                   countT3++;
             if(countT1>1 || countT2>1 || countT3>1)
               {
                  var sum=0;
                   var count=0;
           for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))    
           count++;
    
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
            count++;
   
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
                  for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table1User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table2User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table3User'+i+'CheckBackground').html())/count;
                        }
                   $("#Factor").html(sum.toFixed(2));
                $(".niceCheck").css("background-position","0 -17px");	
		$("#ExpressCheck").attr("checked", false);
		$("#ExpressCheck").attr("disabled",true);
	}else{
            var sum=0;
             var count=0;
           for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))    
           count++;
    
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
            count++;
   
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
                  if($("#ExpressCheck").attr("checked")){
                      for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                      if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table1User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table1User'+i+'CheckBackground').html());
                        }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                       if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table2User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table2User'+i+'CheckBackground').html());
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          if(sum==0 || sum==0.00)  
                        sum+=parseFloat($('#Table3User'+i+'CheckBackground').html());
                    else
                        sum*=parseFloat($('#Table3User'+i+'CheckBackground').html());
                        }
                  }else{
                      var sum=0;
                       var count=0;
           for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))    
           count++;
    
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
            count++;
   
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
                  for(var i = 1; i < 5; i++)
                      if($("#Table1User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table1User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 7; i++)
                      if($("#Table2User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table2User'+i+'CheckBackground').html())/count;
                      }
                  for(var i = 1; i < 9; i++)
                      if($("#Table3User"+i+"Check").attr("checked")){
                          sum+=parseFloat($('#Table3User'+i+'CheckBackground').html())/count;
                        }}
                   $("#Factor").html(sum.toFixed(2));
                $("#ExpressCheck").attr("disabled",false);
	}
	}}
     return true;
}

function SetNoActiveButt(el){
   // el.css("background","-moz-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
   // el.css("background","-webkit-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
   // el.css("background","-o-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
   // el.css("background","-ms-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
   // el.css("background","linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
   
   el.css("backgroundImage", "url(/pic/ButtState2.png)");
}

function SetActiveButt(el){
   // el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
   // el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
  //  el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
  //  el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
  //  el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");	
el.css("backgroundImage", "url(/pic/ButtState1.png)");
}

function SetActiveSetBetButt(el){
   		//el.css("background","-moz-linear-gradient(top, #d52711 0%, #d76255 100%)");
               // el.css("background","-webkit-linear-gradient(top, #d52711 0%, #d76255 100%)");
               // el.css("background","-o-linear-gradient(top, #d52711 0%, #d76255 100%)");
               // el.css("background","-ms-linear-gradient(top, #d52711 0%, #d76255 100%)");
               // el.css("background","linear-gradient(top, #d52711 0%, #d76255 100%)");
   el.css("backgroundImage", "url(/pic/ButtState4.png)");
}

function TableUserChangeCheckStart(el,input){
var el = el,input = input;
      if(input.attr("checked")) {
        //  el.css("background","-moz-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
        //  el.css("background","-webkit-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
        //  el.css("background","-o-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
        //  el.css("background","-ms-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
        //  el.css("background","linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
        
        el.css("backgroundImage", "url(/pic/ButtState2.png)");
    }
     return true;
}

function SetBetHand(set){
//    var json = { };
//    json["Table1"] = { };
//    json["Table2"] = { };
//    json["Table3"] = { };
//    json["Sum"] = $("#SumBetUser").html();
//    json.Table1 = [];
//    json.Table2 = [];
//    json.Table3 = [];
//    var index = 0;
//    for(var i = 1; i < 5; i++)
//        if($("#Table1User"+i+"Check").attr("checked")){
//           json.Table1[index++] = i-1;
//        }
//    index = 0;
//   for(var i = 1; i < 7; i++)
//        if($("#Table2User"+i+"Check").attr("checked"))
//           json.Table2[index++] = i-1;
//   index = 0;
//   for(var i = 1; i < 9; i++)
//        if($("#Table3User"+i+"Check").attr("checked"))
//           json.Table3[index++] = i-1;
//    $.ajax({
//   type: "POST",
//   url: "/CheckBet",
//   data: json.toString(),
//   success: function(msg){
//       var Message = JSON.parse(msg);
//       $("#SumBetUser").html(Message.Sum);
//       $("#MinBet").html(Message.Min);
//       $("#MaxBet").html(Message.Max);
//   }
// });

var count = 0;
    for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))
           count++;
   for(var i = 1; i < 7; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
           count++;
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
            var CurrentSum = parseFloat($("#SumBetUser").html());
            if(count != 0 && (CurrentSum/count) < 4)
                $("#SumBetUser").html(4 * count);
}

function StartGame(){
$.ajax({
   type: "POST",
   url: "/StartGame",
   
   success: function(msg){
       $("#MaxBet").html(msg.Max);
   }
 });
    CheckGame();
}

var GetBetStatisticTimer = 0;
function GetBet(index){
var values =  {  
                "index": index 
            };
//    var url = "/GetBet";
//    reqPrivate = new XMLHttpRequest();
//    reqPrivate.open("POST", url, true);
//    reqPrivate.onreadystatechange = test;
//    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//    reqPrivate.send(JSON.stringify(values));
//var json = { };
//json["index"] = index;
   $.ajax({
   type: "POST",
   url: "/GetBet",
   dataType: "json",
  data: JSON.stringify(values),
   success: function(msg){
       if(msg.correct == true){
           $("#modalWait").css("display","");
           
       }
   }
 });
   // CheckGame();
}

function CheckGame(){setInterval(function() {
    var values =  {  
                "start": $("#CurrentStage").html() 
            };
    var url = "GameChanges";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = StartGameCallback;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
},1000);
}

function StartGameCallback() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null)
            if(reqPrivate.responseText.length > 0){
                var Message = JSON.parse(reqPrivate.responseText);
                var tr = reqPrivate.responseText;
                console.log(tr);
                if(Message.StatisticCurrentUser!=null){
                    var winsTable1 = "";
                    var winsTable2 = "";
                    var winsTable3 = "";
                    var CountBetStatistic = 0;
                        $('#STable1User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand0.FirstCard+'.png)');
                        $('#STable1User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand0.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table0.Hands.Hand0.Target == true){
                            SetActiveSetBetButt($('#STable1User1CheckBackground'));
                            CountBetStatistic++;
                        }
                        else
                           SetNoActiveButt($('#STable1User1CheckBackground'));
                       
                        if(Message.StatisticCurrentUser.Table0.Hands.Hand0.Wins == true){
                            $("#SCartsUser11").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable1 = "11";
                        }
                        else
                            $('#SCartsUser11').css("border","0");
                        $('#STable1User1CheckBackground').html(Message.StatisticCurrentUser.Table0.Hands.Hand0.Factor);
                        $('#STable1User1Progress').css('bottom' , Message.StatisticCurrentUser.Table0.Hands.Hand0.Indicator + '%');
                        $('#STable1User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand1.FirstCard+'.png)');
                        $('#STable1User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand1.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table0.Hands.Hand1.Target == true){
                            SetActiveSetBetButt($('#STable1User2CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable1User2CheckBackground'));
                       if(Message.StatisticCurrentUser.Table0.Hands.Hand1.Wins == true){
                            $("#SCartsUser12").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable1.length>0?winsTable1 += ",12":winsTable1 += "12";
                        }
                        else
                            $('#SCartsUser12').css("border","0");
                        $('#STable1User2CheckBackground').html(Message.StatisticCurrentUser.Table0.Hands.Hand1.Factor);
                        $('#STable1User2Progress').css('bottom' , Message.StatisticCurrentUser.Table0.Hands.Hand1.Indicator + '%');
                        $('#STable1User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand2.FirstCard+'.png)');
                        $('#STable1User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand2.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table0.Hands.Hand2.Target == true){
                            SetActiveSetBetButt($('#STable1User3CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable1User3CheckBackground'));
                       if(Message.StatisticCurrentUser.Table0.Hands.Hand2.Wins == true){
                            $("#SCartsUser13").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable1.length>0?winsTable1 += ",13":winsTable1 += "13";
                        }
                        else
                            $('#SCartsUser13').css("border","0");
                        $('#STable1User3CheckBackground').html(Message.StatisticCurrentUser.Table0.Hands.Hand2.Factor);
                        $('#STable1User3Progress').css('bottom' , Message.StatisticCurrentUser.Table0.Hands.Hand2.Indicator + '%');
                        $('#STable1User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand3.FirstCard+'.png)');
                        $('#STable1User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Hands.Hand3.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table0.Hands.Hand3.Target == true){
                        SetActiveSetBetButt($('#STable1User4CheckBackground'));
                       CountBetStatistic++;
                        }
                        else
                           SetNoActiveButt($('#STable1User4CheckBackground'));
                       if(Message.StatisticCurrentUser.Table0.Hands.Hand3.Wins == true){
                            $("#SCartsUser14").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable1.length>0?winsTable1 += ",14":winsTable1 += "14";
                        }
                        else
                            $('#SCartsUser14').css("border","0");
                        $('#STable1User4CheckBackground').html(Message.StatisticCurrentUser.Table0.Hands.Hand3.Factor);
                        $('#STable1User4Progress').css('bottom' , Message.StatisticCurrentUser.Table0.Hands.Hand3.Indicator + '%');
                        $('#STable2User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand0.FirstCard+'.png)');
                        $('#STable2User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand0.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table1.Hands.Hand0.Target == true){
                            SetActiveSetBetButt($('#STable2User1CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable2User1CheckBackground'));
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand0.Wins == true){
                            $("#SCartsUser21").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable2.length>0?winsTable2 += ",21":winsTable2 += "21";
                        }
                        else
                            $('#SCartsUser21').css("border","0");
                        $('#STable2User1CheckBackground').html(Message.StatisticCurrentUser.Table1.Hands.Hand0.Factor);
                        $('#STable2User1Progress').css('bottom' , Message.StatisticCurrentUser.Table1.Hands.Hand0.Indicator + '%');
                        $('#STable2User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand1.FirstCard+'.png)');
                        $('#STable2User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand1.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table1.Hands.Hand1.Target == true){
                            SetActiveSetBetButt($('#STable2User2CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable2User2CheckBackground'));
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand1.Wins == true){
                            $("#SCartsUser22").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable2.length>0?winsTable2 += ",22":winsTable2 += "22";
                        }
                        else
                            $('#SCartsUser22').css("border","0");
                        $('#STable2User2CheckBackground').html(Message.StatisticCurrentUser.Table1.Hands.Hand1.Factor);
                        $('#STable2User2Progress').css('bottom' , Message.StatisticCurrentUser.Table1.Hands.Hand1.Indicator + '%');
                        $('#STable2User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand2.FirstCard+'.png)');
                        $('#STable2User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand2.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table1.Hands.Hand2.Target == true){
                            SetActiveSetBetButt($('#STable2User3CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable2User3CheckBackground'));
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand2.Wins == true){
                            $("#SCartsUser23").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable2.length>0?winsTable2 += ",23":winsTable2 += "23";
                        }
                        else
                            $('#SCartsUser23').css("border","0");
                        $('#STable2User3CheckBackground').html(Message.StatisticCurrentUser.Table1.Hands.Hand2.Factor);
                        $('#STable2User3Progress').css('bottom' , Message.StatisticCurrentUser.Table1.Hands.Hand2.Indicator + '%');
                        $('#STable2User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand3.FirstCard+'.png)');
                        $('#STable2User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand3.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table1.Hands.Hand3.Target == true){
                            SetActiveSetBetButt($('#STable2User4CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable2User4CheckBackground'));
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand3.Wins == true){
                            $("#SCartsUser24").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable2.length>0?winsTable2 += ",24":winsTable2 += "24";
                        }
                        else
                            $('#SCartsUser24').css("border","0");
                        $('#STable2User4CheckBackground').html(Message.StatisticCurrentUser.Table1.Hands.Hand3.Factor);
                        $('#STable2User4Progress').css('bottom' , Message.StatisticCurrentUser.Table1.Hands.Hand3.Indicator + '%');
                        $('#STable2User5Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand4.FirstCard+'.png)');
                        $('#STable2User5Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand4.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table1.Hands.Hand4.Target == true){
                            SetActiveSetBetButt($('#STable2User5CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable2User5CheckBackground'));
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand4.Wins == true){
                            $("#SCartsUser25").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable2.length>0?winsTable2 += ",25":winsTable2 += "25";
                        }
                        else
                            $('#SCartsUser25').css("border","0");
                        $('#STable2User5CheckBackground').html(Message.StatisticCurrentUser.Table1.Hands.Hand4.Factor);
                        $('#STable2User5Progress').css('bottom' , Message.StatisticCurrentUser.Table1.Hands.Hand4.Indicator + '%');
                        $('#STable2User6Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand5.FirstCard+'.png)');
                        $('#STable2User6Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Hands.Hand5.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table1.Hands.Hand5.Target == true){
                            SetActiveSetBetButt($('#STable2User6CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable2User6CheckBackground'));
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand5.Wins == true){
                            $("#SCartsUser26").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable2.length>0?winsTable2 += ",26":winsTable2 += "26";
                        }
                        else
                            $('#SCartsUser26').css("border","0");
                        $('#STable2User6CheckBackground').html(Message.StatisticCurrentUser.Table1.Hands.Hand5.Factor);
                        $('#STable2User6Progress').css('bottom' , Message.StatisticCurrentUser.Table1.Hands.Hand5.Indicator + '%');
                        $('#STable3User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand0.FirstCard+'.png)');
                        $('#STable3User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand0.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand0.Target == true){
                            SetActiveSetBetButt($('#STable3User1CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User1CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand0.Wins == true){
                            $("#SCartsUser31").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable3.length>0?winsTable3 += ",31":winsTable3 += "31";
                        }
                        else
                            $('#SCartsUser31').css("border","0");
                        $('#STable3User1CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand0.Factor);
                        $('#STable3User1Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand0.Indicator + '%');
                        $('#STable3User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand1.FirstCard+'.png)');
                        $('#STable3User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand1.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand1.Target == true){
                            SetActiveSetBetButt($('#STable3User2CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User2CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand1.Wins == true){
                            $("#SCartsUser32").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable3.length>0?winsTable3 += ",32":winsTable3 += "32";
                        }
                        else
                            $('#SCartsUser32').css("border","0");
                        $('#STable3User2CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand1.Factor);
                        $('#STable3User2Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand1.Indicator + '%');
                        $('#STable3User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand2.FirstCard+'.png)');
                        $('#STable3User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand2.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand2.Target == true){
                            SetActiveSetBetButt($('#STable3User3CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User3CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand2.Wins == true){
                            $("#SCartsUser33").css("box-shadow","0px 0px 6px 5px whitesmoke");
                        winsTable3.length>0?winsTable3 += ",33":winsTable3 += "33";
                    }
                        else
                            $('#SCartsUser33').css("border","0");
                        $('#STable3User3CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand2.Factor);
                        $('#STable3User3Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand2.Indicator + '%');
                        $('#STable3User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand3.FirstCard+'.png)');
                        $('#STable3User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand3.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand3.Target == true){
                            SetActiveSetBetButt($('#STable3User4CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User4CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand3.Wins == true){
                            $("#SCartsUser34").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable3.length>0?winsTable3 += ",34":winsTable3 += "34";
                        }
                        else
                            $('#SCartsUser34').css("border","0");
                        $('#STable3User4CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand3.Factor);
                        $('#STable3User4Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand3.Indicator + '%');
                        $('#STable3User5Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand4.FirstCard+'.png)');
                        $('#STable3User5Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand4.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand4.Target == true){
                            SetActiveSetBetButt($('#STable3User5CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User5CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand4.Wins == true){
                            $("#SCartsUser35").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable3.length>0?winsTable3 += ",35":winsTable3 += "35";
                        }
                        else
                            $('#SCartsUser35').css("border","0");
                        $('#STable3User5CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand4.Factor);
                        $('#STable3User5Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand4.Indicator + '%');
                        $('#STable3User6Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand5.FirstCard+'.png)');
                        $('#STable3User6Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand5.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand5.Target == true){
                            SetActiveSetBetButt($('#STable3User6CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User6CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand5.Wins == true){
                            $("#SCartsUser36").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable3.length>0?winsTable3 += ",36":winsTable3 += "36";
                            }
                        else
                            $('#SCartsUser36').css("border","0");
                        $('#STable3User6CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand5.Factor);
                        $('#STable3User6Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand5.Indicator + '%');
                        $('#STable3User7Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand6.FirstCard+'.png)');
                        $('#STable3User7Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand6.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand6.Target == true){
                            SetActiveSetBetButt($('#STable3User7CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User7CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand6.Wins == true){
                            $("#SCartsUser37").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable3.length>0?winsTable3 += ",37":winsTable3 += "37";
                        }
                        else
                            $('#SCartsUser37').css("border","0");
                        $('#STable3User7CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand6.Factor);
                        $('#STable3User7Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand6.Indicator + '%');
                        $('#STable3User8Cart1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand7.FirstCard+'.png)');
                        $('#STable3User8Cart2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Hands.Hand7.SecondCard+'.png)');
                        if(Message.StatisticCurrentUser.Table2.Hands.Hand7.Target == true){
                            SetActiveSetBetButt($('#STable3User8CheckBackground'));
                           CountBetStatistic++;
                        }
                        else
                            SetNoActiveButt($('#STable3User8CheckBackground'));
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand7.Wins == true){
                            $("#SCartsUser38").css("box-shadow","0px 0px 6px 5px whitesmoke");
                            winsTable3.length>0?winsTable3 += ",38":winsTable3 += "38";
                        }
                        else
                            $('#SCartsUser38').css("border","0");
                        $('#STable3User8CheckBackground').html(Message.StatisticCurrentUser.Table2.Hands.Hand7.Factor);
                        $('#STable3User8Progress').css('bottom' , Message.StatisticCurrentUser.Table2.Hands.Hand7.Indicator + '%');
                       
                        $('#SBetInfoBetSumRequest').html(Message.StatisticCurrentUser.BetInfo.Value);
                        $('#SBetInfoBet').html(Message.StatisticCurrentUser.BetInfo.Value);
                        if(Message.StatisticCurrentUser.BetInfo.Express == true)
                            $('#SBetInfoBetType').html("Экспресс");
                    else
                        $('#SBetInfoBetType').html(CountBetStatistic+" Ординар");
                        $('#SBetInfoBetSumResponse').html(Message.StatisticCurrentUser.BetInfo.WinSize.toFixed(2));
                        if(Message.StatisticCurrentUser.BetInfo.WinSize == 0)    
                            $('#SBetInfoStatus').html("Проиграно");
                        else    
                            $('#SBetInfoStatus').html("Выиграно");
                        $('#SBetInfoDateBet').html(Message.StatisticCurrentUser.date);
                         $('#SBetInfoStageBet').html(Message.StatisticCurrentUser.BetInfo.Stage);
                        $('#StatisticRaund').html(Message.StatisticCurrentUser.round);
                        $('#StatisticForecastTable1').html(winsTable1);
                        $('#StatisticForecastTable2').html(winsTable2);
                        $('#StatisticForecastTable3').html(winsTable3);
                        $('#STable1Flop1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Board.Board[0]+'.png)');
                        $('#STable1Flop2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Board.Board[1]+'.png)');
                        $('#STable1Flop3').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Board.Board[2]+'.png)');
                        $('#STable2Flop1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Board.Board[0]+'.png)');
                        $('#STable2Flop2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Board.Board[1]+'.png)');
                        $('#STable2Flop3').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Board.Board[2]+'.png)');
                        $('#STable3Flop1').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Board.Board[0]+'.png)');
                        $('#STable3Flop2').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Board.Board[1]+'.png)');
                        $('#STable3Flop3').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Board.Board[2]+'.png)'); 
                    
                        $('#STable1Tern').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Board.Board[3]+'.png)');
                        $('#STable2Tern').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Board.Board[3]+'.png)');
                        $('#STable3Tern').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Board.Board[3]+'.png)');
                    
                        $('#STable1River').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table0.Board.Board[4]+'.png)');
                        $('#STable2River').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table1.Board.Board[4]+'.png)');
                        $('#STable3River').css('background-image' , 'url(/pic/cart/'+Message.StatisticCurrentUser.Table2.Board.Board[4]+'.png)');
                        if(Message.StatisticCurrentUser.Table0.Hands.Hand0.Factor == -1 )
                            $('#STable1User1Factor').hide();
                        else
                                $('#STable1User1Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table0.Hands.Hand1.Factor == -1)
                            $('#STable1User2Factor').hide();
                        else
                                $('#STable1User2Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table0.Hands.Hand2.Factor == -1)
                            $('#STable1User3Factor').hide();
                        else
                                $('#STable1User3Factor').show();
                                                   
                       if(Message.StatisticCurrentUser.Table0.Hands.Hand3.Factor == -1)
                            $('#STable1User4Factor').hide();
                        else
                                $('#STable1User4Factor').show();
                            
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand0.Factor == -1)
                            $('#STable2User1Factor').hide();
                        else
                                $('#STable2User1Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand1.Factor == -1)
                            $('#STable2User2Factor').hide();
                        else
                                $('#STable2User2Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand2.Factor == -1)
                            $('#STable2User3Factor').hide();
                        else
                                $('#STable2User3Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand3.Factor == -1)
                            $('#STable2User4Factor').hide();
                        else
                                $('#STable2User4Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand4.Factor == -1)
                            $('#STable2User5Factor').hide();
                        else
                                $('#STable2User5Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table1.Hands.Hand5.Factor == -1)
                            $('#STable2User6Factor').hide();
                        else
                                $('#STable2User6Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand0.Factor == -1)
                            $('#STable3User1Factor').hide();
                        else
                                $('#STable3User1Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand1.Factor == -1)
                            $('#STable3User2Factor').hide();
                        else
                                $('#STable3User2Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand2.Factor == -1)
                            $('#STable3User3Factor').hide();
                        else
                                $('#STable3User3Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand3.Factor == -1)
                            $('#STable3User4Factor').hide();
                        else
                                $('#STable3User4Factor').show();
                            
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand4.Factor == -1)
                            $('#STable3User5Factor').hide();
                        else
                                $('#STable3User5Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand5.Factor == -1)
                            $('#STable3User6Factor').hide();
                        else
                                $('#STable3User6Factor').show();
                            
                       
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand6.Factor == -1)
                            $('#STable3User7Factor').hide();
                        else
                                $('#STable3User7Factor').show();
                            
                       if(Message.StatisticCurrentUser.Table2.Hands.Hand7.Factor == -1)
                            $('#STable3User8Factor').hide();
                        else
                                $('#STable3User8Factor').show();
                            GetBetStatisticTimer = 0;
                       $("#modalWait").css("display","none");
                        $("#StatisticDialog").dialog({ modal: true,minHeight:500,minWidth:605});
                }else
                {
                    if($("#modalWait").css("display") != "none"){
                        GetBetStatisticTimer++;
                        if(GetBetStatisticTimer >= 10){
                            $("#modalWait").css("display","none");
                            alert("Сервер перегружен, повторите попытку");
                            GetBetStatisticTimer = 0;
         }}
                }
                var BalanceNew = Message.Balance;
                $("#MaxBet").html(BalanceNew);
                $("#BalanceUser").html(BalanceNew);
                if($("#ShowCurrentRaund").html() != Message.Round)
                    $("#ShowCurrentRaund").html(Message.Round);
                    
                    if(Message.Stage == 0)
                        $("#ShowNextStage").html("Префлоп");
                    if(Message.Stage == 1)
                        $("#ShowNextStage").html("Флоп");
                    if(Message.Stage == 2)        
                        $("#ShowNextStage").html("Терн");
                    if(Message.Stage == 3)
                        $("#ShowNextStage").html("Ривер");
                           
                    
                var StringBets = "";
                //if(Message.Bets != null)
                for (var i=0;i<Message.Bets[0].length;i++){
                    var hands;
                    if(Message.Bets[0][i].hands.length > 19)
                        hands = Message.Bets[0][i].hands.substr(0,19)+"...";
                    else
                        hands = Message.Bets[0][i].hands;
                    StringBets+=
                           "<div style='float: left' id='BetTableCollection'> "+
                           "<div style='float: left;width: 100%;height: 20px;font-size: 12px'>"+
                                 "<div onclick='GetBet("+i+");return false;' style='border:solid rgb(30, 45, 55) 1px;float: left;width: 130px;height:20px;text-align: center'><div style='margin-top:3px'>"+Message.Bets[0][i].date+"</div></div>"+
                                    "<div onclick='GetBet("+i+");return false;' style='border:solid rgb(30, 45, 55) 1px;float: left;width: 121px;height:20px;text-align: center'><div style='margin-top:3px'>"+hands+"</div></div>"+
                                    "<div onclick='GetBet("+i+");return false;' style='border:solid rgb(30, 45, 55) 1px;float: left;width: 60px;height:20px;text-align: center'><div style='margin-top:3px'>"+Message.Bets[0][i].sum_bet.toFixed(2)+"</div></div>"+
                                    "<div onclick='GetBet("+i+");return false;' style='border:solid rgb(30, 45, 55) 1px;float: left;width: 81px;height:20px;text-align: center'><div style='margin-top:3px'>"+Message.Bets[0][i].sum_win.toFixed(2)+"</div></div>"+
                                "</div>"
                    
                }
            StringBets+="</div>";
            document.getElementById("BetTableCollection").innerHTML = StringBets;
            StringBets = "";
                if(Message.Balance>4 && Message.Stage>=1 && Message.Stage<=3 && $("#CurrentStage").html() != Message.Stage){
                    for(var i = 1; i < 5; i++){
                        $("#Table1User"+i+"Check").attr("disabled",false);
                        SetActiveButt($("#Table1User"+i+"CheckBackground"));
                        $("#Table1User"+i+"Check").attr("checked", false);
                    }        
                    for(var i = 1; i < 7; i++){
                        SetActiveButt($("#Table2User"+i+"CheckBackground"));
                        $("#Table2User"+i+"Check").attr("disabled",false);
                        $("#Table2User"+i+"Check").attr("checked", false);
                    }
                    for(var i = 1; i < 9; i++){
                        SetActiveButt($("#Table3User"+i+"CheckBackground"));
                        $("#Table3User"+i+"Check").attr("disabled",false);
                        $("#Table3User"+i+"Check").attr("checked", false);
                    }
                    $("#SumBetUser").attr("disabled",false);
                    SetActiveButt($("#SumBetUser"));
                    $("#SumBetUp").attr("disabled",false);
                    SetActiveButt($("#SumBetUp"));
                    $("#SumBetDown").attr("disabled",false);
                    SetActiveButt($("#SumBetDown"));
                    $("#SendNewBet").attr("disabled",false);
                    SetActiveSetBetButt($("#SendNewBet"));
                    $("#Factor").html(0);
                }else if($("#CurrentStage").html() != Message.Stage)
                {
                    $("#Factor").html(0);
                    for(var i = 1; i < 5; i++){
                        $("#Table1User"+i+"Check").attr("disabled",true);
                         $("#Table1User"+i+"Check").attr("checked",false);
                        SetNoActiveButt($("#Table1User"+i+"CheckBackground"));
                    }        
                    for(var i = 1; i < 7; i++){
                        SetNoActiveButt($("#Table2User"+i+"CheckBackground"));
                        $("#Table2User"+i+"Check").attr("checked",false);
                        $("#Table2User"+i+"Check").attr("disabled",true);
                    }
                    for(var i = 1; i < 9; i++){
                        SetNoActiveButt($("#Table3User"+i+"CheckBackground"));
                        $("#Table3User"+i+"Check").attr("checked",false);
                        $("#Table3User"+i+"Check").attr("disabled",true);
                    }
                    $("#SumBetUser").attr("disabled",true);
                    SetNoActiveButt($("#SumBetUser"));
                    $("#SumBetUp").attr("disabled",true);
                    SetNoActiveButt($("#SumBetUp"));
                    $("#SumBetDown").attr("disabled",true);
                    SetNoActiveButt($("#SumBetDown"));
                    $("#SendNewBet").attr("disabled",true);
                    SetNoActiveButt($("#SendNewBet"));
                }
                if(Message.Timer != null){
                    var valueBaseProgress = Message.Timer * 100 / ((Message.Stage > 0) ? 30 : 5);
                    $("#progressbar").progressbar({value: valueBaseProgress}); 
                    $("#BaseProgressTime").html("00:"+((Message.Stage > 0 ? 30 : 5) - Message.Timer));
                    if(Message.Stage > 0 && Message.Timer>=28){
                        for(var i=1;i<5;i++){
                            SetNoActiveButt($("#Table1User"+i+"CheckBackground"));
                            $("#Table1User"+i+"Check").attr("disabled",true);
                    }
                
                for(var i=1;i<7;i++){
                    SetNoActiveButt($("#Table2User"+i+"CheckBackground"));
                    $("#Table2User"+i+"Check").attr("disabled",true);
                    }
                
                for(var i=1;i<9;i++){
                    SetNoActiveButt($("#Table3User"+i+"CheckBackground"));
                    $("#Table3User"+i+"Check").attr("disabled",true);
                }
                
                SetNoActiveButt($("#SendNewBet"));
                $("#SendNewBet").attr("disabled",true);
                      $("#Factor").html(0);      
                    }
                        
                }
            if(Message.Stage != 0 && Message.Stage != 5  && Message.Table0.User0 == null)
                return ;
            if(Message.Stage == 0){
                $("#CurrentStage").html(Message.Stage);
                
                for(var i=1;i<5;i++){
                    $('#Table1User'+i.toString()+'Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table1User'+i.toString()+'Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table1User'+i.toString()+'CheckBackground').html(0);
                    $('#Table1User'+i.toString()+'Progress').css('bottom' , 0 + '%');
                    }
                
                for(var i=1;i<7;i++){
                    $('#Table2User'+i.toString()+'Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table2User'+i.toString()+'Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table2User'+i.toString()+'CheckBackground').html(0);
                    $('#Table2User'+i.toString()+'Progress').css('bottom' , 0 + '%');
                    }
                
                for(var i=1;i<9;i++){
                    $('#Table3User'+i.toString()+'Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table3User'+i.toString()+'Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table3User'+i.toString()+'CheckBackground').html(0);
                    $('#Table3User'+i.toString()+'Progress').css('bottom' , 0 + '%');
                }
                $('#Table1Flop1').css('background-image' , 'url(/pic/flop.png)');
                $('#Table1Flop2').css('background-image' , 'url(/pic/flop.png)');
                $('#Table1Flop3').css('background-image' , 'url(/pic/flop.png)');
                $('#Table1Tern').css('background-image' , 'url(/pic/tern.png)');
                $('#Table1River').css('background-image' , 'url(/pic/river.png)');
                $('#Table2Flop1').css('background-image' , 'url(/pic/flop.png)');
                $('#Table2Flop2').css('background-image' , 'url(/pic/flop.png)');
                $('#Table2Flop3').css('background-image' , 'url(/pic/flop.png)');
                $('#Table2Tern').css('background-image' , 'url(/pic/tern.png)');
                $('#Table2River').css('background-image' , 'url(/pic/river.png)');
                $('#Table3Flop1').css('background-image' , 'url(/pic/flop.png)');
                $('#Table3Flop2').css('background-image' , 'url(/pic/flop.png)');
                $('#Table3Flop3').css('background-image' , 'url(/pic/flop.png)');
                $('#Table3Tern').css('background-image' , 'url(/pic/tern.png)');
                $('#Table3River').css('background-image' , 'url(/pic/river.png)');
                $("#Table1User1Cart1").css("box-shadow","");
                                        $("#Table1User1Cart2").css("box-shadow","");
                                        $("#Table1User2Cart1").css("box-shadow","");
                                        $("#Table1User2Cart2").css("box-shadow","");
                                        $("#Table1User3Cart1").css("box-shadow","");
                                        $("#Table1User3Cart2").css("box-shadow","");
                                        $("#Table1User4Cart1").css("box-shadow","");
                                        $("#Table1User4Cart2").css("box-shadow","");
                                        $("#Table2User1Cart1").css("box-shadow","");
                                        $("#Table2User1Cart2").css("box-shadow","");
                                        $("#Table2User2Cart1").css("box-shadow","");
                                        $("#Table2User2Cart2").css("box-shadow","");
                                        $("#Table2User3Cart1").css("box-shadow","");
                                        $("#Table2User3Cart2").css("box-shadow","");
                                        $("#Table2User4Cart1").css("box-shadow","");
                                        $("#Table2User4Cart2").css("box-shadow","");
                                        $("#Table2User5Cart1").css("box-shadow","");
                                        $("#Table2User5Cart2").css("box-shadow","");
                                        $("#Table2User6Cart1").css("box-shadow","");
                                        $("#Table2User6Cart2").css("box-shadow","");
                                        $("#Table3User1Cart1").css("box-shadow","");
                                        $("#Table3User1Cart2").css("box-shadow","");
                                        $("#Table3User2Cart1").css("box-shadow","");
                                        $("#Table3User2Cart2").css("box-shadow","");
                                        $("#Table3User3Cart1").css("box-shadow","");
                                        $("#Table3User3Cart2").css("box-shadow","");
                                        $("#Table3User4Cart1").css("box-shadow","");
                                        $("#Table3User4Cart2").css("box-shadow","");
                                        $("#Table3User5Cart1").css("box-shadow","");
                                        $("#Table3User5Cart2").css("box-shadow","");
                                        $("#Table3User6Cart1").css("box-shadow","");
                                        $("#Table3User6Cart2").css("box-shadow","");
                                        $("#Table3User7Cart1").css("box-shadow","");
                                        $("#Table3User7Cart2").css("box-shadow","");
                                        $("#Table3User8Cart1").css("box-shadow","");
                                        $("#Table3User8Cart2").css("box-shadow","");
                return;
            }
            
                if($("#CurrentStage").html() == -1){
                    $("#CurrentStage").html(Message.Stage);
                   
                    
                    if(Message.Stage >= 1 ){
                        $('#Table1User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User0[0]+'.png)');
                        $('#Table1User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User0[1]+'.png)');
                        $('#Table1User1CheckBackground').html(Message.Table0.User0[2]);
                        $('#Table1User1Progress').css('bottom' , Message.Table0.User0[3] + '%');
                        $('#Table1User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User1[0]+'.png)');
                        $('#Table1User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User1[1]+'.png)');
                        $('#Table1User2CheckBackground').html(Message.Table0.User1[2]);
                        $('#Table1User2Progress').css('bottom' , Message.Table0.User1[3] + '%');
                        $('#Table1User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User2[0]+'.png)');
                        $('#Table1User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User2[1]+'.png)');
                        $('#Table1User3CheckBackground').html(Message.Table0.User2[2]);
                        $('#Table1User3Progress').css('bottom' , Message.Table0.User2[3] + '%');
                        $('#Table1User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User3[0]+'.png)');
                        $('#Table1User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User3[1]+'.png)');
                        $('#Table1User4CheckBackground').html(Message.Table0.User3[2]);
                        $('#Table1User4Progress').css('bottom' , Message.Table0.User3[3] + '%');
                        $('#Table2User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User0[0]+'.png)');
                        $('#Table2User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User0[1]+'.png)');
                        $('#Table2User1CheckBackground').html(Message.Table1.User0[2]);
                        $('#Table2User1Progress').css('bottom' , Message.Table1.User0[3] + '%');
                        $('#Table2User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User1[0]+'.png)');
                        $('#Table2User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User1[1]+'.png)');
                        $('#Table2User2CheckBackground').html(Message.Table1.User1[2]);
                        $('#Table2User2Progress').css('bottom' , Message.Table1.User1[3] + '%');
                        $('#Table2User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User2[0]+'.png)');
                        $('#Table2User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User2[1]+'.png)');
                        $('#Table2User3CheckBackground').html(Message.Table1.User2[2]);
                        $('#Table2User3Progress').css('bottom' , Message.Table1.User2[3] + '%');
                        $('#Table2User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User3[0]+'.png)');
                        $('#Table2User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User3[1]+'.png)');
                        $('#Table2User4CheckBackground').html(Message.Table1.User3[2]);
                        $('#Table2User4Progress').css('bottom' , Message.Table1.User3[3] + '%');
                        $('#Table2User5Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User4[0]+'.png)');
                        $('#Table2User5Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User4[1]+'.png)');
                        $('#Table2User5CheckBackground').html(Message.Table1.User4[2]);
                        $('#Table2User5Progress').css('bottom' , Message.Table1.User4[3] + '%');
                        $('#Table2User6Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User5[0]+'.png)');
                        $('#Table2User6Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User5[1]+'.png)');
                        $('#Table2User6CheckBackground').html(Message.Table1.User5[2]);
                        $('#Table2User6Progress').css('bottom' , Message.Table1.User5[3] + '%');
                        $('#Table3User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User0[0]+'.png)');
                        $('#Table3User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User0[1]+'.png)');
                        $('#Table3User1CheckBackground').html(Message.Table2.User0[2]);
                        $('#Table3User1Progress').css('bottom' , Message.Table2.User0[3] + '%');
                        $('#Table3User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User1[0]+'.png)');
                        $('#Table3User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User1[1]+'.png)');
                        $('#Table3User2CheckBackground').html(Message.Table2.User1[2]);
                        $('#Table3User2Progress').css('bottom' , Message.Table2.User1[3] + '%');
                        $('#Table3User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User2[0]+'.png)');
                        $('#Table3User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User2[1]+'.png)');
                        $('#Table3User3CheckBackground').html(Message.Table2.User2[2]);
                        $('#Table3User3Progress').css('bottom' , Message.Table2.User2[3] + '%');
                        $('#Table3User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User3[0]+'.png)');
                        $('#Table3User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User3[1]+'.png)');
                        $('#Table3User4CheckBackground').html(Message.Table2.User3[2]);
                        $('#Table3User4Progress').css('bottom' , Message.Table2.User3[3] + '%');
                        $('#Table3User5Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User4[0]+'.png)');
                        $('#Table3User5Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User4[1]+'.png)');
                        $('#Table3User5CheckBackground').html(Message.Table2.User4[2]);
                        $('#Table3User5Progress').css('bottom' , Message.Table2.User4[3] + '%');
                        $('#Table3User6Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User5[0]+'.png)');
                        $('#Table3User6Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User5[1]+'.png)');
                        $('#Table3User6CheckBackground').html(Message.Table2.User5[2]);
                        $('#Table3User6Progress').css('bottom' , Message.Table2.User5[3] + '%');
                        $('#Table3User7Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User6[0]+'.png)');
                        $('#Table3User7Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User6[1]+'.png)');
                        $('#Table3User7CheckBackground').html(Message.Table2.User6[2]);
                        $('#Table3User7Progress').css('bottom' , Message.Table2.User6[3] + '%');
                        $('#Table3User8Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User7[0]+'.png)');
                        $('#Table3User8Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User7[1]+'.png)');
                        $('#Table3User8CheckBackground').html(Message.Table2.User7[2]);
                        $('#Table3User8Progress').css('bottom' , Message.Table2.User7[3] + '%');  
                        if(Message.Table0.User0[2] == -1 )
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[2] == 1 && Message.Balance>4){
                                $('#Table1User1Factor').show();
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                               $('#Table1User1Factor').show();
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[2] == -1)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[2] == 1 && Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[2] == -1)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[2] == 1 && Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[2] == -1)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[2] == 1 && Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       
                       
                       if(Message.Table1.User0[2] == -1)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[2] == 1 && Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[2] == -1)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[2] == 1 && Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[2] == -1)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[2] == 1 && Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[2] == -1)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[2] == 1 && Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[2] == -1)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[2] == 1 && Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[2] == -1)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[2] == 1 && Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[2] == -1)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[2] == 1 && Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[2] == -1)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[2] == 1 && Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[2] == -1)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[2] == 1 && Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[2] == -1)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[2] == 1 && Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[2] == -1)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[2] == 1 && Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[2] == -1)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[2] == 1 && Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[2] == -1)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[2] == 1 && Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[2] == -1)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[2] == 1 && Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",false);
                           }
                    }
                    
                    if(Message.Stage >= 2){
                        $('#Table1Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[0]+'.png)');
                        $('#Table1Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[1]+'.png)');
                        $('#Table1Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[2]+'.png)');
                        $('#Table2Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[0]+'.png)');
                        $('#Table2Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[1]+'.png)');
                        $('#Table2Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[2]+'.png)');
                        $('#Table3Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[0]+'.png)');
                        $('#Table3Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[1]+'.png)');
                        $('#Table3Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[2]+'.png)'); 
                    }
                    
                    if(Message.Stage >= 3){
                        $('#Table1Tern').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[3]+'.png)');
                        $('#Table2Tern').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[3]+'.png)');
                        $('#Table3Tern').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[3]+'.png)');
                      
                    }
            
                    if(Message.Stage >= 4){
                        $('#Table1River').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[4]+'.png)');
                        $('#Table2River').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[4]+'.png)');
                        $('#Table3River').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[4]+'.png)');
                    }
                    if(Message.Stage == 5)
                        for(var i=0;i<Message.Shutdown.length;i++){
                        switch (Message.Shutdown[i]){
                                    case 11:
                                        $("#Table1User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 12:
                                        $("#Table1User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 13:
                                        $("#Table1User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 14:
                                        $("#Table1User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 21:
                                        $("#Table2User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 22:
                                        $("#Table2User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 23:
                                        $("#Table2User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 24:
                                        $("#Table2User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 25:
                                        $("#Table2User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 26:
                                        $("#Table2User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 31:
                                        $("#Table3User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 32:
                                        $("#Table3User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 33:
                                        $("#Table3User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 34:
                                        $("#Table3User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 35:
                                        $("#Table3User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 36:
                                        $("#Table3User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 37:
                                        $("#Table3User7Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User7Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 38:
                                        $("#Table3User8Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User8Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                    
                                }
                            }
                    
                    return ;
                }
                
                if($("#CurrentStage").html() == 0){
                    $("#CurrentStage").html(Message.Stage);
                   
                    if(Message.Stage >= 1){
                        $('#Table1User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User0[0]+'.png)');
                        $('#Table1User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User0[1]+'.png)');
                        $('#Table1User1CheckBackground').html(Message.Table0.User0[2]);
                        $('#Table1User1Progress').css('bottom' , Message.Table0.User0[3] + '%');
                        $('#Table1User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User1[0]+'.png)');
                        $('#Table1User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User1[1]+'.png)');
                        $('#Table1User2CheckBackground').html(Message.Table0.User1[2]);
                        $('#Table1User2Progress').css('bottom' , Message.Table0.User1[3] + '%');
                        $('#Table1User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User2[0]+'.png)');
                        $('#Table1User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User2[1]+'.png)');
                        $('#Table1User3CheckBackground').html(Message.Table0.User2[2]);
                        $('#Table1User3Progress').css('bottom' , Message.Table0.User2[3] + '%');
                        $('#Table1User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table0.User3[0]+'.png)');
                        $('#Table1User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table0.User3[1]+'.png)');
                        $('#Table1User4CheckBackground').html(Message.Table0.User3[2]);
                        $('#Table1User4Progress').css('bottom' , Message.Table0.User3[3] + '%');
                        $('#Table2User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User0[0]+'.png)');
                        $('#Table2User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User0[1]+'.png)');
                        $('#Table2User1CheckBackground').html(Message.Table1.User0[2]);
                        $('#Table2User1Progress').css('bottom' , Message.Table1.User0[3] + '%');
                        $('#Table2User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User1[0]+'.png)');
                        $('#Table2User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User1[1]+'.png)');
                        $('#Table2User2CheckBackground').html(Message.Table1.User1[2]);
                        $('#Table2User2Progress').css('bottom' , Message.Table1.User1[3] + '%');
                        $('#Table2User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User2[0]+'.png)');
                        $('#Table2User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User2[1]+'.png)');
                        $('#Table2User3CheckBackground').html(Message.Table1.User2[2]);
                        $('#Table2User3Progress').css('bottom' , Message.Table1.User2[3] + '%');
                        $('#Table2User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User3[0]+'.png)');
                        $('#Table2User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User3[1]+'.png)');
                        $('#Table2User4CheckBackground').html(Message.Table1.User3[2]);
                        $('#Table2User4Progress').css('bottom' , Message.Table1.User3[3] + '%');
                        $('#Table2User5Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User4[0]+'.png)');
                        $('#Table2User5Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User4[1]+'.png)');
                        $('#Table2User5CheckBackground').html(Message.Table1.User4[2]);
                        $('#Table2User5Progress').css('bottom' , Message.Table1.User4[3] + '%');
                        $('#Table2User6Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table1.User5[0]+'.png)');
                        $('#Table2User6Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table1.User5[1]+'.png)');
                        $('#Table2User6CheckBackground').html(Message.Table1.User5[2]);
                        $('#Table2User6Progress').css('bottom' , Message.Table1.User5[3] + '%');
                        $('#Table3User1Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User0[0]+'.png)');
                        $('#Table3User1Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User0[1]+'.png)');
                        $('#Table3User1CheckBackground').html(Message.Table2.User0[2]);
                        $('#Table3User1Progress').css('bottom' , Message.Table2.User0[3] + '%');
                        $('#Table3User2Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User1[0]+'.png)');
                        $('#Table3User2Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User1[1]+'.png)');
                        $('#Table3User2CheckBackground').html(Message.Table2.User1[2]);
                        $('#Table3User2Progress').css('bottom' , Message.Table2.User1[3] + '%');
                        $('#Table3User3Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User2[0]+'.png)');
                        $('#Table3User3Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User2[1]+'.png)');
                        $('#Table3User3CheckBackground').html(Message.Table2.User2[2]);
                        $('#Table3User3Progress').css('bottom' , Message.Table2.User2[3] + '%');
                        $('#Table3User4Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User3[0]+'.png)');
                        $('#Table3User4Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User3[1]+'.png)');
                        $('#Table3User4CheckBackground').html(Message.Table2.User3[2]);
                        $('#Table3User4Progress').css('bottom' , Message.Table2.User3[3] + '%');
                        $('#Table3User5Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User4[0]+'.png)');
                        $('#Table3User5Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User4[1]+'.png)');
                        $('#Table3User5CheckBackground').html(Message.Table2.User4[2]);
                        $('#Table3User5Progress').css('bottom' , Message.Table2.User4[3] + '%');
                        $('#Table3User6Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User5[0]+'.png)');
                        $('#Table3User6Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User5[1]+'.png)');
                        $('#Table3User6CheckBackground').html(Message.Table2.User5[2]);
                        $('#Table3User6Progress').css('bottom' , Message.Table2.User5[3] + '%');
                        $('#Table3User7Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User6[0]+'.png)');
                        $('#Table3User7Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User6[1]+'.png)');
                        $('#Table3User7CheckBackground').html(Message.Table2.User6[2]);
                        $('#Table3User7Progress').css('bottom' , Message.Table2.User6[3] + '%');
                        $('#Table3User8Cart1').css('background-image' , 'url(/pic/cart/'+Message.Table2.User7[0]+'.png)');
                        $('#Table3User8Cart2').css('background-image' , 'url(/pic/cart/'+Message.Table2.User7[1]+'.png)');
                        $('#Table3User8CheckBackground').html(Message.Table2.User7[2]);
                        $('#Table3User8Progress').css('bottom' , Message.Table2.User7[3] + '%');
                        if (Message.Table0.User0[2] == -1)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[2] == 1 && Message.Balance>4){
                                $('#Table1User1Factor').show();
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                               $('#Table1User1Factor').show();
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[2] == -1)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[2] == 1 && Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[2] == -1)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[2] == 1 && Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[2] == -1 )
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[2] == 1 && Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       
                       
                       if(Message.Table1.User0[2] == -1)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[2] == 1 && Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[2] == -1)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[2] == 1 && Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[2] == -1)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[2] == 1 && Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[2] == -1)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[2] == 1 && Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[2] == -1)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[2] == 1 && Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[2] == -1)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[2] == 1 && Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[2] == -1)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[2] == 1 && Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[2] == -1)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[2] == 1 && Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[2] == -1)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[2] == 1 && Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[2] == -1)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[2] == 1 && Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[2] == -1)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[2] == 1 && Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[2] == -1)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[2] == 1 && Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[2] == -1)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[2] == 1 && Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[2] == -1)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[2] == 1 && Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",false);
                           }
                    }
                    
                    if(Message.Stage >= 2){
                        $('#Table1Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[0]+'.png)');
                        $('#Table1Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[1]+'.png)');
                        $('#Table1Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[2]+'.png)');
                        $('#Table2Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[0]+'.png)');
                        $('#Table2Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[1]+'.png)');
                        $('#Table2Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[2]+'.png)');
                        $('#Table3Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[0]+'.png)');
                        $('#Table3Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[1]+'.png)');
                        $('#Table3Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[2]+'.png)'); 
                        
                    }
                    
                    if(Message.Stage >= 3){
                        $('#Table1Tern').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[3]+'.png)');
                        $('#Table2Tern').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[3]+'.png)');
                        $('#Table3Tern').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[3]+'.png)');
                        
                        }
                    
                    if(Message.Stage >= 4){
                        $('#Table1River').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[4]+'.png)');
                        $('#Table2River').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[4]+'.png)');
                        $('#Table3River').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[4]+'.png)');
                        
                    }
                    if(Message.Stage == 5)
                         for(var i=0;i<Message.Shutdown.length;i++){
                                switch (Message.Shutdown[i]){
                                    case 11:
                                        $("#Table1User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 12:
                                        $("#Table1User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 13:
                                        $("#Table1User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 14:
                                        $("#Table1User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 21:
                                        $("#Table2User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 22:
                                        $("#Table2User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 23:
                                        $("#Table2User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 24:
                                        $("#Table2User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 25:
                                        $("#Table2User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 26:
                                        $("#Table2User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 31:
                                        $("#Table3User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 32:
                                        $("#Table3User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 33:
                                        $("#Table3User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 34:
                                        $("#Table3User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 35:
                                        $("#Table3User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 36:
                                        $("#Table3User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 37:
                                        $("#Table3User7Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User7Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 38:
                                        $("#Table3User8Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User8Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                    
                                }
                               }
                    
                    return;
                }
                if($("#CurrentStage").html() == 1){
                    $("#CurrentStage").html(Message.Stage);
                  
                    if(Message.Stage >= 2){
                        $('#Table1User1CheckBackground').html(Message.Table0.User0[0]);
                        $('#Table1User1Progress').css('bottom' , Message.Table0.User0[1] + '%');
                        $('#Table1User2CheckBackground').html(Message.Table0.User1[0]);
                        $('#Table1User2Progress').css('bottom' , Message.Table0.User1[1] + '%');
                        $('#Table1User3CheckBackground').html(Message.Table0.User2[0]);
                        $('#Table1User3Progress').css('bottom' , Message.Table0.User2[1] + '%');
                        $('#Table1User4CheckBackground').html(Message.Table0.User3[0]);
                        $('#Table1User4Progress').css('bottom' , Message.Table0.User3[1] + '%');
                        $('#Table2User1CheckBackground').html(Message.Table1.User0[0]);
                        $('#Table2User1Progress').css('bottom' , Message.Table1.User0[1] + '%');
                        $('#Table2User2CheckBackground').html(Message.Table1.User1[0]);
                        $('#Table2User2Progress').css('bottom' , Message.Table1.User1[1] + '%');
                        $('#Table2User3CheckBackground').html(Message.Table1.User2[0]);
                        $('#Table2User3Progress').css('bottom' , Message.Table1.User2[1] + '%');
                        $('#Table2User4CheckBackground').html(Message.Table1.User3[0]);
                        $('#Table2User4Progress').css('bottom' , Message.Table1.User3[1] + '%');
                        $('#Table2User5CheckBackground').html(Message.Table1.User4[0]);
                        $('#Table2User5Progress').css('bottom' , Message.Table1.User4[1] + '%');
                        $('#Table2User6CheckBackground').html(Message.Table1.User5[0]);
                        $('#Table2User6Progress').css('bottom' , Message.Table1.User5[1] + '%');
                        $('#Table3User1CheckBackground').html(Message.Table2.User0[0]);
                        $('#Table3User1Progress').css('bottom' , Message.Table2.User0[1] + '%');
                        $('#Table3User2CheckBackground').html(Message.Table2.User1[0]);
                        $('#Table3User2Progress').css('bottom' , Message.Table2.User1[1] + '%');
                        $('#Table3User3CheckBackground').html(Message.Table2.User2[0]);
                        $('#Table3User3Progress').css('bottom' , Message.Table2.User2[1] + '%');
                        $('#Table3User4CheckBackground').html(Message.Table2.User3[0]);
                        $('#Table3User4Progress').css('bottom' , Message.Table2.User3[1] + '%');
                        $('#Table3User5CheckBackground').html(Message.Table2.User4[0]);
                        $('#Table3User5Progress').css('bottom' , Message.Table2.User4[1] + '%');
                        $('#Table3User6CheckBackground').html(Message.Table2.User5[0]);
                        $('#Table3User6Progress').css('bottom' , Message.Table2.User5[1] + '%');
                        $('#Table3User7CheckBackground').html(Message.Table2.User6[0]);
                        $('#Table3User7Progress').css('bottom' , Message.Table2.User6[1] + '%');
                        $('#Table3User8CheckBackground').html(Message.Table2.User7[0]);
                        $('#Table3User8Progress').css('bottom' , Message.Table2.User7[1] + '%');
                        $('#Table1Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[0]+'.png)');
                        $('#Table1Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[1]+'.png)');
                        $('#Table1Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[2]+'.png)');
                        $('#Table2Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[0]+'.png)');
                        $('#Table2Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[1]+'.png)');
                        $('#Table2Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[2]+'.png)');
                        $('#Table3Flop1').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[0]+'.png)');
                        $('#Table3Flop2').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[1]+'.png)');
                        $('#Table3Flop3').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[2]+'.png)'); 
                        if(Message.Table0.User0[0] == -1)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[0] == 1 && Message.Balance>4){
                                $('#Table1User1Factor').show();
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                               $('#Table1User1Factor').show();
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[0] == -1)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[0] == 1 && Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[0] == -1 )
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[0] == 1 && Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[0] == -1)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[0] == 1 && Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[0] == -1)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[0] == 1 && Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[0] == -1)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[0] == 1 && Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[0] == -1)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[0] == 1 && Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[0] == -1)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[0] == 1 && Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[0] == -1)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[0] == 1 && Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[0] == -1)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[0] == 1 && Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[0] == -1)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[0] == 1 && Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[0] == -1)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[0] == 1 && Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[0] == -1)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[0] == 1 && Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[0] == -1)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[0] == 1 && Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[0] == -1)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[0] == 1 && Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[0] == -1)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[0] == 1 && Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[0] == -1)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[0] == 1 && Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",false);
                           }
                        
                    }
                    
                    if(Message.Stage >= 3){
                        $('#Table1Tern').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[3]+'.png)');
                        $('#Table2Tern').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[3]+'.png)');
                        $('#Table3Tern').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[3]+'.png)');
                        }
                    
                    if(Message.Stage == 4){
                        $('#Table1River').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[4]+'.png)');
                        $('#Table2River').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[4]+'.png)');
                        $('#Table3River').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[4]+'.png)');
                        
                    }
                   if(Message.Stage == 5)
                         for(var i=0;i<Message.Shutdown.length;i++){
                            switch (Message.Shutdown[i]){
                                    case 11:
                                        $("#Table1User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 12:
                                        $("#Table1User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 13:
                                        $("#Table1User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 14:
                                        $("#Table1User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 21:
                                        $("#Table2User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 22:
                                        $("#Table2User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 23:
                                        $("#Table2User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 24:
                                        $("#Table2User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 25:
                                        $("#Table2User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 26:
                                        $("#Table2User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 31:
                                        $("#Table3User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 32:
                                        $("#Table3User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 33:
                                        $("#Table3User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 34:
                                        $("#Table3User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 35:
                                        $("#Table3User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 36:
                                        $("#Table3User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 37:
                                        $("#Table3User7Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User7Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 38:
                                        $("#Table3User8Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User8Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                    
                                }
                            }
                    return ;
                }
                
                if($("#CurrentStage").html() == 2){
                    $("#CurrentStage").html(Message.Stage);
                   
                    
                    if(Message.Stage >= 3){
                        $('#Table1User1CheckBackground').html(Message.Table0.User0[0]);
                        $('#Table1User1Progress').css('bottom' , Message.Table0.User0[1] + '%');
                        $('#Table1User2CheckBackground').html(Message.Table0.User1[0]);
                        $('#Table1User2Progress').css('bottom' , Message.Table0.User1[1] + '%');
                        $('#Table1User3CheckBackground').html(Message.Table0.User2[0]);
                        $('#Table1User3Progress').css('bottom' , Message.Table0.User2[1] + '%');
                        $('#Table1User4CheckBackground').html(Message.Table0.User3[0]);
                        $('#Table1User4Progress').css('bottom' , Message.Table0.User3[1] + '%');
                        $('#Table2User1CheckBackground').html(Message.Table1.User0[0]);
                        $('#Table2User1Progress').css('bottom' , Message.Table1.User0[1] + '%');
                        $('#Table2User2CheckBackground').html(Message.Table1.User1[0]);
                        $('#Table2User2Progress').css('bottom' , Message.Table1.User1[1] + '%');
                        $('#Table2User3CheckBackground').html(Message.Table1.User2[0]);
                        $('#Table2User3Progress').css('bottom' , Message.Table1.User2[1] + '%');
                        $('#Table2User4CheckBackground').html(Message.Table1.User3[0]);
                        $('#Table2User4Progress').css('bottom' , Message.Table1.User3[1] + '%');
                        $('#Table2User5CheckBackground').html(Message.Table1.User4[0]);
                        $('#Table2User5Progress').css('bottom' , Message.Table1.User4[1] + '%');
                        $('#Table2User6CheckBackground').html(Message.Table1.User5[0]);
                        $('#Table2User6Progress').css('bottom' , Message.Table1.User5[1] + '%');
                        $('#Table3User1CheckBackground').html(Message.Table2.User0[0]);
                        $('#Table3User1Progress').css('bottom' , Message.Table2.User0[1] + '%');
                        $('#Table3User2CheckBackground').html(Message.Table2.User1[0]);
                        $('#Table3User2Progress').css('bottom' , Message.Table2.User1[1] + '%');
                        $('#Table3User3CheckBackground').html(Message.Table2.User2[0]);
                        $('#Table3User3Progress').css('bottom' , Message.Table2.User2[1] + '%');
                        $('#Table3User4CheckBackground').html(Message.Table2.User3[0]);
                        $('#Table3User4Progress').css('bottom' , Message.Table2.User3[1] + '%');
                        $('#Table3User5CheckBackground').html(Message.Table2.User4[0]);
                        $('#Table3User5Progress').css('bottom' , Message.Table2.User4[1] + '%');
                        $('#Table3User6CheckBackground').html(Message.Table2.User5[0]);
                        $('#Table3User6Progress').css('bottom' , Message.Table2.User5[1] + '%');
                        $('#Table3User7CheckBackground').html(Message.Table2.User6[0]);
                        $('#Table3User7Progress').css('bottom' , Message.Table2.User6[1] + '%');
                        $('#Table3User8CheckBackground').html(Message.Table2.User7[0]);
                        $('#Table3User8Progress').css('bottom' , Message.Table2.User7[1] + '%');
                        $('#Table1Tern').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[0]+'.png)');
                        $('#Table2Tern').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[0]+'.png)');
                        $('#Table3Tern').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[0]+'.png)');
                        if(Message.Table0.User0[0] == -1)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[0] == 1 && Message.Balance>4){
                                $('#Table1User1Factor').show();
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                               $('#Table1User1Factor').show();
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[0] == -1)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[0] == 1 && Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[0] == -1)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[0] == 1 && Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[0] == -1)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[0] == 1 && Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[0] == -1)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[0] == 1 && Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[0] == -1)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[0] == 1 && Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[0] == -1)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[0] == 1 && Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[0] == -1)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[0] == 1 && Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[0] == -1)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[0] == 1 && Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[0] == -1)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[0] == 1 && Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[0] == -1)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[0] == 1 && Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[0] == -1)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[0] == 1 && Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[0] == -1)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[0] == 1 && Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[0] == -1)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[0] == 1 && Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[0] == -1)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[0] == 1 && Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[0] == -1)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[0] == 1 && Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[0] == -1)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[0] == 1 && Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",false);
                           }
                    }
                    
                    if(Message.Stage >= 4){
                        $('#Table1River').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[1]+'.png)');
                        $('#Table2River').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[1]+'.png)');
                        $('#Table3River').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[1]+'.png)');
                        
                    }
                    if(Message.Stage == 5)
                         for(var i=0;i<Message.Shutdown.length;i++){
                          switch (Message.Shutdown[i]){
                                    case 11:
                                        $("#Table1User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 12:
                                        $("#Table1User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 13:
                                        $("#Table1User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 14:
                                        $("#Table1User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 21:
                                        $("#Table2User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 22:
                                        $("#Table2User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 23:
                                        $("#Table2User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 24:
                                        $("#Table2User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 25:
                                        $("#Table2User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 26:
                                        $("#Table2User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 31:
                                        $("#Table3User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 32:
                                        $("#Table3User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 33:
                                        $("#Table3User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 34:
                                        $("#Table3User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 35:
                                        $("#Table3User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 36:
                                        $("#Table3User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 37:
                                        $("#Table3User7Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User7Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 38:
                                        $("#Table3User8Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User8Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                    
                                }
                            }
                    
                    return ;
                }
                
                if($("#CurrentStage").html() == 3){
                    $("#CurrentStage").html(Message.Stage);
                  
                    if(Message.Stage >= 4){
                        $('#Table1User1CheckBackground').html(Message.Table0.User0[0]);
                        $('#Table1User1Progress').css('bottom' , Message.Table0.User0[1] + '%');
                        $('#Table1User2CheckBackground').html(Message.Table0.User1[0]);
                        $('#Table1User2Progress').css('bottom' , Message.Table0.User1[1] + '%');
                        $('#Table1User3CheckBackground').html(Message.Table0.User2[0]);
                        $('#Table1User3Progress').css('bottom' , Message.Table0.User2[1] + '%');
                        $('#Table1User4CheckBackground').html(Message.Table0.User3[0]);
                        $('#Table1User4Progress').css('bottom' , Message.Table0.User3[1] + '%');
                        $('#Table2User1CheckBackground').html(Message.Table1.User0[0]);
                        $('#Table2User1Progress').css('bottom' , Message.Table1.User0[1] + '%');
                        $('#Table2User2CheckBackground').html(Message.Table1.User1[0]);
                        $('#Table2User2Progress').css('bottom' , Message.Table1.User1[1] + '%');
                        $('#Table2User3CheckBackground').html(Message.Table1.User2[0]);
                        $('#Table2User3Progress').css('bottom' , Message.Table1.User2[1] + '%');
                        $('#Table2User4CheckBackground').html(Message.Table1.User3[0]);
                        $('#Table2User4Progress').css('bottom' , Message.Table1.User3[1] + '%');
                        $('#Table2User5CheckBackground').html(Message.Table1.User4[0]);
                        $('#Table2User5Progress').css('bottom' , Message.Table1.User4[1] + '%');
                        $('#Table2User6CheckBackground').html(Message.Table1.User5[0]);
                        $('#Table2User6Progress').css('bottom' , Message.Table1.User5[1] + '%');
                        $('#Table3User1CheckBackground').html(Message.Table2.User0[0]);
                        $('#Table3User1Progress').css('bottom' , Message.Table2.User0[1] + '%');
                        $('#Table3User2CheckBackground').html(Message.Table2.User1[0]);
                        $('#Table3User2Progress').css('bottom' , Message.Table2.User1[1] + '%');
                        $('#Table3User3CheckBackground').html(Message.Table2.User2[0]);
                        $('#Table3User3Progress').css('bottom' , Message.Table2.User2[1] + '%');
                        $('#Table3User4CheckBackground').html(Message.Table2.User3[0]);
                        $('#Table3User4Progress').css('bottom' , Message.Table2.User3[1] + '%');
                        $('#Table3User5CheckBackground').html(Message.Table2.User4[0]);
                        $('#Table3User5Progress').css('bottom' , Message.Table2.User4[1] + '%');
                        $('#Table3User6CheckBackground').html(Message.Table2.User5[0]);
                        $('#Table3User6Progress').css('bottom' , Message.Table2.User5[1] + '%');
                        $('#Table3User7CheckBackground').html(Message.Table2.User6[0]);
                        $('#Table3User7Progress').css('bottom' , Message.Table2.User6[1] + '%');
                        $('#Table3User8CheckBackground').html(Message.Table2.User7[0]);
                        $('#Table3User8Progress').css('bottom' , Message.Table2.User7[1] + '%');
                        $('#Table1River').css('background-image' , 'url(/pic/cart/'+Message.Table0.Bord[0]+'.png)');
                        $('#Table2River').css('background-image' , 'url(/pic/cart/'+Message.Table1.Bord[0]+'.png)');
                        $('#Table3River').css('background-image' , 'url(/pic/cart/'+Message.Table2.Bord[0]+'.png)');
                        if(Message.Table0.User0[0] == -1)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[0] == 1 && Message.Balance>4){
                                $('#Table1User1Factor').show();
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                               $('#Table1User1Factor').show();
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1 )
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User2Factor').show();
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[0] == -1)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[0] == 1 && Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User3Factor').show();
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[0] == -1)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[0] == 1 && Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                $('#Table1User4Factor').show();
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[0] == -1)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[0] == 1 && Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User1Factor').show();
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[0] == -1)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[0] == 1 && Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User2Factor').show();
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[0] == -1)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[0] == 1 && Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User3Factor').show();
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[0] == -1)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[0] == 1 && Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User4Factor').show();
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[0] == -1)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[0] == 1 && Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User5Factor').show();
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[0] == -1)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[0] == 1 && Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table2User6Factor').show();
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[0] == -1)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[0] == 1 && Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User1Factor').show();
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[0] == -1)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[0] == 1 && Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User2Factor').show();
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[0] == -1)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[0] == 1 && Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User3Factor').show();
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[0] == -1)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[0] == 1 && Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User4Factor').show();
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[0] == -1)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[0] == 1 && Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User5Factor').show();
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[0] == -1)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[0] == 1 && Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User6Factor').show();
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[0] == -1)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[0] == 1 && Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User7Factor').show();
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table3User7Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[0] == -1)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[0] == 1 && Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                $('#Table3User8Factor').show();
                                SetActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",false);
                           }
                    }
                    if(Message.Stage == 5)
                         for(var i=0;i<Message.Shutdown.length;i++){
                        switch (Message.Shutdown[i]){
                                    case 11:
                                        $("#Table1User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 12:
                                        $("#Table1User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 13:
                                        $("#Table1User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 14:
                                        $("#Table1User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 21:
                                        $("#Table2User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 22:
                                        $("#Table2User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 23:
                                        $("#Table2User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 24:
                                        $("#Table2User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 25:
                                        $("#Table2User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 26:
                                        $("#Table2User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 31:
                                        $("#Table3User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 32:
                                        $("#Table3User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 33:
                                        $("#Table3User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 34:
                                        $("#Table3User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 35:
                                        $("#Table3User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 36:
                                        $("#Table3User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 37:
                                        $("#Table3User7Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User7Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 38:
                                        $("#Table3User8Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User8Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                    
                                }
                            }
                    
                    return ;
                }
                
                if($("#CurrentStage").html() == 4){
                    $("#CurrentStage").html("");
                    $("#CurrentStage").html(Message.Stage);
                    //    return ;
                if(Message.Stage == 5)
                        for(var i=0;i<Message.Shutdown.length;i++){
                     switch (Message.Shutdown[i]){
                                    case 11:
                                        $("#Table1User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 12:
                                        $("#Table1User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 13:
                                        $("#Table1User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 14:
                                        $("#Table1User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table1User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 21:
                                        $("#Table2User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 22:
                                        $("#Table2User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 23:
                                        $("#Table2User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 24:
                                        $("#Table2User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 25:
                                        $("#Table2User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 26:
                                        $("#Table2User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table2User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        
                                        case 31:
                                        $("#Table3User1Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User1Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 32:
                                        $("#Table3User2Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User2Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 33:
                                        $("#Table3User3Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User3Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 34:
                                        $("#Table3User4Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User4Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 35:
                                        $("#Table3User5Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User5Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 36:
                                        $("#Table3User6Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User6Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 37:
                                        $("#Table3User7Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User7Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                        case 38:
                                        $("#Table3User8Cart1").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        $("#Table3User8Cart2").css("box-shadow","0px 0px 12px 10px whitesmoke");
                                        break;
                                    
                                }
                            }
                }
                
                if(Message.Stage == 5){
                    $('#Table1User1Factor').hide();
                    $('#Table1User2Factor').hide();
                    $('#Table1User3Factor').hide();
                    $('#Table1User4Factor').hide();
                    
                    $('#Table2User1Factor').hide();
                    $('#Table2User2Factor').hide();
                    $('#Table2User3Factor').hide();
                    $('#Table2User4Factor').hide();
                    $('#Table2User5Factor').hide();
                    $('#Table2User6Factor').hide();
                    
                    $('#Table3User1Factor').hide();
                    $('#Table3User2Factor').hide();
                    $('#Table3User3Factor').hide();
                    $('#Table3User4Factor').hide();
                    $('#Table3User5Factor').hide();
                    $('#Table3User6Factor').hide();
                    $('#Table3User7Factor').hide();
                    $('#Table3User8Factor').hide();
                }
                
              
                
                
        }}
    }
}

function SaveNewBetCallback() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null)
            if(reqPrivate.responseText.length > 0){
                var Message = JSON.parse(reqPrivate.responseText);
              //  if(Message.Correct == 'true')
              //      alert("Ставка выполнена");
              //  else
              //      alert("Ставка не выполнена");
            }
    }
}
}