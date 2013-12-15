<%-- 
    Document   : newjsp
    Created on : Jul 11, 2013, 12:56:04 AM
    Author     : vadim
--%>

<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
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
    <div class="centerCol" style="margin-bottom: 50px;">
            
            <div  id="StatisticDialog" style="display: none;">
                <!--<div class="modal"></div>-->
                            <div style="float:left;height: 100px;background-color: white;">
                                <div style="float: left">
                                    <div  style="float: left;border: solid black 1px;width: 300px">
                                        <div style="float: left;">Внесение</div>
                                        <div id="SBetInfoBetSumRequest" style="float: right;">
                                            vgjhvjv
                                        </div>
                                    </div>
                                    <div  style="float: left;border: solid black 1px;width: 300px">
                                        <div style="float: left;">Ставка</div>
                                        <div id="SBetInfoBet" style="float: right;">
                                            vfdsdv
                                        </div>
                                    </div>
                                    <div  style="float: left;border: solid black 1px;width: 300px">
                                        <div style="float: left;">Тип ставки</div>
                                        <div id="SBetInfoBetType" style="float: right;">
                                            gfdsvfdsvfdsbd
                                        </div>
                                    </div>
                                    <div  style="float: left;border: solid black 1px;width: 300px">
                                        <div style="float: left;">Сумма выплаты</div>
                                        <div id="SBetInfoBetSumResponse" style="float: right;">
                                            fdgfdvfdbgfdbfd
                                        </div>
                                    </div>
                                </div>
                                <div style="float: right">
                                    <div  style="float: left;border: solid black 1px;width: 300px">
                                    <div style="float: left;">Состояние</div>
                                        <div id="SBetInfoStatus" style="float: right;">
                                            gfdsgfdsgfdsgfdsgfds
                                        </div>
                                    </div>
                                    <div style="float: left;border: solid black 1px;width: 300px">
                                    <div style="float: left;">Создано</div>
                                        <div id="SBetInfoDateBet" style="float: right;">
                                            gfdsgfdsgfdsgfds
                                        </div>
                                    </div>
                                    <div style="float: left;border: solid black 1px;width: 300px;height: 21px;">
                                     
                                    </div>
                                    <div style="float: left;border: solid black 1px;width: 300px;height: 21px;">
                                    
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 0px;">
                                <div id="table" class="Stable1">
                                    <div style="float: left;width: 240px;">
                                        <div style="height: 60px;width: 260px;">
                                            <div class="STableUser" id="STableUser11" style="margin-left: 45px;">
                        <div id="STable1User1Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable1User1CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable1User1Check">
                                <input type="checkbox" name="STable1User1Check" />
                            </span>
                        </div>
                                                <div id="SCartsUser11" class="CartsUser">
                        <div id="STable1User1Cart1" class="STableUserCart"></div>
                        <div id="STable1User1Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable1User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">11</div>
                    </div>
                    <div class="STableUser" id="STableUser12" style="margin-left: 5px;">
                        <div id="STable1User2Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable1User2CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable1User2Check">
                                <input type="checkbox" name="STable1User2Check" />
                            </span>
                        </div>
                        <div id="SCartsUser12" class="CartsUser">
                        <div id="STable1User2Cart1" class="STableUserCart"></div>
                        <div id="STable1User2Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable1User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">12</div>
                    </div>
                </div>
                <div class='StableNumber'>
                    <div style="height: 6px;"></div>
                    1</div>
                <div class="STableCart">
                <div id="STable1Flop1" class="Sflop"></div>
                <div id="STable1Flop2" class="Sflop"></div>
                <div id="STable1Flop3" class="Sflop"></div>
                <div id="STable1Tern" class="Stern"></div>
                <div id="STable1River" class="Sriver"></div>
                </div>
                <div style="float: left;margin-top: 15px;">
                    <div class="STableUser" id="STableUser13" style="margin-left: 45px;">
                        <div id="STable1User3Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable1User3CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable1User3Check">
                                <input type="checkbox" name="STable1User3Check" />
                            </span>
                        </div>
                        <div id="SCartsUser13" class="CartsUser">
                        <div id="STable1User3Cart1" class="STableUserCart"></div>
                        <div id="STable1User3Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable1User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">13</div>
                    </div>
                    <div class="STableUser" id="STableUser14" style="margin-left: 5px;">
                        <div id="STable1User4Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable1User4CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable1User4Check">
                                <input type="checkbox" name="STable1User4Check" />
                            </span>
                        </div>
                        <div id="SCartsUser14" class="CartsUser">
                        <div id="STable1User4Cart1" class="STableUserCart"></div>
                        <div id="STable1User4Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable1User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">14</div>
                    </div>
                </div>
            </div>
                               </div>
            <div id="table" class="Stable2">
                 <div style="float: left;width: 240px;">
                  <div style="height: 60px;width: 260px;">
                    <div class="STableUser" id="STableUser21" style="margin-left: 20px;">
                        <div id="STable2User1Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable2User1CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable2User1Check">
                                <input type="checkbox" name="STable2User1Check" />
                            </span>
                        </div>
                        <div id="SCartsUser21" class="CartsUser">
                        <div id="STable2User1Cart1" class="STableUserCart"></div>
                        <div id="STable2User1Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable2User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">21</div>
                    </div>
                      
                    <div class="STableUser" id="STableUser22">
                        <div id="STable2User2Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable2User2CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable2User2Check">
                                <input type="checkbox" name="STable2User2Check" />
                            </span>
                        </div>
                        <div id="SCartsUser22" class="CartsUser">
                        <div id="STable2User2Cart1" class="STableUserCart"></div>
                        <div id="STable2User2Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable2User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">22</div>
                    </div>
                    <div class="STableUser" id="STableUser23">
                        <div id="STable2User3Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable2User3CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable2User3Check">
                                <input type="checkbox" name="STable2User3Check" />
                            </span>
                        </div>
                        <div id="SCartsUser23" class="CartsUser">
                        <div id="STable2User3Cart1" class="STableUserCart"></div>
                        <div id="STable2User3Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable2User3Progress" class="progressbar-cover"></em>
                            </span>  
                        </div>
                        <div class="SUserNumber">23</div>
                    </div>
                </div>
                <div class='StableNumber'>
                    <div style="height: 6px;"></div>
                    2</div>
                <div class="STableCart">
                <div id="STable2Flop1" class="Sflop"></div>
                <div id="STable2Flop2" class="Sflop"></div>
                <div id="STable2Flop3" class="Sflop"></div>
                <div id="STable2Tern" class="Stern"></div>
                <div id="STable2River" class="Sriver"></div>
                </div>
                <div style="float: left;margin-top: 15px;">
                    
                    <div class="STableUser" id="STableUser24" style="float: left;margin-left: 20px;">
                        <div id="STable2User4Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable2User4CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable2User4Check">
                                <input type="checkbox" name="STable2User4Check" />
                            </span>
                        </div>
                        <div id="SCartsUser24" class="CartsUser">
                        <div id="STable2User4Cart1" class="STableUserCart"></div>
                        <div id="STable2User4Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable2User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">24</div>
                    </div>
                    
                    <div class="STableUser" id="STableUser25" style="float: left;">
                        <div id="STable2User5Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable2User5CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable2User5Check">
                                <input type="checkbox" name="STable2User5Check" />
                            </span>
                        </div>
                        <div id="SCartsUser25" class="CartsUser">
                        <div id="STable2User5Cart1" class="STableUserCart"></div>
                        <div id="STable2User5Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable2User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">25</div>
                    </div>
                    <div class="STableUser" id="STableUser26" style="float: left;">
                        <div id="STable2User6Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable2User6CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable2User6Check">
                                <input type="checkbox" name="STable2User6Check" />
                            </span>
                        </div>
                        <div id="SCartsUser26" class="CartsUser">
                        <div id="STable2User6Cart1" class="STableUserCart"></div>
                        <div id="STable2User6Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable2User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">26</div>
                    </div>
                </div>
            </div>
             </div>
            
            <div id="table" class="Stable3">
                 <div style="float: left;width: 240px;">
                  <div style="height: 60px;width: 260px;">
                    <div class="STableUser" id="STableUser31">
                        <div id="STable3User1Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable3User1CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User1Check">
                                <input type="checkbox" name="STable3User1Check" />
                            </span>
                        </div>
                        <div id="SCartsUser31" class="CartsUser">
                        <div id="STable3User1Cart1" class="STableUserCart">
                        </div>
                        <div id="STable3User1Cart2" class="STableUserCart"></div>
                        </div>
                         <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">31</div>
                    </div>
                    <div class="STableUser" id="STableUser32">
                        <div id="STable3User2Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable3User2CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User2Check">
                                <input type="checkbox" name="STable3User2Check" />
                            </span>
                        </div>
                        <div id="SCartsUser32" class="CartsUser">
                        <div id="STable3User2Cart1" class="STableUserCart"></div>
                        <div id="STable3User2Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">32</div>
                    </div>
                    <div class="STableUser" id="STableUser33">
                        <div id="STable3User3Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable3User3CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User3Check">
                                <input type="checkbox" name="STable3User3Check" />
                            </span>
                        </div>
                        <div id="SCartsUser33" class="CartsUser">
                        <div id="STable3User3Cart1" class="STableUserCart"></div>
                        <div id="STable3User3Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">33</div>
                    </div>
                    <div  class="STableUser" id="STableUser34">
                        <div id="STable3User4Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable3User4CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User4Check">
                                <input type="checkbox" name="STable3User4Check" />
                            </span>
                        </div>
                        <div id="SCartsUser34" class="CartsUser">
                        <div id="STable3User4Cart1" class="STableUserCart"></div>
                        <div id="STable3User4Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">34</div>
                    </div>
                </div>
                     <div class='StableNumber' style="margin-left: 20px;">
                    <div style="height: 6px;"></div>
                    3</div>
                <div class="STableCart">
                    <div id="STable3Flop1" class="Sflop"></div>
                <div id="STable3Flop2" class="Sflop"></div>
                <div id="STable3Flop3" class="Sflop"></div>
                <div id="STable3Tern" class="Stern"></div>
                <div id="STable3River" class="Sriver"></div>
                </div>
                <div style="float: left;margin-top: 15px;width: 260px;">
                    <div  class="STableUser" id="STableUser35">
                        <div id="STable3User5Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable3User5CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User5Check">
                                <input type="checkbox" name="STable3User5Check" />
                            </span>
                        </div>
                        <div id="SCartsUser35" class="CartsUser">
                        <div id="STable3User5Cart1" class="STableUserCart"></div>
                        <div id="STable3User5Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">35</div>
                    </div>
                    <div  class="STableUser" id="STableUser36">
                        <div id="STable3User6Factor" class="STableUserFactor">
                            <div style="position: absolute;" id="STable3User6CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User6Check">
                                <input type="checkbox" name="STable3User6Check" />
                            </span>
                        </div>
                        <div id="SCartsUser36" class="CartsUser">
                        <div id="STable3User6Cart1" class="STableUserCart"></div>
                        <div id="STable3User6Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">36</div>
                    </div>
                    <div  class="STableUser" id="STableUser37">
                        <div id="STable3User7Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable3User7CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User7Check">
                                <input type="checkbox" name="Table3User7Check" />
                            </span>
                        </div>
                        <div id="SCartsUser37" class="CartsUser">
                        <div id="STable3User7Cart1" class="STableUserCart"></div>
                        <div id="STable3User7Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User7Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">37</div>
                    </div>
                    <div  class="STableUser" id="STableUser38">
                        <div id="STable3User8Factor" class="STableUserFactor">
                            <div style="position: absolute" id="STable3User8CheckBackground" class="STableUserCheckBackground">1.88</div>
                            <span class="STableUserCheck" id="STable3User8Check">
                                <input type="checkbox" name="STable3User8Check" />
                            </span>
                        </div>
                        <div id="SCartsUser38" class="CartsUser">
                        <div id="STable3User8Cart1" class="STableUserCart"></div>
                        <div id="STable3User8Cart2" class="STableUserCart"></div>
                        </div>
                        <div class="progressbar">
                            <span class="Sprogressbar-value">
                                <em id="STable3User8Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="SUserNumber">38</div>
                    </div>
                </div>
            </div>
                </div>
                <div class="SBetTable">
                   <div style="float: left;margin-left: 45px">Раунд:<div style="float: right;" id="StatisticRaund"></div></div>
                    <div id="SBetInfoStageBet" style="float: left;margin-left: 75px"></div>
                    <div style="float: left;width: 200px"><div style="float: left">Стол 1:</div><div style="float: left" id="StatisticForecastTable1">12,12,12,12</div></div>
                    <div style="float: left;width: 200px"><div style="float: left">Стол 2:</div><div style="float: left" id="StatisticForecastTable2">22,22,22,22</div></div>
                    <div style="float: left;width: 200px"><div style="float: left">Стол 3:</div><div style="float: left" id="StatisticForecastTable3">33,33,33,33</div></div>
              
                </div>
            </div>
                        </div>
            <div id="menuGame" >
                <div class="SmallLogo"></div>
                <div style="float: left;color: white;margin-top: 15px;font-size: 11px;">
                    <div style="display: none;" id="CurrentStage">-1</div>
                    <div style="float: left;">
                    Время до
                    </div>
                    <div id="ShowNextStage" style="min-width: 50px;float: left;margin-left: 5px">Префлоп</div>
                    <div style="float: left">
                    Раунд
                    </div>
                    <div id="ShowCurrentRaund" style="min-width: 40px;float: left;margin-left: 5px;">0</div>
                        
                </div>
                <div id="progressbar">
                    <b style="position: absolute;margin-left: 60px;" id="BaseProgressTime"></b>
                </div>
                <script> 
                    $("#progressbar").progressbar({value: 37});
                  //  GetCurrentUserStatistic();
                </script>
                <div class="button" style="margin-top: 10px;margin-left: 10px;float: left">
                    Объяснение
                    <form class="dropdownMenu" style="font-size: 11px;top: 200 !important; left: 200px;width: 350px;height: 450px;display: none">
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">
                                    Флеш-рояль
                                </div>
                                <div style="float: right;">
                                    5 старших карт одной масти
                                </div>
                            </div>
                        <img style="float: right;" src="/pic/cart1.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">
                                    Стрит-флеш
                                </div>
                                <div style="float: right;">
                                    5 последовательных карт одной масти
                                </div>
                            </div>
                        <img style="float: right;" src="/pic/cart2.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">Каре</div>
                                <div style="float: right;">4 карты одного достоинства</div>
                            </div>
                        <img style="float: right;" src="/pic/cart3.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">Фулл-хаус</div>
                                <div style="float: right;">3 карты одного достоинства и 2 другого</div>
                            </div>
                        <img style="float: right;" src="/pic/cart4.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">Флеш</div>
                                <div style="float: right;">5 карт одной масти</div>
                            </div>
                        <img style="float: right;" src="/pic/cart5.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">Стрит</div>
                                <div style="float: right;">5 последовательных карт</div>
                            </div>
                        <img style="float: right;" src="/pic/cart6.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">Тройка</div>
                                <div style="float: right;">3 карты одного достоинства</div>
                            </div>
                        <img style="float: right;" src="/pic/cart7.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">Две пары</div>
                                <div style="float: right;">2 карты одного достоинства и 2 другого</div>
                            </div>
                        <img style="float: right;" src="/pic/cart8.png">
                        </div>
                        <div style="width: 100%; margin-top: 5px; display: inline-block;">
                            <div style="float: left;width: 165px;">
                                <div style="float: left;text-align: right;width: 100%;">Пара</div>
                                <div style="float: right;">2 карты одного достоинства</div>
                            </div>
                        <img style="float: right;" src="/pic/cart9.png">
                        </div>
                    </form>
                </div>
                <div style="background-image: url('/pic/UserImage.png');width: 17px;height: 23px;float: left;margin-top: 10px;margin-left: 10px;"></div>
                <div style="float: left;margin-top: 10px;margin-left: 10px;font-size: 15px;color: whitesmoke;">login: 
                <%Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                        UserDetails userDetails = null;
                        if (principal instanceof UserDetails) {
                            userDetails = (UserDetails) principal;} 
                        String s="";
                        if(userDetails!=null)%>
                        <%=userDetails.getUsername()%>
                        </div>
                        <div id='BalanceUser' style="float: left;margin-top: 10px;margin-left: 10px;font-size: 15px;color: whitesmoke;">0</div>
                        <div style="float: left;margin-top: 10px;font-size: 15px;color: whitesmoke;">$</div>
                       <div style="display:inline-block;float: left;margin-top: 10px;margin-left: 10px;font-size: 15px;color: whitesmoke;"> 
                        <form action="j_spring_security_logout" method="Post">
                            <input class="button" type="submit" value="Выход"/>
                        </form>
                         
                    </div>
                        <div class="button" style="float: left;margin-top: 10px;margin-left: 10px;font-size: 15px;color: whitesmoke;">Язык
                            <form class="dropdownMenu" id="language" method="GET" action="#">
                                <input class="active" type="submit" name="language" value="Русский"/>
                                <input type="submit" name="language" value="English"/>
                                <input type="submit" name="language" value="Germany"/>
                        </form>
                        </div>
            </div>
            <div style="margin-top: 60px;">
                <div style="float: left;display: inline-block;width: 100%">
            <div id="table" class="table1">
                 <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 270px;margin-left: 70px;">
                    <div class="TableUser" id="TableUser11" style="float: left">
                        <div id="Table1User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table1User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User1Check">
                                <input type="checkbox" name="Table1User1Check" />
                            </span>
                        </div>
                        <div id="CartsUser11" class="CartsUser">
                        <div id="Table1User1Cart1" class="TableUserCart"></div>
                        <div id="Table1User1Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">11</div>
                    </div>
                    <script>$('#Table1User1Progress').css('bottom' , 40 + '%');
                    </script>
                    <div class="TableUser" id="TableUser12" style="float: right;">
                        <div id="Table1User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table1User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User2Check">
                                <input type="checkbox" name="Table1User2Check" />
                            </span>
                        </div>
                        <div id="CartsUser12" class="CartsUser">
                        <div id="Table1User2Cart1" class="TableUserCart"></div>
                        <div id="Table1User2Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">12</div>
                    </div>
                    <script>$('#Table1User2Progress').css('bottom' , 40 + '%');</script>
                </div>
                    
                
                <div class="TableCart">
                <div id="Table1Flop1" class="flop"></div>
                <div id="Table1Flop2" class="flop"></div>
                <div id="Table1Flop3" class="flop"></div>
                <div id="Table1Tern" class="tern"></div>
                <div id="Table1River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 15px;width: 270px;margin-left: 70px;">
                    <div class="TableUser" id="TableUser13" style="float: left">
                        <div id="Table1User3Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table1User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User3Check">
                                <input type="checkbox" name="Table1User3Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">13</div>
                        <div id="CartsUser13" class="CartsUser">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        
                    </div>
                    <script>$('#Table1User3Progress').css('bottom' , 40 + '%');</script>
                    <div class="TableUser" id="TableUser14" style="float: right">
                        <div id="Table1User4Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table1User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table1User4Check">
                                <input type="checkbox" name="Table1User4Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">14</div>
                        <div id="CartsUser14" class="CartsUser">
                        <div id="Table1User4Cart1" class="TableUserCart"></div>
                        <div id="Table1User4Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                       
                    </div>
                    <script>$('#Table1User4Progress').css('bottom' , 40 + '%');</script>
                </div>
            </div>
                               </div>
                    
            <div id="table" class="table2">
                <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 330px;margin-left: 50px;">
                    <div class="TableUser" id="TableUser21">
                        <div id="Table2User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User1Check">
                                <input type="checkbox" name="Table2User1Check" />
                            </span>
                        </div>
                        <div id="CartsUser21" class="CartsUser" >
                        <div id="Table2User1Cart1" class="TableUserCart"></div>
                        <div id="Table2User1Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">21</div>
                    </div>
                    <div class="TableUser" id="TableUser22" style="margin-left: 20px;">
                        <div id="Table2User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User2Check">
                                <input type="checkbox" name="Table2User2Check" />
                            </span>
                        </div>
                        <div id="CartsUser22" class="CartsUser">
                        <div id="Table2User2Cart1" class="TableUserCart"></div>
                        <div id="Table2User2Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">22</div>
                    </div>
                    <div class="TableUser" id="TableUser23" style="margin-left: 20px;">
                        <div id="Table2User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table2User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User3Check">
                                <input type="checkbox" name="Table2User3Check" />
                            </span>
                        </div>
                        <div id="CartsUser23" class="CartsUser">
                        <div id="Table2User3Cart1" class="TableUserCart"></div>
                        <div id="Table2User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
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
                
                <div class="TableCart">
                <div id="Table2Flop1" class="flop"></div>
                <div id="Table2Flop2" class="flop"></div>
                <div id="Table2Flop3" class="flop"></div>
                <div id="Table2Tern" class="tern"></div>
                <div id="Table2River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 15px;width: 330px;margin-left: 50px;">
                    
                    <div class="TableUser" id="TableUser24">
                        <div id="Table2User4Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table2User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User4Check">
                                <input type="checkbox" name="Table2User4Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">24</div>
                        <div id="CartsUser24" class="CartsUser">
                        <div id="Table2User4Cart1" class="TableUserCart"></div>
                        <div id="Table2User4Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <div class="TableUser" id="TableUser25" style="margin-left: 20px;">
                        <div id="Table2User5Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table2User5CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User5Check">
                                <input type="checkbox" name="Table2User5Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">25</div>
                        <div id="CartsUser25" class="CartsUser">
                        <div id="Table2User5Cart1" class="TableUserCart"></div>
                        <div id="Table2User5Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        
                    </div>
                    <div class="TableUser" id="TableUser26" style="margin-left: 20px;">
                        <div id="Table2User6Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table2User6CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table2User6Check">
                                <input type="checkbox" name="Table2User6Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">26</div>
                        <div id="CartsUser26" class="CartsUser">
                        <div id="Table2User6Cart1" class="TableUserCart"></div>
                        <div id="Table2User6Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        
                    </div>
                    <script>
                        $('#Table2User4Progress').css('bottom' , 40 + '%');
                        $('#Table2User5Progress').css('bottom' , 40 + '%');
                        $('#Table2User6Progress').css('bottom' , 40 + '%');
                    </script>
                </div>
            </div>
             </div>
                </div>
                <div style="float: left;display: inline-block;width: 100%;margin-top: 30px;">
            <div id="table" class="table3">
                <div style="float: left;width: 410px;">
                <div style="height: 95px;width: 410px;">
                    <div class="TableUser" id="TableUser31" >
                        <div id="Table3User1Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User1CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User1Check">
                                <input type="checkbox" name="Table3User1Check" />
                            </span>
                        </div>
                        <div id="CartsUser31" class="CartsUser">
                        <div id="Table3User1Cart1" class="TableUserCart">
                        </div>
                        <div id="Table3User1Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
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
                    <div class="TableUser" id="TableUser32" style="margin-left: 10px;">
                        <div id="Table3User2Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User2CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User2Check">
                                <input type="checkbox" name="Table3User2Check" />
                            </span>
                        </div>
                        <div id="CartsUser32" class="CartsUser">
                        <div id="Table3User2Cart1" class="TableUserCart"></div>
                        <div id="Table3User2Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">32</div>
                    </div>
                    <script>$('#Table3User2Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser" id="TableUser33" style="margin-left: 10px;">
                        <div id="Table3User3Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User3CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User3Check">
                                <input type="checkbox" name="Table3User3Check" />
                            </span>
                        </div>
                        <div id="CartsUser33" class="CartsUser">
                        <div id="Table3User3Cart1" class="TableUserCart"></div>
                        <div id="Table3User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">33</div>
                    </div>
                    <script>$('#Table3User3Progress').css('bottom' , 40 + '%');</script>
                    
                    <div  class="TableUser" id="TableUser34" style="margin-left: 10px;">
                        <div id="Table3User4Factor" class="TableUserFactor">
                            <div style="position: absolute" id="Table3User4CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User4Check">
                                <input type="checkbox" name="Table3User4Check" />
                            </span>
                        </div>
                        <div id="CartsUser34" class="CartsUser">
                        <div id="Table3User4Cart1" class="TableUserCart"></div>
                        <div id="Table3User4Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                        <div class="UserNumber">34</div>
                    </div>
                    <script>$('#Table3User4Progress').css('bottom' , 40 + '%');</script>
                </div>
                    
               
                <div class="TableCart">
                    <div id="Table3Flop1" class="flop"></div>
                <div id="Table3Flop2" class="flop"></div>
                <div id="Table3Flop3" class="flop"></div>
                <div id="Table3Tern" class="tern"></div>
                <div id="Table3River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 15px;">
                    <div  class="TableUser" id="TableUser35">
                        <div id="Table3User5Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table3User5CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User5Check">
                                <input type="checkbox" name="Table3User5Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">35</div>
                        <div id="CartsUser35" class="CartsUser">
                        <div id="Table3User5Cart1" class="TableUserCart"></div>
                        <div id="Table3User5Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>
                        $('#Table3User5Progress').css('bottom' , 40 + '%');                
                    </script>
                    <div  class="TableUser" id="TableUser36" style="margin-left: 10px;">
                        <div id="Table3User6Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table3User6CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User6Check">
                                <input type="checkbox" name="Table3User6Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">36</div>
                        <div id="CartsUser36" class="CartsUser">
                        <div id="Table3User6Cart1" class="TableUserCart"></div>
                        <div id="Table3User6Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table3User6Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser" id="TableUser37" style="margin-left: 10px;">
                        <div id="Table3User7Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table3User7CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User7Check">
                                <input type="checkbox" name="Table3User7Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">37</div>
                        <div id="CartsUser37" class="CartsUser">
                        <div id="Table3User7Cart1" class="TableUserCart"></div>
                        <div id="Table3User7Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User7Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table3User7Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser" id="TableUser38" style="margin-left: 10px;">
                        <div id="Table3User8Factor" class="TableUserFactor" style="margin-top: 80px">
                            <div style="position: absolute" id="Table3User8CheckBackground" class="TableUserCheckBackground">1.88</div>
                            <span class="TableUserCheck" id="Table3User8Check">
                                <input type="checkbox" name="Table3User8Check" />
                            </span>
                        </div>
                        <div style="color: white;font-size: 12px;margin-bottom: 10px;">38</div>
                        <div id="CartsUser38" class="CartsUser">
                        <div id="Table3User8Cart1" class="TableUserCart"></div>
                        <div id="Table3User8Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                        </div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User8Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                   <script>$('#Table3User8Progress').css('bottom' , 40 + '%');</script>
                </div>
            </div>
                
                </div>
                <div class="BetTable">
                    <div class="BetTableInfoTop">
                        <div style="float: left;margin-left: 5px;margin-top: 5px;">
                        <div style="float: left;font-size: 14px;">Коэф.</div>
                        <div id="Factor" style="margin-right:10px;float: left;font-size: 14px;">0</div>
                        <div style="float: left;font-size: 14px;">Мин.</div>
                        <div id="MinBet" style="margin-right:10px;float: left;font-size: 14px;">0</div>
                        <div style="float: left;font-size: 14px;">Макс.</div>
                        <div id="MaxBet" style="float: left;font-size: 14px;">0</div>
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
                            <div class="modalCalc" id="ModalBackCalc" style="display: none;z-index: 1;">
                            <div class="Calculator" name="Calculator" id="Calculator" style="width: 410px;height: 520px;display: none">
                                <!--<div class="modalCalc"></div>-->
                                <div class="CalculatorDisplay">
                                    <div id="DisplayCalculator" style="float: right;font-size: 27px;margin-top: 20px;margin-right: 10px;">
                                        0
                                    </div>
                                </div>
                                <div id="CalculatorButtons" style="display: inline-block">
                                    <div style="float: left;margin-top: 20px;">
                                    <div class="CalcButt" id="CalcButt1">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">1</div>
                                    </div>
                                    <div class="CalcButt" id="CalcButt2">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">2</div>
                                    </div>
                                    <div class="CalcButt" id="CalcButt3">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">3</div>
                                    </div>
                                    </div>
                                    <div style="float: left;margin-top: 20px;">
                                    <div class="CalcButt" id="CalcButt4">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">4</div>
                                    </div>
                                    <div class="CalcButt" id="CalcButt5">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">5</div>
                                    </div>
                                    <div class="CalcButt" id="CalcButt6">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">6</div>
                                    </div>
                                    </div>
                                    <div style="float: left;margin-top: 20px;">
                                    <div class="CalcButt" id="CalcButt7">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">7</div>
                                    </div>
                                    <div class="CalcButt" id="CalcButt8">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">8</div>
                                    </div>
                                    <div class="CalcButt" id="CalcButt9">
                                        <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">9</div>
                                    </div>
                                    </div>
                                    <div style="float: left;margin-top: 20px;">
                                        <div class="CalcButt" id="CalcButt0" style="margin-left: 110px">
                                            <div style="font-size: 30px;margin-left: 25px;margin-top: 15px;">0</div>
                                    </div>
                                    </div>
                                </div>
                                <div id="SumMinAndMax" style="float: left;display: inline-block;width: 250px;margin-left: 20px;margin-top: 10px;margin-bottom: 20px;">
                                    <div style="float: left;font-size: 12px;color: whitesmoke;font-weight: 600">Мин. ставка <div style="float: right;" id="CalcMinSumBet">&nbsp;4.0</div>
                                        </div>
                                    <div style="float:right;font-size: 12px;color: whitesmoke;font-weight: 600">Макс. ставка <div style="float: right;" id="CalcMaxSumBet">&nbsp;50.0</div>
                                    </div>
                                </div>
                                <div id="CalcButAppendAndMax" style="float: left;display: inline-block;width: 250px;margin-left: 20px;">
                                    <div id="SetMaxBet" style="float:left;text-align: center;width: 100px;border-radius: 7px;color: whitesmoke;height: 30px;" class="CalcButtAppend">Макс.</div>
                                    <div id="AppendSum" style="float: right;text-align: center;width: 130px;height: 30px;border-radius: 7px;color: whitesmoke;background-image: url('/pic/ButtState4.png');background-size: cover;" class="CalcButtAppend">Принять</div>
                                </div>
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
                            <div style="float: left;width: 120px;text-align: center;font-size: 14px;margin-left: 5px;">Дата</div>
                            <div style="float: left;width: 100px;text-align: center;margin-left: 20px;font-size: 14px;">Прогноз</div>
                            <div style="float: left;width: 70px;text-align: center;margin-left: 10px;font-size: 14px;">Ставка</div>
                            <div style="float: left;width: 60px;text-align: center;font-size: 14px;">Выигрыш</div>
                            </div>
                            <div style="float: left;" id="BetTableCollection">
                               
                            </div>
                        </div>
                        
                        <div id="modalWait" class="modal" style="background-image: url(/pic/ajax-loader.gif);display: none;"></div>
                        
<!--                        <div style="float:left">
                        <table id="StatisticListCurrentUser"><tr><td /></tr></table>
                        <div id="StatisticPagerCurrentUser"></div>
                        </div>-->
                    </div>
                </div>
                </div>
            </div>
            <script>
                (function($) {
    $(function() {
        $('.jcarousel').jcarousel({wrap: 'circular'});

        $('.jcarousel-control-prev')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '-=1'
            });

        $('.jcarousel-control-next')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '+=1'
            });

        $('.jcarousel-pagination')
            .on('jcarouselpagination:active', 'a', function() {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function() {
                $(this).removeClass('active');
            })
            .jcarouselPagination();
    });
})(jQuery);
              // GetCurrentUserStatistic();
     
    
            </script>
            <div style="width: 100%;height: 130px;display: inline-block;margin-top: 50px;">
                <div style="color: whitesmoke;font-size: 22px;">Платежные системы</div>
            <div class="jcarousel-wrapper">
            <div class="jcarousel">
            <ul>
                <li><img src="/pic/paySystem/beeline.png" style="margin-top: 10px;"></li>
		<li><img src="/pic/paySystem/evro.png"></li>
		<li><img src="/pic/paySystem/megafon.png"></li>
		<li><img src="/pic/paySystem/mts.png"></li>
                <li><img src="/pic/paySystem/mts.png"></li>
		<li><img src="/pic/paySystem/novoplat.png"></li>
                <li><img src="/pic/paySystem/novoplat.png"></li>
		<!--<li><img src="/pic/paySystem/plats.png"></li>-->
		    </ul>
            </div>
                <a data-jcarouselcontrol="true" href="#" class="jcarousel-control-prev"><img src="/pic/paySystem/toLeft.png"></a>
                <a data-jcarouselcontrol="true" href="#" class="jcarousel-control-next inactive"><img src="/pic/paySystem/toRight.png"></a>
                </div>
                </div>
<div class="rightCol"></div>

    </div>
    
             <jsp:include page="footer.jsp" flush="true" />
</body>