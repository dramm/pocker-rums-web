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
var selected = ui.newTab.find("a").attr("href");
if(selected == '#tabs-10')
    GetRequestUserOutMoney(0,10);
if(selected == '#tabs-9')
    GetRequestOutMoney(0,10);
if(selected == '#tabs-11')
    GetUsers(0,10);
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

function GetRangeUserRequest(){
var SelectRange = document.getElementById("SelectUserRange");
    var SelectedIndex = SelectRange.options.selectedIndex;
    var ArraySelect = SelectRange.options;
    var Range = ArraySelect[SelectedIndex].text;
    return Range;
}

function GetRangeUsersList(){
var SelectRange = document.getElementById("SelectRangeUsersList");
    var SelectedIndex = SelectRange.options.selectedIndex;
    var ArraySelect = SelectRange.options;
    var Range = ArraySelect[SelectedIndex].text;
    return Range;
}

function SelectRangeChange() {
    var Range = GetRange();
    GetRequestOutMoney(0,Range)
}

function SelectRangeChangeUserRequest() {
    var Range = GetRangeUserRequest();
    GetRequestUserOutMoney(0,Range)
}

function SelectRangeChangeUsersList() {
    var Range = GetRangeUsersList();
    GetUsers(0,Range)
}

function GetUsers(PageNum,Range) {
    var values =  {  
                "PageNum": PageNum,
                "Range": Range
            };
    var url = "GetAllUser";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackShowUsersList;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}

function CallbackShowUsersList() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null && reqPrivate.responseText.length > 0){
            var Message = JSON.parse(reqPrivate.responseText);
                    ShowUsersList(Message);
            }
        }
    }
}

