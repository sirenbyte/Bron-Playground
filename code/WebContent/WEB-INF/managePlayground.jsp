<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="main.databean.*"%>
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
    	<div class="admin-content">
            <h3>Управление игровой площадкой</h3>
            
            <% PlaygroundBean[] playgrounds = (PlaygroundBean[])(request.getAttribute("playgrounds"));%>
            <% Map<Integer, String> mapCategories = (Map)(request.getAttribute("categories")); %>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Площадка </th>
                        <th>Категория</th>
                        <th>Адрес</th>
                        <th>Действие</th>
                        
                    </tr>
                </thead>
                <tbody>
                	<%for(int i = 0; i < playgrounds.length; i++){ 
						PlaygroundBean item = playgrounds[i];    
						String itemCategory = mapCategories.get(item.getIdCategory());
                	%>
	                    <tr>
	                        <td><%= i+1 %></td>
	                        <td><%= item.getSname()%></td>
	                        <td><%= itemCategory %></td>
	                        <td><%= item.getAddress() %></td>
	                        <td>
	                        	<form action="deletePlaygroundAction.do" method="POST">
	                                <input type="text" hidden name="id" value="<%= item.getId()%>">
	                                <button type="submit">Удалить</button>
	                            </form>
	                        </td>
	                    </tr>
                    <%} %>
                </tbody>
            </table>

        </div>
    </main>

    <footer></footer>	
</body>
</html>