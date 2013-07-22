<%-- 
    Document   : PrivateArea
    Created on : Jul 21, 2013, 10:14:08 AM
    Author     : vadim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <jsp:include page="headParam.jsp" flush="true" />
</head>
<body onload="initPrivateBody">
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
                <div id="smallContainer">
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
</ul>
<div id="tabs-1">
    <div style="height: 45px;">                                
        <div style="float: left;">Имя:</div>
        <input type="text" style="float: right;" id="NamePrivateEdit" name="login" placeholder="Введите имя" onkeyup="RegistFieldChanged()"/>
        <div id="NamePrivateError" class="errorMessage"></div>
                              
                            </div>
    <div style="height: 45px;">                                
        <div style="float: left;">Фамилия:</div>
        <input type="text" style="float: right;" id="SurnamePrivateEdit" name="login" placeholder="Введите фамилию" onkeyup="RegistFieldChanged()"/>
        <div id="SurnamePrivateError" class="errorMessage"></div>
    </div>
    <div style="height: 45px;">                                
        <div style="float: left;">Отчество:</div>
        <input type="text" style="float: right;" id="SecondNamePrivateEdit" name="login" placeholder="Введите отчество" onkeyup="RegistFieldChanged()"/>
        <div id="SecondNamePrivateError" class="errorMessage"></div>
    </div>
      <div style="height: 45px;">                                
        <div style="float: left;">Страна:</div>
        <input type="text" style="float: right;" id="CountryPrivateEdit" name="login" placeholder="Введите отчество" onkeyup="RegistFieldChanged()"/>
        <div id="CountryPrivateError" class="errorMessage"></div>
    </div>
    
    <input type="button" id="SaveInfo" onclick="" value="Сохранить" class="button"/>
    </div>
<div id="tabs-2">
<table cellspacing="5" cellpadding="5" class="tableArea">
        <tr>
            <td>
                <input type="checkbox" id="SendProjectInfo"/>
            </td>
            <td>
                Уведомлять об изменениях проведенных на сайте
            </td>
        </tr>
    </table>
    <input type="button" id="SaveEmailNotify" onclick="" value="Сохранить" class="button"/>
</div>
<div id="tabs-3">
<table cellspacing="5" cellpadding="5" class="tableArea">
        <tr>
            <td>
                Введите новый e-mail
            </td>
            <td>
                <input type="email" id="EditNewMail"/>
            </td>
        </tr>
        
        <tr>
            <td>
                Повторите новый e-mail
            </td>
            <td>
                <input type="email" id="EditConfNewMail"/>
            </td>
        </tr>
        
         <tr>
            <td>
                Введите текущий пароль
            </td>
            <td>
                <input type="password" id="PassUserForEditMail"/>
            </td>
        </tr>
</table>
    <input type="button" id="SaveNewMail" onclick="" value="Сохранить" class="button"/> 
</div>
    <div id="tabs-4">
        <table cellspacing="5" cellpadding="5" class="tableArea">
        <tr>
            <td>
                Введите новый пароль
            </td>
            <td>
                <input type="password" id="EditNewPass"/>
            </td>
        </tr>
        
        <tr>
            <td>
                Повторите новый пароль
            </td>
            <td>
                <input type="email" id="EditConfNewPass"/>
            </td>
        </tr>
        
         <tr>
            <td>
                Введите текущий пароль
            </td>
            <td>
                <input type="password" id="PassUserForEditPass"/>
            </td>
        </tr>
</table>
        <input type="button" id="SaveNewPass" onclick="" value="Сохранить" class="button"/> 
    </div>
    
    <div id="tabs-5">
        <table cellspacing="5" cellpadding="5" class="tableArea">
        <tr>
            <td>
                Введите новый телефон
            </td>
            <td>
                <input type="tel" id="EditNewTel"/>
            </td>
        </tr>
        
        <tr>
            <td>
                Повторите новый телефон
            </td>
            <td>
                <input type="tel" id="EditConfNewTel"/>
            </td>
        </tr>
        
         <tr>
            <td>
                Введите текущий телефон
            </td>
            <td>
                <input type="tel" id="EditCurrentTel"/>
            </td>
        </tr>
        
         <tr>
            <td>
                Введите текущий пароль
            </td>
            <td>
                <input type="tel" id="PassUserForEditTel"/>
            </td>
        </tr>
        
</table>
        <input type="button" id="SaveNewTel" onclick="" value="Сохранить" class="button"/>
    </div>
    <div id="tabs-6">
        <table cellspacing="5" cellpadding="5" class="tableArea">
        <tr>
            <td>
                Серия и номер паспорта
            </td>
            <td>
                <input type="text" id="EditNewPassport"/>
            </td>
        </tr>
        
        <tr>
            <td>
                Выберете платежную систему
            </td>
            <td>
                <select name="PaySys">
                    <option>Visa</option>
                    <option>Master-Cart</option>
                    <option>WebMoney</option>
                    <option>YandexMoney</option>
                    <option>PayPal</option>
                </select>
            </td>
        </tr>
        
         <tr>
            <td>
                Введите номер счета в платежной системе
            </td>
            <td>
                <input type="text" id="PassUserForEditTel"/>
            </td>
        </tr>
        
         <tr>
            <td>
                Введите ваш текущий пароль
            </td>
            <td>
                <input type="password" id="PassUserForEdiPaySys"/>
            </td>
        </tr>
        
</table>
        <input type="button" id="SaveNewPaySys" onclick="" value="Сохранить" class="button"/>
    </div>
    
    <div id="tabs-7">
        <h2>Статистика пользователя</h2>
    </div>
    
    
</div>
        </div>
                    </div>
                </div>
</body>
</html>