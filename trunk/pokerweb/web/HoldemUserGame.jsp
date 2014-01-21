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
                <div id="PagerListTables"></div>
                
                
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
                    
                    
                    
             <div style="float: left;width: 100%;height: 100%;" id="Table4Users">
                 <div class="TableGirl"></div>
                <div style="height: 95px;width: 100%;">
                    <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-left: 110px;">
                        <div style="border: 1px solid red;
width: 70px;
height: 80px;
float: left;
margin-top: 20px;">
                            <div style="background-image: url(/pic/cart/1.png);-moz-transform: rotate(40deg);-o-transform: rotate(40deg);-webkit-transform: rotate(40deg);filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);width: 40px;
height: 60px;
position: absolute;
z-index: 1;
margin-left: 20px;"></div>
                            <div style="background-image: url(/pic/cart/2.png);
width: 40px;
height: 65px;
background-repeat: no-repeat;
z-index: 0;
margin-top: 0px;
float: left;"></div>
                        </div>
                        <div style="background-image: url(/pic/DialerIcon.png);height: 19px;width: 19px;position: absolute;margin-top: 20px;margin-left: 80px;"></div>
                        
                        <div id="UserProfile" style="width: 69px;height: 90px;float: right;">
                        <div id="User1Table1Name" style="color: #fee006;height: 20px;">
                        </div>
                            <div id="AvatarUser1Table1" style="background-image: url(/pic/ClearAvatar.png);background-repeat: no-repeat;width: 69px;height: 90px;">
                            <div class="User1Table1MoneyBut">
                            <div id="UserMoney" style="color: black;text-align: center;height: 100%;font-size: 13px;width: 40px;">1000$</div>  
                        </div>
                            <div style="margin-top: -10px;margin-left: -10px;background-image: url(/pic/SitThisButt.png);background-size: 100%;width: 28px;height: 28px;position: absolute;"></div>
                        </div>
                            </div>
                        </div>
                    <div id="User1Table" style="width: 50px;height: 50px;margin-top: 90px;position: absolute;margin-left: 200px;">
                        <div style="background-image: url(/pic/TokenHoldem.png);width: 20px;height: 16px;background-size: 100%;background-repeat: no-repeat;"></div>
                        <div id="UserBet">
                            <div id="UserChips" style="width: 20px;">
                        <div style="float:left;background-image: url(/pic/chips5.png);height: 20px;width: 20px"></div>
                        <div style="float:left;background-image: url(/pic/chips_blue.png);height: 20px;width: 20px">
                            <div style="font-size: 11px;margin-left: 3px;margin-top: 4px;">10</div>
                        </div>
                        </div>
                            <div id="SumUserCurrentBet" style="color: whitesmoke;font-size: 12px;width: 15px;height: 15px;float: left;margin-top: 5px;">15</div>
                            </div>
                    </div>
                    <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-left: 190px;">
                        <div style="background-image: url(/pic/DialerIcon.png);height: 19px;width: 19px;position: absolute;margin-top: 20px;margin-left: 70px;"></div>
                        <div id="User1Table1Name" style="color: #fee006;height: 20px;">
                        </div>
                        <div id="AvatarUser1Table1" style="background-image: url(/pic/ClearAvatar.png);background-repeat: no-repeat;width: 69px;height: 90px;">
                            <div class="User1Table1MoneyBut">
                            <div id="UserMoney" style="color: black;text-align: center;height: 100%;font-size: 13px;width: 40px;">1000$</div>  
                        </div>
                            <div style="margin-top: -10px;margin-left: -10px;background-image: url(/pic/SitThisButt.png);background-size: 100%;width: 28px;height: 28px;position: absolute;"></div>
                        </div>
                        <div style="border: 1px solid red;
width: 70px;
height: 80px;
float: right;
margin-top: 20px;">
                            <div style="background-image: url(/pic/cart/1.png);-moz-transform: rotate(40deg);-o-transform: rotate(40deg);-webkit-transform: rotate(40deg);filter: progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11=0.7071067811865476, M12=0.7071067811865475, M21=-0.7071067811865475, M22=0.7071067811865476);width: 40px;
height: 60px;
position: absolute;
z-index: 1;
margin-left: 20px;"></div>
                            <div style="background-image: url(/pic/cart/2.png);
width: 40px;
height: 65px;
background-repeat: no-repeat;
z-index: 0;
margin-top: 0px;
float: left;"></div>
                        </div>
                        </div>
                    <div id="User2Table" style="width: 50px;height: 50px;position: absolute;margin-top: 100px;margin-left: 510px;">
                            <div style="background-image: url(/pic/TokenHoldem.png);width: 20px;height: 16px;background-size: 100% auto;background-repeat: no-repeat;float: right;"></div>
                    <div id="UserBet">
                            <div id="UserChips" style="width: 20px;">
                        <div style="float:left;background-image: url(/pic/chips5.png);height: 20px;width: 20px"></div>
                        <div style="float:left;background-image: url(/pic/chips_blue.png);height: 20px;width: 20px">
                            <div style="font-size: 11px;margin-left: 3px;margin-top: 4px;">10</div>
                        </div>
                        </div>
                            <div id="SumUserCurrentBet" style="color: whitesmoke;font-size: 12px;width: 15px;height: 15px;float: left;margin-top: 5px;">15</div>
                            </div>
                    </div>
                </div>
                
                <div style="float: left;width: 100%;margin-top: 130px;height: 95px;">
                    
                    <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-left: 35px;">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                    <div id="User3Table" style="width: 70px;height: 50px;position: absolute;margin-left: 485px;">
                            <div style="background-image: url(/pic/TokenHoldem.png);width: 20px;height: 16px;background-size: 100% auto;background-repeat: no-repeat;float: right;margin-top: 17px;"></div>
                    <div id="UserBet">
                            <div id="UserChips" style="width: 20px;">
                        <div style="float:left;background-image: url(/pic/chips5.png);height: 20px;width: 20px"></div>
                        <div style="float:left;background-image: url(/pic/chips_blue.png);height: 20px;width: 20px">
                            <div style="font-size: 11px;margin-left: 3px;margin-top: 4px;">10</div>
                        </div>
                        
                        </div>
                            <div id="SumUserCurrentBet" style="color: whitesmoke;font-size: 12px;width: 15px;height: 15px;float: left;margin-top: 5px;">15</div>
                            </div>
                    </div>
                    <div class="UserHoldemGame" id="TableUser11" style="float: right;margin-right: 35px;">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                    <div id="User4Table" style="width: 70px;height: 50px;position: absolute;margin-left: 195px;">
                            <div style="background-image: url(/pic/TokenHoldem.png);width: 20px;height: 16px;background-size: 100% auto;background-repeat: no-repeat;margin-top: 17px;"></div>
                            <div id="UserBet">
                            <div id="UserChips" style="width: 20px;">
                        <div style="float:left;background-image: url(/pic/chips5.png);height: 20px;width: 20px"></div>
                        <div style="float:left;background-image: url(/pic/chips_blue.png);height: 20px;width: 20px">
                            <div style="font-size: 11px;margin-left: 3px;margin-top: 4px;">10</div>
                        </div>
                        </div>
                            <div id="SumUserCurrentBet" style="color: whitesmoke;font-size: 12px;width: 15px;height: 15px;float: left;margin-top: 5px;">15</div>
                            </div>
                    </div>
                </div>
            </div>
                               </div>
                
                <div class="rightCol"></div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
