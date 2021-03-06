<%-- 
    Document   : HoldemUserGame
    Created on : Jan 12, 2014, 9:17:59 PM
    Author     : vadim
--%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/headParam.jsp" flush="true" />
        <script type="text/javascript" src="/js/holdem.js"></script>
    </head>
    <body style="background-image: url(/pic/backgroundGame.png);
    background-size: cover;
    font-family: arial;">
        <div id="header">
            <div class="leftCol"> </div>
            <div class="centerCol"> 
                <jsp:include page="/topMenu.jsp" flush="true" />
                <jsp:include page="/headerContent.jsp" flush="true" />
                <jsp:include page="/mainMenu.jsp" flush="true" />
            </div>
            <div class="rightCol"> </div>      
        </div>
            <div class="leftCol"></div>
            <div class="centerCol" style="margin-bottom: 50px;">
                <div id="StageCurrentTable" style="display: none">0</div>
                
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
                        
                <div id="BackToList" style="
                     cursor: pointer;
                     width: 100px;
                     height: 25px;
                     background-color: rgb(19, 30, 36);
                     text-align: center;
                     color: whitesmoke;
                   
                     ">Список</div>
                     
                <div id="DialogSelectSumToTable" style="display: none">
                    <div id="DisplaySummToTable" style="
                         width: 100px;
                         height: 20px;
                         margin-top: 30px;
                         margin-left: 100px;
                         text-align: center;">0$</div>
                    <input type="range" id="RangeSelectSumToTable" step = "0.1" value = "0" onchange="updateTextSum(this.value);" style="width: 100%;">
                    <div style="
                         width: 100%;
                         margin-top: 10px;
                         ">
                        <div id="DialogSumToTableCansel" style="
                             width: 100px;
                             float: left;
                             cursor: pointer
                             ">
                            <div style="text-align: center;">Cansel</div>
                        </div>
                        <div id="DialogSumToTableOk" style="
                             width: 100px;
                             float: right;
                             cursor: pointer;
                             ">
                            <div style="text-align: center;">OK</div>
                        </div>
                    </div>
                </div>
                
                
                
                <div style="display: none">
                    <div></div>
                    <div>
                        <div style="width: 300px;
height: 350px;
background-color: rgb(56, 79, 95);">
                            <div style="width: 100%;
height: 30px;
text-align: center;
color: whitesmoke;">Buy-in And Fee</div>
                            <div style="
                                 width: 50%;
height: 100px;
margin-left: 70px;
margin-top: 20px;">
                                <div style="
                                     width: 100px;
height: 60px;
background-color: rgb(40, 62, 76);
float: right;">
                                    
                                </div>
                                <div style="float: left;
position: absolute;
width: 115px;">
                                    <div style="
                                         float: left;
                                         color: whitesmoke;
                                         ">1ST</div>
                                    <div style="
                                         float: right;
                                         color: whitesmoke;
                                         ">$250</div>
                                </div>
                                <div style="position: absolute;
margin-top: 20px;
width: 115px;">
                                    <div style="
                                         float: left;
                                         color: whitesmoke;
                                         ">2ND</div>
                                    
                                    <div style="
                                         float: right;
                                         color: whitesmoke;
                                         ">$150</div>
                                </div>
                                <div style="width: 115px;
margin-top: 40px;
position: absolute;">
                                    <div style="
                                         float: left;
                                         color: whitesmoke;
                                         ">3RD</div>
                                    
                                    <div style="
                                         float: right;
                                         color: whitesmoke;
                                         ">$100</div>
                                </div>
                            </div>
                            <div style="width: 100%">
                                <div style="width: 100%;
color: whitesmoke;
text-align: center;">Buy-in and Fee</div>
                                <div></div>
                            </div>
                            
                            <div style="
                                 width: 55%;
height: 100px;
margin-left: 70px;
margin-top: 20px;">
                                <div style="
                                     width: 100px;
height: 60px;
background-color: rgb(40, 62, 76);
float: right;">
                                    
                                </div>
                                <div style="float: left;
