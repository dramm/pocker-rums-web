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
    var count = 0;
    for(var i = 1; i < 5; i++)
        if($("#Table1User"+i+"Check").attr("checked"))
           count++;
   for(var i = 1; i < 6; i++)
        if($("#Table2User"+i+"Check").attr("checked"))
           count++;
   for(var i = 1; i < 9; i++)
        if($("#Table3User"+i+"Check").attr("checked"))
           count++;
            var CurrentSum = parseFloat($("#SumBetUser").html());
            if(count != 0 && ((CurrentSum - 0.50)/count) >= 4)
                $("#SumBetUser").html(CurrentSum - 0.50);
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
    json.Table1 = [];
    json.Table2 = [];
    json.Table3 = [];
    var index = 0;
    for(var i = 1; i < 5; i++){
        $("#Table1User"+i+"Check").attr("disabled",true);
        SetNoActiveButt($("#Table1User"+i+"CheckBackground"));
        if($("#Table1User"+i+"Check").attr("checked"))    
           json.Table1[index++] = i-1;
    }        
    index = 0;
   for(var i = 1; i < 7; i++){
       SetNoActiveButt($("#Table2User"+i+"CheckBackground"));
        $("#Table2User"+i+"Check").attr("disabled",true);
        if($("#Table2User"+i+"Check").attr("checked"))
            json.Table2[index++] = i-1;
   }
   index = 0;
   for(var i = 1; i < 9; i++){
       SetNoActiveButt($("#Table3User"+i+"CheckBackground"));
       $("#Table3User"+i+"Check").attr("disabled",true);
        if($("#Table3User"+i+"Check").attr("checked"))
           json.Table3[index++] = i-1;
   }
   $("#SumBetUser").attr("disabled",true);
   SetNoActiveButt($("#SumBetUser"));
   $("#SumBetUp").attr("disabled",true);
   SetNoActiveButt($("#SumBetUp"));
   $("#SumBetDown").attr("disabled",true);
   SetNoActiveButt($("#SumBetDown"));
   $("#SendNewBet").attr("disabled",true);
   SetNoActiveButt($("#SendNewBet"));
   var url = "NewBet";
   reqPrivate = new XMLHttpRequest();
   reqPrivate.open("POST", url, true);
   reqPrivate.onreadystatechange = SaveNewBetCallback;
   reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   reqPrivate.send(JSON.stringify(json));
        }
            );
                
        $("#SumBetUser").click(
                function (){
            if($("#SumBetUser").attr("disabled"))
                return ;
           $("#Calculator").dialog({title:"Выберите ставку",closeText:"X", modal: true,maxHeight:500,maxWidth:150,minHeight:500,minWidth:150});
                }     
            );   


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
for(var i = 1; i < 5; i++)
    DisableCheck($("#Table1User"+i.toString()+"Check"+"Background"),$("#Table1User"+i.toString()+"Check"));

for(var i = 1; i < 7; i++)
    DisableCheck($("#Table2User"+i.toString()+"Check"+"Background"),$("#Table2User"+i.toString()+"Check"));

for(var i = 1; i < 9; i++)
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
     if(!input.attr("disabled"))
   	 if(!input.attr("checked")) {
             var exp = document.getElementById("ExpressCheck");
             if(exp.getAttribute("checked"))
                 DisableOtherBet(input);
		el.css("background","-moz-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-webkit-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-o-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-ms-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","linear-gradient(top, #d52711 0%, #d76255 100%)");
                input.attr("checked", true);
                SetBetHand(true);
	} else {
                el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
                el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");	
                //SetBetHand(false);
                input.attr("checked", false);
	}
     return true;
}

