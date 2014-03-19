var idTable;
var plaseId;
var countUserTable;
var BigBlinds;
var Balance;
$(document).ready(function(){
    idTable = -1;
    plaseId = -1;
    GetAllUserStatistic();
    $("#JoinTable").click(function(){
        SelectTable();
    });
    
    $("#BackToList").click(function (){
    var data = {};
    data.IdTable = idTable;
        $.ajax({
        url: "/ExitUserTable",
        type: "post",
        dataType: "json",
        data: JSON.stringify(data),
        success: function (response, textStatus, jqXHR) {
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            
        },
        complete: function () {
            
        }
    });
    
       $("#SelectTablePanel").show();
       $("#Tables").hide();
       $("#Table4Users").hide();
       $("#Table5Users").hide();
       $("#Table9Users").hide();
       $("#ControlPanel").hide();
       idTable = -1;
    });
    $('#ListTables').on('loadComplete', function() {
        $("#ListTables").jqGrid('hideCol',"TableId");
});
    
    $('#ListTables').on('reloadGrid', function() {
        $("#ListTables").jqGrid('hideCol',"TableId");
});
$("#Table9User0SitThis").click(function(){SitThis(0);});
$("#Table9User1SitThis").click(function(){SitThis(1);});
$("#Table9User2SitThis").click(function(){SitThis(2);});
$("#Table9User3SitThis").click(function(){SitThis(3);});
$("#Table9User4SitThis").click(function(){SitThis(4);});
$("#Table9User5SitThis").click(function(){SitThis(5);});
$("#Table9User6SitThis").click(function(){SitThis(6);});
$("#Table9User7SitThis").click(function(){SitThis(7);});
$("#Table9User8SitThis").click(function(){SitThis(8);});

$("#Table5User0SitThis").click(function(){SitThis(0);});
$("#Table5User1SitThis").click(function(){SitThis(1);});
$("#Table5User2SitThis").click(function(){SitThis(2);});
$("#Table5User3SitThis").click(function(){SitThis(3);});
$("#Table5User4SitThis").click(function(){SitThis(4);});

$("#Table4User0SitThis").click(function(){SitThis(0);});
$("#Table4User1SitThis").click(function(){SitThis(1);});
$("#Table4User2SitThis").click(function(){SitThis(2);});
$("#Table4User3SitThis").click(function(){SitThis(3);});


$("#RaiseButton").click(function(){ResponceCommand(1);});
$("#CallButton").click(function(){ResponceCommand(2);});
$("#FoldButton").click(function(){ResponceCommand(3);});
$("#CheckButton").click(function(){ResponceCommand(4);});

$("#DialogSumToTableCansel").click(function (){
    $("#DialogSelectSumToTable").dialog("close");
});

$("#DialogSumToTableOk").click(function (){
    var data = {};
    data.IdTable = idTable;
    data.plaseId = plaseId;
    
    data.summ = $("#RangeSelectSumToTable").val();
    $.ajax({
        url: "/SitThisUser",
        type: "post",
        dataType: "json",
        data: JSON.stringify(data),
        success: function (response, textStatus, jqXHR) {
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            
        },
        complete: function () {
            
        }
    });
$("#DialogSelectSumToTable").dialog("close");

});

setInterval(function() {
    if(idTable == -1){
    scrollPosition = $("#ListTables").closest(".ui-jqgrid-bdiv").scrollTop();
    $("#ListTables").trigger("reloadGrid",[{current:true}]);
}
},3000);
});

function ResponceCommand(command){
    var data = {};
    $("#RaiseButton").hide();
    $("#CallButton").hide();
    $("#FoldButton").hide();
    $("#CheckButton").hide();

    switch (command){
        case 1:
            data.command = command;
            data.summ = $("#RaiseSumUser").html();
            break;
            
        case 2:
            data.command = command;
            break;
            
        case 3:
            data.command = command;
            break;
            
        case 4:
            data.command = command;
            break;
    }
    
    $.ajax({
        url: "/SelectUserCommand",
        type: "post",
        dataType: "json",
        data: JSON.stringify(data),
        success: function (response, textStatus, jqXHR) {
                UpdateTable(response);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            
        },
        complete: function () {
            
        }
    }); 
}

var scrollPosition;
var ids = new Array();
var RowId;
var timer = null;
function CheckGame(){
    if(timer == null)
   timer =  setInterval(function() {
    var data = {};
    data.IdTable = idTable;
    data.Stage = $("#StageCurrentTable").html(); 
    if(idTable != -1){
    $.ajax({
        url: "/GetTableInfo",
        type: "post",
        dataType: "json",
        data: JSON.stringify(data),
        success: function (response, textStatus, jqXHR) {
                UpdateTable(response);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            
        },
        complete: function () {
            
        }
    }); 
}
},1000);
}

