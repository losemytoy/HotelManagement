<%@ page import="pojo.Room" %>
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
<jsp:include page="AdminIndex.jsp"/>
<jsp:useBean id="roomDao" class="dao.impl.RoomDaoImpl"/>
<div id="login_click" style="position: relative;right: 750px">
    <a id="btlogin" href="addOrder.jsp">订房</a>
</div>

<table class="hovertable">
    <tr>
        <td width="94" style="background-color: darkslategray;color: white" height="25"><div  align="center">房间号</div></td>
        <td width="155"style="background-color: darkslategray;color: white"><div  align="center">房间状态</div></td>
        <td width="133"style="background-color: darkslategray;color: white"><div  align="center">房间价格</div></td>
    </tr>
    <%
        List<Room> list=roomDao.getAllRoom();
        for (Room room:list){
    %>

    <tr bgcolor="#FFFFFF" style="text-align: center">
        <td style="background-color: white" onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';">
            <%=room.getRoom_id()%>
        </td>
        <td style="background-color: white" onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';">
            <%=room.getRoom_stat()%>
        </td>
        <td style="background-color: white" onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';">
            <%=room.getRoom_price()%>
        </td>

    </tr>
    <% }%>

</table>
</body>
</html>
