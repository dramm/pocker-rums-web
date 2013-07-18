/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



var req;
var LoginError;
var PassError;
var ConfPassError;
var TelError;
var MailError;
var NameError;
var SurnameError;

var FieldLogin;
var FieldPass;
var FieldConfPass;
var FieldTel;
var FieldMail;
var FieldName;
var FieldSurname;

var RegisterButton;

// $("body").on({
//    ajaxStart: function() { 
//        $(this).addClass("loading"); 
//    },
//    ajaxStop: function() { 
//        $(this).removeClass("loading"); 
//    }    
//});


function init() {
    LoginError = document.getElementById("LoginError");
    PassError = document.getElementById("PassError");
    ConfPassError = document.getElementById("ConfPassError");
    TelError = document.getElementById("TelError");
    MailError = document.getElementById("MailError");
    NameError = document.getElementById("NameError");
    SurnameError = document.getElementById("SurnameError");  
    
    FieldLogin = document.getElementById("login");
    FieldPass = document.getElementById("password");
    FieldConfPass = document.getElementById("confirmPassword");
    FieldTel = document.getElementById("tel");
    FieldMail = document.getElementById("email");
    FieldName = document.getElementById("name");
    FieldSurname = document.getElementById("surname");
    RegisterButton = document.getElementById("RegButton");
    
    var query = getURLParameter("token");
   if(query!='null')
        ConfirmRegist(query);
  
}


function RegistClickButton() {
    init();
    document.getElementById("modalWait").className='modal';
    var values =  {  
                "login": FieldLogin.value,
                "password":FieldPass.value,
                "confirmPassword": FieldConfPass.value,
                "tel": FieldTel.value,
                "email": FieldMail.value,
                "name": FieldName.value,
                "surname": FieldSurname.value
            };
    var url = "RegisterUser";
    req = new XMLHttpRequest();
    req.open("POST", url, true);
    req.onreadystatechange = callbackRegist;
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(JSON.stringify(values));  

}

function callbackRegist() {
     document.getElementById("modalWait").className='';
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessagesRegistration(req.responseText);
        }
    }
}

function parseMessagesRegistration(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
      if(ErrorS.Regist!=null)
         registDialog(ErrorS.Regist);
        } 
   }
   }



//$("body").addClass("loading");
function RegistFieldChanged() {
    init();
   // $.mockjax({ url: '/AjaxController', responseTime: 20 });
//   $(document).on("click", function(){
//    $.post("/AjaxController");        
//});

    var values =  {  
                "login": FieldLogin.value,
                "password":FieldPass.value,
                "confirmPassword": FieldConfPass.value,
                "tel": FieldTel.value,
                "email": FieldMail.value,
                "name": FieldName.value,
                "surname": FieldSurname.value
            };
    var url = "AjaxController";
    req = new XMLHttpRequest();
    req.open("POST", url, true);
    req.onreadystatechange = callback;
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(JSON.stringify(values));   
}

function ConfirmRegist(token) {
    var values =  {"token": token};
    var url = "ConfirmRegistration";
    req = new XMLHttpRequest();
    req.open("POST", url, true);
    req.onreadystatechange = callbackConfRegist;
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(JSON.stringify(values));   
}

function callbackConfRegist() {
    
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessagesConfRegistration(req.responseText);
        }
    }
}

function parseMessagesConfRegistration(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
      if(ErrorS.ConfRegist!=null)
          registDialog(ErrorS.ConfRegist);
        } 
   }
   }

function callback() {
    init();
  //  $("body").removeClass("loading");
    RegisterButton.disabled=false;
    LoginError.innerHTML="";
    PassError.innerHTML="";
    ConfPassError.innerHTML="";
    TelError.innerHTML="";
    MailError.innerHTML="";
    NameError.innerHTML="";
    SurnameError.innerHTML="";
    
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessages(req.responseText);
        }
    }
}





function parseMessages(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
        appendComposer(ErrorS);
        } 
   }
   }

function appendComposer(Message) {
    init();
    RegisterButton.disabled=true;
    
    if(Message.Login!=null)
        LoginError.innerHTML = Message.Login;
    
    if(Message.Mail!=null)
        MailError.innerHTML = Message.Mail;
    
    if(Message.Pass!=null)
        PassError.innerHTML = Message.Pass;
    
    if(Message.PassConf!=null)
        ConfPassError.innerHTML = Message.PassConf;
    
    if(Message.Name!=null)
        NameError.innerHTML = Message.Name;
    
    if(Message.Surname!=null)
        SurnameError.innerHTML = Message.Surname;
    
    if(Message.Tel!=null)
        TelError.innerHTML = Message.Tel;
}

function getURLParameter(name) {
    return decodeURIComponent(
        (location.search.match(RegExp("[?|&]"+name+'=(.+?)(&|$)'))||[,null])[1]
    );  
}


function registDialog(message){
var formReadReminder=document.createElement("form");
var newInput=document.createElement("input");
formReadReminder.style.cssText="background-color: #285F74;text-align:center;"
var newP=document.createElement("p");
newP.style.cssText="color:#FFFFFF;";
newP.innerHTML=message;//"На указаный вами адрес отправленно сообщение для подтверждения регистрации, перейдите пожалуйста по ссылке";
formReadReminder.appendChild(newP);
$( formReadReminder).dialog({ modal: true,/*title:"Подтвердите регистрацию",*/maxHeight:200,maxWidth:400,minHeight:200,minWidth:400});
 }


// Initiates an AJAX request on click



