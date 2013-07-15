<%-- 
    Document   : topMenu
    Created on : Jul 13, 2013, 8:41:49 PM
    Author     : vadim
--%>

<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div id="topMenu"> 
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
                    </div>
                        <%}else{%>
                        <div class="button">Регистрация

                        <form name="frm" class="dropdownMenu register" action="Regist" method="Post" onSubmit="return Validate()">
                            <div>Заполните пожалуйста все поля</div>
                            <div>                                
                                <div class="caption">Логин:</div>
                                <input type="text" name="login" placeholder="Введите логин"/>
                                <div class="wrongInput">введите логин</div>
                            </div>
                            <div>
                                <div class="caption">Пароль:</div>
                                <input type="password" name="password" placeholder="Введите пароль"/>
                                <div class="wrongInput">введите пароль</div>
                            </div>
                            <div>
                                <div class="caption">Повторите пароль:</div>
                                <input type="password" name="confirmPassword"/>
                                <div class="wrongInput">повторите пароль</div>
                            </div>
                            <div>
                                <div class="caption">Телефон:</div>
                                <input type="text" name="tel"/>
                                <div class="wrongInput">введите телефон</div>
                            </div>
                            <div>
                                <div class="caption">E-mail:</div>
                                <input type="email" name="email"/>
                                <div class="wrongInput">не правильно заполнено</div>
                            </div>
                            <div>
                                <div class="caption">Имя:</div>
                                <input type="text" name="name"/>
                                <div class="wrongInput">введите Ваше имя</div>
                            </div>
                            <div>
                                <div class="caption">Фамилия:</div>
                                <input type="text" name="surname" value=""/>
                                <div class="wrongInput">введите Вашу фамилию</div>
                            </div>
                            <div class="centered">
                                <input type="submit" class="button" value="РЕГИСТРАЦИЯ"/>
                                
                            </div>    
                        </form></div>
                    </div>
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
                        <a href="#">Забыли пароль?</a> 
                        <%}%>
                    <div>
                        <div class="button">Язык
                            <form class="dropdownMenu" id="language" method="GET" action="#">
                                <input class="active" type="submit" name="language" value="Русский"/>
                                <input type="submit" name="language" value="English"/>
                                <input type="submit" name="language" value="Germany"/>
                        </form>
                        </div>
                        
                    </div>
                </div>
