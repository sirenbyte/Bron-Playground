<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <link rel='stylesheet' href='./style.css'>
    <link rel='stylesheet' href='./login.css'>
    
</head>
<body>
  <header>
    <a href="index.do" id="logo"><h1>SportKZ</h1></a>
    <div id="header1">
      <a href="playgrounds.do">ПЛОЩАДКИ</a>
      <a href="#">СОБЫТИЯ</a>
      <a href="contacts.do">КОНТАКТЫ</a>
    </div>
    <div id="header2">
      <a href="#" id="almaty">Алматы <img src="./images/worldwide.png"></a>
      <%if (session.getAttribute("user") != null) {%>
      <form action="logout.do" method="POST">
      <button id="logout">ВЫЙТИ</button>
      </form>
      <%}else{%>
      <a href="login.do" style="font-size: 90%;">ВОЙТИ</a>
      <%}%>
    </div>
  </header>
  <div class="container">
  <form action="register.do" method="POST">
    <h1 style="text-align:center;">Регистрация</h1>
    <br>
    <br><br><br>
    <c:forEach var="error" items="${form.formErrors}">
					<h3 style="color:red"> ${error} </h3>
	</c:forEach>
	<c:forEach var="field" items="${form.visibleFields}">
    <label for="email"><b>${field.label}</b></label>
    <input type="${field.type}" placeholder="${field.label}" name="${field.name}" value="${field.value}" required/>
    <div style="color:red">
        ${field.error}
     </div>
     </c:forEach>
    <button type="submit" class="registerbtn">Регистрация</button>
    </form>
  </div>

  <div class="container signin">
    <p>У вас уже есть аккаунт? <a href="login.do">Войти</a>.</p>
  </div>
  <div id="footer">
    <div id="usti">
    <div id="sol">
  <p>SportKZ</p>
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2908.083317104573!2d76.66686551548332!3d43.20774177913909!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38834f7675d8a6c3%3A0x7b7d14aec270c056!2z0KPQvdC40LLQtdGA0YHQuNGC0LXRgiDQodGD0LvQtdC50LzQsNC9INCU0LXQvNC40YDQtdC70Y8!5e0!3m2!1sru!2skz!4v1606728888172!5m2!1sru!2skz" width="350" height="200" frameborder="0" style="border:0; border-radius: 5px;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

    </div>
    <div id="orta">
        <div id="f1">
            <div id="">Виды спорт</div>
            <a href="#">Футбол</a>
    <a href="#">Волейбой</a>
    <a href="#">Баскетбол</a>
        </div>
        <div id="f3">
            <div id="">Мы в соцсетях</div>
            <a href="#"><img src="./images/instagram.png"> Инстаграм</a>
    <a href="#"><img src="./images/facebook.png"> Фэйсбук</a>
    <a href="#"><img src="./images/telegram.png"> Телеграм</a>
        </div>
    </div>
    <div id="on">
        <div id="f4">
            <div id="">Линки</div>
            <a href="#">О нас</a>
            <a href="#">Контакты </a>
        </div>
        <div id="f2">
            <div id="">CONTACTS</div>
            <p>Сүлейменов, 17 Тараз/Қазақстан</p>
            <p>тел: +7 (7172)42-79-36</p>
            <p>факс: +7 (7172)42-79-36</p>
            <p>email: info@bil-edu.kz</p>
        </div>
    </div>
    </div>
    <div id="asti">
        © 2020,Damir. All rights reserved.
    </div>
</div>
</body>
</html>