
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <link rel='stylesheet' href='./style.css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
  <header>
    <a href="#" id="logo"><h1>SportKZ</h1></a>
    <div id="header1">
      <a href="playgrounds.do">ПЛОЩАДКИ</a>
      <a href="#">СОБЫТИЯ</a>
      <a href="contacts.do">КОНТАКТЫ</a>
    </div>
    <div id="header2">
      
      <%if (session.getAttribute("user") != null) {%>
      <%if (session.getAttribute("userN")!=null) {%>
      <a href="adminPageAction.do" id="almaty">Админ панель</a>
      <%}else{%>
      <a href="#" id="almaty">Алматы <img src="./images/worldwide.png"></a>
            <%}%>
      <form action="logout.do" method="POST">
      <button id="logout">ВЫЙТИ</button>
      </form>
      <%}else{%>
      <a href="#" id="almaty">Алматы <img src="./images/worldwide.png"></a>
      <a href="login.do" style="font-size: 90%;">ВОЙТИ</a>
      <%}%>
    </div>
  </header>
  <div id="section1">
    <div id="s11">
      <div id="s111">Занимайтесь спортом</div>
      <div id="s112">Бронируйте площадки,записывайтесь на заниятия</div>
    </div>
  </div>
  <div id="section2">
      <a href="playgrounds.do" class="section2div">
        <img src="data:image/svg+xml;base64,PHN2ZyBpZD0iSWNvbnMiIGhlaWdodD0iNTEyIiB2aWV3Qm94PSIwIDAgNzQgNzQiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0ibTYwIDcxaC00NmExIDEgMCAwIDEgLTEtMXYtNjZhMSAxIDAgMCAxIDEtMWg0NmExIDEgMCAwIDEgMSAxdjY2YTEgMSAwIDAgMSAtMSAxem0tNDUtMmg0NHYtNjRoLTQ0eiIvPjxwYXRoIGQ9Im0xNCAzNmg0NnYyaC00NnoiLz48cGF0aCBkPSJtMzcgNDhhMTEgMTEgMCAxIDEgMTEtMTEgMTEuMDEyIDExLjAxMiAwIDAgMSAtMTEgMTF6bTAtMjBhOSA5IDAgMSAwIDkgOSA5LjAxIDkuMDEgMCAwIDAgLTktOXoiLz48cGF0aCBkPSJtNTEgNzFoLTI4YTEgMSAwIDAgMSAtMS0xdi04YTEgMSAwIDAgMSAxLTFoMjhhMSAxIDAgMCAxIDEgMXY4YTEgMSAwIDAgMSAtMSAxem0tMjctMmgyNnYtNmgtMjZ6Ii8+PHBhdGggZD0ibTQ1IDYyaC0yYTYgNiAwIDAgMCAtMTIgMGgtMmE4IDggMCAwIDEgMTYgMHoiLz48cGF0aCBkPSJtNTEgMTNoLTI4YTEgMSAwIDAgMSAtMS0xdi04YTEgMSAwIDAgMSAxLTFoMjhhMSAxIDAgMCAxIDEgMXY4YTEgMSAwIDAgMSAtMSAxem0tMjctMmgyNnYtNmgtMjZ6Ii8+PHBhdGggZD0ibTM3IDIwYTguMDA5IDguMDA5IDAgMCAxIC04LThoMmE2IDYgMCAwIDAgMTIgMGgyYTguMDA5IDguMDA5IDAgMCAxIC04IDh6Ii8+PC9zdmc+" />
        <p>Арендовать<br>площадку</p>
        <img id="arrow" src="./images/next.png">
      </a>
      
      <a href="#" class="section2div">
        <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNDgwIDQ4MCIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNDgwIDQ4MDsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik00NzIsMTQ0aC0yNHYtMTJjMC0xNS40NjQtMTIuNTM2LTI4LTI4LTI4Yy00LjE2LDAuMDIzLTguMjYxLDAuOTgzLTEyLDIuODA4Vjk2YzAtMTcuNjczLTE0LjMyNy0zMi0zMi0zMg0KCQkJYy0xNy42NzMsMC0zMiwxNC4zMjctMzIsMzJ2NDhoLTMydi04YzAuMDU4LTEzLjE5Ny0xMC41OTMtMjMuOTQzLTIzLjc5LTI0LjAwMmMtNS45OTUtMC4wMjctMTEuNzgxLDIuMjAxLTE2LjIxLDYuMjQyDQoJCQljLTkuMDQ0LTguMzItMjIuOTU2LTguMzItMzIsMGMtOS4wNDQtOC4zMi0yMi45NTYtOC4zMi0zMiwwYy05Ljc1LTguODk0LTI0Ljg2NC04LjItMzMuNzU4LDEuNTUNCgkJCWMtNC4wNCw0LjQyOS02LjI2OCwxMC4yMTUtNi4yNDIsMTYuMjF2OGgtMzJWOTZjMC0xNy42NzMtMTQuMzI3LTMyLTMyLTMyYy0xNy42NzMsMC0zMiwxNC4zMjctMzIsMzJ2MTAuODA4DQoJCQljLTMuNzM5LTEuODI1LTcuODQtMi43ODUtMTItMi44MDhjLTE1LjQ2NCwwLTI4LDEyLjUzNi0yOCwyOHYxMkg4Yy00LjQxOCwwLTgsMy41ODItOCw4djQ4YzAsNC40MTgsMy41ODIsOCw4LDhoMjR2MTINCgkJCWMwLDE1LjQ2NCwxMi41MzYsMjgsMjgsMjhjNC4xNi0wLjAyMyw4LjI2MS0wLjk4MywxMi0yLjgwOFYyNTZjMCwxNy42NzMsMTQuMzI3LDMyLDMyLDMyYzE3LjY3MywwLDMyLTE0LjMyNywzMi0zMnYtNDhoMTZ2MjYuNzQ0DQoJCQljLTAuMDI2LDEwLjYxMyw0LjE5NCwyMC43OTYsMTEuNzIsMjguMjhMMTg0LDI4My4zMTJWNDE2aDE2VjI4MGMwLTIuMTIyLTAuODQ0LTQuMTU2LTIuMzQ0LTUuNjU2bC0yMi42MjQtMjIuNjMyDQoJCQljLTQuNDg5LTQuNTA4LTcuMDE2LTEwLjYwNi03LjAzMi0xNi45NjhWMTg0aDQ2Ljg1NmMzLjAyOS0wLjA0MSw1Ljg5OSwxLjM1LDcuNzQ0LDMuNzUyYzAuMDU2LDAuMDgsMC4xMiwwLjE2LDAuMTc2LDAuMjQ4DQoJCQljMC4zNDMsMC41NDYsMC42MTIsMS4xMzUsMC44LDEuNzUyYzAuMTUxLDAuNDkzLDAuMjUzLDAuOTk5LDAuMzA0LDEuNTEyYzAuMDU2LDAuNTAyLDAuMDU2LDEuMDEsMCwxLjUxMg0KCQkJYy0wLjAxOCwwLjI2OS0wLjA1MywwLjUzNi0wLjEwNCwwLjhjLTAuMTgxLDAuODQzLTAuNDkyLDEuNjUyLTAuOTIsMi40Yy0xLjM5NSwyLjQ3Ny00LjAxMyw0LjAxMy02Ljg1Niw0LjAyNGgtMjQNCgkJCWMtNC40MTgsMC04LDMuNTgyLTgsOHYxNmMtMC4wMDEsMy40NDUsMi4yMDQsNi41MDMsNS40NzIsNy41OTJsMTcuNiw1Ljg4QzIyMS4zNiwyNDIuMjE2LDIzMiwyNjMuODQsMjMyLDI4MGgxNg0KCQkJYzAtMjIuMDA4LTEzLjY5Ni01MC4zMzYtMzUuODMyLTU3LjcxMkwyMDAsMjE4LjIzMlYyMTZoMTZjNi43MzMtMC4wNjUsMTMuMTI1LTIuOTcsMTcuNi04SDMwNHYyOS4zMzYNCgkJCWMtMC4wMSw1LjE5MS0xLjY5MywxMC4yNDEtNC44LDE0LjRMMjgxLjYsMjc1LjJjLTEuMDM5LDEuMzg1LTEuNiwzLjA2OS0xLjYsNC44djEzNmgxNlYyODIuNjY0bDE2LTIxLjMyOA0KCQkJYzUuMTc4LTYuOTMxLDcuOTg0LTE1LjM0OCw4LTI0VjIwOGgyNHY0OGMwLDE3LjY3MywxNC4zMjcsMzIsMzIsMzJjMTcuNjczLDAsMzItMTQuMzI3LDMyLTMydi0xMC44MDgNCgkJCWMzLjczOSwxLjgyNSw3Ljg0LDIuNzg1LDEyLDIuODA4YzE1LjQ2NCwwLDI4LTEyLjUzNiwyOC0yOHYtMTJoMjRjNC40MTgsMCw4LTMuNTgyLDgtOHYtNDhDNDgwLDE0Ny41ODIsNDc2LjQxOCwxNDQsNDcyLDE0NHoNCgkJCSBNMzIsMTkySDE2di0zMmgxNlYxOTJ6IE03MiwyMjBjMCw2LjYyNy01LjM3MywxMi0xMiwxMnMtMTItNS4zNzMtMTItMTJ2LTg4YzAtNi42MjcsNS4zNzMtMTIsMTItMTJzMTIsNS4zNzMsMTIsMTJWMjIweg0KCQkJIE0xMjAsMjU2YzAsOC44MzctNy4xNjMsMTYtMTYsMTZzLTE2LTcuMTYzLTE2LTE2Vjk2YzAtOC44MzcsNy4xNjMtMTYsMTYtMTZzMTYsNy4xNjMsMTYsMTZWMjU2eiBNMTYwLDE2OGMtNC40MTgsMC04LDMuNTgyLTgsOA0KCQkJdjE2aC0xNnYtMzJoMzJjMC4wMDksMS41MTIsMC4xNjEsMy4wMjEsMC40NTYsNC41MDRjMC4wODgsMC40NzIsMC4yNCwwLjkwNCwwLjM1MiwxLjM2YzAuMTg0LDAuNzEyLDAuMzIsMS40NDgsMC41NiwyLjEzNkgxNjB6DQoJCQkgTTIwMCwxNjBjMCw0LjQxOC0zLjU4Miw4LTgsOGMtNC40MTgsMC04LTMuNTgyLTgtOHYtMjRjMC00LjQxOCwzLjU4Mi04LDgtOGM0LjQxOCwwLDgsMy41ODIsOCw4VjE2MHogTTIzMiwxNjANCgkJCWMwLDQuNDE4LTMuNTgyLDgtOCw4Yy00LjQxOCwwLTgtMy41ODItOC04di0yNGMwLTQuNDE4LDMuNTgyLTgsOC04YzQuNDE4LDAsOCwzLjU4Miw4LDhWMTYweiBNMjgwLDEzNmMwLTQuNDE4LDMuNTgyLTgsOC04DQoJCQljNC40MTgsMCw4LDMuNTgyLDgsOHYyNGMwLDQuNDE4LTMuNTgyLDgtOCw4Yy00LjQxOCwwLTgtMy41ODItOC04VjEzNnogTTI0OCwxMzZjMC00LjQxOCwzLjU4Mi04LDgtOGM0LjQxOCwwLDgsMy41ODIsOCw4djI0DQoJCQljMCw0LjQxOC0zLjU4Miw4LTgsOGMtNC40MTgsMC04LTMuNTgyLTgtOFYxMzZ6IE0zNDQsMTkyTDM0NCwxOTJIMjQwYzAtMC4wOCwwLTAuMTQ0LDAtMC4yMjQNCgkJCWMtMC4wMDctMS41OTEtMC4xNzMtMy4xNzgtMC40OTYtNC43MzZjLTAuMDQ4LTAuMjE2LTAuMTUyLTAuNDE2LTAuMi0wLjY0Yy0wLjE0NC0wLjU4NC0wLjM1Mi0xLjEyOC0wLjUzNi0xLjY5Ng0KCQkJYy0wLjMzOC0xLjAyNS0wLjc0Ny0yLjAyNC0xLjIyNC0yLjk5MmMtMC4yMzItMC40OC0wLjM0NC0xLjAyNC0wLjYwOC0xLjQ4OGMwLjA5MS0wLjA2MiwwLjE3OS0wLjEyOSwwLjI2NC0wLjINCgkJCWMwLjM2OC0wLjI0LDAuNjg4LTAuNTI4LDEuMDQtMC44YzAuNi0wLjQ0OCwxLjIzMi0wLjg2NCwxLjc5Mi0xLjM2OGMwLjQ2NCwwLjQxNiwxLDAuNzQ0LDEuNDk2LDEuMTINCgkJCWMwLjQ5NiwwLjM3NiwwLjk4NCwwLjgsMS41MiwxLjEzNmMwLjc1NSwwLjQ2NiwxLjUzNSwwLjg5MSwyLjMzNiwxLjI3MmMwLjU0NCwwLjI2NCwxLjA1NiwwLjU3NiwxLjYsMC44DQoJCQljMC45MzQsMC4zNTgsMS44OTEsMC42NTUsMi44NjQsMC44ODhjMC41MDQsMC4xMzYsMC45NzYsMC4zMjgsMS40OTYsMC40MzJjMy4wNzcsMC42MjksNi4yNSwwLjYyOSw5LjMyOCwwDQoJCQljMC41Mi0wLjEwNCwwLjk5Mi0wLjI5NiwxLjQ5Ni0wLjQzMmMwLjk3My0wLjIzMywxLjkzLTAuNTMsMi44NjQtMC44ODhjMC41NjgtMC4yMzIsMS4wOC0wLjU0NCwxLjYtMC44DQoJCQljMC44MDQtMC4zODEsMS41ODYtMC44MDYsMi4zNDQtMS4yNzJjMC41MjgtMC4zNTIsMS4wMDgtMC43NTIsMS41MTItMS4xMzZjMC41MDQtMC4zODQsMS4wMzItMC43MDQsMS40OTYtMS4xMg0KCQkJYzAuNDY0LDAuNDE2LDEsMC43NDQsMS40OTYsMS4xMmMwLjQ5NiwwLjM3NiwwLjk4NCwwLjgsMS41MiwxLjEzNmMwLjc1NSwwLjQ2NiwxLjUzNSwwLjg5MSwyLjMzNiwxLjI3Mg0KCQkJYzAuNTQ0LDAuMjY0LDEuMDU2LDAuNTc2LDEuNiwwLjhjMC45MzQsMC4zNTgsMS44OTEsMC42NTUsMi44NjQsMC44ODhjMC41MDQsMC4xMzYsMC45NzYsMC4zMjgsMS40OTYsMC40MzINCgkJCWMxMi45NTUsMi42MzMsMjUuNTkxLTUuNzM0LDI4LjIyNC0xOC42ODhjMC4zMjItMS41ODUsMC40ODMtMy4xOTgsMC40OC00LjgxNmgzMlYxOTJ6IE0zOTIsMjU2YzAsOC44MzctNy4xNjMsMTYtMTYsMTYNCgkJCWMtOC44MzcsMC0xNi03LjE2My0xNi0xNlY5NmMwLTguODM3LDcuMTYzLTE2LDE2LTE2YzguODM3LDAsMTYsNy4xNjMsMTYsMTZWMjU2eiBNNDMyLDIyMGMwLDYuNjI3LTUuMzczLDEyLTEyLDEyDQoJCQlzLTEyLTUuMzczLTEyLTEydi04OGMwLTYuNjI3LDUuMzczLTEyLDEyLTEyczEyLDUuMzczLDEyLDEyVjIyMHogTTQ2NCwxOTJoLTE2di0zMmgxNlYxOTJ6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=" />
        <p>
          Записаться<br>на тренировку
        </p>
        <img id="arrow" src="./images/next.png">
      </a>

      
  </div>
  <div id="section3">
      <p>Спортивные площадки</p>
  </div>
 
  <div id="section4">
  <% int i = 0; %>
  <c:forEach var="playground" items="${playgrounds}">
  <% if(i<6){ %>
  <form action="playground.do" method="POST">
  	<input type="hidden" name="playgroundId" value="${playground.id}">
    <a href="javascript:;" onclick="parentNode.submit();" id="s4" style="text-decoration:none;color:black;">
      <img src="${playground.simg}">
      <p>${playground.sname}</p>  
      <p id="address">${playground.address}</p> 
      <fmt:parseNumber var = "price" integerOnly = "true" type = "number" value = "${playground.price}" />
      <div id="cost">от ${price} KZT</div>
    </a>
    </form>
	<% i=i+1; %>
    <% } %>
    </c:forEach>
    
  </div>
  
  <div id="section5">
    <a href="playgrounds.do">Показать все площадки</a>
  </div>
  <div id="section6">
    <p>Выбирайте свой спорт</p>
  </div>
  <div id="section7">
    <form action="playgrounds.do" method="POST">
  	<input type="hidden" name="categ" value="Футбол">
    <a href="javascript:;" onclick="parentNode.submit();" style="text-decoration:none;color:black;">
      <img src="./images/football.jpg">
      <p id="nameofsport">Футбол</p>  
    </a>
    </form>
    <form action="playgrounds.do" method="POST">
  	<input type="hidden" name="categ" value="Баскетбол">
    <a href="javascript:;" onclick="parentNode.submit();"  style="text-decoration:none;color:black;">
      <img src="./images/basketball.jpg">
      <p id="nameofsport">Баскетбол</p>  
    </a>
    </form>
    <form action="playgrounds.do" method="POST">
  	<input type="hidden" name="categ" value="Волейбол">
    <a href="javascript:;" onclick="parentNode.submit();"  style="text-decoration:none;color:black;">
      <img src="./images/volleyball.jpg">
      <p id="nameofsport">Волейбол</p>  
    </a>
    </form>
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
