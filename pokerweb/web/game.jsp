<%-- 
    Document   : newjsp
    Created on : Jul 11, 2013, 12:56:04 AM
    Author     : vadim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <html>
   <head>
       <jsp:include page="headParam.jsp" flush="true" />
</head>
<body style="background-image: url(/pic/backgroundGame.png);
    background-size: cover;
    font-family: arial;" onload="StartGame()">
    <div id="header">
            <div class="leftCol"> </div>
            <div class="centerCol"> 
                <jsp:include page="topMenu.jsp" flush="true" />
                <jsp:include page="headerContent.jsp" flush="true" />
                <jsp:include page="mainMenu.jsp" flush="true" />
            </div>
            <div class="rightCol"> </div>      
        </div>

    <div class="leftCol"></div>
        <div id="centerCol" style="float: left;width: 70%;" >
            
            <div id="menuGame" >
                <div class="SmallLogo"></div>
                <div style="float: left;color: white;margin-top: 15px;">
                    <div style="display: none;" id="CurrentStage">-1</div> 
                    Время до
                    <b id="ShowNextStage">Ривер</b> Раунд <b id="ShowCurrentRaund">5383</b></div>
                <div id="progressbar">
                    <b style="position: absolute;margin-left: 60px;" id="BaseProgressTime"></b>
                </div>
                <script> 
                    $("#progressbar").progressbar({value: 37});
                    GetCurrentUserStatistic();
                </script>
                <div class="button">
                    Объяснение
                </div>
            </div>
            <div style="margin-top: 60px;">
            <div id="table" class="table1">
                 <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" id="TableUser11" style="margin-left: 85px;">
                        <div id="Table1User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table1User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User1Check">
                                <input type="checkbox" name="Table1User1Check" />
                            </span>
                        </div>
                        <div id="Table1User1Cart1" class="TableUserCart"></div>
                        <div id="Table1User1Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">11</div>
                    </div>
                    <script>$('#Table1User1Progress').css('bottom' , 40 + '%');
                    </script>
                    <div class="TableUser" id="TableUser12" style="margin-left: 15px;">
                        <div id="Table1User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table1User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User2Check">
                                <input type="checkbox" name="Table1User2Check" />
                            </span>
                        </div>
                        <div id="Table1User2Cart1" class="TableUserCart"></div>
                        <div id="Table1User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">12</div>
                    </div>
                    <script>$('#Table1User2Progress').css('bottom' , 40 + '%');</script>
                </div>
                    
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    1</div>
                <div class="TableCart">
                <div id="Table1Flop1" class="flop"></div>
                <div id="Table1Flop2" class="flop"></div>
                <div id="Table1Flop3" class="flop"></div>
                <div id="Table1Tern" class="tern"></div>
                <div id="Table1River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    <div class="TableUser" id="TableUser13" style="margin-left: 85px;">
                        <div id="Table1User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table1User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User3Check">
                                <input type="checkbox" name="Table1User3Check" />
                            </span>
                        </div>
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">13</div>
                    </div>
                    <script>$('#Table1User3Progress').css('bottom' , 40 + '%');</script>
                    <div class="TableUser" id="TableUser14" style="margin-left: 15px;">
                        <div id="Table1User4Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table1User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User4Check">
                                <input type="checkbox" name="Table1User4Check" />
                            </span>
                        </div>
                        <div id="Table1User4Cart1" class="TableUserCart"></div>
                        <div id="Table1User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">14</div>
                    </div>
                    <script>$('#Table1User4Progress').css('bottom' , 40 + '%');</script>
                </div>
            </div>
                               </div>
            <div id="table" class="table2">
                <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" id="TableUser21" style="margin-left: 50px;">
                        <div id="Table2User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User1Check">
                                <input type="checkbox" name="Table2User1Check" />
                            </span>
                        </div>
                        <div id="Table2User1Cart1" class="TableUserCart"></div>
                        <div id="Table2User1Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">21</div>
                    </div>
                    <div class="TableUser" id="TableUser22">
                        <div id="Table2User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User2Check">
                                <input type="checkbox" name="Table2User2Check" />
                            </span>
                        </div>
                        <div id="Table2User2Cart1" class="TableUserCart"></div>
                        <div id="Table2User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">22</div>
                    </div>
                    <div class="TableUser" id="TableUser23">
                        <div id="Table2User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User3Check">
                                <input type="checkbox" name="Table2User3Check" />
                            </span>
                        </div>
                        <div id="Table2User3Cart1" class="TableUserCart"></div>
                        <div id="Table2User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User3Progress" class="progressbar-cover"></em>
                            </span>  
                        </div>
                        <div class="UserNumber">23</div>
                    </div>
                </div>
                    <script>
                        $('#Table2User1Progress').css('bottom' , 40 + '%');
                        $('#Table2User2Progress').css('bottom' , 40 + '%');
                        $('#Table2User3Progress').css('bottom' , 40 + '%');
                    </script>
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    2</div>
                <div class="TableCart">
                <div id="Table2Flop1" class="flop"></div>
                <div id="Table2Flop2" class="flop"></div>
                <div id="Table2Flop3" class="flop"></div>
                <div id="Table2Tern" class="tern"></div>
                <div id="Table2River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    
                    <div class="TableUser" id="TableUser24" style="float: left;margin-left: 50px;">
                        <div id="Table2User4Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User4Check">
                                <input type="checkbox" name="Table2User4Check" />
                            </span>
                        </div>
                        <div id="Table2User4Cart1" class="TableUserCart"></div>
                        <div id="Table2User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">24</div>
                    </div>
                    <div class="TableUser" id="TableUser25" style="float: left;">
                        <div id="Table2User5Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User5CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User5Check">
                                <input type="checkbox" name="Table2User5Check" />
                            </span>
                        </div>
                        <div id="Table2User5Cart1" class="TableUserCart"></div>
                        <div id="Table2User5Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">25</div>
                    </div>
                    <div class="TableUser" id="TableUser26" style="float: left;">
                        <div id="Table2User6Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User6CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User6Check">
                                <input type="checkbox" name="Table2User6Check" />
                            </span>
                        </div>
                        <div id="Table2User6Cart1" class="TableUserCart"></div>
                        <div id="Table2User6Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">26</div>
                    </div>
                    <script>
                        $('#Table2User4Progress').css('bottom' , 40 + '%');
                        $('#Table2User5Progress').css('bottom' , 40 + '%');
                        $('#Table2User6Progress').css('bottom' , 40 + '%');
                    </script>
                </div>
            </div>
             </div>
            
            <div id="table" class="table3">
                <div style="float: left;width: 370px;">
                <div style="height: 95px;width: 370px;">
                    <div class="TableUser" id="TableUser31">
                        <div id="Table3User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User1Check">
                                <input type="checkbox" name="Table3User1Check" />
                            </span>
                        </div>
                        <div id="Table3User1Cart1" class="TableUserCart">
                        </div>
                        <div id="Table3User1Cart2" class="TableUserCart"></div>
                         <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">31</div>
                    </div>
                    <script>
                        $('#Table3User1Progress').css('bottom' , 40 + '%'); 
                    </script>
                    <div class="TableUser" id="TableUser32">
                        <div id="Table3User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User2Check">
                                <input type="checkbox" name="Table3User2Check" />
                            </span>
                        </div>
                        <div id="Table3User2Cart1" class="TableUserCart"></div>
                        <div id="Table3User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">32</div>
                    </div>
                    <script>$('#Table3User2Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser" id="TableUser33">
                        <div id="Table3User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User3Check">
                                <input type="checkbox" name="Table3User3Check" />
                            </span>
                        </div>
                        <div id="Table3User3Cart1" class="TableUserCart"></div>
                        <div id="Table3User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">33</div>
                    </div>
                    <script>$('#Table3User3Progress').css('bottom' , 40 + '%');</script>
                    
                    <div  class="TableUser" id="TableUser34">
                        <div id="Table3User4Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User4Check">
                                <input type="checkbox" name="Table3User4Check" />
                            </span>
                        </div>
                        <div id="Table3User4Cart1" class="TableUserCart"></div>
                        <div id="Table3User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">34</div>
                    </div>
                    <script>$('#Table3User4Progress').css('bottom' , 40 + '%');</script>
                </div>
                    
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    3</div>
                <div class="TableCart">
                    <div id="Table3Flop1" class="flop"></div>
                <div id="Table3Flop2" class="flop"></div>
                <div id="Table3Flop3" class="flop"></div>
                <div id="Table3Tern" class="tern"></div>
                <div id="Table3River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    <div  class="TableUser" id="TableUser35">
                        <div id="Table3User5Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User5CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User5Check">
                                <input type="checkbox" name="Table3User5Check" />
                            </span>
                        </div>
                        <div id="Table3User5Cart1" class="TableUserCart"></div>
                        <div id="Table3User5Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">35</div>
                    </div>
                    <script>
                        $('#Table3User5Progress').css('bottom' , 40 + '%');                
                    </script>
                    <div  class="TableUser" id="TableUser36">
                        <div id="Table3User6Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User6CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User6Check">
                                <input type="checkbox" name="Table3User6Check" />
                            </span>
                        </div>
                        <div id="Table3User6Cart1" class="TableUserCart"></div>
                        <div id="Table3User6Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">36</div>
                    </div>
                    <script>$('#Table3User6Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser" id="TableUser37">
                        <div id="Table3User7Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User7CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User7Check">
                                <input type="checkbox" name="Table3User7Check" />
                            </span>
                        </div>
                        <div id="Table3User7Cart1" class="TableUserCart"></div>
                        <div id="Table3User7Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User7Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">37</div>
                    </div>
                    <script>$('#Table3User7Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser" id="TableUser38">
                        <div id="Table3User8Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User8CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User8Check">
                                <input type="checkbox" name="Table3User8Check" />
                            </span>
                        </div>
                        <div id="Table3User8Cart1" class="TableUserCart"></div>
                        <div id="Table3User8Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User8Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">38</div>
                    </div>
                   <script>$('#Table3User8Progress').css('bottom' , 40 + '%');</script>
                </div>
            </div>
                
                </div>
                <div class="BetTable">
                    <div class="BetTableInfoTop">
                        <div style="float: left;margin-left: 5px;margin-top: 5px;">
                        <div style="float: left;">Коэф.</div>
                        <div id="Factor" style="margin-right:10px;float: left;">6,00</div>
                        <div style="float: left;">Мин.</div>
                        <div id="MinBet" style="margin-right:10px;float: left">4.0</div>
                        <div style="float: left;">Макс.</div>
                        <div id="MaxBet" style="float: left;">баланс</div>
                        </div>
                        
                        <div class="ExpressBet">
                        <div class="ExpressBetElipse">
                            <span class="niceCheck">
                                <input type="checkbox" id="ExpressCheck" />
                            </span>
                        </div><b>Экспресс</b></div>
                        </div>
                    <div class="BetTableSettings">
                        <div style="float: left;">    
                            <div class="ButtonExpressBetSum" id="SumBetDown">&lt</div>
                            <div class="ButtonExpressBetSum" id="SumBetUser">4.00</div>
                            <div class="Calculator" name="Calculator" id="Calculator">
                                <div class="CalculatorDisplay" id="DisplayCalculator">0</div>
                                <div id="CalculatorButtons" style="display: inline-block">
                                    <div style="float: left">
                                    <div class="CalcButt" id="CalcButt1">
                                        <b style="margin-left: 25px">1</b>
                                    </div>
                                    <div class="CalcButt" id="CalcButt2">
                                        <b style="margin-left: 25px">2</b>
                                    </div>
                                    <div class="CalcButt" id="CalcButt3">
                                        <b style="margin-left: 25px">3</b>
                                    </div>
                                    </div>
                                    <div style="float: left">
                                    <div class="CalcButt" id="CalcButt4">
                                        <b style="margin-left: 25px">4</b>
                                    </div>
                                    <div class="CalcButt" id="CalcButt5">
                                        <b style="margin-left: 25px">5</b>
                                    </div>
                                    <div class="CalcButt" id="CalcButt6">
                                        <b style="margin-left: 25px">6</b>
                                    </div>
                                    </div>
                                    <div style="float: left">
                                    <div class="CalcButt" id="CalcButt7">
                                        <b style="margin-left: 25px">7</b>
                                    </div>
                                    <div class="CalcButt" id="CalcButt8">
                                        <b style="margin-left: 25px">8</b>
                                    </div>
                                    <div class="CalcButt" id="CalcButt9">
                                        <b style="margin-left: 25px">9</b>
                                    </div>
                                    </div>
                                    <div style="float: left">
                                        <div class="CalcButt" id="CalcButt0" style="margin-left: 110px">
                                        <b style="margin-left: 25px">0</b>
                                    </div>
                                    </div>
                                </div>
                                <div id="SumMinAndMax" style="float: left;display: inline-block;width:295px">
                                    <div style="float: left;font-size: 12px;">Мин. ставка <div style="color: white;float: right;" id="CalcMinSumBet">4.0</div>
                                        </div>
                                    <div style="float:right;font-size: 12px;">Макс. ставка <div style="color: white;float: right;" id="CalcMaxSumBet">50.0</div>
                                    </div>
                                </div>
                                <div id="CalcButAppendAndMax" style="float: left;display: inline-block;width: 300px;">
                                    <div id="SetMaxBet" style="float:left" class="CalcButtAppend">Макс.</div>
                                    <div id="AppendSum" style="float:right" class="CalcButtAppend">Принять</div>
                                </div>
                            </div>
                            <div class="ButtonExpressBetSum" id="SumBetUp">&gt;</div>
                        </div>
                        <div style="float: right;">
                        <div class="ButtonExpressBetSum" id="ResetBets">X</div>
                        <div class="ButtonExpressBetEnter" id="SendNewBet">Сделать ставку</div>    
                        </div>
                        <div class="BetTableColumn" style="float: left">
                            <div style="float: left">
                            <div style="float: left;width: 120px;text-align: center">Дата</div>
                            <div style="float: left;width: 100px;text-align: center">Прогноз</div>
                            <div style="float: left;width: 70px;text-align: center">Ставка</div>
                            <div style="float: left;width: 60px;text-align: center">Выигрыш</div>
                            </div>
                            <div style="float: left" id="BetTableCollection">
                               
                            </div>
                        </div>
                        <div id="StatisticDialog" style="display: none">
                            <div style="margin-top: 60px;">
            <div id="table" class="table1">
                 <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" id="STableUser11" style="margin-left: 85px;">
                        <div id="STable1User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable1User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable1User1Check">
                                <input type="checkbox" name="STable1User1Check" />
                            </span>
                        </div>
                        <div id="STable1User1Cart1" class="TableUserCart"></div>
                        <div id="STable1User1Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable1User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">11</div>
                    </div>
                    <div class="TableUser" id="STableUser12" style="margin-left: 15px;">
                        <div id="STable1User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable1User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable1User2Check">
                                <input type="checkbox" name="STable1User2Check" />
                            </span>
                        </div>
                        <div id="STable1User2Cart1" class="TableUserCart"></div>
                        <div id="STable1User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable1User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">12</div>
                    </div>
                </div>
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    1</div>
                <div class="TableCart">
                <div id="STable1Flop1" class="flop"></div>
                <div id="STable1Flop2" class="flop"></div>
                <div id="STable1Flop3" class="flop"></div>
                <div id="STable1Tern" class="tern"></div>
                <div id="STable1River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    <div class="TableUser" id="STableUser13" style="margin-left: 85px;">
                        <div id="STable1User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable1User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable1User3Check">
                                <input type="checkbox" name="STable1User3Check" />
                            </span>
                        </div>
                        <div id="STable1User3Cart1" class="TableUserCart"></div>
                        <div id="STable1User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable1User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">13</div>
                    </div>
                    <div class="TableUser" id="STableUser14" style="margin-left: 15px;">
                        <div id="STable1User4Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable1User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable1User4Check">
                                <input type="checkbox" name="STable1User4Check" />
                            </span>
                        </div>
                        <div id="STable1User4Cart1" class="TableUserCart"></div>
                        <div id="STable1User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable1User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">14</div>
                    </div>
                </div>
            </div>
                               </div>
            <div id="table" class="table2">
                <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" id="STableUser21" style="margin-left: 50px;">
                        <div id="STable2User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable2User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable2User1Check">
                                <input type="checkbox" name="STable2User1Check" />
                            </span>
                        </div>
                        <div id="STable2User1Cart1" class="TableUserCart"></div>
                        <div id="STable2User1Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable2User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">21</div>
                    </div>
                    <div class="TableUser" id="STableUser22">
                        <div id="STable2User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable2User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable2User2Check">
                                <input type="checkbox" name="STable2User2Check" />
                            </span>
                        </div>
                        <div id="STable2User2Cart1" class="TableUserCart"></div>
                        <div id="STable2User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable2User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">22</div>
                    </div>
                    <div class="TableUser" id="STableUser23">
                        <div id="STable2User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable2User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable2User3Check">
                                <input type="checkbox" name="STable2User3Check" />
                            </span>
                        </div>
                        <div id="STable2User3Cart1" class="TableUserCart"></div>
                        <div id="STable2User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable2User3Progress" class="progressbar-cover"></em>
                            </span>  
                        </div>
                        <div class="UserNumber">23</div>
                    </div>
                </div>
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    2</div>
                <div class="TableCart">
                <div id="STable2Flop1" class="flop"></div>
                <div id="STable2Flop2" class="flop"></div>
                <div id="STable2Flop3" class="flop"></div>
                <div id="STable2Tern" class="tern"></div>
                <div id="STable2River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    
                    <div class="TableUser" id="STableUser24" style="float: left;margin-left: 50px;">
                        <div id="STable2User4Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable2User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable2User4Check">
                                <input type="checkbox" name="STable2User4Check" />
                            </span>
                        </div>
                        <div id="STable2User4Cart1" class="TableUserCart"></div>
                        <div id="STable2User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable2User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">24</div>
                    </div>
                    <div class="TableUser" id="STableUser25" style="float: left;">
                        <div id="STable2User5Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable2User5CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable2User5Check">
                                <input type="checkbox" name="STable2User5Check" />
                            </span>
                        </div>
                        <div id="STable2User5Cart1" class="TableUserCart"></div>
                        <div id="STable2User5Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable2User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">25</div>
                    </div>
                    <div class="TableUser" id="STableUser26" style="float: left;">
                        <div id="STable2User6Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable2User6CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable2User6Check">
                                <input type="checkbox" name="STable2User6Check" />
                            </span>
                        </div>
                        <div id="STable2User6Cart1" class="TableUserCart"></div>
                        <div id="STable2User6Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable2User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">26</div>
                    </div>
                </div>
            </div>
             </div>
            
            <div id="table" class="table3">
                <div style="float: left;width: 370px;">
                <div style="height: 95px;width: 370px;">
                    <div class="TableUser" id="STableUser31">
                        <div id="STable3User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User1Check">
                                <input type="checkbox" name="STable3User1Check" />
                            </span>
                        </div>
                        <div id="STable3User1Cart1" class="TableUserCart">
                        </div>
                        <div id="STable3User1Cart2" class="TableUserCart"></div>
                         <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">31</div>
                    </div>
                    <div class="TableUser" id="STableUser32">
                        <div id="STable3User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User2Check">
                                <input type="checkbox" name="STable3User2Check" />
                            </span>
                        </div>
                        <div id="STable3User2Cart1" class="TableUserCart"></div>
                        <div id="STable3User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">32</div>
                    </div>
                    <div class="TableUser" id="STableUser33">
                        <div id="STable3User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User3Check">
                                <input type="checkbox" name="STable3User3Check" />
                            </span>
                        </div>
                        <div id="STable3User3Cart1" class="TableUserCart"></div>
                        <div id="STable3User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">33</div>
                    </div>
                    <div  class="TableUser" id="STableUser34">
                        <div id="STable3User4Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User4Check">
                                <input type="checkbox" name="STable3User4Check" />
                            </span>
                        </div>
                        <div id="STable3User4Cart1" class="TableUserCart"></div>
                        <div id="STable3User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">34</div>
                    </div>
                </div>
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    3</div>
                <div class="TableCart">
                    <div id="STable3Flop1" class="flop"></div>
                <div id="STable3Flop2" class="flop"></div>
                <div id="STable3Flop3" class="flop"></div>
                <div id="STable3Tern" class="tern"></div>
                <div id="STable3River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    <div  class="TableUser" id="STableUser35">
                        <div id="STable3User5Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User5CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User5Check">
                                <input type="checkbox" name="STable3User5Check" />
                            </span>
                        </div>
                        <div id="STable3User5Cart1" class="TableUserCart"></div>
                        <div id="STable3User5Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">35</div>
                    </div>
                    <div  class="TableUser" id="STableUser36">
                        <div id="STable3User6Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User6CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User6Check">
                                <input type="checkbox" name="STable3User6Check" />
                            </span>
                        </div>
                        <div id="STable3User6Cart1" class="TableUserCart"></div>
                        <div id="STable3User6Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">36</div>
                    </div>
                    <div  class="TableUser" id="STableUser37">
                        <div id="STable3User7Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User7CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User7Check">
                                <input type="checkbox" name="Table3User7Check" />
                            </span>
                        </div>
                        <div id="STable3User7Cart1" class="TableUserCart"></div>
                        <div id="STable3User7Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User7Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">37</div>
                    </div>
                    <div  class="TableUser" id="STableUser38">
                        <div id="STable3User8Factor" class="TableUserFactor">
                            <div style="position: absolute" id="STable3User8CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="STable3User8Check">
                                <input type="checkbox" name="STable3User8Check" />
                            </span>
                        </div>
                        <div id="STable3User8Cart1" class="TableUserCart"></div>
                        <div id="STable3User8Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="STable3User8Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">38</div>
                    </div>
                </div>
            </div>
                </div>
                <div class="BetTable">
                    
                </div>
            </div>
                        </div>
<!--                        <div style="float:left">
                        <table id="StatisticListCurrentUser"><tr><td /></tr></table>
                        <div id="StatisticPagerCurrentUser"></div>
                        </div>-->
                    </div>
                </div>
            </div>
            <script>
               GetCurrentUserStatistic();
            </script>
<div class="rightCol"></div>
    </div>
             <jsp:include page="footer.jsp" flush="true" />
</body>