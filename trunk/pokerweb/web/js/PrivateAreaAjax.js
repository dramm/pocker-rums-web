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
    
    FieldLoadFromDB();
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
            if(reqPrivate.responseText != null && reqPrivate.responseText.length>0){
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
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
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
       NamePrivateError.innerHTML="";
       SurnamePrivateError.innerHTML="";
       SecondNamePrivateError.innerHTML="";
       CountryPrivateError.innerHTML="";
       if(Message.Name!=null)
           NamePrivateError.innerHTML = Message.Name;
       
       if(Message.Surname!=null)
           SurnamePrivateError.innerHTML = Message.Surname;
    
       if(Message.Second!=null)
           SecondNamePrivateError.innerHTML = Message.Second;
    
       if(Message.Country!=null)
           CountryPrivateError.innerHTML = Message.Country;
   }