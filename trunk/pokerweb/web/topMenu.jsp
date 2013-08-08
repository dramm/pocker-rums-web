<%-- 
    Document   : topMenu
    Created on : Jul 13, 2013, 8:41:49 PM
    Author     : vadim
--%>

<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div id="topMenu" > 
                    <div>

                        <a href="#">О нас </a> | <a href="#">Помощь и обучение</a> | <a href="#">Ответственная игра</a>
                    </div>
                    <div>
                        <%Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                        UserDetails userDetails = null;
                        if (principal instanceof UserDetails) {
                            userDetails = (UserDetails) principal;} 
                        String s="";
                        if(userDetails!=null){%>
                        <b>Вы вошли как</b>
                        <%=userDetails.getUsername()%>
                        <div style="display:inline-block;"> 
                        <form action="j_spring_security_logout" method="Post">
                            <input class="button" type="submit" value="Выход"/>
                        </form>
                         
                    </div>
                        <div style="display:inline-block;">
                        <form action="/PrivateArea">
                            <input class="button" type="submit"  value="Личный кабинет"/>
                        </form>
                            </div>
                        </div>
                        <%}else{%>
                        <div class="button">Регистрация

                        <form name="frm" class="dropdownMenu register" onSubmit="return Validate()">
                            <div class="errorMessage">Заполните пожалуйста все поля</div>
                            <div style="height: 45px;">                                
                                <div class="caption">Логин:</div>
                                <input type="text" id="login" name="login" placeholder="Введите логин" onkeyup="RegistFieldChanged()"/>
                                <div id="LoginError" class="errorMessage">
                                </div>
                              
                            </div>
                            <div style="height: 45px;"> 
                                <div class="caption">Пароль:</div>
                                <input type="password" id="password" name="password" placeholder="Введите пароль" onkeyup="RegistFieldChanged()"/>
                                <div id="PassError" class="errorMessage">
                                </div>
                               
                            </div>
                            <div style="height: 45px;">
                                <div class="caption">Повторите пароль:</div>
                                <input type="password" id="confirmPassword" name="confirmPassword" onkeyup="RegistFieldChanged()"/>
                                <div id="ConfPassError" class="errorMessage">
                                </div>
                                
                            </div>
                            <div style="height: 45px;">
                                <div class="caption">Телефон:</div>
                                <input type="text" id="tel" name="tel" onkeyup="RegistFieldChanged()"/>
                                <div id="TelError" class="errorMessage">
                                </div>
                                
                            </div>
                            <div style="height: 45px;">
                                <div class="caption">E-mail:</div>
                                <input type="email" id="email" name="email" onkeyup="RegistFieldChanged()"/> 
                                <div id="MailError" class="errorMessage" >
                                </div>
                                
                            </div>
                            <div style="height: 45px;">
                                <div class="caption">Имя:</div>
                                <input type="text"  id="name" name="name" onkeyup="RegistFieldChanged()"/>
                                <div id="NameError" class="errorMessage"> </div>
                                
                            </div>
                            <div style="height: 45px;">
                                <div class="caption">Фамилия:</div>
                                <input type="text" id="surname" name="surname" onkeyup="RegistFieldChanged()"/>
                                <div id="SurnameError" class="errorMessage"> </div>
                                
                            </div>
                            <div class="centered">
                                <input class="button" id="RegButton" type="button" onclick="RegistClickButton()" disabled value="РЕГИСТРАЦИЯ"/>
                            </div>
                            
                        </form></div>
                    </div>
                        <div id="modalWait"></div>
                    <div>
                        <div class="button">Войти
                            <form class="dropdownMenu signIn" action="j_spring_security_check" method="POST">
                            <div>                                
                                <div class="caption">Логин:</div>
                                <input type="text" size="20" name="j_username">
                                <div class="wrongInput">введите логин</div>
                            </div>
                            <div>
                                <div class="caption">Пароль:</div>
                                <input type="password" size="20" name="j_password">
                                <div class="wrongInput">введите пароль</div>
                            </div>                            
                            <div class="centered">
                                <input type="submit" class="button" value="ВХОД"/>
                            </div>    
                        </form>
                        </div>
                      
                    </div>
<!--                         -->
                 <div class="button">Забыли пароль?
                            <form class="dropdownMenu signIn" onSubmit="return Validate()">
                            <div>                                
                                <div class="caption">Логин:</div>
                                <input type="text" size="20" id="RestorePassEdit" onkeyup="RestorePassFieldChanged()">
                                <div class="wrongInput">введите логин</div>
                            </div>                       
                            <div class="centered">
                                <input type="button" id="ResetPassButt" class="button" value="Востановить" onclick="selectMail()"/>
                            </div>    
                        </form>
                        </div>
                        <%}%>
                        
                    <div>
                        <div class="button" style="float: right;">Язык
                            <form class="dropdownMenu" id="language" method="GET" action="#">
                                <input class="active" type="submit" name="language" value="Русский"/>
                                <input type="submit" name="language" value="English"/>
                                <input type="submit" name="language" value="Germany"/>
                        </form>
                        </div>
                        
                    </div>
                </div>
