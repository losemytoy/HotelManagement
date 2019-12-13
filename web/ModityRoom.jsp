<%@ page import="pojoAdmin.Room" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/18
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改房间信息</title>
    <link rel="stylesheet" href="css/1.css" />
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<%
    Room room = (Room) request.getAttribute("room");
    if (room == null){
        return;
    }
%>

<%--<form id="form1" name="form1" method="post"   action="helloroom?method=3">--%>
<%--<input type="hidden" name="roomid" value="<%=room.getRoom_id()%>">--%>
<%--<table align="center" width="260" border="1" cellpadding="0" cellspacing="0">--%>
<%--<tr>--%>
<%--<th width="64" scope="row">房间号：</th>--%>
<%--<td width="120">--%>
<%--<c name="roomid"><%=room.getRoom_id()%></c>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th width="64" scope="row">房间状态：</th>--%>
<%--<td width="120">--%>
<%--<c name="roomstat"><%=room.getRoom_stat()%></c>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row">房间价格：</th>--%>
<%--<td><input type="text" name="roomprice" id="textfield2" value="<%=room.getRoom_price()%>"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>

<%--<td colspan="2" align="center"><input type="reset"--%>
<%--name="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp; <input--%>
<%--type="submit" name="button2" id="button2" value="提交"/></td>--%>
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
    <form name="form1" method="post" action="helloroom?method=3">
        <input type="hidden" name="roomid" value="<%=room.getRoom_id()%>">
        <ul>
            <li>
                <label>房间号：</label>
                <input type="text" name="roomid" value="<%=room.getRoom_id()%>"/><span class="tips">名称可为中文或英文</span>
            </li>
            <li>
                <label>房间状态：</label>
                <input type="text" name="roomstat" value="<%=room.getRoom_stat()%>"/><span class="tips" id="divpassword1">必填</span>
            </li>
            <li>
                <label>房间价格：</label>
                <input type="text" name="roomprice" value="<%=room.getRoom_price()%>"/><span class="tips" id="divpassword2">可不填</span>
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
<p>&nbsp;</p>
</body>
</html>
