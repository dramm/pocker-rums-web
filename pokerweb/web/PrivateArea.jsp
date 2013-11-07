<%-- 
    Document   : PrivateArea
    Created on : Jul 21, 2013, 10:14:08 AM
    Author     : vadim
--%>

<%@page import="org.springframework.security.core.GrantedAuthority"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%SecurityContext context = SecurityContextHolder.getContext();
        String RoleManager = "ROLE_MANAGER";
        String RoleAdmin = "ROLE_ADMIN";
        boolean IsManager = false;
        boolean IsAdministrator = false;
        if (context == null)
            return;
        Authentication authentication = context.getAuthentication();
        if (authentication == null)
            return;
        for (GrantedAuthority auth : authentication.getAuthorities()) 
            if (RoleManager.equals(auth.getAuthority())){
            IsManager = true;
            break;
            }else
                if(RoleAdmin.equals(auth.getAuthority())){
                    IsAdministrator = true;
                    break;
                }
        %>
<!DOCTYPE html>
<html>
   <head>
       <jsp:include page="headParam.jsp" flush="true" />
       <script type="text/javascript" src="js/PrivateAreaAjax.js"></script>
</head>
<body onload="initPrivateBody()">
     <div id="modalWait" class="modal" style="background-image: url(/pic/ajax-loader.gif);display: none;"></div>
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
               
                    <div id="PrivatArea">
<div id="tabs">
<ul>
<li><a href="#tabs-1">Личные настройки</a></li>
<li><a href="#tabs-2">Настройки e-mail</a></li>
<li><a href="#tabs-3">Изменения e-mail</a></li>
<li><a href="#tabs-4">Изменение пароля</a></li>
<li><a href="#tabs-5">Изменение телефона</a></li>
<li><a href="#tabs-6">Платежная информация</a></li>
<li><a href="#tabs-7">Ваша статистика</a></li>
<li><a href="#tabs-8">Вывод средств</a></li>
<li><a href="#tabs-10">Ваши заявки на выплату</a></li>
<%if(IsManager || IsAdministrator){%>
<li><a href="#tabs-9">Обработка заявок</a></li>
<%}%>
<%if(IsAdministrator){%>
<li><a href="#tabs-11">Пользователи</a></li>
<%}%>
<%if(IsAdministrator){%>
<li><a href="#tabs-12">Игравой сервер</a></li>
<%}%>
<%if(IsManager || IsAdministrator){%>
<li><a href="#tabs-13">Статистика пользователей</a></li>
<%}%>
</ul>
    
<div id="tabs-1">
    <div style="height: 45px;">                         
        <div style="display: block">
        <div style="float: left;">Имя:</div>
        <input type="text" style="float: right;" id="NamePrivateEdit" onkeyup="Tab1FieldChanged()"/>
        </div>
        <div id="NamePrivateError" class="errorMessage" style="float:right;" ></div>
        
    </div>
    <div style="height: 45px;">                                
        <div style="display: block">
        <div style="float: left;">Фамилия:</div>
        <input type="text" style="float: right;" id="SurnamePrivateEdit" onkeyup="Tab1FieldChanged()"/>
       </div>
        <div id="SurnamePrivateError" class="errorMessage" style="float:right;"></div>
    </div>
    
    <div style="height: 45px;">                                
        <div style="display: block">
        <div style="float: left;">Отчество:</div>
        <input type="text" style="float: right;" id="SecondNamePrivateEdit" onkeyup="Tab1FieldChanged()"/>
       </div>
        <div id="SecondNamePrivateError" class="errorMessage" style="float:right;"></div>
    </div>
    
      <div style="height: 45px;">                                
        <div style="display: block">
        
          <div style="float: left;">Страна:</div>
        <input type="text" style="float: right;" id="CountryPrivateEdit" onkeyup="Tab1FieldChanged()"/>
    </div>
        <div id="CountryPrivateError" class="errorMessage" style="float: right;"></div>
    </div>
    
         <input type="button" id="SaveInfo" onclick="SaveTab1Info()" value="Сохранить" class="button"/>    
</div>
<div id="tabs-2">
    <div style="height: 45px;"> 
        <div style="display: block">
        <div style="float: left;"><input type="checkbox" id="SendProjectInfo"/></div>
        <div style="float: right;">Уведомлять об изменениях проведенных на сайте</div>  
    </div>
        </div>
    <input type="button" id="SaveEmailNotify" onclick="" value="Сохранить" class="button"/>
