<%-- 
    Document   : index
    Created on : Jul 11, 2013, 12:10:44 AM
    Author     : vadim
--%>

<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.pokerweb.Counter.servlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <jsp:include page="headParam.jsp" flush="true" />
    </head>
    <body onload="init()">
        <div id="header">
            <div class="leftCol"> </div>
            <div class="centerCol"> 
                <jsp:include page="topMenu.jsp" flush="true" />
                <jsp:include page="headerContent.jsp" flush="true" />
                <jsp:include page="mainMenu.jsp" flush="true" />
            </div>
            <div class="rightCol"> </div>      
        </div>
        
        <div class="separator"></div>       
        <div id="center">
            <!--<div class="leftCol dark"> </div>
            <div class="centerCol"> -->
            <jsp:include page="SliderPage.jsp" flush="true" />
            
            <!--</div>
            <div class="rightCol dark"> </div>-->
            <div class="separator"></div>
            <div class="leftCol"> </div>
            <div class="centerCol"> 
                <jsp:include page="SmallContainer.jsp" flush="true" />  
                <div class="bigMenuItem">
                    <div class="bigMenuTop">Зарегистрируйтесь</div>
                    <div class="bigMenuCenter">
                        <div>
                            <div>Турниры</div>
                        </div>
                        <div>
                            <div>Игры онлайн</div>
                        </div>    
                        <div>
                            <div>Ежедневные фрироллы</div>
                        </div>
                    </div>
                    <div class="bigMenuBottom">
                        <div class="button">Зарегистрироваться</div>
                    </div>
                </div>
                
                <div style="display: block;float:left">Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Еще.</div>
                <ul>
                    <li>Турниры до 1000000 денег</li>
                    <li>Ставки круглосуточно</li>
                    <li>Стабильность и качество Вашей работы</li>
                </ul>
                Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино.
            </div>
            <div class="leftCol"> </div>
            <div class="separator"></div>
        </div>
                <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