function SitThis(Id){
    plaseId = Id;
    if(Balance >= BigBlinds*10)
        $("#DialogSelectSumToTable").dialog({title:"Выберите сумму",height:200,width:300,maxHeight:200,maxWidth:300,minHeight:200,minWidth:300});
}

function UpdateTable(root){
    Balance = root.Balance;
    if($("#StageCurrentTable").html() == 0){
        if(root.stage == 0){
            Balance = root.Balance;
        }
    }
    
    
    
    
    
    
    
    if(root.CurrentUserSit == true)
        for(var i = 0; i < countUserTable; i++){
            $("#Table"+countUserTable+"User"+i+"SitThis").hide();
    }

if(root.ButtonActivate != null){
   if(JSON.parse(root.ButtonActivate).IsRaise){
       $("#RaiseButton").show();
       $("#RaiseSumUser").html(JSON.parse(root.ButtonActivate).ValueRaise);
       
   }
   
   if(JSON.parse(root.ButtonActivate).IsCall){
       $("#CallButton").show();
       $("#CallSumUser").html(JSON.parse(root.ButtonActivate).SumCall);

        }
   
   if(JSON.parse(root.ButtonActivate).IsFold){
       $("#FoldButton").show();
   }
   
   if(JSON.parse(root.ButtonActivate).IsCheck){
       $("#CheckButton").show();
   }
}
    for(var i = 0; i < countUserTable; i++){
        if(JSON.parse(root.Users)[i].isUserSit == true){
            $("#Table"+countUserTable+"User"+i+"Cart0").css("backgroundImage","url(/pic/cart/"+JSON.parse(root.Users)[i].CartOne+".png)");
            $("#Table"+countUserTable+"User"+i+"Cart1").css("backgroundImage","url(/pic/cart/"+JSON.parse(root.Users)[i].CartTwo+".png)");
            $("#Table"+countUserTable+"User"+i+"Name").html(JSON.parse(root.Users)[i].UserName);
            $("#Table"+countUserTable+"User"+i+"Money").html(JSON.parse(root.Users)[i].UserCash+"$");
            $("#Table"+countUserTable+"User"+i+"SitThis").hide();
            if(JSON.parse(root.Users)[i].Dialer == true){
                $("#Table"+countUserTable+"User"+i+"Dialer").show();
            }
            if(JSON.parse(root.Users)[i].Lack == true){
        }
        
        }else{
            $("#Table"+countUserTable+"User"+i+"Name").html("");
            $("#Table"+countUserTable+"User"+i+"Money").html("0$");
            if(root.CurrentUserSit != true)
            $("#Table"+countUserTable+"User"+i+"SitThis").show();
            
            $("#Table"+countUserTable+"User"+i+"Dialer").hide();
            $("#Table"+countUserTable+"User"+i+"Timer").html(0);
            $("#Table"+countUserTable+"User"+i+"Timer").hide();
            
        }
        

        
    }
}