</div>
<div id="tabs-3">
    <div style="display: block">
    <div style="float: left;">Ваш e-mail: <label id="CurrentEmail"/></div>
    </div>  
    <div style="height: 45px;">   
          <div style="display: block">
        <div style="float: left;">Введите новый e-mail</div>
        <input type="email" style="float: right;" id="NewMailPrivateEdit" onkeyup="RegistFieldChanged()"/>
        </div>
        <div id="NewMailPrivateError" class="errorMessage"></div>
          </div>
    
    <div style="height: 45px;">
        <div style="display: block">
        <div style="float: left;">Повторите новый e-mail</div>
        <input type="email" style="float: right;" id="NewMailConfPrivateEdit" onkeyup="RegistFieldChanged()"/>
        </div>
        <div id="NewMailConfPrivateError" class="errorMessage"></div>
        </div>
    
    <div style="height: 45px;">
        <div style="display: block">
        <div style="float: left;">Введите текущий пароль</div>
        <input type="password" style="float: right;" id="NewMailPassPrivateEdit" onkeyup="RegistFieldChanged()"/>
       </div>
        <div id="NewMailPassPrivateError" class="errorMessage"></div>
        </div>
    <input type="button" id="SaveNewMail" onclick="SaveTab3Info()" value="Сохранить" class="button"/> 
</div>
    <div id="tabs-4">
        <div style="height: 45px;">
            <div style="display: block">
        <div style="float: left;">Введите новый пароль</div>
        <input type="password" style="float: right;" id="NewPasPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="NewPassPrivateError" class="errorMessage"></div>
            </div></div>
        
        <div style="height: 45px;">                                
        <div style="display: block">
            <div style="float: left;">Повторите новый пароль</div>
        <input type="password" style="float: right;" id="ConfPassPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="ConfPassPrivateError" class="errorMessage"></div>
        </div></div>
        
        <div style="height: 45px;">
            <div style="display: block">
        <div style="float: left;">Введите текущий пароль</div>
        <input type="password" style="float: right;" id="CurPassPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="CurPassPrivateError" class="errorMessage"></div>
            </div></div>
        <input type="button" id="SaveNewPass" onclick="SaveTab4Info()" value="Сохранить" class="button"/> 
    </div>
    
    <div id="tabs-5">
        <div style="display: block">
       <div style="float: left;">Ваш телефон: <label id="CurrentPhone"/></div>
        </div>
       <div style="height: 45px;">
           <div style="display: block">
        <div style="float: left;">Введите новый телефон</div>
        <input type="text" style="float: right;" id="NewPhonePrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="NewPhonePrivateError" class="errorMessage"></div>
           </div></div>
       
        <div style="height: 45px;">                                
       <div style="display: block">
            <div style="float: left;">Повторите новый телефон</div>
        <input type="text" style="float: right;" id="NewPhoneConfPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="NewPhoneConfPrivateError" class="errorMessage"></div>
       </div></div>
       
           <div style="height: 45px;">                                
        <div style="display: block">
               <div style="float: left;">Введите текущий пароль</div>
        <input type="text" style="float: right;" id="CurPassPhonePrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="CurPassTelPrivateError" class="errorMessage"></div>
        </div></div>
        <input type="button" id="SaveNewTel" onclick="SaveTab5Info()" value="Сохранить" class="button"/>
    </div>
    <div id="tabs-6">
        <div style="height: 45px;">                                
            <div style="display: block">
            <div style="float: left;">Серия и номер паспорта</div>
        <input type="text" style="float: right;" id="PassportPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="PassportPrivateError" class="errorMessage"></div>
            </div></div>
        
        <div style="height: 45px;">                                
            <div style="display: block">
            <div style="float: left;">Выберете платежную систему</div>
            <select id="PaySystemPrivateEdit" style="float: right;">
                    
                </select>
            </div></div>
        
        <div style="height: 45px;">                                
            <div style="float: left;">Введите номер счета в платежной системе</div>
        <input type="text" style="float: right;" id="PayNumPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="PayNumPrivateError" class="errorMessage"></div>
    </div>
        
        <div style="height: 45px;">                                
            <div style="display: block">
            <div style="float: left;">Введите ваш текущий пароль</div>
        <input type="text" style="float: right;" id="CurPassPayPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="CurPassPayPrivateError" class="errorMessage"></div>
            </div></div>
        <input type="button" id="SaveNewPaySys" onclick="SaveTab6Info()" value="Сохранить" class="button"/>
    </div>
    
    <div id="tabs-7">
        <div style="float: left;">Ваш баланс: <label id="Balance"/></div>
        <table id="StatisticListCurrentUser"><tr><td /></tr></table>
        <div id="StatisticPagerCurrentUser"></div>
            </div>
    
    <div id="tabs-8">
        <div>Ваш баланс: <label id="BalanceTab8"></label></div>
        <div style="height: 45px;float: left">                                
            <div style="display: block">
            <div style="float: left;">Введите выводимую сумму</div>
        <input type="text" style="float: right;" id="OutMoneyPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="OutMoneyPrivateError" class="errorMessage"></div>
            </div></div>
        <input type="button" style="display:block;" id="SaveOutMoney" onclick="RequestOutMoney()" value="Вывести деньги" class="button"/>
    </div>
