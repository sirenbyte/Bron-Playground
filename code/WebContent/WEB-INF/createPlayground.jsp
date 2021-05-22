<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
    <%@page import="main.databean.Category"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="./style.css">
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

    <main >

        <div class="sidebar">
            <ul>
				<li><a href="<%= request.getContextPath() %>/adminPageAction.do">Показать заказы</a></li>
                <li><a href="<%= request.getContextPath() %>/managePlaygroundAction.do">Управление игровой площадкой</a></li>
                <li><a href="<%= request.getContextPath() %>/createPlaygroundAction.do" >Создать площадку</a></li>
                <li><a href="<%= request.getContextPath() %>/manageCategoryAction.do">Управление категорией</a></li>
            </ul>
        </div>
        <div class="admin-content" >
            <h3>Создать площадку</h3>
            
            <p style="color: green;"><%= (request.getAttribute("message") == null) ? "" : request.getAttribute("message") %> </p>
            
<%		List<String> errors = (List<String>) request.getAttribute("errors");
		if (errors != null) {
			for (String error : errors) {
%>		
				<p style="color:red; font-size: 18px;"> <%= error %> </p>
<%
			}
		}
%>	
            
            <div class="inner-content" style="text-align: left;">
                <form action="createPlaygroundAction.do" method="POST">
                    <label>Название площадки:</label>
                    <input name="name" type="text" value="${form.name}"><br>
                    <label>Категория:</label>
                    <select name="category">
                    <option value="-1">По умолчанию</option>
	                    <% Category[] categories = (Category[])(request.getAttribute("categories")); 
	                    	for(int i = 0; i < categories.length; i++){
	                    		Category item = categories[i];
	                    %>
                        	<option value="<%= item.getId()%>"><%= item.getName()%></option>
                        <%} %>
                    </select><br>

                    
                    <label>Ширина:</label>
                    <input name="width" type="number" value="${form.width}">
                    <label>Длина:</label>
                    <input name="length" type="number" value="${form.length}"><br>
                    
                    <label>Покрытие:</label>
                    <input name="cover" type="text" value="${form.cover}">
                    <label>Вместимость:</label>
                    <input name="capacity" type="number" value="${form.capacity}"><br>
                    
                    <label>Тип Стадион:</label>
                    <select name="typeStadion" id="">
                        <option value="Открытый">Открытый</option>
                        <option value="Крытый">Крытый</option>
                    </select><br>
                    
                    <label>Душ:</label>
                    <input name="shower" type="checkbox">
                    <label>Раздевалка:</label>
                    <input name="chanRoom" type="checkbox">
                    <label>Освещение:</label>
                    <input name="lighting" type="checkbox">
                    <label>Автостоянка:</label>
                    <input name="parking" type="checkbox">
                    <label>Трибуна:</label>
                    <input name="stands" type="checkbox"><br>
                    
                    <label>Цена:</label>
                    <input name="price" type="number" value="${form.price}"><br>

                    <label>Изображение(path):</label>
                    <input name="simg" type="text" value="${form.sourceImage}"><br>
                    <label>Адрес:</label>
                    <input name="address" type="text" value="${form.address}"><br>
                    <label>Время работы(с):</label>
                    <input name="startTime" type="time" value="${form.startTime}">
                    <label>Время работы(до):</label>
                    <input name="endTime" type="time" value="${form.endTime}"><br>
                    
            		<button type="submit">Добавить</button>        
                </form>
                
            </div>
			
        </div>
    </main>

    <footer></footer>

</body>
</html>