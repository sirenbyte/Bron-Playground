<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
      <link rel='stylesheet' href='./style.css'>
    <link rel='stylesheet' href='./login.css'>
   <script>
function validateForm() {
  var x = document.forms["myForm"]["ver"].value;
  if (x == "") {
    return false;
  }
}
</script>
</head>
<body>
	<div class="container">
	<a href="javascript:history.go(-1)">Назад</a>
	<div class="text-center">Вы уверены что хотите забронировать ${playground[0].sname}?</div>
	
	<div class="text-center">Время День-месяц : ${date}</div>
	<div class="text-center">Время часы : ${time}</div>
	<div class="text-center">Имя Фамилия : ${user.firstName} ${user.lastName}</div>
	<div class="text-center">Цена : ${playground[0].price}</div>
	<br>
	<br>
	
	<h3>Запишите ваш телефон!</h3>
	<form>
    <input type="text" id="number" placeholder="+7747 950 7898">
    <div id="recaptcha-container"></div>
    <button type="button" onclick="phoneAuth();">Отправить</button>
</form><br>
<h3>Напишите верификацонный код!</h3>
<form action="agreebron.do" method="post" onsubmit="return validateForm()" name="myForm">
    <input type="text" id="verificationCode" required placeholder="Enter verification code">
     <input type="hidden" name="ver" value="" id="ver"/>
            <input type="hidden" name="d" value="${date}"/>
             <input type="hidden" name="t" value="${time}"/>
             <input type="hidden" name="playgroundId" value="${playground[0].id}"/>
             
    <button type="submit" onclick="codeverify();">Потвердите код с телефона</button>

</form>

	
<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-analytics.js"></script>



<script>
  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyBzQhOORdD18s_dIF-vkQZ6OqO-2UQf2sM",
    authDomain: "proj4-cf00e.firebaseapp.com",
    projectId: "proj4-cf00e",
    storageBucket: "proj4-cf00e.appspot.com",
    messagingSenderId: "619850643431",
    appId: "1:619850643431:web:5832325133f2273f02ef42",
    measurementId: "G-1XP74XR7J2"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>
<script src="NumberAuthentication.js"></script>
<br>
<br>
	<div class="text-center">Если это не вы? Перезайдите</div>
	</div>
	
	
	
</body>


</html>