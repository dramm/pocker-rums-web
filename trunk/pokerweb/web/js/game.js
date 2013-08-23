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




function StartGame(){setInterval(function() {
    var values =  {  
                "start": $("#CurrentStage").html() 
            };
    var url = "StartGame";
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
                if(Message.Data != null){
                   console.log(Message.Data.toString());
                   var Base = JSON.parse(Message.Data);
                   for(var i=0;i<Base.length;i++){
                   if(Base[i].Timer != null){
                       var valueBaseProgress = Base[i].Timer * 100 / 20;//Base.length > 2 ? JSON.parse(Base[2].Timer):Base.length == 1 ? JSON.parse(Base[0].Timer): JSON.parse(Base[1].Timer) * 100 / 5;
                       $( "#progressbar" ).progressbar({value: valueBaseProgress}); 
                       document.getElementById("BaseProgressTime").innerHTML = 20 - Base[i].Timer;//(Base.length > 2 ? JSON.parse(Base[2].Timer):Base.length == 1 ? JSON.parse(Base[0].Timer): JSON.parse(Base[1].Timer));
                                break;
                            }
               }
                   var TableUser = null;
                   var Table = null;
                      for(var i=0; i<Base.length-1; i++){ 
                          var obj = JSON.parse(Base[i]);
                          if(obj.Stage != "Starting"){
                       if(obj.Table0.Player0 != null)
                           TableUser = obj;
                       if(obj.Table0.Player0 == null)
                           Table = obj;
                          }
                      }
                   
                   if(Table == null && TableUser == null){
                     
                            $('#Table1User1Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                            $('#Table1User1Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                            $('#Table1User2Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                            $('#Table1User2Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                     $('#Table1User3Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table1User3Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                     $('#Table1User4Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table1User4Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                     $('#Table1Flop1').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table1Flop2').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table1Flop3').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table1Tern').css('background-image' , 'url(/pic/tern.png)');
                     $('#Table1River').css('background-image' , 'url(/pic/river.png)');
                     
                     $('#Table2User1Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table2User1Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                            $('#Table2User2Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                            $('#Table2User2Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                     $('#Table2User3Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table2User3Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                     $('#Table2User4Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table2User4Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                    $('#Table2User5Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table2User5Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                    $('#Table2User6Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    $('#Table2User6Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                     $('#Table2Flop1').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table2Flop2').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table2Flop3').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table2Tern').css('background-image' , 'url(/pic/tern.png)');
                     $('#Table2River').css('background-image' , 'url(/pic/river.png)');
                     
                     $('#Table3User1Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User1Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                     $('#Table3User2Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User2Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                     $('#Table3User3Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User3Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     
                     $('#Table3User4Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User4Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                    $('#Table3User5Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User5Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                    $('#Table3User6Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User6Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                    $('#Table3User7Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User7Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                    $('#Table3User8Cart1').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                     $('#Table3User8Cart2').css('background-image' , 'url(/pic/ClearSubstrate.png)');
                    
                     $('#Table3Flop1').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table3Flop2').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table3Flop3').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table3Tern').css('background-image' , 'url(/pic/tern.png)');
                     $('#Table3River').css('background-image' , 'url(/pic/river.png)');
                            return ;
                        }
                   if(TableUser != null){
                     $('#Table1User1Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player0[0]+'.png)');
                     $('#Table1User1Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player0[1]+'.png)');
                     
                     $('#Table1User2Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player1[0]+'.png)');
                     $('#Table1User2Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player1[1]+'.png)');
                     
                     $('#Table1User3Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player2[0]+'.png)');
                     $('#Table1User3Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player2[1]+'.png)');
                     
                     $('#Table1User4Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player3[0]+'.png)');
                     $('#Table1User4Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table0.Player3[1]+'.png)');
                     
                     if(Table == null){
                         document.getElementById("Table1User1CheckBackground").innerHTML = TableUser.Table0.Player0[2].Factor;
                         document.getElementById("Table1User2CheckBackground").innerHTML = TableUser.Table0.Player1[2].Factor;
                         document.getElementById("Table1User3CheckBackground").innerHTML = TableUser.Table0.Player2[2].Factor;
                         document.getElementById("Table1User4CheckBackground").innerHTML = TableUser.Table0.Player3[2].Factor;
                         }
                     
                     $('#Table1Flop1').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table1Flop2').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table1Flop3').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table1Tern').css('background-image' , 'url(/pic/tern.png)');
                     $('#Table1River').css('background-image' , 'url(/pic/river.png)');
                     
                            }
                    if(Table != null){
                     $('#Table1Flop1').css('background-image' , 'url(/pic/cart/'+Table.Table0[0].Bord[0]+'.png)');
                     $('#Table1Flop2').css('background-image' , 'url(/pic/cart/'+Table.Table0[0].Bord[1]+'.png)');
                     $('#Table1Flop3').css('background-image' , 'url(/pic/cart/'+Table.Table0[0].Bord[2]+'.png)');
                     if(Table.Table0[0].Bord[3] != null)
                     $('#Table1Tern').css('background-image' , 'url(/pic/cart/'+Table.Table0[0].Bord[3]+'.png)');
                 else
                     $('#Table1Tern').css('background-image' , 'url(/pic/tern.png)');
                     if(Table.Table0[0].Bord[4] != null)
                     $('#Table1River').css('background-image' , 'url(/pic/cart/'+Table.Table0[0].Bord[4]+'.png)');
                     else
                     $('#Table1River').css('background-image' , 'url(/pic/river.png)');
                         
                        document.getElementById("Table1User1CheckBackground").innerHTML = Table.Table0[1].Player0.Factor;
                        document.getElementById("Table1User2CheckBackground").innerHTML = Table.Table0[1].Player1.Factor;
                        document.getElementById("Table1User3CheckBackground").innerHTML = Table.Table0[1].Player2.Factor;
                        document.getElementById("Table1User4CheckBackground").innerHTML = Table.Table0[1].Player3.Factor;
                          
                         
                    }
                    
                     if(TableUser != null){
                     $('#Table2User1Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player0[0]+'.png)');
                     $('#Table2User1Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player0[1]+'.png)');
                     
                     $('#Table2User2Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player1[0]+'.png)');
                     $('#Table2User2Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player1[1]+'.png)');
                     
                     $('#Table2User3Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player2[0]+'.png)');
                     $('#Table2User3Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player2[1]+'.png)');
                     
                     $('#Table2User4Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player3[0]+'.png)');
                     $('#Table2User4Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player3[1]+'.png)');
                     
                     $('#Table2User5Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player4[0]+'.png)');
                     $('#Table2User5Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player4[1]+'.png)');
                     
                     $('#Table2User6Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player5[0]+'.png)');
                     $('#Table2User6Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table1.Player5[1]+'.png)');
                   
                   if(Table == null){
                         document.getElementById("Table2User1CheckBackground").innerHTML = TableUser.Table1.Player0[2].Factor;
                         document.getElementById("Table2User2CheckBackground").innerHTML = TableUser.Table1.Player1[2].Factor;
                         document.getElementById("Table2User3CheckBackground").innerHTML = TableUser.Table1.Player2[2].Factor;
                         document.getElementById("Table2User4CheckBackground").innerHTML = TableUser.Table1.Player3[2].Factor;
                         document.getElementById("Table2User5CheckBackground").innerHTML = TableUser.Table1.Player4[2].Factor;
                         document.getElementById("Table2User6CheckBackground").innerHTML = TableUser.Table1.Player5[2].Factor;
                     
                        }
                            
                     $('#Table2Flop1').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table2Flop2').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table2Flop3').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table2Tern').css('background-image' , 'url(/pic/tern.png)');
                     $('#Table2River').css('background-image' , 'url(/pic/river.png)');
                   
                            }
                    if(Table  != null){
                     $('#Table2Flop1').css('background-image' , 'url(/pic/cart/'+Table.Table1[0].Bord[0]+'.png)');
                     $('#Table2Flop2').css('background-image' , 'url(/pic/cart/'+Table.Table1[0].Bord[1]+'.png)');
                     $('#Table2Flop3').css('background-image' , 'url(/pic/cart/'+Table.Table1[0].Bord[2]+'.png)');
                     if(Table.Table1[0].Bord[3] != null)
                     $('#Table2Tern').css('background-image' , 'url(/pic/cart/'+Table.Table1[0].Bord[3]+'.png)');
                 else
                     $('#Table2Tern').css('background-image' , 'url(/pic/tern.png)');
                     if(Table.Table1[0].Bord[4] != null)
                     $('#Table2River').css('background-image' , 'url(/pic/cart/'+Table.Table1[0].Bord[4]+'.png)');
                     else
                     $('#Table2River').css('background-image' , 'url(/pic/river.png)');
                     
                     
                        document.getElementById("Table2User1CheckBackground").innerHTML = Table.Table1[1].Player0.Factor;
                        document.getElementById("Table2User2CheckBackground").innerHTML = Table.Table1[1].Player1.Factor;
                        document.getElementById("Table2User3CheckBackground").innerHTML = Table.Table1[1].Player2.Factor;
                        document.getElementById("Table2User4CheckBackground").innerHTML = Table.Table1[1].Player3.Factor;
                        document.getElementById("Table2User5CheckBackground").innerHTML = Table.Table1[1].Player4.Factor;
                        document.getElementById("Table2User6CheckBackground").innerHTML = Table.Table1[1].Player5.Factor;
                        
                        }
                    
                     if(TableUser != null){
                     $('#Table3User1Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player0[0]+'.png)');
                     $('#Table3User1Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player0[1]+'.png)');
                     
                     $('#Table3User2Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player1[0]+'.png)');
                     $('#Table3User2Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player1[1]+'.png)');
                     
                     $('#Table3User3Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player2[0]+'.png)');
                     $('#Table3User3Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player2[1]+'.png)');
                    
                     $('#Table3User4Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player3[0]+'.png)');
                     $('#Table3User4Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player3[1]+'.png)');
                     
                     $('#Table3User5Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player4[0]+'.png)');
                     $('#Table3User5Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player4[1]+'.png)');
                     
                     $('#Table3User6Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player5[0]+'.png)');
                     $('#Table3User6Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player5[1]+'.png)');
                     
                     $('#Table3User7Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player6[0]+'.png)');
                     $('#Table3User7Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player6[1]+'.png)');
                     
                     $('#Table3User8Cart1').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player7[0]+'.png)');
                     $('#Table3User8Cart2').css('background-image' , 'url(/pic/cart/'+TableUser.Table2.Player7[1]+'.png)');
                   
                   if(Table == null){
                         document.getElementById("Table3User1CheckBackground").innerHTML = TableUser.Table2.Player0[2].Factor;
                         document.getElementById("Table3User2CheckBackground").innerHTML = TableUser.Table2.Player1[2].Factor;
                         document.getElementById("Table3User3CheckBackground").innerHTML = TableUser.Table2.Player2[2].Factor;
                         document.getElementById("Table3User4CheckBackground").innerHTML = TableUser.Table2.Player3[2].Factor;
                         document.getElementById("Table3User5CheckBackground").innerHTML = TableUser.Table2.Player4[2].Factor;
                         document.getElementById("Table3User6CheckBackground").innerHTML = TableUser.Table2.Player5[2].Factor;
                         document.getElementById("Table3User7CheckBackground").innerHTML = TableUser.Table2.Player6[2].Factor;
                         document.getElementById("Table3User8CheckBackground").innerHTML = TableUser.Table2.Player7[2].Factor;
                     
                     
                        }
                   
                   $('#Table3Flop1').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table3Flop2').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table3Flop3').css('background-image' , 'url(/pic/flop.png)');
                     $('#Table3Tern').css('background-image' , 'url(/pic/tern.png)');
                     $('#Table3River').css('background-image' , 'url(/pic/river.png)');
                   
                        }
                    if(Table  != null){
                     $('#Table3Flop1').css('background-image' , 'url(/pic/cart/'+Table.Table2[0].Bord[0]+'.png)');
                     $('#Table3Flop2').css('background-image' , 'url(/pic/cart/'+Table.Table2[0].Bord[1]+'.png)');
                     $('#Table3Flop3').css('background-image' , 'url(/pic/cart/'+Table.Table2[0].Bord[2]+'.png)');
                   if(Table.Table2[0].Bord[3] != null)
                     $('#Table3Tern').css('background-image' , 'url(/pic/cart/'+Table.Table2[0].Bord[3]+'.png)');
                 else
                     $('#Table3Tern').css('background-image' , 'url(/pic/tern.png)');
                     if(Table.Table2[0].Bord[4] != null)
                     $('#Table3River').css('background-image' , 'url(/pic/cart/'+Table.Table2[0].Bord[4]+'.png)');
                     else
                     $('#Table3River').css('background-image' , 'url(/pic/river.png)');
                     
                        document.getElementById("Table3User1CheckBackground").innerHTML = Table.Table2[1].Player0.Factor;
                        document.getElementById("Table3User2CheckBackground").innerHTML = Table.Table2[1].Player1.Factor;
                        document.getElementById("Table3User3CheckBackground").innerHTML = Table.Table2[1].Player2.Factor;
                        document.getElementById("Table3User4CheckBackground").innerHTML = Table.Table2[1].Player3.Factor;
                        document.getElementById("Table3User5CheckBackground").innerHTML = Table.Table2[1].Player4.Factor;
                        document.getElementById("Table3User6CheckBackground").innerHTML = Table.Table2[1].Player5.Factor;
                        document.getElementById("Table3User7CheckBackground").innerHTML = Table.Table2[1].Player6.Factor;
                        document.getElementById("Table3User8CheckBackground").innerHTML = Table.Table2[1].Player7.Factor;
                        
                        }
                    
                    }
        }}
    }
}