position: absolute;
width: 100px;">
                                    <div style="
                                         float: left;
                                         color: whitesmoke;
                                         ">Players</div>
                                    <div style="
                                         float: right;
                                         color: whitesmoke;
                                         ">5</div>
                                </div>
                                <div style="position: absolute;
margin-top: 20px;
width: 125px;">
                                    <div style="
                                         float: left;
                                         color: whitesmoke;
                                         ">Buy-in</div>
                                    
                                    <div style="
                                         float: right;
                                         color: whitesmoke;
                                         ">$100</div>
                                </div>
                                <div style="width: 115px;
margin-top: 40px;
position: absolute;">
                                    <div style="
                                         float: left;
                                         color: whitesmoke;
                                         ">Fee</div>
                                    
                                    <div style="
                                         float: right;
                                         color: whitesmoke;
                                         ">$10</div>
                                </div>
                            </div>
                            
                            
                            <div style="width: 100%;
height: 35px;">
                                <div style="color: whitesmoke;
text-align: center;
width: 140px;
height: 30px;
float: left;
background-color: rgb(40, 123, 175);" id="ButtCanselSelectSumm">
                                    CANSEL
                                </div>
                                <div style="color: whitesmoke;
text-align: center;
width: 140px;
float: right;
height: 30px;
background-color: rgb(40, 123, 175);" id="ButtSelectSumm">
                                    OK
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="SelectTablePanel" style="
                     width: 700px;
                     height: 200px;
                     background-color: rgb(19, 30, 36);
                     margin-left: 100px;
                     margin-top: 100px;
                  
                     ">
                    <div style="
                         width: 100%;
                         height: 25px;
                         border: 1px solid red;
                         color: whitesmoke;
                         text-align: center;
                         ">
                        Список столов
                    </div>
                    <div style="margin-left: 10px"><table id="ListTables"><tr><td /></tr></table></div>
                <div style="width: 100%;height: 40px">
                    <div style="width: 300px;height: 100%;float: left;"></div>
                    <div id="JoinTable" style="
                         float: right;
                         width: 100px;
                         height: 30px;
                         border: 1px solid red;
                         text-align: center;
                         cursor: pointer;
                         background-color: #256388;
                         margin-top: 5px;
                         ">JOIN</div>
                </div>
                </div>
                
                <div id="Tables" style="display: none" class="tableHoldem">
                    <div class="TableImageHoldem"></div>
                 <div class="TableCartHoldem">
                <div id="Table1Flop1" class="flop"></div>
                <div id="Table1Flop2" class="flop"></div>
                <div id="Table1Flop3" class="flop"></div>
                <div id="Table1Tern" class="tern"></div>
                <div id="Table1River" class="river"></div>
                </div>
                    <div id="bank" class="BankHoldem"></div>
                    
                    
                    
                    <!--
                    ***********************************************************
                    ***********************************************************
                    Table9
                    ***********************************************************
                    ***********************************************************
                    -->
             <div style="float: left;width: 100%;height: 100%;display: none" id="Table9Users">
                 <div class="TableGirl"></div>
                <div style="height: 95px;width: 100%;">
                   
                    <div class="UserHoldemGame" id="Table9User8" style="float: left;margin-left: 250px;">
                        <div>
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User8Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User8Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table9User8Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                            display: none;
                             "></div>
                             <div id="Table9User8Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="
                             width: 69px;
                             height: 90px;
                             float: right;
                             ">
                        <div id="Table9User8Name" style="color: #fee006;height: 20px;">
                        </div>
                            <div id="Table9User8Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User8Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User8SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    
                    <div id="Table9User8CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 360px;
                         margin-top: 135px;
                         "></div>
    
                    <div class="UserHoldemGame" id="Table9User0" style="
                         float: right;
                         margin-right: 240px;
                         ">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User0Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             
                            <div id="Table9User0Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table9User0Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                        <div id="Table9User0Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User0Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User0SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User0Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User0Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div>
                    <div id="Table9User0CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 550px;
                         margin-top: 135px;
                         "></div>
                </div>
                
                <div style="
                     float: left;
                     width: 100%;
                     height: 95px;
                     margin-top: 20px;
                     ">
                   <div class="UserHoldemGame" id="Table9User7" style="float: left;">
                        <div>
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User7Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User7Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table9User7Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             display: none;
                             "></div>
                             <div id="Table9User7Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="
                             width: 69px;
                             height: 90px;
                             float: right;
                             ">
                        <div id="Table9User7Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                            <div id="Table9User7Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User7Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User7SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="Table9User7CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 220px;
                         margin-top: 40px;
                         "></div>
    
                    <div class="UserHoldemGame" id="TableUser1" style="
                         float: right;
                         margin-right: 10px;
                         ">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User1Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table9User1Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table9User1Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                        <div id="Table9User1Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User1Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User1SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User1Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User1Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div> 
                    <div id="Table9User1CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 670px;
                         margin-top: 40px;
                         "></div>
                   
                </div>
                 
                 <div style="
                      float: left;
                      width: 100%;
                      height: 95px;
                      margin-top: 60px;
                      ">
                    <div class="UserHoldemGame" id="TableUser6" style="float: left;">
                        <div>
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User6Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User6Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table9User6Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             display: none;
                             "></div>
                             <div id="Table9User6Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
                        <div id="Table9User6Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                            <div id="Table9User6Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User6Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User6SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                     <div id="Table9User6CashTable" style="
                          border: 1px solid red;
                          width: 50px;
                          height: 50px;
                          position: absolute;
                          margin-left: 220px;
                          margin-top: 15px;
                          "></div>
                     
                     <div class="UserHoldemGame" id="TableUser2" style="float: right;margin-right: 10px;">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User2Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table9User2Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table9User2Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                        <div id="Table9User2Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User2Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User2SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User2Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User2Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div>
                     <div id="Table9User2CashTable" style="
                          border: 1px solid red;
                          width: 50px;
                          height: 50px;
                          position: absolute;
                          margin-left: 667px;
                          margin-top: 15px;
                          "></div>
                     
                   
                </div>
                 
                 <div style="
                      float: left;
                      width: 100%;
                      height: 95px;
                      margin-top: 30px;
                      ">
                    <div class="UserHoldemGame" id="TableUser5" style="
                         float: left;
                         margin-left: 180px;
                         ">
                        <div>
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User5Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User5Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table9User5Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             display: none;
                             "></div>
                             <div id="Table9User5Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="
                             width: 69px;
                             height: 90px;
                             float: right;
                             ">
                        <div id="Table9User5Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                            <div id="Table9User5Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User5Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User5SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                     <div id="Table9User5CashTable" style="
                          border: 1px solid red;
                          width: 50px;
                          height: 50px;
                          position: absolute;
                          margin-left: 300px;
                          margin-top: -80px;
                          "></div>
                     
    
                     <div class="UserHoldemGame" id="TableUser4" style="
                          margin-left: 30px;
                          float: left;
                          ">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User4Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table9User4Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table9User4Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                        <div id="Table9User4Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User4Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User4SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User4Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User4Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div>
                     <div id="Table9User4CashTable" style="
                          border: 1px solid red;
                          width: 50px;
                          height: 50px;
                          position: absolute;
                          margin-left: 440px;
                          margin-top: -80px;
                          "></div>
                     
                     <div class="UserHoldemGame" id="TableUser3" style="
                          float: left;
                          margin-left: 30px;
                          ">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User3Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table9User3Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table9User3Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                        <div id="Table9User3Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User3Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table9User3SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User3Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table9User3Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div>
                     <div id="Table9User3CashTable" style="
                          border: 1px solid red;
                          width: 50px;
                          height: 50px;
                          position: absolute;
                          margin-left: 580px;
                          margin-top: -80px;
                          "></div>
                   
                </div>
            </div>

                    <!--
                    ***********************************************************
                    ***********************************************************
                    Table5
                    ***********************************************************
                    ***********************************************************
                    -->
                    
                    <div style="
                         float: left;
                         width: 100%;
                         height: 100%;
                         display: none;
                         " id="Table5Users">
                        <div class="TableGirl"></div>
                        <div style="height: 95px;width: 100%;">
                            <div class="UserHoldemGame" id="Table5User4" style="float: left;margin-left: 250px;">
                                <div>
                        <div style="width: 70px;height: 80px;float: left;margin-top: 20px;">
                            <div id="Table5User4Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table5User4Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table5User4Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             display: none;
                             "></div>
                             <div id="Table5User4Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
                        <div id="Table5User4Name" style="color: #fee006;height: 20px;">
                        </div>
                            <div id="Table5User4Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table5User4Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table5User4SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="Table5User4CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 310px;
                         margin-top: 135px;
                         "></div>
    
                    <div class="UserHoldemGame" id="Table5User0" style="float: right;margin-right: 240px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table5User0Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table5User0Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table5User0Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="Table5User0Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table5User0Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table5User0SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table5User0Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table5User0Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div>
                    <div id="Table5User0CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 595px;
                         margin-top: 135px;
                         "></div>
                </div>
                
                <div style="float: left;width: 100%;height: 95px;margin-top: 100px;">
                   <div class="UserHoldemGame" id="TableUser3" style="float: left;">
                        <div>
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table5User3Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table5User3Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table5User3Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             display: none;
                             "></div>
                             <div id="Table5User3Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
                        <div id="Table5User3Name" style="color: #fee006;height: 20px;">
                        </div>
                            <div id="Table5User2Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table5User3Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table5User3SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="Table5User3CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 193px;
                         margin-top: 30px;
                         "></div>
                    
    
                    <div class="UserHoldemGame" id="TableUser1" style="float: right;margin-right: 10px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table5User1Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table5User1Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table5User1Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="Table5User1Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table5User1Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table5User1SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table5User1Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table5User1Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div> 
                    <div id="Table5User1CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-top: 30px;
                         margin-left: 696px;
                         "></div>
                </div>
                 <div style="float: left;width: 100%;height: 95px;margin-top: 110px;">
                     <div class="UserHoldemGame" id="TableUser2" style="float: left;margin-left: 380px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table5User2Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table5User2Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table5User2Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="Table5User2Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table5User2Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table5User2SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table5User2Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table5User2Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div>
                     <div id="Table5User2CashTable" style="
                          border: 1px solid red;
                          width: 50px;
                          height: 50px;
                          position: absolute;
                          margin-left: 440px;
                          margin-top: -80px;
                          "></div>
                   
                </div>
            </div>
                    
                    
                    <!--
                    ***********************************************************
                    ***********************************************************
                    Table4
                    ***********************************************************
                    ***********************************************************
                    -->
                    
                    
                    <div style="float: left;width: 100%;height: 100%;display: none" id="Table4Users">
                 <div class="TableGirl"></div>
                <div style="height: 95px;width: 100%;">
                   
                    <div class="UserHoldemGame" id="Tabl4User3" style="float: left;margin-left: 250px;">
                        <div>
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table4User3Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table4User3Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table4User3Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             display: none;
                             "></div>
                             <div id="Table4User3Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="
                             width: 69px;
                             height: 90px;
                             float: right;
                             ">
                        <div id="Table4User3Name" style="color: #fee006;height: 20px;">
                        </div>
                            <div id="Table4User3Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table4User3Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table4User3SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="Table4User3CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 310px;
                         margin-top: 135px;
                         "></div>
    
    
                    <div class="UserHoldemGame" id="TableUser0" style="float: right;margin-right: 240px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table4User0Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table4User0Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table4User0Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="Table4User0Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table4User0Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table4User0SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table4User0Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table4User0Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div>
                    <div id="Table4User0CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 595px;
                         margin-top: 135px;
                         "></div>
                </div>
                
                <div style="float: left;width: 100%;height: 95px;margin-top: 300px;">
                   <div class="UserHoldemGame" id="TableUser2" style="float: left;margin-left: 250px;">
                        <div>
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table4User2Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table4User2Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                        </div>
                        <div>
                        <div id="Table4User2Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             display: none;
                             "></div>
                             <div id="Table4User2Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 80px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
                        <div id="Table4User2Name" style="color: #fee006;height: 20px;">
                        </div>
                            <div id="Table4User2Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table4User2Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table4User2SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="UserCashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 310px;
                         margin-top: -80px;
                         "></div>
                   
    
                    <div class="UserHoldemGame" id="TableUser1" style="float: right;margin-right: 240px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table4User4Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             display: none;
                             "></div>
                             <div id="Table4User4Timer" style="
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 40px;
                             margin-left: 70px;
                             color: whitesmoke;
                             display: none;
                             ">20</div>
                        <div id="Table4User1Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="Table4User1Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table4User1Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">0$</div>  
                        </div>
                            <div id="Table4User1SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 cursor: pointer;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table4User1Cart0" style="
                                 background-image: url(/pic/cart/1.png);
                                 -moz-transform: rotate(40deg);
                                 -o-transform: rotate(40deg);
                                 -webkit-transform: rotate(40deg);
                                 filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);
                                 width: 40px;
                                 height: 60px;
                                 position: absolute;
                                 z-index: 1;
                                 margin-left: 20px;
                                 "></div>
                            <div id="Table4User1Cart1" style="
                                 background-image: url(/pic/cart/2.png);
                                 width: 40px;
                                 height: 65px;
                                 background-repeat: no-repeat;
                                 z-index: 0;
                                 margin-top: 0px;
                                 float: left;
                                 "></div>
                        </div>
                            </div>
                        </div> 
                    <div id="UserCashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 595px;
                         margin-top: -80px;
                         "></div>
                   
                   
                </div>
            </div>
                               </div>
                <div id="ControlPanel" 
                     style="
                     width: 100%;
                     height: 300px;
                     border: solid red 1px;
                     display: none;
                     margin-top: 600px">
                    <div style="width: 100%;height: 50px;float: left"></div>
                    <div style="width: 100%;height: 250px;border: solid 1px green;float: left">
                        <div style="width: 290px;height: 200px;border: solid 1px red;float: left">
                            
                        </div>
                        <div style="width: 300px;height: 200px;border: solid green 1px;float: left;">
                            
                            <div style="margin-top: 5px;margin-left: 30px;width: 80%;border-radius: 10px;height: 20px;float: left;background-color: #565656">
                                <div style="position: absolute;width: 240px;height: 20px;cursor: pointer;display: none;" id="RaiseButton"></div>
                                <div style="color: whitesmoke;margin-left: 80px;">
                                    <div style="float: left;margin-left: 2px">Raise</div>
                                    <div style="float: left;margin-left: 2px" id="RaiseSumUser">0</div>
                                    <div style="float: left">$</div>
                                </div>
                            </div>
                            
                            <div style="margin-left: 30px;margin-top: 5px;width: 80%;border-radius: 10px;height: 20px;float: left;background-color: #565656">
                                <div style="color: whitesmoke;margin-left: 80px;">
                                    <div style="position: absolute;width: 240px;height: 20px;cursor: pointer;display: none;" id="CallButton"></div>
                                    <div style="float: left;margin-left: 2px">Call</div>
                                    <div style="float: left" id="CallSumUser">10</div>
                                    <div style="float: left;margin-left: 2px">$</div>
                                </div>
                            </div>
                            
                            <div style="margin-left: 30px;margin-top: 5px;width: 80%;border-radius: 10px;height: 20px;float: left;background-color: #565656;">
                                <div style="color: whitesmoke;margin-left: 80px;">
                                    <div style="position: absolute;width: 240px;height: 20px;cursor: pointer;display: none;" id="FoldButton"></div>
                                    <div>Fold</div>
                                </div>
                            </div>
                            
                            <div style="margin-left: 30px;margin-top: 5px;width: 80%;border-radius: 10px;height: 20px;float: left;background-color: #565656;">
                                <div style="color: whitesmoke;margin-left: 80px;">
                                    <div style="position: absolute;width: 240px;height: 20px;cursor: pointer;display: none;" id="CheckButton"></div>
                                    <div>Check</div>
                                </div>
                            </div>
                            
                            <div style="margin-left: 30px;margin-top: 5px;width: 80%;height: 20px;float: left;">
                                <input type="range" style="width: 100%" value="0" min="0" max="100">
                            </div>
                            
                        </div>
                        <div style="width: 280px;height: 200px;border: solid 1px red;float: right" >
                            
                        </div>
                        <div style="width: 100%;height: 50px;"></div>
                    </div>
                </div>
                <div class="rightCol"></div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
