<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <link rel='stylesheet' href='./style.css'>
    <link rel='stylesheet' href='./login.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
      <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=5c471b04-a368-4388-be8f-8f602e7e0c55" type="text/javascript"></script>
    
    <script src="./main.js"></script>
    
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
  <c:forEach var="playground" items="${playground}">
    <div id="p">
        <div id="p1">
            <a href="playgrounds.do">
                <img src="./images/arrow-back.svg">
            </a>
            <p>${playground.sname}</p>
        </div>
        <div id="p2">
            <div>
                <img src="./images/map-location.svg">
                <p id="mapadd">${playground.address}</p>
            </div>
            <div>
                <img src="./images/working-hours.svg">
                <p>${playground.wtime}</p>
            </div>
        </div>
        <div id="p3">
            <div id="p31">
                <img src="${playground.simg}">
            </div>
            <div id="p32">

                <div id="p321">
                    <div id="uu">
                        <img src="./images/playground-size.svg">
                        <p>${playground.width} × ${playground.length}</p>
                    </div>
                    <div id="uu">
                        <p>${playground.cover}</p>
                    </div>
                    <div>
                        <p>${playground.typeStadion}</p>
                    </div>
                </div>

                <div id="p322">
                    <p>Вмещает игроков — ${playground.capacity}</p>
                </div>

                <div id="p323">
                    <div>${categ}</div>
                </div>
                
                <div id="p324">
                    <div id="anaumnau">
                        <div>
                        <img id="suretk" src="./images/infra-shower.svg">
                        <p>Душ</p>
                         </div>
                         <c:if test="${playground.shower == true}">
                        <img id="check" src="./images/check.svg">
                         </c:if>
                         <c:if test="${playground.shower == false}">
                         <img id="check" src="./images/delete.svg">
                         </c:if>
                         
                    </div>
                    <div id="anaumnau">
                        <div>
                        <img id="suretk" src="./images/infra-chrooms.svg">
                        <p>Раздевалка</p>
                        </div>
                        <c:if test="${playground.chanRoom == true}">
                        <img id="check" src="./images/check.svg">
                         </c:if>
                         <c:if test="${playground.chanRoom == false}">
                         <img id="check" src="./images/delete.svg">
                         </c:if>
                        
                    </div>
                    <div id="anaumnau">
                        <div>
                        <img id="suretk" src="./images/infra-lighting.svg">
                        <p>Освещение</p>
                        </div>
                        <c:if test="${playground.lighting == true}">
                        <img id="check" src="./images/check.svg">
                         </c:if>
                         <c:if test="${playground.lighting == false}">
                         <img id="check" src="./images/delete.svg">
                         </c:if>
                        
                    </div>
                    <div id="anaumnau">
                        <div>
                        <img id="suretk" src="./images/infra-car_parking.svg">
                        <p>Парковка</p>
                        </div>
                        <c:if test="${playground.parking == true}">
                        <img id="check" src="./images/check.svg">
                         </c:if>
                         <c:if test="${playground.parking == false}">
                         <img id="check" src="./images/delete.svg">
                         </c:if>
                    </div>
                    <div id="anaumnau">
                        <div>
                        <img id="suretk" src="./images/infra-tribunes.svg">
                        <p>Трибуны</p>
                        </div>
                        <c:if test="${playground.stands == true}">
                        <img id="check" src="./images/check.svg">
                         </c:if>
                         <c:if test="${playground.stands == false}">
                         <img id="check" src="./images/delete.svg">
                         </c:if>
                    </div>
                </div>
                <div id="zabron">
                    <a href="#" id="azabron">
                        Забронировать
                    </a>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    
  <div class="container">
  <div id="natmenu">
  	<div onclick="tbron()">Время для брона</div>
  	<div onclick="vmap()">Местоположение</div>
  	<div onclick="comm()">Отзывы</div>
  </div> 
  </div>
 
  <div class="container-fluid">
  
  	<div id="map" style="width:100%;height:500px;"></div>
  	
  	<div id="tbron">
  	<c:forEach var="p" items="${playground}">
  	
  	<table class="clTbl" width="100%">
  <tbody><tr>
  <fmt:formatDate var="qwe" pattern="d-MMMM" value = "${date[0]}" />
  
 
  	
  		<td class="ctg" style="font-size:12px; font-weight:bold; background-color: #fab7c3;" width="55" height="30" align="center">Day/Hour</td>
        <td class="ctg" width="13.384615384615%" align="center" style="background-color: #fab7c3"> &nbsp;&nbsp;&nbsp;&nbsp;<span title="Monday" style="font-size:14px; font-weight:bold; color:black;"><fmt:formatDate pattern="d-MMMM" value = "${date[0]}" />   <fmt:formatDate pattern="E" value = "${date[0]}" /></span></td>
        <td class="ctg" width="13.384615384615%" align="center" style="background-color: #fab7c3"> &nbsp;&nbsp;&nbsp;&nbsp;<span title="Tuesday" style="font-size:14px; font-weight:bold; color:black;"><fmt:formatDate pattern="d-MMMM"  value = "${date[1]}" />   <fmt:formatDate pattern="E" value = "${date[1]}" /></span></td>
        <td class="ctg" width="13.384615384615%" align="center" style="background-color: #fab7c3"> &nbsp;&nbsp;&nbsp;&nbsp;<span title="Wednesday" style="font-size:14px; font-weight:bold; color:black;"><fmt:formatDate pattern="d-MMMM"  value = "${date[2]}" />   <fmt:formatDate pattern="E" value = "${date[2]}" /></span></td>
        <td class="ctg" width="13.384615384615%" align="center" style="background-color: #fab7c3"> &nbsp;&nbsp;&nbsp;&nbsp;<span title="Thursday" style="font-size:14px; font-weight:bold; color:black;"><fmt:formatDate pattern="d-MMMM"  value = "${date[3]}" />   <fmt:formatDate pattern="E" value = "${date[3]}" /></span></td>
        <td class="ctg" width="13.384615384615%" align="center" style="background-color: #fab7c3"> &nbsp;&nbsp;&nbsp;&nbsp;<span title="Friday" style="font-size:14px; font-weight:bold; color:black;"><fmt:formatDate pattern="d-MMMM"  value = "${date[4]}" />   <fmt:formatDate pattern="E" value = "${date[4]}" /></span></td>
        <td class="ctg" width="13.384615384615%" align="center" style="background-color: #fab7c3"> &nbsp;&nbsp;&nbsp;&nbsp;<span title="Saturday" style="font-size:14px; font-weight:bold; color:black;"><fmt:formatDate pattern="d-MMMM" value = "${date[5]}" />   <fmt:formatDate pattern="E" value = "${date[5]}" /></span></td>
        <td class="ctg" width="13.384615384615%" align="center" style="background-color: #fab7c3"> &nbsp;&nbsp;&nbsp;&nbsp;<span title="Sunday" style="font-size:14px; font-weight:bold; color:black;"><fmt:formatDate pattern="d-MMMM" value = "${date[6]}" />   <fmt:formatDate pattern="E" value = "${date[6]}" /></span></td>
   </tr>
  <c:set var = "string1" value = "${fn:substring(p.wtime, 0, 1)}" />
  <c:set var = "string2" value = "${fn:substring(p.wtime, 5, 7)}" />
  <c:if test="${fn:length(p.wtime)==11}">
  <c:set var = "string1" value = "${fn:substring(p.wtime, 0, 2)}" />
  <c:set var = "string2" value = "${fn:substring(p.wtime, 6, 8)}" />
  </c:if>
  
   
  <fmt:parseNumber var = "i1" integerOnly = "true" type = "number" value = "${string1}" />
  <fmt:parseNumber var = "i2" integerOnly = "true" type = "number" value = "${string2}" />
  <fmt:parseNumber var = "price" integerOnly = "true" type = "number" value = "${playground[0].price}" />
    <c:forEach begin="${i1}" end="${i2-1}"  varStatus="loop">
   
    <tr>
   
      <td class="ctg" height="50" align="center" style="background-color: #fab7c3"><span style="font-weight:bold">${loop.count+i1-1}:00</span><br><span style="color:#999">${loop.count+i1}:00</span></td>
            
            <c:set var="tester" value="${loop.count+i1-1}:00-${loop.count+i1}:00"/>
           	
   			
            <td class="ctg" align="center" style="font-size: 10px; padding: 0;">
            <form action="bron.do" method="post">
            <fmt:formatDate pattern="d-M" value = "${date[0]}" var="bt"/>
            <c:set var="bool2" value="true"/>
            <c:if test="${check[0]==null}">
            	<input type="hidden" name="d" value="${bt}"/>
             	<input type="hidden" name="t" value="${tester}"/>
             	<input type="hidden" name="playgroundId" value="${p.id}"/>
             	<button class="www">${price} KZT</button>
             	<c:set var="bool2" value="false"/>
            </c:if>
            <c:if test="${bool2 eq 'true'}">
            <c:set var="bool" value="true"/>
            <c:forEach var="snek" items="${check}">
            <c:if test="${bool eq 'true'}">
       	    <c:if test="${(snek.b_day == bt && snek.b_time == tester)}">      
            		<p>Занято выберите другое время</p>
            		<c:set var="bool" value="false"/>
            </c:if>                      
           	</c:if>
           	</c:forEach> 
           	 <input type="hidden" name="d" value="${bt}"/>
             <input type="hidden" name="t" value="${tester}"/>
             <input type="hidden" name="playgroundId" value="${p.id}"/>
             
             <c:if test="${bool eq 'true'}">      
            		<button class="www">${price} KZT</button> 
            		<c:set var="bool" value="false"/>
           	</c:if> 
           	</c:if>
            </form>       
             </td>
           
             
          
           <td class="ctg" align="center" style="font-size: 10px; padding: 0;">
             <form action="bron.do" method="post">
            <fmt:formatDate pattern="d-M" value = "${date[1]}" var="bt"/>
                <c:set var="bool2" value="true"/>
            <c:if test="${check[0]==null}">
            	<input type="hidden" name="d" value="${bt}"/>
             	<input type="hidden" name="t" value="${tester}"/>
             	<input type="hidden" name="playgroundId" value="${p.id}"/>
             	<button class="www">${price} KZT</button>
             	<c:set var="bool2" value="false"/>
            </c:if>
            <c:if test="${bool2 eq 'true'}">
            <c:set var="bool" value="true"/>
            <c:forEach var="snek" items="${check}">
            <c:if test="${bool eq 'true'}">
       	    <c:if test="${(snek.b_day == bt && snek.b_time == tester)}">      
            		<p>Занято выберите другое время</p>
            		<c:set var="bool" value="false"/>
            </c:if>                      
           	</c:if>
           	</c:forEach> 
           	 <input type="hidden" name="d" value="${bt}"/>
             <input type="hidden" name="t" value="${tester}"/>
             <input type="hidden" name="playgroundId" value="${p.id}"/>
             
             <c:if test="${bool eq 'true'}">      
            		<button class="www">${price} KZT</button> 
            		<c:set var="bool" value="false"/>
           	</c:if> 
           	</c:if> 
             </form>
           </td>
              
         
             <td class="ctg" align="center" style="font-size: 10px; padding: 0;">
            <form action="bron.do" method="post">
            <fmt:formatDate pattern="d-M" value = "${date[2]}" var="bt"/>
                 <c:set var="bool2" value="true"/>
            <c:if test="${check[0]==null}">
            	<input type="hidden" name="d" value="${bt}"/>
             	<input type="hidden" name="t" value="${tester}"/>
             	<input type="hidden" name="playgroundId" value="${p.id}"/>
             	<button class="www">${price} KZT</button>
             	<c:set var="bool2" value="false"/>
            </c:if>
            <c:if test="${bool2 eq 'true'}">
            <c:set var="bool" value="true"/>
            <c:forEach var="snek" items="${check}">
            <c:if test="${bool eq 'true'}">
       	    <c:if test="${(snek.b_day == bt && snek.b_time == tester)}">      
            		<p>Занято выберите другое время</p>
            		<c:set var="bool" value="false"/>
            </c:if>                      
           	</c:if>
           	</c:forEach> 
           	 <input type="hidden" name="d" value="${bt}"/>
             <input type="hidden" name="t" value="${tester}"/>
             <input type="hidden" name="playgroundId" value="${p.id}"/>
             
             <c:if test="${bool eq 'true'}">      
            		<button class="www">${price} KZT</button> 
            		<c:set var="bool" value="false"/>
           	</c:if> 
           	</c:if>

             </form>
            </td>
             
             
             
             
             
            <td class="ctg" align="center" style="font-size: 10px; padding: 0;">
           <form action="bron.do" method="post">
            <fmt:formatDate pattern="d-M" value = "${date[3]}" var="bt"/>
            <c:set var="bool2" value="true"/>
            <c:if test="${check[0]==null}">
            	<input type="hidden" name="d" value="${bt}"/>
             	<input type="hidden" name="t" value="${tester}"/>
             	<input type="hidden" name="playgroundId" value="${p.id}"/>
             	<button class="www">${price} KZT</button>
             	<c:set var="bool2" value="false"/>
            </c:if>
            <c:if test="${bool2 eq 'true'}">
            <c:set var="bool" value="true"/>
            <c:forEach var="snek" items="${check}">
            <c:if test="${bool eq 'true'}">
       	    <c:if test="${(snek.b_day == bt && snek.b_time == tester)}">      
            		<p>Занято выберите другое время</p>
            		<c:set var="bool" value="false"/>
            </c:if>                      
           	</c:if>
           	</c:forEach> 
           	 <input type="hidden" name="d" value="${bt}"/>
             <input type="hidden" name="t" value="${tester}"/>
             <input type="hidden" name="playgroundId" value="${p.id}"/>
             
             <c:if test="${bool eq 'true'}">      
            		<button class="www">${price} KZT</button> 
            		<c:set var="bool" value="false"/>
           	</c:if> 
           	</c:if> 
             </form>
            </td>
            
            
            <td class="ctg" align="center" style="font-size: 10px; padding: 0;">
          <form action="bron.do" method="post">
            <fmt:formatDate pattern="d-M" value = "${date[4]}" var="bt"/>
            <c:set var="bool2" value="true"/>
            <c:if test="${check[0]==null}">
            	<input type="hidden" name="d" value="${bt}"/>
             	<input type="hidden" name="t" value="${tester}"/>
             	<input type="hidden" name="playgroundId" value="${p.id}"/>
             	<button class="www">${price} KZT</button>
             	<c:set var="bool2" value="false"/>
            </c:if>
            <c:if test="${bool2 eq 'true'}">
            <c:set var="bool" value="true"/>
            <c:forEach var="snek" items="${check}">
            <c:if test="${bool eq 'true'}">
       	    <c:if test="${(snek.b_day == bt && snek.b_time == tester)}">      
            		<p>Занято выберите другое время</p>
            		<c:set var="bool" value="false"/>
            </c:if>                      
           	</c:if>
           	</c:forEach> 
           	 <input type="hidden" name="d" value="${bt}"/>
             <input type="hidden" name="t" value="${tester}"/>
             <input type="hidden" name="playgroundId" value="${p.id}"/>
             
             <c:if test="${bool eq 'true'}">      
            		<button class="www">${price} KZT</button> 
            		<c:set var="bool" value="false"/>
           	</c:if> 
           	</c:if> 
             </form>
            </td>
             
            <td class="ctg" align="center" style="font-size: 10px; padding: 0;">
       <form action="bron.do" method="post">
            <fmt:formatDate pattern="d-M" value = "${date[5]}" var="bt"/>
            <c:set var="bool2" value="true"/>
            <c:if test="${check[0]==null}">
            	<input type="hidden" name="d" value="${bt}"/>
             	<input type="hidden" name="t" value="${tester}"/>
             	<input type="hidden" name="playgroundId" value="${p.id}"/>
             	<button class="www">${price} KZT</button>
             	<c:set var="bool2" value="false"/>
            </c:if>
            <c:if test="${bool2 eq 'true'}">
            <c:set var="bool" value="true"/>
            <c:forEach var="snek" items="${check}">
            <c:if test="${bool eq 'true'}">
       	    <c:if test="${(snek.b_day == bt && snek.b_time == tester)}">      
            		<p>Занято выберите другое время</p>
            		<c:set var="bool" value="false"/>
            </c:if>                      
           	</c:if>
           	</c:forEach> 
           	 <input type="hidden" name="d" value="${bt}"/>
             <input type="hidden" name="t" value="${tester}"/>
             <input type="hidden" name="playgroundId" value="${p.id}"/>
             
             <c:if test="${bool eq 'true'}">      
            		<button class="www">${price} KZT</button> 
            		<c:set var="bool" value="false"/>
           	</c:if> 
           	</c:if> 
             </form></td>
            
                 <td class="ctg" align="center" style="font-size: 10px; padding: 0;">
             <form action="bron.do" method="post">
            <fmt:formatDate pattern="d-M" value = "${date[6]}" var="bt"/>
            <c:set var="bool2" value="true"/>
            <c:if test="${check[0]==null}">
            	<input type="hidden" name="d" value="${bt}"/>
             	<input type="hidden" name="t" value="${tester}"/>
             	<input type="hidden" name="playgroundId" value="${p.id}"/>
             	<button class="www">${price} KZT</button>
             	<c:set var="bool2" value="false"/>
            </c:if>
            <c:if test="${bool2 eq 'true'}">
            <c:set var="bool" value="true"/>
            <c:forEach var="snek" items="${check}">
            <c:if test="${bool eq 'true'}">
       	    <c:if test="${(snek.b_day == bt && snek.b_time == tester)}">      
            		<p>Занято выберите другое время</p>
            		<c:set var="bool" value="false"/>
            </c:if>                      
           	</c:if>
           	</c:forEach> 
           	 <input type="hidden" name="d" value="${bt}"/>
             <input type="hidden" name="t" value="${tester}"/>
             <input type="hidden" name="playgroundId" value="${p.id}"/>
             
             <c:if test="${bool eq 'true'}">      
            		<button class="www">${price} KZT</button> 
            		<c:set var="bool" value="false"/>
           	</c:if> 
           	</c:if>
             </form>
               </td>
               
    </tr>
  </c:forEach>   
