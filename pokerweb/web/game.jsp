<%-- 
    Document   : newjsp
    Created on : Jul 11, 2013, 12:56:04 AM
    Author     : vadim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <html>
   <head>
       <jsp:include page="headParam.jsp" flush="true" />
       
</head>
<body style="background-image: url(/pic/backgroundGame.png);
    background-size: cover;
     font-family: arial;">
    <div id="header">
            <div class="leftCol"> </div>
            <div class="centerCol"> 
                <jsp:include page="topMenu.jsp" flush="true" />
                <jsp:include page="headerContent.jsp" flush="true" />
                <jsp:include page="mainMenu.jsp" flush="true" />
            </div>
            <div class="rightCol"> </div>      
        </div>

<div id="center">
    <div class="leftCol"></div>
        <div id="centerCol" style="float: left;width: 70%;" >
            
            <div id="menuGame" >
                <div class="SmallLogo"></div>
                <div style="float: left;color: white;margin-top: 15px;">Время до Ривер-Раунд 5383</div>
                <div id="progressbar"><b style="position: absolute;margin-left: 60px;" id="BaseProgressTime"></b></div>
                <script> 
                    $( "#progressbar" ).progressbar({value: 37});
                </script>
                <div class="button">
                    Объяснение
                </div>
            </div>
            <div style="margin-top: 60px;">
            <div id="table" class="table1">
                 <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" style="margin-left: 85px;">
                        <div class="button" id="Table1User1Factor">1.85</div>
                        <div id="Table1User1Cart1" class="TableUserCart"></div>
                        <div id="Table1User1Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table1User1Progress').css('bottom' , 40 + '%');
                        StartGame();
                    </script>
                    <div class="TableUser" style="margin-left: 15px;">
                        <div class="button" id="Table1User2Factor">1.85</div>
                        <div id="Table1User2Cart1" class="TableUserCart"></div>
                        <div id="Table1User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table1User2Progress').css('bottom' , 40 + '%');</script>
                </div>
                    
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    1</div>
                <div class="TableCart">
                <div id="Table1Flop1" class="flop"></div>
                <div id="Table1Flop2" class="flop"></div>
                <div id="Table1Flop3" class="flop"></div>
                <div id="Table1Tern" class="tern"></div>
                <div id="Table1River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    <div class="TableUser" style="margin-left: 85px;">
                        <div class="button" id="Table1User3Factor">1.85</div>
                        <div id="Table1User3Cart1" class="TableUserCart"></div>
                        <div id="Table1User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table1User3Progress').css('bottom' , 40 + '%');</script>
                    <div class="TableUser" style="margin-left: 15px;">
                        <div class="button" id="Table1User4Factor">1.85</div>
                        <div id="Table1User4Cart1" class="TableUserCart"></div>
                        <div id="Table1User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table1User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table1User4Progress').css('bottom' , 40 + '%');</script>
                </div>
            </div>
                               </div>
            <div id="table" class="table2">
                <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser" style="margin-left: 50px;">
                        <div class="button" id="Table2User1Factor">1.85</div>
                        <div id="Table2User1Cart1" class="TableUserCart"></div>
                        <div id="Table2User1Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <div class="TableUser">
                        <div class="button" id="Table2User2Factor">1.85</div>
                        <div id="Table2User2Cart1" class="TableUserCart"></div>
                        <div id="Table2User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <div class="TableUser">
                        <div class="button" id="Table2User3Factor">1.85</div>
                        <div id="Table2User3Cart1" class="TableUserCart"></div>
                        <div id="Table2User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                </div>
                    <script>
                        $('#Table2User1Progress').css('bottom' , 40 + '%');
                        $('#Table2User2Progress').css('bottom' , 40 + '%');
                        $('#Table2User3Progress').css('bottom' , 40 + '%');
                    </script>
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    2</div>
                <div class="TableCart">
                <div id="Table2Flop1" class="flop"></div>
                <div id="Table2Flop2" class="flop"></div>
                <div id="Table2Flop3" class="flop"></div>
                <div id="Table2Tern" class="tern"></div>
                <div id="Table2River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    
                    <div class="TableUser" style="float: left;margin-left: 50px;">
                        <div class="button" id="Table2User4Factor">1.85</div>
                        <div id="Table2User4Cart1" class="TableUserCart"></div>
                        <div id="Table2User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <div class="TableUser" style="float: left;">
                        <div class="button" id="Table2User5Factor">1.85</div>
                        <div id="Table2User5Cart1" class="TableUserCart"></div>
                        <div id="Table2User5Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <div class="TableUser" style="float: left;">
                        <div class="button" id="Table2User6Factor">1.85</div>
                        <div id="Table2User6Cart1" class="TableUserCart"></div>
                        <div id="Table2User6Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table2User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>
                        $('#Table2User4Progress').css('bottom' , 40 + '%');
                        $('#Table2User5Progress').css('bottom' , 40 + '%');
                        $('#Table2User6Progress').css('bottom' , 40 + '%');
                    </script>
                </div>
            </div>
             </div>
            
            <div id="table" class="table3">
                
                <div style="float: left;width: 360px;">
                <div style="height: 95px;width: 360px;">
                    <div class="TableUser">
                        <div class="button" id="Table3User1Factor">1.85</div>
                        <div id="Table3User1Cart1" class="TableUserCart">
                        </div>
                        <div id="Table3User1Cart2" class="TableUserCart"></div>
                         <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User1Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>
                        $('#Table3User1Progress').css('bottom' , 40 + '%'); 
                    </script>
                    <div class="TableUser">
                        <div class="button" id="Table3User2Factor">1.85</div>
                        <div id="Table3User2Cart1" class="TableUserCart"></div>
                        <div id="Table3User2Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User2Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table3User2Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser">
                        <div class="button" id="Table3User3Factor">1.85</div>
                        <div id="Table3User3Cart1" class="TableUserCart"></div>
                        <div id="Table3User3Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User3Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table3User3Progress').css('bottom' , 40 + '%');</script>
                    
                    <div  class="TableUser">
                        <div class="button" id="Table3User4Factor">1.85</div>
                        <div id="Table3User4Cart1" class="TableUserCart"></div>
                        <div id="Table3User4Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User4Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table3User4Progress').css('bottom' , 40 + '%');</script>
                </div>
                    
                <div class='tableNumber'>
                    <div style="height: 13px;"></div>
                    3</div>
                <div class="TableCart">
                    <div id="Table3Flop1" class="flop"></div>
                <div id="Table3Flop2" class="flop"></div>
                <div id="Table3Flop3" class="flop"></div>
                <div id="Table3Tern" class="tern"></div>
                <div id="Table3River" class="river"></div>
                </div>
                <div style="float: left;margin-top: 25px;">
                    <div  class="TableUser">
                        <div class="button" id="Table3User5Factor">1.85</div>
                        <div id="Table3User5Cart1" class="TableUserCart"></div>
                        <div id="Table3User5Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User5Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>
                        $('#Table3User5Progress').css('bottom' , 40 + '%');                
                    </script>
                    <div  class="TableUser">
                        <div class="button" id="Table3User6Factor">1.85</div>
                        <div id="Table3User6Cart1" class="TableUserCart"></div>
                        <div id="Table3User6Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User6Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table3User6Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser">
                        <div class="button" id="Table3User7Factor">1.85</div>
                        <div id="Table3User7Cart1" class="TableUserCart"></div>
                        <div id="Table3User7Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User7Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                    <script>$('#Table3User7Progress').css('bottom' , 40 + '%');</script>
                    <div  class="TableUser">
                        <div class="button" id="Table3User8Factor">1.85</div>
                        <div id="Table3User8Cart1" class="TableUserCart"></div>
                        <div id="Table3User8Cart2" class="TableUserCart"></div>
                        <div class="progressbar">
                            <span class="progressbar-value">
                                <em id="Table3User8Progress" class="progressbar-cover"></em>
                            </span>
                        </div>
                    </div>
                   <script>$('#Table3User8Progress').css('bottom' , 40 + '%');</script>
                </div>
            </div>
                
                </div>
        </div>
    
<div class="rightCol"></div>
    </div>
             <jsp:include page="footer.jsp" flush="true" />
</body>