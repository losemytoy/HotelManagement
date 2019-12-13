<%@ page import="pojoAdmin.Room" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/18
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间查询</title>
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<%
    Room room = (Room) request.getAttribute("room");
    if (room == null){
        return;
    }
%>

<form id="form1" name="form1" method="post">
    <input type="hidden" name="useraccount" value="<%=room.getRoom_id()%>">
    <table align="center" width="260" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th width="64" scope="row">房间号：</th>
            <td width="120"><%=room.getRoom_id()%></td>
        </tr>
        <tr>
            <th scope="row">房间状态：</th>
            <td><%=room.getRoom_stat()%></td>
        </tr>
        <tr>
            <th scope="row" >房间价格：</th>
            <td><%=room.getRoom_price()%></td>
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
