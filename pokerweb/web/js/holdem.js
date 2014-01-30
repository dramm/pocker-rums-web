/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    GetAllUserStatistic();
    $("#JoinTable").click(function(){
        SelectTable();
    });
    
    $("#BackToList").click(function (){
       $("#SelectTablePanel").show();
       $("#Tables").hide();
       $("#Table4Users").hide();
       $("#Table5Users").hide();
       $("#Table9Users").hide();
    });
    $('#ListTables').on('loadComplete', function() {
        $("#ListTables").jqGrid('hideCol',"TableId");
});
    
    $('#ListTables').on('reloadGrid', function() {
        $("#ListTables").jqGrid('hideCol',"TableId");
});
});
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
                    'flopView',
                    'players',
                    'MinBlinds',
                    'MaxBlinds',
                    'PlayerSittings',
                    'distributionCount',
                    'averageBank',
                    'type'
                ],
                colModel: [
                    { name: 'TableId', index: 'TableId',width: 80},
                    { name: 'flopView', index: 'flopView',width: 80},
                    { name: 'players', index: 'players',width: 80},
                    { name: 'MinBlinds', index: 'MinBlinds',width: 80},
                    { name: 'MaxBlinds', index: 'MaxBlinds',width: 80},
                    { name: 'PlayerSittings', index: 'playersSitting',width: 80},
                    { name: 'distributionCount', index: 'distributionCount',width: 120},
                    { name: 'averageBank', index: 'averageBank', width: 80 },
                    { name: 'type', index: 'type', width: 40 },
                     ],
                rowNum: 200,
                rowList: [10,30,60,150,200],
//                pager: '#PagerListTables',
                gridview: true,
                mtype: "POST",
                autoencode: true,
                ignoreCase: true,
                viewrecords: true,
                sortorder: 'asc',
                height: '110px',
                caption: 'Статистика текущего пользователя',
                beforeSelectRow: function (rowid,e) {
                    if (rowid !== lastSel) {
                        $(this).jqGrid('restoreRow', lastSel);
                        lastSel = rowid;
                    }
                    var $td = $(e.target).closest("td");
                    var $tr = $td.closest("tr.jqgrow");
                    var data = { index: $tr[0].cells[1].innerHTML};
                    
//                    if(CheckBetTimer == null){
//                         var $td = $(e.target).closest("td");
//                    var $tr = $td.closest("tr.jqgrow");
//                    var data = { index: $tr[0].cells[0].innerHTML};
//                    $.ajax({
//                                    url: "/SelectTable",
//                                    type: "post",
//                                    dataType: "json",
//                                    data: JSON.stringify(data),
//                                    success: function (response, textStatus, jqXHR) {
//                                        if(response.correct == true)
//                                        CheckBetRequest();
//                                    },
//                                    error: function (jqXHR, textStatus, errorThrown) {
//                                        //alert("error");
//                                    },
//                                    complete: function () {
//                                    }
//                                });
//                            }
                    return true;
                },
                ondblClickRow: function (rowid, iRow, iCol, e) {
                    $(this).jqGrid('editRow', rowid, true, function () {
                        $("input, select", e.target).focus();
                    });
                    return;
                }
            });

           
           jQuery("#StatisticListAllUser").jqGrid('navGrid','#StatisticPagerAllUser',{edit:false,add:false,del:false,view: false});
//            $grid.jqGrid('navGrid', '#pager', { view: true });
            
            $("#AutoEdit").button({
                text: false,
                icons: { primary: "ui-icon-mail-closed" }
            }).click(function () {
                var iconClass, $this = $(this);
                if (!autoedit) { // $this.is(':checked')) {
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
                    //alert(celValueId);
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