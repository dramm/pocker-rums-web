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
                 <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 370px;">
                    <div class="UserHoldemGame" id="TableUser11" style="float: left">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                    <div class="UserHoldemGame" id="TableUser11" style="float: left">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                </div>
                <div class="TableCart">
                <div id="Table1Flop1" class="flop"></div>
                <div id="Table1Flop2" class="flop"></div>
                <div id="Table1Flop3" class="flop"></div>
                <div id="Table1Tern" class="tern"></div>
                <div id="Table1River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 15px;width: 370px;">
                    <div class="UserHoldemGame" id="TableUser11" style="float: left">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
                    </div>
                        </div>
                    <div class="UserHoldemGame" id="TableUser11" style="float: left">
                        <div class="UserHoldemProfile">
                            <div id="UserName" style="color: whitesmoke;width: 110px;text-align: center;margin-top: 4px;">name</div>
                            <div id="UserMoney" style="color: whitesmoke; text-align: center; width: 110px;">1000$</div>
                        </div>
                        <div id="CartsUser13" class="CartsUserHoldem">
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart" style="margin-left: 3px;"></div>
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