</tbody></table>



  	</div>
   </div>
   <form action="comment.do" method="post">
   <div id="comments">
   <input type="hidden" name="playgroundId" value="${p.id}"/>
        <div id="totalcom">${totalCom} отзывов</div>
        <hr>
        <c:forEach var="comment" items="${comments}">
        <div id="comment">
            <p id="cname">${comment.userName}</p>
            <div id="rateYo" data-rateyo-rating="${comment.stars}"></div>
            <p id="comContent">${comment.content}</p>
        </div>
        <hr>
        </c:forEach>
        <label>Ваш отзыв:</label>
        <c:forEach var="field" items="${form.visibleFields}">
        <div class="rateyo" id= "rating"
                 data-rateyo-rating="4"
                 data-rateyo-num-stars="5"
                 data-rateyo-score="3">
                 </div>
        <input type="${field.type}" name="${field.name}" value="${field.value}" id="otzyv" placeholder="Ваш отзыв">
         <input type="hidden" name="stars">
        <p>${field.error}</p>
        <button id="cbtn">Отправить</button>
        </c:forEach>
        
    </div>
    </form>
    </c:forEach>
    
   
   
   
  
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
 
<script>
 
    $(function () {
        $("[id=rateYo]").rateYo({
        starWidth: "20px",
        ratedFill: "#f85c78",
        readOnly: true
        });
        });
        $(function () {
        $(".rateyo").rateYo({
        starWidth: "40px",
        ratedFill: " #fc4063"
        });
        });
    $(function () {
        $(".rateyo").rateYo().on("rateyo.change", function (e, data) {
            var rating = data.rating;
            $(this).parent().find('.score').text('score :'+ $(this).attr('data-rateyo-score'));
            $(this).parent().find('.result').text('rating :'+ rating);
            $(this).parent().find('input[name=stars]').val(rating); //add rating value to input field
        });
    });
 
</script>
</body>

<script src="./map.js"></script>
    
</html>