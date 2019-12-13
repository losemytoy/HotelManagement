<%@ page import="pojoAdmin.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 89412
  Date: 2019/6/18
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预定房间</title>
    <link rel="stylesheet" href="css/1.css" />
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<jsp:useBean id="orderDao" class="daoAdmin.impl.OrderDaoImpl"/>
<%
    List<Order> list=orderDao.getAllOrder();
%>
<%--<form id="form1" name="form1" method="post"   action="ad.do?method=3">--%>
<%--<table align="center" width="260" border="1" cellpadding="0" cellspacing="0">--%>
<%--<tr>--%>
<%--<th scope="row">订单编号：</th>--%>
<%--<td><input type="text" name="order_id" id="textfield1" value="自动生成"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row">用户账号：</th>--%>
<%--<td><input type="text" name="user_account" id="textfield2" value="<%=session.getAttribute("user")%>"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row">房间号：</th>--%>
<%--<td><input type="text" name="room_id" id="textfield3" value=""/></td>--%>
<%--</tr>--%>
<%--<td colspan="2" align="center">--%>
<%--<input type="reset"vname="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--<input type="submit" name="button2" id="button2" value="提交"/></td>--%>
<%--</tr>--%>
<%--</table>--%>

<%--<%--%>
<%--String result =(String) request.getAttribute("result");--%>
<%--if (result != null) {--%>
<%--out.println(result);--%>
<%--}--%>
<%--%>--%>
<%--</form>--%>

<div class="contact" >
    <form name="form1" method="post" action="ad.do?method=3">
        <ul>
            <li>
                <label>订单编号：</label>
                <input type="text" name="order_id" value="自动生成" disabled="disabled"/>
            </li>
            <li>
                <label>用户账号：</label>
                <input type="text" name="user_account" value="<%=session.getAttribute("user")%>"/><span class="tips" id="divpassword1">必填</span>
            </li>
            <li>
                <label>房间号：</label>
                <input type="text" name="room_id" value=""/><span class="tips" id="divpassword2">必填</span>
            </li>
        </ul>
        <b class="btn"><input type="submit" value="提交"/>
            <input type="reset" value="取消"/></b>
    </form>
    <%
        String result =(String) request.getAttribute("result");
        if (result != null) {
            out.println(result);
        }
    %>

</div>

</body>
</html>
