<%--
  Created by IntelliJ IDEA.
  User: WZBC
  Date: 2019/6/10
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">

</head>

<body>
<a href="log_in.jsp" style="float:right;text-decoration: none;color: black;font-size: 16px;position: relative;right: 25px;top: 10px">用户登陆</a>
<%
    String name="";
    String cookieName = "admin_account";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie cookie = cookies[i];
            if (cookieName.equals(cookie.getName())) {
                name = cookie.getValue();
            }
        }
    }
%>
<%--<form id="form1" name="form1" >--%>
<div class="wrapper" >

    <div class="container">
        <h1>Welcome</h1>
        <form class="form" method="post" action="admin.do?method=1">
            <input type="text" placeholder="请输入账号" name="admin_account" value="<%=name%>">
            <input type="password" placeholder="请输入密码" name="admin_pwd">
            <button type="submit" id="login-button">登陆</button>
        </form>
    </div>

    <ul class="bg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>

</div>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
</body>
</html>
<%
    String result = (String) request.getAttribute("result");
    if (result != null)
        out.print(result);
%>
