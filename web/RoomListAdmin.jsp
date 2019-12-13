<%@ page import="pojoAdmin.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="pojoAdmin.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/17
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间列表</title>
    <link rel="stylesheet" href="css/1.css" />
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<jsp:useBean id="roomDao" class="daoAdmin.impl.RoomDaoImpl"/>

<%--<table width="100%" border="1" cellpadding="1" cellspacing="1" bgcolor="#FECE62">--%>
<%--<tr>--%>
<%--<td width="94" height="25"><div align="center">房间号</div></td>--%>
<%--<td width="155"><div align="center">房间状态</div></td>--%>
<%--<td width="133"><div align="center">房间价格</div></td>--%>
<%--<td width="81"><div align="center">操作</div></td>--%>
<%--</tr>--%>
<%--<%--%>
<%--List<Room> list=roomDao.getAllRoom();--%>
<%--for (Room room :list){--%>
<%--%>--%>

<%--<tr bgcolor="#FFFFFF" style="text-align: center">--%>
<%--<td><%=room.getRoom_id()%>--%>
<%--</td>--%>
<%--<td>--%>
<%--<p style="overflow: hidden;white-space: nowrap;text-align: center"><%=room.getRoom_stat()%></p>--%>
<%--</td>--%>
<%--<td style="text-align: center">--%>
<%--<%=room.getRoom_price()%>--%>
<%--</td>--%>
<%--<td align="center">--%>
<%--<a href="helloroom?method=2&roomId=<%=room.getRoom_id()%>">修改&nbsp;&nbsp;</a>--%>
<%--<a href="helloroom?method=4&roomId=<%=room.getRoom_id()%>">删除房间订单</a></td>--%>
<%--</tr>--%>
<%--<% }%>--%>

<%--</table>--%>

<table class="hovertable" >
    <tr>
        <th>房间号</th>
        <th>房间状态</th>
        <th>房间价格</th>
        <th>操作</th>
    </tr>
    <%
        List<Room> list=roomDao.getAllRoom();
        for (Room room :list){
    %>
    <tr>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=room.getRoom_id()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=room.getRoom_stat()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=room.getRoom_price()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';">
            <a href="helloroom?method=2&roomId=<%=room.getRoom_id()%>">修改&nbsp;&nbsp;</a>
            <a href="helloroom?method=4&roomId=<%=room.getRoom_id()%>">删除</a>
        </td>
    </tr>
    <%}%>
</table>

</body>
</html>
