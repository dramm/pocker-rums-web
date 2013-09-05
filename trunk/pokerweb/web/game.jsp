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
                </script>
                <div class="button">
                    Объяснение
                </div>
            </div>
            <div style="margin-top: 60px;">
            <div id="table" class="table1">
                 <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" style="margin-left: 85px;">
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
                        <div class="UserNumber">1</div>
                    </div>
                    <script>$('#Table1User1Progress').css('bottom' , 40 + '%');
                    </script>
                    <div class="TableUser" style="margin-left: 15px;">
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
                        <div class="UserNumber">2</div>
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
                    <div class="TableUser" style="margin-left: 85px;">
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
                        <div class="UserNumber">3</div>
                    </div>
                    <script>$('#Table1User3Progress').css('bottom' , 40 + '%');</script>
                    <div class="TableUser" style="margin-left: 15px;">
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
                        <div class="UserNumber">4</div>
                    </div>
                    <script>$('#Table1User4Progress').css('bottom' , 40 + '%');</script>
                </div>
            </div>
                               </div>
            <div id="table" class="table2">
                <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" style="margin-left: 50px;">
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
                        <div class="UserNumber">1</div>
                    </div>
                    <div class="TableUser">
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
                        <div class="UserNumber">2</div>
                    </div>
                    <div class="TableUser">
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
                        <div class="UserNumber">3</div>
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
                    
                    <div class="TableUser" style="float: left;margin-left: 50px;">
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
                        <div class="UserNumber">4</div>
                    </div>
                    <div class="TableUser" style="float: left;">
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
                        <div class="UserNumber">5</div>
                    </div>
                    <div class="TableUser" style="float: left;">
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
                        <div class="UserNumber">6</div>
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
                <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser">
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
                        <div class="UserNumber">1</div>
                    </div>
                    <script>
                        $('#Table3User1Progress').css('bottom' , 40 + '%'); 
                    </script>
                    <div class="TableUser">
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
                        <div class="UserNumber">2</div>
                    </div>
                    <script>$('#Table3User2Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser">
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
                        <div class="UserNumber">3</div>
                    </div>
                    <script>$('#Table3User3Progress').css('bottom' , 40 + '%');</script>
                    
                    <div  class="TableUser">
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
                        <div class="UserNumber">4</div>
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
                    <div  class="TableUser">
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
                        <div class="UserNumber">5</div>
                    </div>
                    <script>
                        $('#Table3User5Progress').css('bottom' , 40 + '%');                
                    </script>
                    <div  class="TableUser">
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
                        <div class="UserNumber">6</div>
                    </div>
                    <script>$('#Table3User6Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser">
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
                        <div class="UserNumber">7</div>
                    </div>
                    <script>$('#Table3User7Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser">
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
                        <div class="UserNumber">8</div>
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
                        <div id="MinBet" style="margin-right:10px;float: left">0,5</div>
                        <div style="float: left;">Макс.</div>
                        <div id="MaxBet" style="float: left;">50,00</div>
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
                                <div class="CalculatorDisplay" id="DisplayCalculator"></div>
                                <div id="CalculatorButtons">
                                    <div style="float: left">
                                    <div class="CalcButt" id="CalcButt1"><b style="margin-top: 20px">1</b></div>
                                    <div class="CalcButt" id="CalcButt2"><b style="margin-top: 20px">2</b></div>
                                    <div class="CalcButt" id="CalcButt3"><b style="margin-top: 20px">3</b></div>
                                    </div>
                                    <div style="float: left">
                                    <div class="CalcButt" id="CalcButt4"><b style="margin-top: 20px">4</b></div>
                                    <div class="CalcButt" id="CalcButt5"><b style="margin-top: 20px">5</b></div>
                                    <div class="CalcButt" id="CalcButt6"><b style="margin-top: 20px">6</b></div>
                                    </div>
                                    <div style="float: left">
                                    <div class="CalcButt" id="CalcButt7"><b style="margin-top: 20px">7</b></div>
                                    <div class="CalcButt" id="CalcButt8"><b style="margin-top: 20px">8</b></div>
                                    <div class="CalcButt" id="CalcButt9"><b style="margin-top: 20px">9</b></div>
                                    </div>
                                    <div style="float: left">
                                    <div class="CalcButt" id="CalcButt9"><b style="margin-top: 20px">0</b></div>
                                    </div>
                                </div>
                                <div id="SumMinAndMax">
                                    <div style="color: white" id="CalcMinSumBet">4.0</div>
                                    <div style="color: white" id="CalcMaxSumBet">50.0</div>
                                </div>
                                <div id="CalcButAppendAndMax">
                                    <div id="SetMaxBet">Макс.</div>
                                    <div id="AppendSum">Принять</div>
                                </div>
                            </div>
                            <div class="ButtonExpressBetSum" id="SumBetUp">&gt;</div>
                        </div>
                        <div style="float: right;">
                        <div class="ButtonExpressBetSum">X</div>
                        <div class="ButtonExpressBetEnter" id="SendNewBet">Сделать ставку</div>    
                        </div>
                    </div>
                </div>
            </div>
<div class="rightCol"></div>
    </div>
             <jsp:include page="footer.jsp" flush="true" />
</body>