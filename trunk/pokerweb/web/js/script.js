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
        
         $("#menuGame .button").keyup(function()
        {   
            setButtonGradient($(this),false)
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
        
        $('#menuGame .button').click(function () {
            var butt = $(this);
            setButtonGradient(butt,true);
            
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



