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

var BalanceTab8;
var CurrentEmail;

var CurrentPhone;
var OutMoneyPrivateEdit;
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
    CurPassPhonePrivateEdit = document.getElementById("CurPassPhonePrivateEdit");
    
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
    
    OutMoneyPrivateEdit = document.getElementById("OutMoneyPrivateEdit");
    Balance = document.getElementById("Balance");
    BalanceTab8 = document.getElementById("BalanceTab8");
    
    CurrentEmail = document.getElementById("CurrentEmail");
    
    CurrentPhone = document.getElementById("CurrentPhone");
    
    FieldLoadFromDB();
}


$(function() {
$( "#tabs" ).tabs({
beforeActivate: function(event, ui) {
var selected = ui.newTab.index();
if(selected == 8)
    GetRequestOutMoney(0,10);
}
}).addClass( "ui-tabs-vertical ui-helper-clearfix" );
$( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );

});

function GetRange(){
var SelectRange = document.getElementById("SelectRange");
    var SelectedIndex = SelectRange.options.selectedIndex;
    var ArraySelect = SelectRange.options;
    var Range = ArraySelect[SelectedIndex].text;
    return Range;
}

function SelectRangeChange() {
    var Range = GetRange();
    GetRequestOutMoney(0,Range)
}

function GetRequestOutMoney(PageNum,Range) {
    var values =  {  
                "PageNum": PageNum,
                "Range": Range
            };
    var url = "GetRequestOutMoney";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackResponseOutMoney;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}


function CallbackResponseOutMoney() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null && reqPrivate.responseText.length>0){
            var Message = JSON.parse(reqPrivate.responseText);
                    ShowRequestList(Message);
            }
        }
    }
}

function ShowRequestList(responseText){
    var rootDiv = document.createElement("div");
    var NewDivLogin = document.createElement("div");
    var NewDivDate = document.createElement("div");
    var NewDivSum = document.createElement("div");
    var NewDivBalance = document.createElement("div");
    var NewDivChecked = document.createElement("div");
    var CurrentDiv = document.getElementById("RequestList");
    NewDivLogin.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivDate.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivSum.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivBalance.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivChecked.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    rootDiv.style.cssText = "text-align: left; border: solid red 1px";
    CurrentDiv.innerHTML = "";
    var NewPLogin = document.createElement("p");
    var NewPDate = document.createElement("p");
    var NewPSum = document.createElement("p");
    var NewPBalance = document.createElement("p");
    var NewPChecked = document.createElement("p");
    NewPLogin.style.cssText = "text-align:center";
    NewPDate.style.cssText = "text-align:center";
    NewPSum.style.cssText = "text-align:center";
    NewPBalance.style.cssText = "text-align:center";
    NewPChecked.style.cssText = "text-align:center";
    NewPLogin.innerHTML = "Login";
    NewPDate.innerHTML = "Date";
    NewPSum.innerHTML = "Sum";
    NewPBalance.innerHTML = "Balance";
    NewPChecked.innerHTML = "Выбор";
    NewDivLogin.appendChild(NewPLogin);
    NewDivDate.appendChild(NewPDate);
    NewDivSum.appendChild(NewPSum);
    NewDivBalance.appendChild(NewPBalance);
    NewDivChecked.appendChild(NewPChecked);
    NewDivChecked.setAttribute("id","CheckedDiv")
    var NewInputChecked;
    for (var i=0; i<responseText.User.length;i++){
       NewDivLogin.innerHTML+=responseText.User[i].Login+"</br>";
       NewDivDate.innerHTML+=responseText.User[i].Date+"</br>";
       NewDivSum.innerHTML+=responseText.User[i].Sum+"</br>";
       NewDivBalance.innerHTML+=responseText.User[i].Balance+"</br>";
       NewInputChecked = document.createElement("input");
       NewInputChecked.type = "checkbox";
       NewInputChecked.style.cssText = "float:left";
       NewInputChecked.setAttribute('id',responseText.User[i].Id);
       NewDivChecked.appendChild(NewInputChecked);
       NewDivChecked.innerHTML += "<br/>";
    }
    
       rootDiv.appendChild(NewDivLogin);
       rootDiv.appendChild(NewDivDate);
       rootDiv.appendChild(NewDivSum);
       rootDiv.appendChild(NewDivBalance);
       rootDiv.appendChild(NewDivChecked);
    
    var NewDivLink = document.createElement("div");
    NewDivLink.style.cssText = "display:block;";
    var NewLink;
   // var NewSelect = document.createElement("select");
   // NewSelect.id = "SelectRange";
    var SelectRange = document.getElementById("SelectRange");
    var SelectedIndex = SelectRange.options.selectedIndex;
    var ArraySelect = SelectRange.options;
    var Range = ArraySelect[SelectedIndex].text;
    var CountUserRequest = responseText.Count;
    var LinkId = 0;
    for(var i=0; i < (CountUserRequest < Range ? 1 : (CountUserRequest / Range) < 20 ? (CountUserRequest / Range) : 20); i++){
        NewLink = document.createElement("a");
        NewLink.setAttribute('href',"#");
        NewLink.style.cssText = "margin-left: 3px";
        NewLink.setAttribute('onclick',"GetRequestOutMoney(" + i * Range + "," + Range + ");return false;");
        NewLink.innerHTML = i + 1;
        NewDivLink.appendChild(NewLink);
    }
    CurrentDiv.appendChild(NewDivLink);
    CurrentDiv.appendChild(rootDiv);
}

function ResponseOutMoney(){
    var parent = document.getElementById("CheckedDiv");
    var child = parent.firstChild;
    var myObject = {};
    myObject["CheckedItems"] = [];
    var i = 0;
    while(child) {
        if(child.id > 0){
            if(child.checked)
             myObject.CheckedItems[i++] = child.id;
        }
    child = child.nextSibling;
}
    if(i == 0)
        return;
    var url = "ResponseOutMoney";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(myObject));
}


function RequestOutMoney() {
    var values =  {  
                "Sum": OutMoneyPrivateEdit.value
            };
    var url = "RequestOutMoney";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}

function SaveTab6Info() {
    var values =  {  
                "NewPassport": PassportPrivateEdit.value,
                "NewPaySys":PaySystemPrivateEdit.options.selectedIndex,
                "NewPayNum":PayNumPrivateEdit.value,
                "CurrentPassword": CurPassPayPrivateEdit.value
            };
    var url = "SaveInfoTab6";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}

function SaveTab5Info() {
    var values =  {  
                "NewPhone": NewPhonePrivateEdit.value,
                "ConfNewPhone":NewPhoneConfPrivateEdit.value,
                "CurrentPassword": CurPassPhonePrivateEdit.value
            };
    var url = "SaveInfoTab5";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
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
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
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
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
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
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}


function CallbackSave() {
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
        if(Message.Balance !== null){
            Balance.innerHTML = Message.Balance;
            BalanceTab8.innerHTML = Message.Balance;
        }
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