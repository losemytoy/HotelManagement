<%--
  Created by IntelliJ IDEA.
  User: WZBC
  Date: 2019/6/10
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/1.css" />

</head>

<script type="text/javascript" src="js/showtime.js"></script>

<body onload="showtime()">

<nav class="navbar navbar-default navbar-fixed-top" style="background: rgba(255,255,255,0.5);">
    <div class="container-fluid">
        <div class="head_pic">
            <a href="../网页/登陆.html"><img src="img/pic.png" class="navbar-brand"/></a>
        </div>

        <div>
            <ul class="nav navbar-nav "style="margin-left:70px ;"id="head">
                <li><a href="../网页/首页.html">首页&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        用戶管理
                        <b class="caret"></b>&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="">用戶添加</a></li>
                        <li class="divider"></li>
                        <li><a href="">世界简史</a></li>
                        <li class="divider"></li>
                        <li><a href="">项目经验</a></li>
                        <li class="divider"></li>
                        <li><a href="">发展前景</a></li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        房間管理
                        <b class="caret"></b>&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">房間信息</a></li>
                        <li class="divider"></li>
                        <li><a href="">传统风格</a></li>
                        <li><a href="">中式风格</a></li>
                    </ul>
                </li>
                <li><a href="">訂單管理&nbsp;&nbsp;&nbsp;</a></li>
                <li><a href="">訂房</a></li>
            </ul>
        </div>

        <div class="clock">
            当前时间：<span id="clock"></span>
        </div>

        <div class="admin">
            用户账号：<a href=""></a>
        </div>

    </div>
</nav>

</body>
</html>

<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
<script src="js/bootstrap.js"></script>
