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
     <form onSubmit="return Validate()">
         <input type="button" id="SaveInfo" onclick="SaveTab1Info()" value="Сохранить" class="button"/>
</form>    
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
    <input type="button" id="SaveNewMail" onclick="" value="Сохранить" class="button"/> 
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
        <input type="button" id="SaveNewPass" onclick="" value="Сохранить" class="button"/> 
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
        <input type="text" style="float: right;" id="CurPassTelPrivateEdit" onkeyup="RegistFieldChanged()"/>
        <div id="CurPassTelPrivateError" class="errorMessage"></div>
        </div></div>
        <input type="button" id="SaveNewTel" onclick="" value="Сохранить" class="button"/>
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
        <input type="button" id="SaveNewPaySys" onclick="" value="Сохранить" class="button"/>
    </div>
    
    <div id="tabs-7">
        <div style="float: left;">Баланс: <label id="Balance"/></div>
            </div>
</div>
                    </div>
                </div>
                </div>
</body>
</html>