function ShowUsersList(responseText){
    var rootDiv = document.createElement("div");
    var NewDivLogin = document.createElement("div");
    var NewDivDate = document.createElement("div");
    var NewDivRole = document.createElement("div");
    var NewDivBalance = document.createElement("div");
    var NewDivActiveted = document.createElement("div");
    var NewDivBaned = document.createElement("div");
    var NewDivSelectActions = document.createElement("div");
    var CurrentDiv = document.getElementById("ListUsers");
    NewDivLogin.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivDate.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivRole.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivBalance.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivActiveted.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivBaned.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivSelectActions.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    rootDiv.style.cssText = "text-align: left; border: solid red 1px";
    CurrentDiv.innerHTML = "";
    var NewPLogin = document.createElement("p");
    var NewPDate = document.createElement("p");
    var NewPRole = document.createElement("p");
    var NewPBalance = document.createElement("p");
    var NewPBaned = document.createElement("p");
    var NewPActivated = document.createElement("p");
    var NewPChecked = document.createElement("p");
    NewPLogin.style.cssText = "text-align:center";
    NewPDate.style.cssText = "text-align:center";
    NewPRole.style.cssText = "text-align:center";
    NewPBalance.style.cssText = "text-align:center";
    NewPChecked.style.cssText = "text-align:center";
    NewPLogin.innerHTML = "Логин";
    NewPDate.innerHTML = "Дата регистрации";
    NewPRole.innerHTML = "Роль";
    NewPBalance.innerHTML = "Баланс";
    NewPActivated.innerHTML = "Активирован";
    NewPBaned.innerHTML = "Блокирован";
    NewPChecked.innerHTML = "Выбор";
    NewDivLogin.appendChild(NewPLogin);
    NewDivDate.appendChild(NewPDate);
    NewDivRole.appendChild(NewPRole);
    NewDivBalance.appendChild(NewPBalance);
    NewDivActiveted.appendChild(NewPActivated);
    NewDivBaned.appendChild(NewPBaned);
    NewDivSelectActions.appendChild(NewPChecked);
    NewDivSelectActions.setAttribute("id","SelectedAction")
    var NewSelectedAction;
    for (var i=0; i<responseText.User.length;i++){
       NewDivLogin.innerHTML+=responseText.User[i].Login+"</br>";
       NewDivDate.innerHTML+=responseText.User[i].DateRegist+"</br>";
       NewDivRole.innerHTML+=responseText.User[i].Role+"</br>";
       NewDivBalance.innerHTML+=responseText.User[i].Balance+"</br>";
       NewDivBaned.innerHTML+=responseText.User[i].Banned+"</br>";
       NewDivActiveted.innerHTML+=responseText.User[i].Activated+"</br>";
       NewSelectedAction = document.createElement("select");
       NewSelectedAction.style.cssText = "float:left;font-size:11px";
       NewSelectedAction.setAttribute('id',responseText.User[i].Id);
       NewSelectedAction.options[NewSelectedAction.options.length] = new Option("Выбор", 0);
       NewSelectedAction.options[NewSelectedAction.options.length] = new Option("Менеджер", 1);
       NewSelectedAction.options[NewSelectedAction.options.length] = new Option("Пользователь", 2);
       NewSelectedAction.options[NewSelectedAction.options.length] = new Option("Блокировать", 3);
       NewSelectedAction.options[NewSelectedAction.options.length] = new Option("Разблокировать", 4);
       NewDivSelectActions.appendChild(NewSelectedAction);
       NewDivSelectActions.innerHTML += "<br/>";
    }
       rootDiv.appendChild(NewDivLogin);
       rootDiv.appendChild(NewDivDate);
       rootDiv.appendChild(NewDivRole);
       rootDiv.appendChild(NewDivBalance);
       rootDiv.appendChild(NewDivBaned);
       rootDiv.appendChild(NewDivActiveted);
       rootDiv.appendChild(NewDivSelectActions);
    
    var NewDivLink = document.createElement("div");
    NewDivLink.style.cssText = "display:block;";
    var NewLink;
    var SelectRange = document.getElementById("SelectRangeUsersList");
    var SelectedIndex = SelectRange.options.selectedIndex;
    var ArraySelect = SelectRange.options;
    var Range = ArraySelect[SelectedIndex].text;
    var CountUserRequest = responseText.Count;
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

function GetRequestUserOutMoney(PageNum,Range) {
    var values =  {  
                "PageNum": PageNum,
                "Range": Range
            };
    var url = "GetRequestOutMoneyCurrentUser";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackResponseUserOutMoney;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
}

function CallbackResponseUserOutMoney() {
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null && reqPrivate.responseText.length > 0){
            var Message = JSON.parse(reqPrivate.responseText);
                    ShowRequestUserList(Message);
            }
        }
    }
}