<%if(IsManager || IsAdministrator){%>
<div id="tabs-9">
    <b>Заявки</b>
    <select id="SelectRange" onchange="SelectRangeChange()">
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
        <option value="60">60</option>
    </select>
    <input type="button" style="display:block;" id="SendResponseOutMoney" onclick="ResponseOutMoney()" value="Оплатить заявки" class="button"/>
       
    <div id="RequestList">
        
    </div>
    </div>
<%}%>

<div id="tabs-10">
    <b>Заявки</b>
    <select id="SelectUserRange" onchange="SelectRangeChangeUserRequest()">
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
        <option value="60">60</option>
    </select>
       
    <div id="RequestListUser">
        
    </div>
    </div>

<%if(IsAdministrator){%>
<div id="tabs-11">
    <b>Управление пользователями</b>
    <select id="SelectRangeUsersList" onchange="SelectRangeChangeUsersList()">
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
        <option value="60">60</option>
    </select>
    <input type="button" style="display:block;" id="ExecuteSelectedActions" onclick="ExecuteSelectedActions()" value="Выполнить действия" class="button"/>
    <div id="ListUsers">
    </div>
    </div>
<%}%>

<%if(IsAdministrator){%>
<div id="tabs-12">
    <b>Настройки сервера</b>
    <input type="button" style="display:block;" id="ExecuteSelectedActions" onclick="" value="Запуск сервера" class="button"/>
    <div id="ListUsers">
    </div>
    </div>
<%}%>

<%if(IsAdministrator || IsManager){%>
<div id="tabs-13">
   
    <table id="StatisticListAllUser"><tr><td /></tr></table>
        
        
</div>
<%}%>
</div>
                    </div>
<div id="StatisticPagerAllUser"></div>
                <div id="StatisticDialog" style="display: none;">
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
                                    <!--<div style="float: left;">Стадия</div>-->
                                        <!--<div id="SBetInfoStageBet" style="float: right;">-->
                                            <!--gfdsgfdsgfdsgfds-->
                                        <!--</div>-->
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
                        <div id="STable1User1Cart1" class="STableUserCart"></div>
                        <div id="STable1User1Cart2" class="STableUserCart"></div>
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
                        <div id="STable1User2Cart1" class="STableUserCart"></div>
                        <div id="STable1User2Cart2" class="STableUserCart"></div>
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
                        <div id="STable1User3Cart1" class="STableUserCart"></div>
                        <div id="STable1User3Cart2" class="STableUserCart"></div>
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
                        <div id="STable1User4Cart1" class="STableUserCart"></div>
                        <div id="STable1User4Cart2" class="STableUserCart"></div>
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
                        <div id="STable2User1Cart1" class="STableUserCart"></div>
                        <div id="STable2User1Cart2" class="STableUserCart"></div>
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
                        <div id="STable2User2Cart1" class="STableUserCart"></div>
                        <div id="STable2User2Cart2" class="STableUserCart"></div>
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
                        <div id="STable2User3Cart1" class="STableUserCart"></div>
                        <div id="STable2User3Cart2" class="STableUserCart"></div>
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
                        <div id="STable2User4Cart1" class="STableUserCart"></div>
                        <div id="STable2User4Cart2" class="STableUserCart"></div>
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
                        <div id="STable2User5Cart1" class="STableUserCart"></div>
                        <div id="STable2User5Cart2" class="STableUserCart"></div>
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
                        <div id="STable2User6Cart1" class="STableUserCart"></div>
                        <div id="STable2User6Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User1Cart1" class="STableUserCart">
                        </div>
                        <div id="STable3User1Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User2Cart1" class="STableUserCart"></div>
                        <div id="STable3User2Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User3Cart1" class="STableUserCart"></div>
                        <div id="STable3User3Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User4Cart1" class="STableUserCart"></div>
                        <div id="STable3User4Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User5Cart1" class="STableUserCart"></div>
                        <div id="STable3User5Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User6Cart1" class="STableUserCart"></div>
                        <div id="STable3User6Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User7Cart1" class="STableUserCart"></div>
                        <div id="STable3User7Cart2" class="STableUserCart"></div>
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
                        <div id="STable3User8Cart1" class="STableUserCart"></div>
                        <div id="STable3User8Cart2" class="STableUserCart"></div>
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
                    <div class="SBetTable" style="text-align: center;">
                    <div style="float: left;margin-left: 45px">Раунд:<div style="float: right" id="StatisticRaund">343434</div></div>
                    <div id="SBetInfoStageBet" style="float: left;margin-left: 75px"></div>
                    <div style="float: left;width: 200px"><div style="float: left">Стол 1:</div><div style="float: left" id="StatisticForecastTable1">12,12,12,12</div></div>
                    <div style="float: left;width: 200px"><div style="float: left">Стол 2:</div><div style="float: left" id="StatisticForecastTable2">22,22,22,22</div></div>
                    <div style="float: left;width: 200px"><div style="float: left">Стол 3:</div><div style="float: left" id="StatisticForecastTable3">33,33,33,33</div></div>
                </div>
            </div>
                        </div>
                </div>
</body>
</html>