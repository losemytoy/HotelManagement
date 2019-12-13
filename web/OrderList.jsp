<%@ page import="pojo.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 89412
  Date: 2019/6/18
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <link rel="stylesheet" href="css/1.css">
</head>
<body>
<jsp:include page="AdminIndex.jsp"/>
<jsp:useBean id="orderDao" class="dao.impl.OrderDaoImpl"/>
<table class="hovertable">
    <tr>
        <td style="background-color: darkslategray;color: white" width="94" height="25"><div align="center">订单编号</div></td>
        <td style="background-color: darkslategray;color: white" width="155"><div align="center">用户账号</div></td>
        <td style="background-color: darkslategray;color: white" width="133"><div align="center">房间号</div></td>
        <td style="background-color: darkslategray;color: white" width="81"><div align="center">操作</div></td>
    </tr>
    <%
        List<Order> list=orderDao.getAllOrder();
        for (Order order:list){
    %>

    <tr bgcolor="#FFFFFF" style="text-align: center">
        <td style="background-color: white" onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';">
            <%=order.getOrder_id()%>
        </td>
        <td style="background-color: white" onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';">
            <%=order.getUser_account()%>
        </td>
        <td style="background-color: white" onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';">
            <%=order.getRoom_id()%>
        </td>
        <td style="background-color: white" onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" align="center">
            <a href="add.do?method1=4&account=<%=order.getOrder_id()%>">删除</a></td>
        </td>
    </tr>
    <% }%>

</table>
</body>
</html>
