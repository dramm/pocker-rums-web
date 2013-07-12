<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Вход в систему</title>
    </head>
    <body>
        <h1>Введите логин и пароль</h1>
        <form action="j_spring_security_check" method="POST">
            <div id="loginBox">
                <div>
                 <input placeholder="Введите логин" type="text" size="20" name="j_username"></div>
                <div>
                 <input placeholder="Введите пароль" type="password" size="20" name="j_password"></div>
             <div><input type="submit" value="Авторизоваться"></div>
            </div>
        </form>
        
        <div>Демо пользователи:
            <div>
                Логин: user Пароль: test<br />
                Логин: admin Пароль: test<br />
            </div>
        </div>                
    </body>
</html>