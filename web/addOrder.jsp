<%@ page import="pojo.Order" %>
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
</head>
<body>
<jsp:include page="AdminIndex.jsp"/>
<jsp:useBean id="orderDao" class="dao.impl.OrderDaoImpl"/>
<%
        List<Order> list=orderDao.getAllOrder();
%>
<form id="form1" name="form1" method="post"   action="add.do?method1=5">
    <table align="center" width="300" border="1" cellpadding="0" cellspacing="0" style="position: relative;top: 100px;">
        <tr>
            <th scope="row;" width="120" style="text-align: center;background-color: darkslategray;color: white;">订单编号：</th>
            <td><input type="text" name="order_id" id="textfield1" value="自动生成"/></td>
        </tr>
        <tr>
            <th scope="row" style="text-align: center;background-color: darkslategray;color: white;">用户账号：</th>
            <td><input type="text" name="user_account" id="textfield2" value="<%=session.getAttribute("user")%>"/></td>
        </tr>
        <tr>
            <th scope="row" style="text-align: center;background-color: darkslategray;color: white;">房间号：</th>
            <td><input type="text" name="room_id" id="textfield3" value=""/></td>

    </table>
    <table align="center" style="position: relative;top: 100px;">
        </tr>
        <td colspan="2" align="center">
            <input style="width: 60px;height: 40px;border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;font-family: Microsoft YaHei;color: white;font-size: 17px;position: relative;left: 30px;"
            type="reset"vname="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp;
            <input style="width: 60px;height: 40px;border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;font-family: Microsoft YaHei;color: white;font-size: 17px;position: relative;left: 30px;"
                   type="submit" name="button2" id="button2" value="提交"/></td>
        </tr>
    </table>

    <%
        String result =(String) request.getAttribute("result");
        if (result != null) {
            out.println(result);
        }
    %>
</form>
</body>
</html>