function GetAllUserStatistic() {
    
            'use strict';
            var mydata = [],
                $grid = $("#ListTables"),
                initDateEdit = function (elem) {
                    setTimeout(function () {
                        $(elem).datepicker({
                            dateFormat: 'dd-M-yy',
                            autoSize: true,
                            changeYear: true,
                            changeMonth: true,
                            showButtonPanel: true,
                            showWeek: true
                        });
                    }, 100);
                },
                initDateSearch = function (elem) {
                    setTimeout(function () {
                        $(elem).datepicker({
                            dateFormat: 'dd-M-yy',
                            autoSize: true,
                            changeYear: true,
                            changeMonth: true,
                            showWeek: true,
                            showButtonPanel: true
                        });
                    }, 100);
                },numberTemplate = {
                    formatter: 'number', align: 'right', sorttype: 'number', editable: true,
                    searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'ge', 'nu', 'nn', 'in', 'ni'] }
                },
                getSelectedText = function () {
                    var text = '';
                    if (window.getSelection) {
                        text = window.getSelection();
                    } else if (document.getSelection) {
                        text = document.getSelection();
                    } else if (document.selection) {
                        text = document.selection.createRange().text;
                    }
                    return typeof (text) === 'string' ? text : text.toString();
                },
                createContexMenuFromNavigatorButtons = function (grid, pager) {
                    var menuId = 'menu_' + grid[0].id, menuUl = $('<ul>'),
                        menuDiv = $('<div>').attr('id', menuId);

                    menuUl.appendTo(menuDiv);
                    menuDiv.appendTo('body');
                },
                lastSel,
                autoedit = false;
        
            $grid.jqGrid({
                url: 'GetAllTablesHoldem',
                datatype: "json",
                colNames: [
                    'TableId',
                    'Флоп',
                    'Мест',
                    'MinBlinds',
                    'MaxBlinds',
                    'Играют',
                    'Количество раздач',
                    'Средний банк',
                    'Тип'
                ],
                colModel: [
                    { name: 'TableId', index: 'TableId',width: 0},
                    { name: 'flopView', index: 'flopView',width: 70},
                    { name: 'players', index: 'players',width: 60},
                    { name: 'MinBlinds', index: 'MinBlinds',width: 70},
                    { name: 'MaxBlinds', index: 'MaxBlinds',width: 70},
                    { name: 'PlayerSittings', index: 'playersSitting',width: 60},
                    { name: 'distributionCount', index: 'distributionCount',width: 120},
                    { name: 'averageBank', index: 'averageBank', width: 80 },
                    { name: 'type', index: 'type', width: 100 },
                     ],
                rowNum: 200,
                rowList: [10,30,60,150,200],
                gridview: true,
                mtype: "POST",
                autoencode: true,
                ignoreCase: true,
                viewrecords: true,
                sortorder: 'asc',
                height: '110px',
                caption: 'Статистика текущего пользователя',
                loadui: 'disable',
                beforeSelectRow: function (rowid,e) {
                    if (rowid !== lastSel) {
                        $(this).jqGrid('restoreRow', lastSel);
                        lastSel = rowid;
                    }
                    var $td = $(e.target).closest("td");
                    var $tr = $td.closest("tr.jqgrow");
                    var data = { index: $tr[0].cells[1].innerHTML};
                    return true;
                },
                ondblClickRow: function (rowid, iRow, iCol, e) {
                    $(this).jqGrid('editRow', rowid, true, function () {
                        $("input, select", e.target).focus();
                    });
                    return;
                },
                loadComplete: function(data){
               //     console.log("RowIdSet = "+RowId);
             //       $("#ListTables").jqGrid('setSelection', RowId);
                    $("#ListTables").closest(".ui-jqgrid-bdiv").scrollTop(scrollPosition);

           }
            });
            
    $("#StatisticListAllUser").jqGrid('navGrid','#StatisticPagerAllUser',{edit:false,add:false,del:false,view: false});
    $("#AutoEdit").button({
        text: false,
        icons: { primary: "ui-icon-mail-closed" }
    }).click(function () {
        var iconClass, $this = $(this);
        if (!autoedit) {
            autoedit = true;
            iconClass = "ui-icon-mail-open";
        } else {
            autoedit = false;
            iconClass = "ui-icon-mail-closed";
        }
        $this.button("option", { icons: { primary: iconClass } });
    });
    createContexMenuFromNavigatorButtons($grid, '#StatisticPagerAllUser');
    $(".ui-jqgrid-titlebar").hide();
    $("#ListTables").jqGrid('hideCol',"TableId");
        }
        

function SelectTable(){
    var myGrid = $('#ListTables'),
            selRowId = myGrid.jqGrid ('getGridParam', 'selrow'),
            celValue = myGrid.jqGrid ('getCell', selRowId, 'players');
    var celValueId = myGrid.jqGrid ('getCell', selRowId, 'TableId');
    idTable = celValueId;
    BigBlinds = myGrid.jqGrid ('getCell', selRowId, 'MaxBlinds');
    $("#RangeSelectSumToTable").attr("min",BigBlinds*10);
    $("#RangeSelectSumToTable").attr("max",BigBlinds*20);
    $("#RangeSelectSumToTable").val(0);
    $("#DisplaySummToTable").html((BigBlinds*10)+"$");
    countUserTable = myGrid.jqGrid ('getCell', selRowId, 'players');
    $("#ControlPanel").show();
    CheckGame();
    for(var i = 0; i < countUserTable; i++){
        $("#Table" + countUserTable + "User" + i + "Name").html("");
        $("#Table" + countUserTable + "User" + i + "Money").html("0$");
        $("#Table" + countUserTable + "User" + i + "SitThis").show();
    }
    $("#BackToList").show();
    
    if (celValue == 4){
        $("#SelectTablePanel").hide();
        $("#Tables").show();
        $("#Table4Users").show();
    }
    
    if (celValue == 5){
        $("#SelectTablePanel").hide();
        $("#Tables").show();
        $("#Table5Users").show();
    }
    
    if (celValue == 9){
        $("#SelectTablePanel").hide();
        $("#Tables").show();
        $("#Table9Users").show();
    }
}

function updateTextSum(val) {
    $("#DisplaySummToTable").html(val+"$");
}