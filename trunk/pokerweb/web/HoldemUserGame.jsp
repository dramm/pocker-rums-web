<%-- 
    Document   : HoldemUserGame
    Created on : Jan 12, 2014, 9:17:59 PM
    Author     : vadim
--%>

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
                
                <table id="ListTables"><tr><td /></tr></table>
                
                
                <div id="table" style="display: none" class="tableHoldem">
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
                   
                    <div class="UserHoldemGame" id="Table9User1" style="float: left;margin-left: 250px;">
                        <div>
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User1Cart1" style="
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
                            <div id="Table9User1Cart2" style="
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
                        <div id="Table9User1Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             "></div>
                        <div id="UserProfile" style="
                             width: 69px;
                             height: 90px;
                             float: right;
                             ">
                        <div id="Table9User1Name" style="color: #fee006;height: 20px;">
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User1SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    
                    <div id="Table9User1CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 360px;
                         margin-top: 135px;
                         "></div>
    
                    <div class="UserHoldemGame" id="Table9User2" style="
                         float: right;
                         margin-right: 240px;
                         ">
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
                             "></div>
                        <div id="Table9User2Name" style="
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
                            <div id="Table9User2Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User2SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User2Cart1" style="
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
                            <div id="Table9User2Cart2" style="
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
                   <div class="UserHoldemGame" id="Table9User3" style="float: left;">
                        <div>
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User3Cart1" style="
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
                            <div id="Table9User3Cart2" style="
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
                        <div id="Table9User3Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             "></div>
                        <div id="UserProfile" style="
                             width: 69px;
                             height: 90px;
                             float: right;
                             ">
                        <div id="Table9User3Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                            <div id="Table9User3Avatar" style="
                                 background-image: url(/pic/ClearAvatar.png);
                                 background-repeat: no-repeat;
                                 width: 69px;
                                 height: 90px;">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User3Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User3SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="Table9User3CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 220px;
                         margin-top: 40px;
                         "></div>
    
                    <div class="UserHoldemGame" id="TableUser4" style="
                         float: right;
                         margin-right: 10px;
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
                             "></div>
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
                            <div style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User4Cart1" style="
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
                            <div id="Table9User4Cart2" style="
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
                    <div class="UserHoldemGame" id="TableUser5" style="float: left;">
                        <div>
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User5Cart1" style="
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
                            <div id="Table9User5Cart2" style="
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
                             "></div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
                        <div id="User1Table1Name" style="
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User5SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
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
                          margin-left: 220px;
                          margin-top: 15px;
                          "></div>
                     
                     <div class="UserHoldemGame" id="TableUser6" style="float: right;margin-right: 10px;">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User6Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User6SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User6Cart1" style="
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
                            <div id="Table9User6Cart2" style="
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
                     <div id="Table9User6CashTable" style="
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
                    <div class="UserHoldemGame" id="TableUser7" style="
                         float: left;
                         margin-left: 180px;
                         ">
                        <div>
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table9User7Cart1" style="
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
                            <div id="Table9User7Cart2" style="
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
                             "></div>
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
                                 height: 90px;
                                 ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User7Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User7SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
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
                          margin-left: 300px;
                          margin-top: -80px;
                          "></div>
                     
    
                     <div class="UserHoldemGame" id="TableUser8" style="
                          margin-left: 30px;
                          float: left;
                          ">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User8Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
                        <div id="Table9User8Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User8SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User8Cart1" style="
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
                            <div id="Table9User8Cart2" style="
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
                     <div id="Table9User8CashTable" style="
                          border: 1px solid red;
                          width: 50px;
                          height: 50px;
                          position: absolute;
                          margin-left: 440px;
                          margin-top: -80px;
                          "></div>
                     
                     <div class="UserHoldemGame" id="TableUser9" style="
                          float: left;
                          margin-left: 30px;
                          ">
                        <div style="
                             width: 90px;
                             height: 110px;
                             float: left;
                             ">
                        <div id="Table9User9Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
                        <div id="Table9User9Name" style="
                             color: #fee006;
                             height: 20px;
                             ">
                        </div>
                        <div id="Table9User9Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table9User9Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">1000$</div>  
                        </div>
                            <div id="Table9User9SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table9User9Cart1" style="
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
                            <div id="Table9User9Cart2" style="
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
                     <div id="Table9User9CashTable" style="
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
                         display: none
                         " id="Table5Users">
                        <div class="TableGirl"></div>
                        <div style="height: 95px;width: 100%;">
                            <div class="UserHoldemGame" id="Table5User1" style="float: left;margin-left: 250px;">
                                <div>
                        <div style="border: 1px solid red;width: 70px;height: 80px;float: left;margin-top: 20px;">
                            <div id="Table5User1Cart1" style="
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
                            <div id="Table5User1Cart2" style="
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
                        <div id="Table5User1Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             "></div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table5User1SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="Table5User1CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 310px;
                         margin-top: 135px;
                         "></div>
    
                    <div class="UserHoldemGame" id="Table5User2" style="float: right;margin-right: 240px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table5User2Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table5User2SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="
                             float: right;
                             width: 72px;
                             height: 90px;
                             ">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table5User2Cart1" style="
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
                            <div id="Table5User2Cart2" style="
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
                         margin-left: 595px;
                         margin-top: 135px;
                         "></div>
                </div>
                
                <div style="float: left;width: 100%;height: 95px;margin-top: 100px;">
                   <div class="UserHoldemGame" id="TableUser3" style="float: left;">
                        <div>
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table5User3Cart1" style="
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
                            <div id="Table5User3Cart2" style="
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
                             "></div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
                        <div id="Table5User3Name" style="color: #fee006;height: 20px;">
                        </div>
                            <div id="Table5User3Avatar" style="
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table5User3SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
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
                    
    
                    <div class="UserHoldemGame" id="TableUser4" style="float: right;margin-right: 10px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table5User4Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table5User4SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table5User4Cart1" style="
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
                            <div id="Table5User4Cart2" style="
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
                    <div id="Table5User4CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-top: 30px;
                         margin-left: 696px;
                         "></div>
                </div>
                 <div style="float: left;width: 100%;height: 95px;margin-top: 110px;">
                     <div class="UserHoldemGame" id="TableUser5" style="float: left;margin-left: 380px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table5User5Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
                        <div id="Table5User5Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="Table5User5Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table5User5Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">1000$</div>  
                        </div>
                            <div id="Table5User5SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table5User5Cart1" style="
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
                            <div id="Table5User5Cart2" style="
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
                     <div id="Table5User5CashTable" style="
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
                   
                    <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-left: 250px;">
                        <div>
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table4User1Cart1" style="
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
                            <div id="Table4User1Cart2" style="
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
                        <div id="Table4User1Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 80px;
                             "></div>
                        <div id="UserProfile" style="
                             width: 69px;
                             height: 90px;
                             float: right;
                             ">
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table4User1SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                            </div>
                        </div>
                        </div>
                    <div id="Table4User1CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 310px;
                         margin-top: 135px;
                         "></div>
    
    
                    <div class="UserHoldemGame" id="TableUser2" style="float: right;margin-right: 240px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table4User2Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table4User2SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table4User2Cart1" style="
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
                            <div id="Table4User2Cart2" style="
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
                    <div id="Table4User2CashTable" style="
                         border: 1px solid red;
                         width: 50px;
                         height: 50px;
                         position: absolute;
                         margin-left: 595px;
                         margin-top: 135px;
                         "></div>
                </div>
                
                <div style="float: left;width: 100%;height: 95px;margin-top: 300px;">
                   <div class="UserHoldemGame" id="TableUser3" style="float: left;margin-left: 250px;">
                        <div>
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: left;
                             margin-top: 20px;
                             ">
                            <div id="Table4User3Cart1" style="
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
                            <div id="Table4User3Cart2" style="
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
                             "></div>
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
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
                                 ">1000$</div>  
                        </div>
                            <div id="Table4User3SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
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
                   
    
                    <div class="UserHoldemGame" id="TableUser4" style="float: right;margin-right: 240px;">
                        <div style="width: 90px;height: 110px;float: left;">
                        <div id="Table4User4Dialer" style="
                             background-image: url(/pic/DialerIcon.png);
                             height: 19px;
                             width: 19px;
                             position: absolute;
                             margin-top: 20px;
                             margin-left: 70px;
                             "></div>
                        <div id="Table4User4Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="Table4User4Avatar" style="
                             background-image: url(/pic/ClearAvatar.png);
                             background-repeat: no-repeat;
                             width: 69px;
                             height: 90px;
                             ">
                            <div class="User1Table1MoneyBut">
                            <div id="Table4User4Money" style="
                                 color: black;
                                 text-align: center;
                                 height: 100%;
                                 font-size: 13px;
                                 width: 40px;
                                 ">1000$</div>  
                        </div>
                            <div id="Table4User4SitThis" style="
                                 margin-top: -10px;
                                 margin-left: -10px;
                                 background-image: url(/pic/SitThisButt.png);
                                 background-size: 100%;
                                 width: 28px;
                                 height: 28px;
                                 position: absolute;
                                 "></div>
                        </div>
                        </div>
                        <div style="float: right;width: 72px;height: 90px;">
                        <div style="
                             border: 1px solid red;
                             width: 70px;
                             height: 80px;
                             float: right;
                             margin-top: 20px;
                             ">
                            <div id="Table4User4Cart1" style="
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
                            <div id="Table4User4Cart2" style="
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
                
                <div class="rightCol"></div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
