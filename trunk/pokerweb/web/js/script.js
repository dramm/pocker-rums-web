if(typeof jQuery == 'undefined'){
    console.log("jQuery not LOADED!!!");
}

$(window).load(function() {
        $('#slider').nivoSlider();
    });
    
function resetForm(form)
{
    $(form).find("input").each(function()
    {      
        if($(this).attr("type")!="button"&&$(this).attr("type")!="submit")
        {
            var $field=$(this);
            $field.css("border","solid 1px #729CB0");
            $field.next().css("visibility","hidden");
            $field.val("");
        }
    });
}
function setButtonGradient(button,active)
{
    if(active){
        $(button).css("background"," -moz-linear-gradient(top, #0d2a34 0%, #285F74 100%)");
        $(button).css("background"," -webkit-linear-gradient(top, #0d2a34 0%, #285F74 100%)");
        $(button).css("background"," -o-linear-gradient(top, #0d2a34 0%, #285F74 100%)");
        $(button).css("background"," -ms-linear-gradient(top, #0d2a34 0%, #285F74 100%)");
        $(button).css("background"," linear-gradient(top, #0d2a34 0%, #285F74 100%)");
    }
    else{        
        $(button).css("background"," -moz-linear-gradient(top, #285F74 0%, #0d2a34 100%)");
        $(button).css("background"," -webkit-linear-gradient(top, #285F74 0%, #0d2a34 100%)");
        $(button).css("background"," -o-linear-gradient(top, #285F74 0%, #0d2a34 100%)");
        $(button).css("background"," -ms-linear-gradient(top, #285F74 0%, #0d2a34 100%)");
        $(button).css("background"," linear-gradient(top, #285F74 0%, #0d2a34 100%)");
    }
}

$(document).ready(function(){
        $("#game").css({"width":$(document).width()+"px"});
        
        var inf=$(".half:odd .cont");
        inf.css({"border-left":"solid 1px #0e161a"});
        inf.css({"padding-left":"30px"});
        inf.prev().css({"padding-left":"30px"});
        
        var cont=$("#footer .copyrightCenter");
        var s=(cont.parent().width()-(cont.prev().width()+cont.next().width())-cont.width())/2-5;
       cont.css({"margin":"0 "+s+"px 0 "+s+"px"});
        
        $("#mainMenu .button").click(function()
        {    
            $("#mainMenu .active").removeClass("active");
            $(this).addClass("active");
        });
        /*$("input").keypress(function(){
            $(this).css("color","#000000");
        });*/
        
        $('#topMenu .button').click(function () {
            var butt = $(this);
            setButtonGradient(butt,true)
            var forma = butt.find(".dropdownMenu");
            var container=$("#topMenu");
            var left1=butt.offset().left+butt.width()/2 - forma.width()/2-20;
            forma.css({"top":container.height()+8, "left":left1});
            forma.hover(
                    function(){$(this).addClass("under");},
                    function(){$(this).removeClass("under");}
            );
            forma.addClass("started");
            forma.slideDown("fast");
        });
        
        $(document).click(function(){
            $(".dropdownMenu").each(function(){
                var form=$(this);
                if(!form.hasClass("under")&&!form.hasClass("started"))
                {
                    setButtonGradient(form.parent(),false);
                    resetForm(form);
                    form.slideUp("fast");
                }
                form.removeClass("started");
            });
        });

        $(".dropdownMenu .button").click(function(){
            //alert(1);
            var valid=true;
            var $form=$(this).parent().parent();
            $form.find("input").each(function(i){
                var $field=$(this);
                //alert($field.css("color"));
                if($field.val()==""||$field.val()=="undefined")
                 {   //alert($field.attr("name")+" -- |"+$field.attr("value")+"| -- |"+$field.val()+"| :: "+$field.css("color"));
                     $field.css("border","solid red 1px");
                     $field.next().css("visibility","visible");
                     valid=false;
                }else
                {
                    $field.css("border","solid 1px #729CB0");
                    $field.next().css("visibility","hidden");
                }
                if($field.attr("name")=="confirmPassword"&&($field.val()!=$form.find("input[name=password]").val()))
                {
                    //alert($field.attr("name")+"||||"+$field.val()+"---"+$form.find("input[name=password]").val());
                    valid==false;
                    $field.css("border","solid red 1px");
                    $field.next().css("visibility","visible");
                }
            });/**/
            if(valid)
                $form.submit();
        });
});

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
}

function doCompletion() {
    init();
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

function callback() {
    init();
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