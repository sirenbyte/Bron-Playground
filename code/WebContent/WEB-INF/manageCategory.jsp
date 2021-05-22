<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="main.databean.*"%>
    <%@page import="java.util.*"%>
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
            <h3>Управление категорией</h3>
            <p style="color: green;"><%= (request.getAttribute("message") == null) ? "" : request.getAttribute("message") %> </p>
            <p style="color: red;"><%= (request.getAttribute("errorMessage") == null) ? "" : request.getAttribute("errorMessage") %> </p>
            <form action="createCategoryAction.do" method="POST"  style="margin-top: 20px; text-align: left;">
                <label>Добавить новую категорию</label>
                <input type="text" placeholder="Имя" name="name">
                <button>Добавить</button>
            </form>
            <table>
            	<% Map<Integer, Integer> mapQuantity = (Map)(request.getAttribute("quantity")); %>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Категория </th>
                        <th>Количество</th>
                        <th>Действие</th>
                    </tr>
                </thead>
				<tbody>
				<% 
					
					Category[] categories = (Category[])(request.getAttribute("categories")); 
                	for(int i = 0; i < categories.length; i++){
                		Category item = categories[i];
                		int quantity = 0;
                		if(mapQuantity.containsKey(item.getId())){
                			quantity = mapQuantity.get(item.getId());	
                		}
				%>
                    <tr>
                        <td><%=i+1 %></td>
                        <td><%=item.getName() %></td>
                        <td><%= quantity%></td>
                        <td>
                            <form action="deleteCategoryAction.do" method="POST">
                                <input type="text" hidden name="id" value="<%=item.getId()%>">
                                <button class="delete" type="submit">Удалить</button>
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