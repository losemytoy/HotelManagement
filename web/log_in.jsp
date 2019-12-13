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



    <meta charset="utf-8">

    <title>用户登陆</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description" content="">

    <meta name="author" content="">



    <!-- CSS -->

    <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/supersized.css">

    <link rel="stylesheet" href="css/style1.css">



    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->

    <!--[if lt IE 9]>

    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>

    <![endif]-->



</head>



<body>
<a href="log_inAdmin.jsp" style="float:right;text-decoration: none;color: white;font-size: 16px;position: relative;top: -110px;right: 20px;">管理员登陆</a>
<%
    String name="";
    String cookieName = "user";
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
<form id="form1" name="form1" method="post" action="user.do?method=1">

<div class="page-container">

    <h1>林氏传奇酒店用户登陆</h1>

    <form action="" method="post">

        <input type="text" name="user_account" class="username" placeholder="请输入账号">

        <input type="password" name="user_pwd" class="password" placeholder="请输入密码">

        <button type="submit">登陆</button>

        <button type="button"><a href="register.jsp" style="color: white;text-decoration: none">还没有账号？</a></button>

    </form>

    <div class="connect">

        <p>Or connect with:</p>

        <p>

            <a class="facebook" href=""></a>

            <a class="twitter" href=""></a>

        </p>

    </div>

</div>


</form>

<!-- Javascript -->

<script src="js/jquery-1.8.2.min.js"></script>

<script src="js/supersized.3.2.7.min.js"></script>

<script src="js/supersized-init.js"></script>

<script src="js/scripts.js"></script>

<%
    String result = (String) request.getAttribute("result");
    if (result != null)
        out.print(result);
%>

</body>



</html>