function ShowRequestUserList(responseText){
    var rootDiv = document.createElement("div");
    var NewDivDateRequest = document.createElement("div");
    var NewDivDateResponse = document.createElement("div");
    var NewDivBalanceRequest = document.createElement("div");
    var NewDivBalanceResponse = document.createElement("div");
    var NewDivManager = document.createElement("div");
    var NewDivStatus = document.createElement("div");
    var NewDivSum = document.createElement("div");
    var CurrentDiv = document.getElementById("RequestListUser");
    NewDivDateRequest.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivDateResponse.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivBalanceRequest.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivBalanceResponse.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivManager.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivStatus.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivSum.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    rootDiv.style.cssText = "text-align: left; border: solid red 1px";
    CurrentDiv.innerHTML = "";
    var NewPDateRequest = document.createElement("p");
    var NewPDateResponse = document.createElement("p");
    var NewPBalanceRequest = document.createElement("p");
    var NewPBalanceResponse = document.createElement("p");
    var NewPManager = document.createElement("p");
    var NewPStatus = document.createElement("p");
    var NewPSum = document.createElement("p");
    NewPDateRequest.style.cssText = "text-align:center";
    NewPDateResponse.style.cssText = "text-align:center";
    NewPBalanceRequest.style.cssText = "text-align:center";
    NewPBalanceResponse.style.cssText = "text-align:center";
    NewPManager.style.cssText = "text-align:center";
    NewPStatus.style.cssText = "text-align:center";
    NewPSum.style.cssText = "text-align:center";
    NewPDateRequest.innerHTML = "Дата запроса";
    NewPDateResponse.innerHTML = "Дата обработки";
    NewPBalanceRequest.innerHTML = "Баланс до";
    NewPBalanceResponse.innerHTML = "Баланс после";
    NewPManager.innerHTML = "Обработал";
    NewPStatus.innerHTML = "Статус";
    NewPSum.innerHTML = "Cумма";
    NewDivDateRequest.appendChild(NewPDateRequest);
    NewDivDateResponse.appendChild(NewPDateResponse);
    NewDivBalanceRequest.appendChild(NewPBalanceRequest);
    NewDivBalanceResponse.appendChild(NewPBalanceResponse);
    NewDivManager.appendChild(NewPManager);
    NewDivStatus.appendChild(NewPStatus);
    NewDivSum.appendChild(NewPSum);
    
   
    for (var i=0; i<responseText.User.length;i++){
       NewDivDateRequest.innerHTML+=responseText.User[i].DateRequest+"</br>";
       NewDivDateResponse.innerHTML+=responseText.User[i].DateResponse+"</br>";
       NewDivBalanceRequest.innerHTML+=responseText.User[i].BalanceRequest+"</br>";
       NewDivBalanceResponse.innerHTML+=responseText.User[i].BalanceResponse+"</br>";
       NewDivSum.innerHTML+=responseText.User[i].Sum+"</br>";
       NewDivManager.innerHTML+=responseText.User[i].Manager+"</br>";
       if(responseText.User[i].Status == 0)
        NewDivStatus.innerHTML+="Ожидает"+"</br>";
    if(responseText.User[i].Status == 1)
        NewDivStatus.innerHTML+="Обработка"+"</br>";
    if(responseText.User[i].Status == 2)
        NewDivStatus.innerHTML+="Выполнено"+"</br>";
    if(responseText.User[i].Status == 3)
        NewDivStatus.innerHTML+="Отменено"+"</br>";
    }
       rootDiv.appendChild(NewDivDateRequest);
       rootDiv.appendChild(NewDivDateResponse);
       rootDiv.appendChild(NewDivBalanceRequest);
       rootDiv.appendChild(NewDivBalanceResponse);
       rootDiv.appendChild(NewDivManager);
       rootDiv.appendChild(NewDivSum);
       rootDiv.appendChild(NewDivStatus);
       var NewDivLink = document.createElement("div");
       NewDivLink.style.cssText = "display:block;";
       var NewLink;
       var SelectRange = document.getElementById("SelectUserRange");
       var SelectedIndex = SelectRange.options.selectedIndex;
       var ArraySelect = SelectRange.options;
       var Range = ArraySelect[SelectedIndex].text;
       var CountUserRequest = responseText.Count;
        for(var i=0; i < (CountUserRequest < Range ? 1 : (CountUserRequest / Range) < 20 ? (CountUserRequest / Range) : 20); i++){
            NewLink = document.createElement("a");
            NewLink.setAttribute('href',"#");
            NewLink.style.cssText = "margin-left: 3px";
            NewLink.setAttribute('onclick',"GetRequestUserOutMoney(" + i * Range + "," + Range + ");return false;");
            NewLink.innerHTML = i + 1;
            NewDivLink.appendChild(NewLink);
        }
        CurrentDiv.appendChild(NewDivLink);
        CurrentDiv.appendChild(rootDiv);
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
    var NewDivSelectActionsMoney = document.createElement("div");
    var CurrentDiv = document.getElementById("RequestList");
    NewDivLogin.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivDate.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivSum.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivBalance.style.cssText = "float:left;font-size:18px; border: solid red 1px";
    NewDivSelectActionsMoney.style.cssText = "float:left;font-size:18px; border: solid red 1px";
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
    NewDivSelectActionsMoney.appendChild(NewPChecked);
    NewDivSelectActionsMoney.setAttribute("id","NewDivSelectActionsMoney")
    var NewSelectedActionMoney;
    for (var i=0; i<responseText.User.length;i++){
       NewDivLogin.innerHTML+=responseText.User[i].Login+"</br>";
       NewDivDate.innerHTML+=responseText.User[i].Date+"</br>";
       NewDivSum.innerHTML+=responseText.User[i].Sum+"</br>";
       NewDivBalance.innerHTML+=responseText.User[i].Balance+"</br>";
       NewSelectedActionMoney = document.createElement("select");
       NewSelectedActionMoney.style.cssText = "float:left;font-size:11px";
       NewSelectedActionMoney.setAttribute('id',responseText.User[i].Id);
       NewSelectedActionMoney.setAttribute('onchange',"ChangeListOutMoney('"+responseText.User[i].Id+"')");
       NewSelectedActionMoney.options[NewSelectedActionMoney.options.length] = new Option("Выбор", 0);
       NewSelectedActionMoney.options[NewSelectedActionMoney.options.length] = new Option("Оплатить", 1);
       NewSelectedActionMoney.options[NewSelectedActionMoney.options.length] = new Option("Отказать", 2);
       NewDivSelectActionsMoney.appendChild(NewSelectedActionMoney);
       NewDivSelectActionsMoney.innerHTML += "<br/>";
    }
    
       rootDiv.appendChild(NewDivLogin);
       rootDiv.appendChild(NewDivDate);
       rootDiv.appendChild(NewDivSum);
       rootDiv.appendChild(NewDivBalance);
       rootDiv.appendChild(NewDivSelectActionsMoney);
    
    var NewDivLink = document.createElement("div");
    NewDivLink.style.cssText = "display:block;";
    var NewLink;
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

function ChangeListOutMoney(UserId){
    var SelectAction = document.getElementById(UserId);
    var SelectActionIndex = SelectAction.options.selectedIndex;
    if(SelectActionIndex != 0)
        DialogComment(UserId);         
}

function ExecuteSelectedActions(){
    var parent = document.getElementById("SelectedAction");
    var child = parent.firstChild;
    var json = { };
    var i = 0;
    while(child) {
        if(child.id > 0){
            var SelectAction = document.getElementById(child.id);
            var SelectActionIndex = SelectAction.options.selectedIndex;
            if(SelectActionIndex != 0){ 
                     json[child.id]=SelectActionIndex;
                     i++;
                 }
             }
    child = child.nextSibling;
}
    if(i == 0)
        return;
    var url = "ExecuteActionOverUsers";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackSave;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(json));
}


