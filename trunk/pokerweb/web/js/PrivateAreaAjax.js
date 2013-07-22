var req;

function initPrivateBody() {
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
    RegisterButton.disabled=true;  
}

function Tab1FieldChanged() {
    var values =  {  
                "Name": FieldLogin.value,
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