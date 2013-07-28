var reqPrivate;
var NamePrivateEdit;
var SurnamePrivateEdit;
var SecondNamePrivateEdit;
var CountryPrivateEdit;
var SendProjectInfo;
var NewMailPrivateEdit;
var NewMailConfPrivateEdit;
var NewMailPassPrivateEdit;

var NewPasPrivateEdit;
var ConfPassPrivateEdit;
var CurPassPrivateEdit;
var NewPhonePrivateEdit;
var NewPhoneConfPrivateEdit;
var CurPhonePrivateEdit;
var CurPassTelPrivateEdit;
var PassportPrivateEdit;
var PaySystemPrivateEdit;

var PayNumPrivateEdit;
var CurPassPayPrivateEdit;

var NamePrivateError;
var SurnamePrivateError;
var SecondNamePrivateError;
var CountryPrivateError;

var NewMailPrivateError;
var NewMailConfPrivateError;
var NewMailPassPrivateError;

var NewPassPrivateError;
var ConfPassPrivateError;
var CurPassPrivateError;


var NewPhonePrivateError;
var CurPhonePrivateError;

var CurPassTelPrivateError;
var PassportPrivateError;
var PayNumPrivateError;
var CurPassPayPrivateError;

var Balance;

var CurrentEmail;

var CurrentPhone;
function initPrivateBody() {
    init();
    NamePrivateEdit = document.getElementById("NamePrivateEdit");
    SurnamePrivateEdit = document.getElementById("SurnamePrivateEdit");
    SecondNamePrivateEdit = document.getElementById("SecondNamePrivateEdit");
    CountryPrivateEdit = document.getElementById("CountryPrivateEdit");
   
    SendProjectInfo = document.getElementById("SendProjectInfo");
    
    NewMailPrivateEdit = document.getElementById("NewMailPrivateEdit");
    NewMailConfPrivateEdit = document.getElementById("NewMailConfPrivateEdit");
    NewMailPassPrivateEdit = document.getElementById("NewMailPassPrivateEdit");
    
    NewPasPrivateEdit = document.getElementById("NewPasPrivateEdit");
    ConfPassPrivateEdit = document.getElementById("ConfPassPrivateEdit");
    CurPassPrivateEdit = document.getElementById("CurPassPrivateEdit");
    
    NewPhonePrivateEdit = document.getElementById("NewPhonePrivateEdit");
    NewPhoneConfPrivateEdit = document.getElementById("NewPhoneConfPrivateEdit");
    CurPhonePrivateEdit = document.getElementById("CurPhonePrivateEdit");
    CurPassTelPrivateEdit = document.getElementById("CurPassTelPrivateEdit");
    
    PassportPrivateEdit = document.getElementById("PassportPrivateEdit");
    PaySystemPrivateEdit = document.getElementById("PaySystemPrivateEdit");
    PayNumPrivateEdit = document.getElementById("PayNumPrivateEdit");
    CurPassPayPrivateEdit = document.getElementById("CurPassPayPrivateEdit");
    
    
    NamePrivateError = document.getElementById("NamePrivateError");
    SurnamePrivateError = document.getElementById("SurnamePrivateError");
    SecondNamePrivateError = document.getElementById("SecondNamePrivateError");
    CountryPrivateError = document.getElementById("CountryPrivateError");
    
    
    NewMailPrivateError = document.getElementById("NewMailPrivateError");
    NewMailConfPrivateError = document.getElementById("NewMailConfPrivateError");
    NewMailPassPrivateError = document.getElementById("NewMailPassPrivateError");
    
    NewPassPrivateError = document.getElementById("NewPassPrivateError");
    ConfPassPrivateError = document.getElementById("ConfPassPrivateError");
    CurPassPrivateError = document.getElementById("CurPassPrivateError");
    
    NewPhonePrivateError = document.getElementById("NewPhonePrivateError");
    NewPhoneConfPrivateError = document.getElementById("NewPhoneConfPrivateError");
    CurPhonePrivateError = document.getElementById("CurPhonePrivateError");
    CurPassTelPrivateError = document.getElementById("CurPassTelPrivateError");
    
    Balance = document.getElementById("Balance");
    
    CurrentEmail = document.getElementById("CurrentEmail");
    
    CurrentPhone = document.getElementById("CurrentPhone");
    
    FieldLoadFromDB();
}

function SaveTab4Info() {
    var values =  {  
                "NewPassword": NewPasPrivateEdit.value,
                "ConfNewPassword":ConfPassPrivateEdit.value,
                "CurrentPassword": CurPassPrivateEdit.value
            };
    var url = "SaveInfoTab4";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSaveTab1Info;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}

