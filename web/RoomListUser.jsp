<%@ page import="pojoAdmin.Room" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 89412
  Date: 2019/6/18
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订房</title>
    <link rel="stylesheet" href="css/1.css">

</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<jsp:useBean id="roomDao" class="daoAdmin.impl.RoomDaoImpl"/>
<table class="hovertable" >
    <tr>
        <th>房间号</th>
        <th>房间状态</th>
        <th>房间价格</th>
    </tr>
    <%
        List<Room> list=roomDao.getAllRoom();
        for (Room room :list){
    %>
    <tr>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=room.getRoom_id()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=room.getRoom_stat()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=room.getRoom_price()%></td>
    </tr>
    <%}%>
</table>


<div id="login_click">
    <a id="btlogin" href="addOrderAdmin.jsp">订房</a>
</div>

</body>
</html>