function ResponseOutMoney(){
    var parent = document.getElementById("NewDivSelectActionsMoney");
    var child = parent.firstChild;
    var myObject = {};
    var i = 0;
    var date = new Date(0);
    //myObject["Comment"] = [];
    while(child) {
        if(child.id > 0){
            var SelectAction = document.getElementById(child.id);
            var SelectActionIndex = SelectAction.options.selectedIndex;
            if(SelectActionIndex != 0){ 
                myObject[child.id] = [];//SelectActionIndex;
                myObject[child.id][0] = SelectActionIndex;
                myObject[child.id][1] = getCookie("User"+child.id);
                document.cookie="User"+child.id+"=; path=/; expires="+date.toUTCString();
                i++;
                 }
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
    $( formReadReminder).dialog({ modal: true,maxHeight:200,maxWidth:400,minHeight:200,minWidth:400});
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
   
   function selectMail(){
       
       var Login = document.getElementById("RestorePassEdit");
       var values =  {  
                "login": Login.value 
            };
    var url = "ResetPass";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackResetPass;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));
   }
   
   function CallbackResetPass() {
   
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null)
            if(reqPrivate.responseText.length>0)
            parseMessagesReset(reqPrivate.responseText);
        }
    }
}


function parseMessagesReset(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
          if(ErrorS.Error != "true"){
                registDialog("Инструкция для востановления пароля отправленна вам на e-mail");
          }
          else
              registDialog("Пользователя не существует");
        } 
    }
}
  
   function RestorePassFieldChanged() {
   var Login = document.getElementById("RestorePassEdit");
   
    var values =  {  
                "login": Login 
            };
    var url = "ValidLoginResetPass";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackResetPassChanget;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values));   
}

