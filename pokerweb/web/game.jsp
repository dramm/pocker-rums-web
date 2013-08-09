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

<div id="center">
    <div class="leftCol"></div>
        <div id="centerCol" style="float: left;width: 70%;" >
            
            <div id="menuGame" >
                <img src="/pic/texas-holdem-logo.png">
                Время до Ривер-Раунд 5383
                <div class="button">
                    Объяснение
                </div>
            </div>
            <div style="margin-top: 60px;">
            <div class="table1">
                <div style="height: 95px;"></div>
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    1</div>
            </div>
            <div class="table2">
                <div style="height: 95px;"></div>
                
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    2</div>
            </div>
            <div class="table3">
                <div style="height: 95px;"></div>
                
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    3</div>
            </div>
                </div>
        </div>
    
<div class="rightCol"></div>
    </div>
             <jsp:include page="footer.jsp" flush="true" />
</body>