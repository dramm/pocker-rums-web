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
                <jsp:include page="topMenu.jsp" flush="true" />
                <jsp:include page="headerContent.jsp" flush="true" />
                <jsp:include page="mainMenu.jsp" flush="true" />
            </div>
            <div class="rightCol"> </div>      
        </div>
            <div class="leftCol"></div>
            <div class="centerCol" style="margin-bottom: 50px;">
                <div id="table" class="tableHoldem">
                    <div class="TableImageHoldem"></div>
                 <div class="TableCartHoldem">
                <div id="Table1Flop1" class="flop"></div>
                <div id="Table1Flop2" class="flop"></div>
                <div id="Table1Flop3" class="flop"></div>
                <div id="Table1Tern" class="tern"></div>
                <div id="Table1River" class="river"></div>
                </div>
                    <div id="bank" class="BankHoldem"></div>
                    <div style="float: left;width: 100%;height: 100%;" id="Table9Users">
                        <div style="height: 95px;width: 100%;position: absolute">
                    <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-left: 300px;margin-top: 5px;">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                            <div id="User1Table" style="width: 60px;height: 50px;position: absolute;margin-left: 350px;margin-top: 123px;">
                        <div style="background-image: url(/pic/TokenHoldem.png);float: left;width: 20px;height: 16px;background-size: 100%;background-repeat: no-repeat;"></div>
                        <div id="UserBet" style="float: left;">
                            <div id="UserChips" style="width: 20px;float: left">
                        <div style="float:left;background-image: url(/pic/chips5.png);height: 20px;width: 20px"></div>
                        <div style="float:left;background-image: url(/pic/chips_blue.png);height: 20px;width: 20px">
                            <div style="font-size: 11px;margin-left: 3px;margin-top: 4px;">10</div>
                        </div>
                        </div>
                            <div id="SumUserCurrentBet" style="color: whitesmoke;font-size: 12px;width: 15px;height: 15px;float: left;margin-top: 5px;">15</div>
                            </div>
                    </div>
                        </div>
                <div style="height: 95px;width: 100%;margin-top: 50px;">
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
                        <div style="height: 155px;width: 100%;position: absolute;margin-top: 150px;">
                    <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-left: 200px;margin-top: 60px;">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                            <div id="User1Table" style="width: 60px;height: 50px;position: absolute;margin-left: 245px;">
                        <div style="background-image: url(/pic/TokenHoldem.png);float: left;width: 20px;height: 16px;background-size: 100%;background-repeat: no-repeat;"></div>
                        <div id="UserBet" style="float: left;">
                            <div id="UserChips" style="width: 20px;float: left">
                        <div style="float:left;background-image: url(/pic/chips5.png);height: 20px;width: 20px"></div>
                        <div style="float:left;background-image: url(/pic/chips_blue.png);height: 20px;width: 20px">
                            <div style="font-size: 11px;margin-left: 3px;margin-top: 4px;">10</div>
                        </div>
                        </div>
                            <div id="SumUserCurrentBet" style="color: whitesmoke;font-size: 12px;width: 15px;height: 15px;float: left;margin-top: 5px;">15</div>
                            </div>
                    </div>
                            <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-top: 60px;">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                            <div id="User1Table" style="width: 60px;height: 50px;position: absolute;margin-left: 395px;">
                        <div style="background-image: url(/pic/TokenHoldem.png);float: left;width: 20px;height: 16px;background-size: 100%;background-repeat: no-repeat;"></div>
                        <div id="UserBet" style="float: left;">
                            <div id="UserChips" style="width: 20px;float: left">
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
                    
                    <div style="float: left;width: 100%;height: 100%;display: none" id="Table5Users">
                        <div style="height: 95px;width: 100%;position: absolute">
                    <div class="UserHoldemGame" id="TableUser11" style="float: left;margin-left: 300px;margin-top: 5px;">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                            <div id="User1Table" style="width: 60px;height: 50px;position: absolute;margin-left: 350px;margin-top: 123px;">
                        <div style="background-image: url(/pic/TokenHoldem.png);float: left;width: 20px;height: 16px;background-size: 100%;background-repeat: no-repeat;"></div>
                        <div id="UserBet" style="float: left;">
                            <div id="UserChips" style="width: 20px;float: left">
                        <div style="float:left;background-image: url(/pic/chips5.png);height: 20px;width: 20px"></div>
                        <div style="float:left;background-image: url(/pic/chips_blue.png);height: 20px;width: 20px">
                            <div style="font-size: 11px;margin-left: 3px;margin-top: 4px;">10</div>
                        </div>
                        </div>
                            <div id="SumUserCurrentBet" style="color: whitesmoke;font-size: 12px;width: 15px;height: 15px;float: left;margin-top: 5px;">15</div>
                            </div>
                    </div>
                        </div>
                <div style="height: 95px;width: 100%;margin-top: 50px;">
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
                    
             <div style="float: left;width: 100%;height: 100%;display: none" id="Table4Users">
                <div style="height: 95px;width: 100%;margin-top: 50px;">
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
