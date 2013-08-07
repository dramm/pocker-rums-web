<%-- 
    Document   : headerContent
    Created on : Jul 16, 2013, 1:01:37 AM
    Author     : vadim
--%>

<%@page import="com.pokerweb.Counter.servlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="headerContent"> 
                    <div class="firstText">Именно СЕЙЧАС 348 активных столов!</div>
                    <br><div class="secondText">
                       На сайте
                        <%int p=0;servlet counter=(servlet)session.getAttribute("counter");%>
                        <%=counter.getActiveSessionNumber()%>
                        <%if(counter.getActiveSessionNumber()==1){%>
                        посетитель
                        <%}%>
                        <%if(counter.getActiveSessionNumber()>1 && counter.getActiveSessionNumber()<5){%>
                        посетителя
                        <%}%>
                        <%if(counter.getActiveSessionNumber() > 5){%>
                        посетителей
                        <%}%>
                         </div>
                </div>