function SetNoActiveButt(el){
    el.css("background","-moz-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
    el.css("background","-webkit-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
    el.css("background","-o-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
    el.css("background","-ms-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
    el.css("background","linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
}

function SetActiveButt(el){
    el.css("background","-moz-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","-webkit-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","-o-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","-ms-linear-gradient(top, #49a6e8 0%, #4281a9 100%)");
    el.css("background","linear-gradient(top, #49a6e8 0%, #4281a9 100%)");	
}

function SetActiveSetBetButt(el){
   		el.css("background","-moz-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-webkit-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-o-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","-ms-linear-gradient(top, #d52711 0%, #d76255 100%)");
                el.css("background","linear-gradient(top, #d52711 0%, #d76255 100%)");
   
}

function TableUserChangeCheckStart(el,input){
var el = el,input = input;
      if(input.attr("checked")) {
          el.css("background","-moz-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
          el.css("background","-webkit-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
          el.css("background","-o-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
          el.css("background","-ms-linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");
          el.css("background","linear-gradient(top, #A9A9A9 0%, #C0C0C0 100%)");	
		
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
                //console.log(tr);
                $("#MaxBet").html(Message.Balance);
                
                if(Message.Balance>4 && Message.Stage>=1 && Message.Stage<=3 && $("#CurrentStage").html() != Message.Stage){
                    for(var i = 1; i < 5; i++){
                        $("#Table1User"+i+"Check").attr("disabled",false);
                        SetActiveButt($("#Table1User"+i+"CheckBackground"));
                    }        
                    for(var i = 1; i < 7; i++){
                        SetActiveButt($("#Table2User"+i+"CheckBackground"));
                        $("#Table2User"+i+"Check").attr("disabled",false);
                    }
                    for(var i = 1; i < 9; i++){
                        SetActiveButt($("#Table3User"+i+"CheckBackground"));
                        $("#Table3User"+i+"Check").attr("disabled",false);
                    }
                    $("#SumBetUser").attr("disabled",false);
                    SetActiveButt($("#SumBetUser"));
                    $("#SumBetUp").attr("disabled",false);
                    SetActiveButt($("#SumBetUp"));
                    $("#SumBetDown").attr("disabled",false);
                    SetActiveButt($("#SumBetDown"));
                    $("#SendNewBet").attr("disabled",false);
                    SetActiveSetBetButt($("#SendNewBet"));
                }else if($("#CurrentStage").html() != Message.Stage)
                {
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
                }
                if(Message.Timer != null){
                    var valueBaseProgress = Message.Timer * 100 / ((Message.Stage > 0) ? 42 : 5);
                    $("#progressbar").progressbar({value: valueBaseProgress}); 
                    $("#BaseProgressTime").html((Message.Stage > 0 ? 42 : 5) - Message.Timer);
                }
            if(Message.Stage != 0 && Message.Stage != 5  && Message.Table0.User0 == null)
                return ;
            if(Message.Stage == 0){
                $("#CurrentStage").html(Message.Stage);
                $("#ShowCurrentRaund").html(Message.Round);
                for(var i=1;i<5;i++){
                    $('#Table1User'+i.toString()+'Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table1User'+i.toString()+'Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table1User'+i.toString()+'CheckBackground').html(0);
                    $('#Table1User'+i.toString()+'Progress').css('bottom' , 0 + '%');
                    $('#Table1User'+i.toString()+'Cart1').css("border","0");
                    $('#Table1User'+i.toString()+'Cart2').css("border","0");
                    }
                
                for(var i=1;i<7;i++){
                    $('#Table2User'+i.toString()+'Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table2User'+i.toString()+'Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table2User'+i.toString()+'CheckBackground').html(0);
                    $('#Table2User'+i.toString()+'Progress').css('bottom' , 0 + '%');
                    $('#Table2User'+i.toString()+'Cart1').css("border","0");
                    $('#Table2User'+i.toString()+'Cart2').css("border","0");
                    }
                
                for(var i=1;i<9;i++){
                    $('#Table3User'+i.toString()+'Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table3User'+i.toString()+'Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table3User'+i.toString()+'CheckBackground').html(0);
                    $('#Table3User'+i.toString()+'Progress').css('bottom' , 0 + '%');
                    $('#Table3User'+i.toString()+'Cart1').css("border","0");
                    $('#Table3User'+i.toString()+'Cart2').css("border","0");
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
                
                $('#Table1Flop1').css('border' , '0');
                $('#Table2Flop1').css('border' , '0');
                $('#Table3Flop1').css('border' , '0');
                $('#Table1Flop2').css('border' , '0');
                $('#Table2Flop2').css('border' , '0');
                $('#Table3Flop2').css('border' , '0');
                $('#Table1Flop3').css('border' , '0');
                $('#Table2Flop3').css('border' , '0');
                $('#Table3Flop3').css('border' , '0');
                $('#Table1Tern').css('border' , '0');
                $('#Table2Tern').css('border' , '0');
                $('#Table3Tern').css('border' , '0');
                $('#Table1River').css('border' , '0');
                $('#Table2River').css('border' , '0');
                $('#Table3River').css('border' , '0');
                
                return;
            }
            
                if($("#CurrentStage").html() == -1){
                    $("#CurrentStage").html(Message.Stage);
                    $("#ShowCurrentRaund").html(Message.Round);
                    
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
                        if(Message.Table0.User0[2] == -1 && Message.Balance>4 )
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[2] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[2] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[2] == -1 && Message.Balance>4 )
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[2] == -1 && Message.Balance>4)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[2] == -1 && Message.Balance>4)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[2] == -1 && Message.Balance>4)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[2] == -1 && Message.Balance>4)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[2] == -1 && Message.Balance>4)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Table1.User3[2] == 1 && Message.Balance>4){
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[2] == -1 && Message.Balance>4)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[2] == -1 && Message.Balance>4)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[2] == -1 && Message.Balance>4)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[2] == -1 && Message.Balance>4)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[2] == -1 && Message.Balance>4)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[2] == -1 && Message.Balance>4)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[2] == -1 && Message.Balance>4)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[2] == -1 && Message.Balance>4)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[2] == -1 && Message.Balance>4)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[2] == -1 && Message.Balance>4)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
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
                        for(var i=0;i<Message.Shutdown.length;i++)
                            $("#"+Message.Shutdown[i]).css("border","solid 1px red");
                        
                    
                    return ;
                }
                
                if($("#CurrentStage").html() == 0){
                    $("#CurrentStage").html(Message.Stage);
                    $("#ShowCurrentRaund").html(Message.Round);
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
                        if(Message.Table0.User0[2] == -1 && Message.Balance>4)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[2] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[2] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[2] == -1 && Message.Balance>4)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[2] == -1 && Message.Balance>4)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[2] == -1 && Message.Balance>4)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[2] == -1 && Message.Balance>4)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[2] == -1 && Message.Balance>4)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[2] == -1 && Message.Balance>4)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[2] == -1 && Message.Balance>4)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[2] == -1 && Message.Balance>4)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[2] == -1 && Message.Balance>4)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[2] == -1 && Message.Balance>4)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[2] == -1 && Message.Balance>4)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[2] == -1 && Message.Balance>4)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[2] == -1 && Message.Balance>4)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[2] == -1 && Message.Balance>4)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[2] == -1 && Message.Balance>4)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Balance>4){
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Table2.User6[2] == 1 && Message.Balance>4){
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[2] == -1 && Message.Balance>4)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[2] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
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
                        for(var i=0;i<Message.Shutdown.length;i++)
                            $("#"+Message.Shutdown[i]).css("border","solid 1px red");
                    
                    return;
                }
                if($("#CurrentStage").html() == 1){
                    $("#CurrentStage").html(Message.Stage);
                    $("#ShowCurrentRaund").html(Message.Round);
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
                        if(Message.Table0.User0[0] == -1 && Message.Balance>4)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[0] == -1 && Message.Balance>4)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[0] == -1 && Message.Balance>4)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[0] == -1 && Message.Balance>4)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[0] == -1 && Message.Balance>4)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[0] == -1 && Message.Balance>4)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[0] == -1 && Message.Balance>4)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[0] == -1 && Message.Balance>4)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[0] == -1 && Message.Balance>4)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[0] == -1 && Message.Balance>4)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[0] == -1 && Message.Balance>4)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[0] == -1 && Message.Balance>4)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[0] == -1 && Message.Balance>4)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[0] == -1 && Message.Balance>4)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[0] == -1 && Message.Balance>4)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[0] == -1 && Message.Balance>4)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[0] == -1 && Message.Balance>4)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
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
                        for(var i=0;i<Message.Shutdown.length;i++)
                            $("#"+Message.Shutdown[i]).css("border","solid 1px red");
                    return ;
                }
                
                if($("#CurrentStage").html() == 2){
                    $("#CurrentStage").html(Message.Stage);
                    $("#ShowCurrentRaund").html(Message.Round);
                    
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
                        if(Message.Table0.User0[0] == -1 && Message.Balance>4)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[0] == -1 && Message.Balance>4)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[0] == -1 && Message.Balance>4)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[0] == -1 && Message.Balance>4)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[0] == -1 && Message.Balance>4)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[0] == -1 && Message.Balance>4)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[0] == -1 && Message.Balance>4)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[0] == -1 && Message.Balance>4)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[0] == -1 && Message.Balance>4)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[0] == -1 && Message.Balance>4)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[0] == -1 && Message.Balance>4)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[0] == -1 && Message.Balance>4)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[0] == -1 && Message.Balance>4)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[0] == -1 && Message.Balance>4)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[0] == -1 && Message.Balance>4)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[0] == -1 && Message.Balance>4)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[0] == -1 && Message.Balance>4)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
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
                        for(var i=0;i<Message.Shutdown.length;i++)
                            $("#"+Message.Shutdown[i]).css("border","solid 1px red");
                    
                    return ;
                }
                
                if($("#CurrentStage").html() == 3){
                    $("#CurrentStage").html(Message.Stage);
                    $("#ShowCurrentRaund").html(Message.Round);
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
                        if(Message.Table0.User0[0] == -1 && Message.Balance>4)
                            $('#Table1User1Factor').hide();
                        else
                            if(Message.Table0.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User1CheckBackground"));
                                $("#Table1User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User1[0] == -1 && Message.Balance>4)
                            $('#Table1User2Factor').hide();
                        else
                            if(Message.Table0.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User2CheckBackground"));
                                $("#Table1User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User2[0] == -1 && Message.Balance>4)
                            $('#Table1User3Factor').hide();
                        else
                            if(Message.Table0.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",true);
                           }else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User3CheckBackground"));
                                $("#Table1User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table0.User3[0] == -1 && Message.Balance>4)
                            $('#Table1User4Factor').hide();
                        else
                            if(Message.Table0.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table1User4CheckBackground"));
                                $("#Table1User4Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table1.User0[0] == -1 && Message.Balance>4)
                            $('#Table2User1Factor').hide();
                        else
                            if(Message.Table1.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User1CheckBackground"));
                                $("#Table2User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User1[0] == -1 && Message.Balance>4)
                            $('#Table2User2Factor').hide();
                        else
                            if(Message.Table1.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User2CheckBackground"));
                                $("#Table2User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User2[0] == -1 && Message.Balance>4)
                            $('#Table2User3Factor').hide();
                        else
                            if(Message.Table1.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User3CheckBackground"));
                                $("#Table2User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User3[0] == -1 && Message.Balance>4)
                            $('#Table2User4Factor').hide();
                        else
                            if(Message.Table1.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User4CheckBackground"));
                                $("#Table2User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User4[0] == -1 && Message.Balance>4)
                            $('#Table2User5Factor').hide();
                        else
                            if(Message.Table1.User4[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User5CheckBackground"));
                                $("#Table2User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table1.User5[0] == -1 && Message.Balance>4)
                            $('#Table2User6Factor').hide();
                        else
                            if(Message.Table1.User5[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table2User6CheckBackground"));
                                $("#Table2User6Check").attr("disabled",false);
                           }
                       
                       
                       if(Message.Table2.User0[0] == -1 && Message.Balance>4)
                            $('#Table3User1Factor').hide();
                        else
                            if(Message.Table2.User0[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User1CheckBackground"));
                                $("#Table3User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User1[0] == -1 && Message.Balance>4)
                            $('#Table3User2Factor').hide();
                        else
                            if(Message.Table2.User1[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User2CheckBackground"));
                                $("#Table3User2Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User2[0] == -1 && Message.Balance>4)
                            $('#Table3User3Factor').hide();
                        else
                            if(Message.Table2.User2[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User3CheckBackground"));
                                $("#Table3User3Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User3[0] == -1 && Message.Balance>4)
                            $('#Table3User4Factor').hide();
                        else
                            if(Message.Table2.User3[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User4CheckBackground"));
                                $("#Table3User4Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User4[0] == -1 && Message.Balance>4)
                            $('#Table3User5Factor').hide();
                        else
                            if(Message.Table2.User4[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User5CheckBackground"));
                                $("#Table3User5Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User5[0] == -1 && Message.Balance>4)
                            $('#Table3User6Factor').hide();
                        else
                            if(Message.Table2.User5[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User6CheckBackground"));
                                $("#Table3User6Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User6[0] == -1 && Message.Balance>4)
                            $('#Table3User7Factor').hide();
                        else
                            if(Message.Table2.User6[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User7CheckBackground"));
                                $("#Table7User1Check").attr("disabled",false);
                           }
                       
                       if(Message.Table2.User7[0] == -1 && Message.Balance>4)
                            $('#Table3User8Factor').hide();
                        else
                            if(Message.Table2.User7[0] == 1 && Message.Balance>4){
                                SetNoActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",true);
                           }
                       else
                           if(Message.Balance>4){
                                SetActiveButt($("#Table3User8CheckBackground"));
                                $("#Table3User8Check").attr("disabled",false);
                           }
                    }
                    if(Message.Stage == 5)
                        for(var i=0;i<Message.Shutdown.length;i++)
                            $("#"+Message.Shutdown[i]).css("border","solid 1px red");
                    
                    return ;
                }
                
                if($("#CurrentStage").html() == 4){
                    $("#CurrentStage").html(Message.Stage);
                    $("#ShowCurrentRaund").html(Message.Round);
                if(Message.Stage == 5)
                        for(var i=0;i<Message.Shutdown.length;i++)
                            $("#"+Message.Shutdown[i]).css("border","solid 1px red");
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
                if(Message.Correct == 'true')
                    alert("Ставка выполнена");
                else
                    alert("Ставка не выполнена");
            }
    }
}
}