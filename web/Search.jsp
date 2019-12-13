<%@ page import="pojoAdmin.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/15
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户查询</title>
    <link rel="stylesheet" href="css/1.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<div class="search d2" style="margin: 0px">
    <form id="form1" name="form1" method="post" action="hello?method=6" style="position: relative; width: 500px;margin: 0 auto;">
        <input type="text" name="account" placeholder="用户账号:">
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
