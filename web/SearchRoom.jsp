<%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/18
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间查询</title>
    <link rel="stylesheet" href="css/1.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<%--<form id="form1" name="form1" method="post"   action="helloroom?method=6">--%>
<%--<table align="center" width="260" border="1" cellpadding="0" cellspacing="0">--%>
<%--<tr>--%>
<%--<th width="64" scope="row">房间号：</th>--%>
<%--<td width="120"><input type="text" name="roomid" id="textfield1"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<td colspan="2" align="center">--%>
<%--<input type="reset" name="button" id="button" value="重置"/>&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--<input type="submit" name="button2" id="button2" value="提交"/></td>--%>
<%--</tr>--%>
<%--</table>--%>

<div class="search d2" style="margin: 0px">
    <form id="form1" name="form1" method="post" action="helloroom?method=6" style="position: relative; width: 500px;margin: 0 auto;">
        <input type="text" name="roomid" placeholder="房间号:">
        <button style="height: 26px;width: 40px;position: absolute;right:60px;top: 8px;background: white;cursor: pointer;" type="reset">重置</button>
        <button style="height: 26px;width: 40px;position: absolute;right:10px;top: 8px;background: white;cursor: pointer;" type="submit">查询</button>
    </form>
</div>

<%
    String result =(String) request.getAttribute("result");
    if (result != null) {
        out.println(result);
    }
%>
<%--</form>--%>
</body>
</html>
