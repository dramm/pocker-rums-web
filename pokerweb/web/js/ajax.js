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
   if(RegisterButton!=null)
    RegisterButton.disabled=true;
    var ConfirmReg = getURLParameter("confirm-reg");
    var PrivatToken = getURLParameter("privat-token");
    var Autorization = getURLParameter("autor");
    var emailT = getURLParameter("pass-token");
   if(ConfirmReg != 'null')
        ConfirmRegist(ConfirmReg);
    if(PrivatToken != 'null')
        ConfirmEdit(PrivatToken);
    if(Autorization != 'null')
        registDialog("Ошибка авторизации");
    if(emailT != 'null')
        ConfirmRestor(emailT);
}

function ConfirmRestor(token) {
    var values =  {"token": token};
    var url = "ConfResetPass";
    req = new XMLHttpRequest();
    req.open("POST", url, true);
    req.onreadystatechange = callbackConfRestore;
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(JSON.stringify(values));   
}

function callbackConfRestore() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessagesConfReset(req.responseText);
        }
    }
}

function parseMessagesConfReset(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
      if(ErrorS.Error!=null)
          if(ErrorS.Error == "false")
              restDialog(ErrorS.token)
              else
                  registDialog("Востановление не удалось");
        } 
   }
   }
   
   

function restDialog(token){
var formReadReminder=document.createElement("form");
var newInput=document.createElement("input");
var newPass=document.createElement("input");
var newConfPass=document.createElement("input");
formReadReminder.style.cssText="background-color: #285F74;text-align:center;"
var newP=document.createElement("p");
newP.style.cssText="color:#FFFFFF;";
newP.innerHTML= "";
newPass.setAttribute("id","ResetNewPass");
newConfPass.setAttribute("id","ResetNewConfPass");
newPass.setAttribute("type","password");
newConfPass.setAttribute("type","password");
formReadReminder.innerHTML+="Введите новый пароль</br>";
formReadReminder.appendChild(newPass);
formReadReminder.innerHTML+="</br>";
formReadReminder.innerHTML+="Повторите новый пароль</br>";
formReadReminder.appendChild(newConfPass);
newInput.setAttribute("type","submit");
newInput.setAttribute("onclick","SendNewPass('"+token+"');return false;");
newInput.style.cssText="color: white;padding: 1px;display:inline-block;border: solid 2px #285F74;"+
    "border-radius: 6px;min-width: 76px;text-align: center;background: #000000;"+
    "background: -moz-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -webkit-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -o-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -ms-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: linear-gradient(top, #285F74 0%, #0d2a34 100%);";
newInput.setAttribute("value","OK");
formReadReminder.innerHTML+="</br>";
formReadReminder.appendChild(newInput);
$( formReadReminder).dialog({ modal: true,maxHeight:200,maxWidth:400,minHeight:200,minWidth:400});
 
  
}

function SendNewPass(token){
    var values =  {  
                "token": token,
                "password":document.getElementById("ResetNewPass").value,
                "confirmPassword": document.getElementById("ResetNewConfPass").value
            };
    var url = "SetNewPass";
    req = new XMLHttpRequest();
    req.open("POST", url, true);
    req.onreadystatechange = callbackNewPass;
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(JSON.stringify(values));}

function callbackNewPass() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessagesConfRest(req.responseText);
        }
    }
}

function parseMessagesConfRest(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
      if(ErrorS.NotConf==null){
          if(ErrorS.Error != "true")
                registDialog("Новый пароль сохранен");
              else
                  registDialog("Востановление не удалось");
      }
              else
                  registDialog(ErrorS.NotConf);
        } 
   }
   }

function callbackConfRestor() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessagesNewPass(req.responseText);
        }
    }
}

function parseMessagesNewPass(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
      if(ErrorS.ConfRegist!=null)
          if(ErrorS.Error == "true")
                registDialog("Новый пароль сохранен");
              else
                  registDialog("Востановление не удалось");
        } 
   }
   }
   


function RegistClickButton() {
    // document.getElementById("modalWait").className='modal';
    // init();
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


setInterval(function() {
    var url = "IsOnline";
    req = new XMLHttpRequest();
    req.open("POST", url, true);
    req.send();  
}, 15000);

function RegistClickButton() {
     document.getElementById("modalWait").className='modal';
    // init();
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


function RegistFieldChanged() {
   // init();
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

function ConfirmEdit(token) {
    var values =  {"token": token};
    var url = "ConfirmEdit";
    req = new XMLHttpRequest();
    req.open("POST", url, true);
    req.onreadystatechange = callbackConfEdit;
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send(JSON.stringify(values));   
}

function callbackConfEdit() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessagesConfEdit(req.responseText);
        }
    }
}

function parseMessagesConfEdit(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
      if(ErrorS.ConfEdit!=null)
          registDialog(ErrorS.ConfEdit);
        } 
   }
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
  //  init();
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
  //  init();
    RegisterButton.disabled=true;
    LoginError.style.cssText="visibility: visible !important;"
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
newInput.setAttribute("type","submit");
newInput.style.cssText="color: white;padding: 1px;display:inline-block;border: solid 2px #285F74;"+
    "border-radius: 6px;min-width: 76px;text-align: center;background: #000000;"+
    "background: -moz-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -webkit-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -o-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -ms-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: linear-gradient(top, #285F74 0%, #0d2a34 100%);";
newInput.setAttribute("value","OK");
formReadReminder.appendChild(newInput);
$( formReadReminder).dialog({ modal: true,/*title:"Подтвердите регистрацию",*/maxHeight:200,maxWidth:400,minHeight:200,minWidth:400});
 }

