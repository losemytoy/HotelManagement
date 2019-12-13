<%@ page import="pojoAdmin.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/15
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表</title>
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<jsp:useBean id="orderDao" class="daoAdmin.impl.OrderDaoImpl"/>
<%--<table width="100%" border="1" cellpadding="1" cellspacing="1" bgcolor="#FECE62">--%>
<%--<tr>--%>
<%--<td width="94" height="25"><div align="center">订单编号</div></td>--%>
<%--<td width="155"><div align="center">客户账号</div></td>--%>
<%--<td width="133"><div align="center">房间号</div></td>--%>
<%--<td width="81"><div align="center">操作</div></td>--%>
<%--</tr>--%>
<%--<%--%>
<%--List<Order> list=orderDao.getAllOrder();--%>
<%--for (Order order :list){--%>
<%--%>--%>

<%--<tr bgcolor="#FFFFFF" style="text-align: center">--%>
<%--<td><%=order.getOrder_id()%>--%>
<%--</td>--%>
<%--<td>--%>
<%--<p style="overflow: hidden;white-space: nowrap;text-align: center"><%=order.getUser_account()%></p>--%>
<%--</td>--%>
<%--<td style="text-align: center">--%>
<%--<%=order.getRoom_id()%>--%>
<%--</td>--%>
<%--<td align="center">--%>
<%--<a href="helloorder?method=2&orderid=<%=order.getOrder_id()%>">删除</a></td>--%>
<%--</tr>--%>
<%--<% }%>--%>

<%--</table>--%>

<table class="hovertable" >
    <tr>
        <th>订单编号</th>
        <th>客户账号</th>
        <th>房间号</th>
        <th>操作</th>
    </tr>
    <%
        List<Order> list=orderDao.getAllOrder();
        for (Order order :list){
    %>
    <tr>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=order.getOrder_id()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=order.getUser_account()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=order.getRoom_id()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';">
            <a href="helloorder?method=2&orderid=<%=order.getOrder_id()%>">删除</a>
        </td>
    </tr>
    <%}%>
</table>
</body>
</html>
