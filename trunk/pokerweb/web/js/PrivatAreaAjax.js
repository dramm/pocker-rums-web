var req;
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