function CallbackResetPassChanget() {
    var validMessage = document.getElementById("LoginResetPassError");
    validMessage.innerHTML = "";
    if (reqPrivate.readyState == 4) {
        if (reqPrivate.status == 200) {
            if(reqPrivate.responseText != null)
            if(reqPrivate.responseText.length>0)
            parseMessagesResetPass(reqPrivate.responseText);
        }
    }
}
   
   function parseMessagesResetPass(responseText) {
    if (responseText == null) {
        return false;
    } else {
        if (responseText.length > 0) {
        var ErrorS = JSON.parse(responseText);
          if(ErrorS.Login != null){
              var validMessage = document.getElementById("LoginResetPassError");
              validMessage.innerHTML = ErrorS.Login;
          }
          else
              document.getElementById("ResetPassButt").disabled = false;
        } 
    }
}
   
   function SendTokenNewMail(){
    var url = "ValidateTab1";
    reqPrivate = new XMLHttpRequest();
    reqPrivate.open("POST", url, true);
    reqPrivate.onreadystatechange = CallbackTab1Changet;
    reqPrivate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    reqPrivate.send(JSON.stringify(values)); 
   }
   
   function MailDialog(){
    var formReadReminder=document.createElement("form");
    var NewInput = document.createElement("input");
    var newInput=document.createElement("input");
    formReadReminder.style.cssText="background-color: #285F74;text-align:center;"
    var newP=document.createElement("p");
    newP.style.cssText="color:#FFFFFF;";
    newP.innerHTML = message;
    formReadReminder.appendChild(newP);
    NewInput.setAttribute("type","text");
    newInput.setAttribute("type","submit");
   // newInput.setAttribute("onclick",);
    newInput.style.cssText="color: white;padding: 1px;display:inline-block;border: solid 2px #285F74;"+
    "border-radius: 6px;min-width: 76px;text-align: center;background: #000000;"+
    "background: -moz-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -webkit-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -o-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: -ms-linear-gradient(top, #285F74 0%, #0d2a34 100%);"+
    "background: linear-gradient(top, #285F74 0%, #0d2a34 100%);";
    newInput.setAttribute("value","OK");
    formReadReminder.appendChild(newInput);
    $( formReadReminder).dialog({ modal: true,maxHeight:200,maxWidth:400,minHeight:200,minWidth:400});
}

function DialogComment(useriId){
var formReadReminder=document.createElement("form");
var newInput=document.createElement("input");
var newComment=document.createElement("input");
formReadReminder.style.cssText="background-color: #285F74;text-align:center;"
newComment.setAttribute("id","NewCommentArea");
newComment.setAttribute("type","textarea");
formReadReminder.innerHTML+="Введите коментарий</br>";
formReadReminder.appendChild(newComment);
formReadReminder.innerHTML+="</br>";
formReadReminder.setAttribute("id","formReadReminder");
newInput.setAttribute("type","button");
newInput.setAttribute("onclick","SetNewCookie('User"+useriId+"');return false;");
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
$( formReadReminder).dialog({ modal: true,maxHeight:200,maxWidth:400,minHeight:200,minWidth:400
        });
}

function SetNewCookie(useriId){
    var comment = document.getElementById("NewCommentArea");
    document.cookie = useriId+"="+comment.value;
    $("#formReadReminder").dialog('close');
 }

function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}