function CallbackSaveTab4Info() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null && reqPrivate.responseText.length > 0){
            var ErrorS = JSON.parse(reqPrivate.responseText);
            SaveDialog(ErrorS.Message);
            }
        }
    }
}

function SaveTab3Info() {
    var values =  {  
                "NewMail": NewMailPrivateEdit.value,
                "ConfNewMail":NewMailConfPrivateEdit.value,
                "CurrentPassword": NewMailPassPrivateEdit.value
            };
    var url = "SaveInfoTab3";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSaveTab1Info;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}

function CallbackSaveTab3Info() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null && reqPrivate.responseText.length > 0){
            var ErrorS = JSON.parse(reqPrivate.responseText);
            SaveDialog(ErrorS.Message);
            }
        }
    }
}

function SaveTab1Info() {
    var values =  {  
                "Name": NamePrivateEdit.value,
                "Surname":SurnamePrivateEdit.value,
                "SecondName": SecondNamePrivateEdit.value,
                "Country": CountryPrivateEdit.value
            };
    var url = "SaveInfoTab1";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSaveTab1Info;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}


function CallbackSaveTab1Info() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null && reqPrivate.responseText.length>0){
            var ErrorS = JSON.parse(reqPrivate.responseText);
            SaveDialog(ErrorS.Message);
            }
        }
    }
}

function SaveDialog(message){
var formReadReminder=document.createElement("form");
var newInput=document.createElement("input");
formReadReminder.style.cssText="background-color: #285F74;text-align:center;"
var newP=document.createElement("p");
newP.style.cssText="color:#FFFFFF;";
newP.innerHTML=message;
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

function FieldLoadFromDB() {
    var url = "LoadInfoFromDB";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackLoadInfo;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send();
}

function CallbackLoadInfo() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null)
                if(reqPrivate.responseText.length > 0){
            var ErrorS = JSON.parse(reqPrivate.responseText);
            AppendFieldInfoFromDB(ErrorS);
            }
        }
    }
}

function AppendFieldInfoFromDB(Message) {
        if(Message.Balance != null)
            Balance.innerHTML = Message.Balance;
       if(Message.Name != null)
            NamePrivateEdit.value = Message.Name;
       
       if(Message.Surname != null)
           SurnamePrivateEdit.value = Message.Surname;
    
       if(Message.Second != null)
           SecondNamePrivateEdit.value = Message.Second;
    
       if(Message.Country != null)
           CountryPrivateEdit.value = Message.Country;
       
       if(Message.Email != null)
           CurrentEmail.innerHTML = Message.Email;
           
       if(Message.Phone != null)
           CurrentPhone.innerHTML = Message.Phone;
       
       if(Message.Passport != null)
           PassportPrivateEdit.value =  Message.Passport;
       
        if(Message.SelectOptions != null){
           var OptionsPay = JSON.parse(Message.SelectOptions);
           
        for (var i=0; i<OptionsPay.length;i++)
                PaySystemPrivateEdit.options[PaySystemPrivateEdit.options.length] = new Option(OptionsPay[i], i);
        }
        
       if(Message.Pay_sys != null)
           PaySystemPrivateEdit.options[Message.Pay_sys].selected = true;
       
        if(Message.Score != null) 
            PayNumPrivateEdit.value = Message.Score;
}

function Tab1FieldChanged() {
    var values =  {  
                "Name": NamePrivateEdit.value,
                "Surname":SurnamePrivateEdit.value,
                "SecondName": SecondNamePrivateEdit.value,
                "Country": CountryPrivateEdit.value
            };
    var url = "ValidateTab1";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackTab1Changet;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));   
}

function CallbackTab1Changet() {
    NamePrivateError.innerHTML="";
    SurnamePrivateError.innerHTML="";
    SecondNamePrivateError.innerHTML="";
    CountryPrivateError.innerHTML="";
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null)
            if(reqPrivate.responseText.length>0)
            parseMessagesTab1Error(reqPrivate.responseText);
        }
    }
}

function parseMessagesTab1Error(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
          AppendErrorFieldTab1(ErrorS);
        } 
    }
}
   
   function AppendErrorFieldTab1(Message) {
       
       if(Message.Name!=null)
           NamePrivateError.innerHTML = Message.Name;
       
       if(Message.Surname!=null)
           SurnamePrivateError.innerHTML = Message.Surname;
    
       if(Message.Second!=null)
           SecondNamePrivateError.innerHTML = Message.Second;
    
       if(Message.Country!=null)
           CountryPrivateError.innerHTML = Message.Country;
   }