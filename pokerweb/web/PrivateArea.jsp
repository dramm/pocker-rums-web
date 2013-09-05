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
       
</head>
<body onload="initPrivateBody()">
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
<li><a href="#tabs-7">Статистика пользователя</a></li>
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
</div>
                    </div>
                
                </div>
</body>
</html>