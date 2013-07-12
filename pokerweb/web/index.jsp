<%-- 
    Document   : index
    Created on : Jul 11, 2013, 12:10:44 AM
    Author     : vadim
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sergio Richi Casino</title>
        <meta name="description" content="Sergio Richi - лучшее казино....">
        <meta name="keywords" content="Rergio Richi казино играть live спорт футбол ставки выиграть ">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>        
        <link rel="Stylesheet" href="style.css" type="text/css" />
    
    <script type="text/javascript" src="slider/jquery.nivo.slider.js"></script>    
    <link rel="stylesheet" href="slider/themes/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/themes/light/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/themes/dark/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/themes/bar/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/nivo-slider.css" type="text/css" media="screen" />

    </head>
    <body>
        
        <div id="header">
            <div class="leftCol"> </div>
            <div class="centerCol"> 
                <div id="topMenu"> 
                    <div>
                        <a href="#">О нас</a> | <a href="#">Помощь и обучение</a> | <a href="#">Ответственная игра</a>
                    </div>
                    <div>
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
                            <form class="dropdownMenu signIn" method="GET" action="#">
                            <div>                                
                                <div class="caption">Логин:</div>
                                <input type="text" name="login"/>
                                <div class="wrongInput">введите логин</div>
                            </div>
                            <div>
                                <div class="caption">Пароль:</div>
                                <input type="password" name="password"/>
                                <div class="wrongInput">введите пароль</div>
                            </div>                            
                            <div class="centered">
                                <input type="button" class="button" value="ВХОД"/>
                            </div>    
                        </form>
                        </div>
                        
                    </div>
                    <a href="#">Забыли пароль?</a>                    
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
                <div id="headerContent"> 
                    <div class="firstText">Именно СЕЙЧАС 348 активных столов!</div>
                    <br><div class="secondText">На сайте 1023 посетителя</div>
                </div>
                <div id="mainMenu"> 
                    <div class="button">Спорт</div>
                    <div class="button">Live</div>
                    <div class="button">Футбол</div>
                    <div class="button">Казино</div>
                    <div class="button">Live казино</div>
                    <div class="button">Покер</div>
                    <div class="button active">Игры</div>
                    <div class="button">Аркады</div>
                    <div class="button">Топ столы</div>
                    <div class="button">Акции</div>
                </div>
                
            </div>
            <div class="rightCol"> </div>      
        </div>
        <div class="separator"></div>       
        <div id="center">
            <!--<div class="leftCol dark"> </div>
            <div class="centerCol"> -->
                <div class="slider-wrapper theme-dark">
                    <div id="slider" class="nivoSlider">
                        <!--<img src="slider/images/toystory.jpg" data-thumb="slider/images/toystory.jpg" alt="" data-transition="slideInLeft"/>
                        <a href="http://dev7studios.com"><img src="slider/images/up.jpg" data-thumb="slider/images/up.jpg" alt="" title="This is an example of a caption" data-transition="slideInLeft"/></a>
                        <img src="slider/images/walle.jpg" data-thumb="slider/images/walle.jpg" alt="" data-transition="slideInLeft" />
                        <img src="slider/images/nemo.jpg" data-thumb="slider/images/nemo.jpg" alt="" title="#htmlcaption" data-transition="slideInLeft"/>-->
                        <img src="slider/images/banner1.png" data-thumb="slider/images/banner1.png" alt=""  />
                    </div>
                </div>
            <!--</div>
            <div class="rightCol dark"> </div>-->
            <div class="separator"></div>
            <div class="leftCol"> </div>
            <div class="centerCol"> 
                <div id="smallContainer">
                    <div >
                        <div id="sm1" class="smallMenuItem">
                            <div class="menuTitle">Покер против казино</div>
                        </div>
                        <div id="sm2" class="smallMenuItem">
                            <div class="menuTitle">Покер между людьми</div>
                        </div>
                        <div id="sm3" class="smallMenuItem">
                            <div class="menuTitle">Ставки на спорт</div>
                        </div>
                    </div>
                    <div >
                        <div id="sm4" class="smallMenuItem">
                            <div class="menuTitle">Игровые автоматы</div>
                        </div>
                        <div id="sm5" class="smallMenuItem">
                            <div class="menuTitle">Онлайн спорт трансляции</div>
                        </div>
                        <div id="sm6" class="smallMenuItem">
                            <div class="menuTitle">Игры против казино</div>
                        </div>
                    </div>
                </div>
                <div class="bigMenuItem">
                    <div class="bigMenuTop">Зарегистрируйтесь</div>
                    <div class="bigMenuCenter">
                        <div>
                            <div>Турниры</div>
                        </div>
                        <div>
                            <div>Игры онлайн</div>
                        </div>    
                        <div>
                            <div>Ежедневные фрироллы</div>
                        </div>
                    </div>
                    <div class="bigMenuBottom">
                        <div class="button">Зарегистрироваться</div>
                    </div>
                </div>
                Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Еще.
                <ul>
                    <li>Турниры до 1000000 денег</li>
                    <li>Ставки круглосуточно</li>
                    <li>Стабильность и качество Вашей работы</li>
                </ul>
                Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино. Приветствуем вас в нашем казино.
            </div>
            <div class="leftCol"> </div>
            <div class="separator"></div>
        </div>
        
        <div id="footer">
            <div>
                <div class="leftCol"> </div>
                <div class="centerCol">
                    <div class="half">
                        <div class="references">
                            <div class="title">Платежные системы</div>
                            <div class="cont">
                                <a href="#"><img src="pic/paySystem/webmoney.png"/></a>
                                <a href="#"><img src="pic/paySystem/yad.png"/></a>
                                <a href="#"><img src="pic/paySystem/visa.png"/></a>
                                <a href="#"><img src="pic/paySystem/mastercard.png"/></a>
                                <a href="#"><img src="pic/paySystem/contact.png"/></a>
                            </div>
                        </div>
                        <div class="references">
                            <div class="title">Наши партнеры</div>
                            <div class="cont">
                                <a href="#"><img src="pic/paySystem/webmoney.png"/></a>
                                <a href="#"><img src="pic/paySystem/yad.png"/></a>
                                <a href="#"><img src="pic/paySystem/visa.png"/></a>
                                <a href="#"><img src="pic/paySystem/mastercard.png"/></a>
                                <a href="#"><img src="pic/paySystem/contact.png"/></a>
                            </div>
                        </div>
                    </div>
                    <div class="half">
                        <div class="references">
                            <div class="title">Лицензии</div>
                            <div class="cont">
                                <a href="#"><img src="pic/footer/eighteenplus.png"/></a>
                                <a href="#"><img src="pic/footer/1.png"/></a>
                                <a href="#"><img src="pic/footer/hand.png"/></a>
                                <a href="#"><img src="pic/footer/2.png"/></a>
                                <a href="#"><img src="pic/footer/verysign.png"/></a>
                                <a href="#"><img src="pic/footer/oddsr.png"/></a>
                            </div>
                        </div>
                        <div class="references">
                            <div class="title">Безопасность и надежность</div>
                            <div class="cont">
                                <a href="#"><img src="pic/paySystem/webmoney.png"/></a>
                                <a href="#"><img src="pic/paySystem/yad.png"/></a>
                                <a href="#"><img src="pic/paySystem/visa.png"/></a>
                                <a href="#"><img src="pic/paySystem/mastercard.png"/></a>
                                <a href="#"><img src="pic/paySystem/contact.png"/></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="rightCol"> </div>
            </div>
            <div class="sep"></div>
            <div>
                <div class="leftCol"> </div>
                <div class="centerCol">
                    <div class="navigation">
                        <div><div id="nav1"><div>
                           <h2>
                                <a href="#">О нас</a>
                           </h2>
                           <ul>
                                <li>
                                    <a href="#">Партнеры</a>
                                </li>
                                <li>
                                    <a href="#">Столы</a>
                                </li>
                                <li>
                                    <a href="#">Заказы</a>
                                </li>
                                <li>
                                    <a href="#">Лобби</a>
                                </li>
                                <li>
                                    <a href="#">Комбинация</a>
                                </li>
                                <li>
                                    <a href="#">Лучшие игроки</a>
                                </li>
                           </ul> 
                        </div></div></div>
                        <div><div id="nav2"><div>
                           <h2>
                                <a href="#">О нас</a>
                           </h2>
                           <ul>
                                <li>
                                    <a href="#">Партнеры</a>
                                </li>
                                <li>
                                    <a href="#">Столы</a>
                                </li>
                                <li>
                                    <a href="#">Заказы</a>
                                </li>
                                <li>
                                    <a href="#">Лобби</a>
                                </li>
                                <li>
                                    <a href="#">Комбинация</a>
                                </li>
                                <li>
                                    <a href="#">Лучшие игроки</a>
                                </li>
                           </ul> 
                        </div></div></div>
                        <div><div id="nav3"><div>
                           <h2>
                                <a href="#">О нас</a>
                           </h2>
                           <ul>
                                <li>
                                    <a href="#">Партнеры</a>
                                </li>
                                <li>
                                    <a href="#">Столы</a>
                                </li>
                                <li>
                                    <a href="#">Заказы</a>
                                </li>
                                <li>
                                    <a href="#">Лобби</a>
                                </li>
                                <li>
                                    <a href="#">Комбинация</a>
                                </li>
                                <li>
                                    <a href="#">Лучшие игроки</a>
                                </li>
                           </ul> 
                        </div></div></div>
                    </div>
                </div>
                <div class="rightCol"> </div>
            </div>    
            <div class="sep"></div>
            <div>
                <div class="leftCol"> </div>
                <div class="centerCol copyright">
                    <div class="links">
                        <a href="#"><img src="pic/footer/facebook.png"/></a>
                        <a href="#"><img src="pic/footer/twitter.png"/></a>
                        <a href="#"><img src="pic/footer/hz.png"/></a>
                    </div>
                    <div class="copyrightCenter">
                        Все права защищены. Лицензия подтверждена. Торговая марка не распространяется.
                    </div>
                    <div>
                        <img src="pic/footer/eighteen.png"/>
                    </div>
                </div>
                <div class="rightCol"> </div>
            </div>    
            <div class="sep"></div>
            <div>
                <div class="leftCol"> </div>
                <div class="centerCol additionInfo">
                    Оператор данного веб-сайта, компания Test Electronics, обладает лицензиями выданными Гиралтаром. Выполняет все свои функции по своим возможностям и по согласию правительства планеты Земля.
                </div>
                <div class="rightCol"> </div>
            </div>    
        </div>
    </body>
</html>
