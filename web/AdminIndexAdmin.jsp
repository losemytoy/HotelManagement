<%--
  Created by IntelliJ IDEA.
  User: WZBC
  Date: 2019/6/10
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>酒店订房管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/1.css" />

</head>

<script type="text/javascript">
    function open_1()
    {
        window.open("addUserNumber.jsp","_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=500, height=300,left=550,top=230")
    }

    function open_2()
    {
        window.open("addRoom.jsp","_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=500, height=300,left=550,top=230")
    }
</script>

<script type="text/javascript" src="js/showtime.js"></script>

<body onload="showtime()">

<nav class="navbar navbar-default" style="background: rgba(255,255,255,0.5);">
    <div class="container-fluid">
        <div class="head_pic">
            <a href=""><img src="img/pic.png" class="navbar-brand"/></a>
        </div>

        <div>
            <ul class="nav navbar-nav "style="margin-left:70px ;"id="head">
                <li><a href="AdminIndexAdmin.jsp">首页&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        用戶管理
                        <b class="caret"></b>&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="CustomerListAdmin.jsp">用户列表</a></li>
                        <li class="divider"></li>
                        <li><a href="Search.jsp">用户查询</a></li>
                        <li class="divider"></li>
                        <li><a href="" onclick="open_1()">新增用户账号</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        房間管理
                        <b class="caret"></b>&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="RoomListAdmin.jsp">房间信息</a></li>
                        <li class="divider"></li>
                        <li><a href="SearchRoom.jsp">房间查询</a></li>
                        <li class="divider"></li>
                        <li><a href="" onclick="open_2()">新增房间</a></li>
                    </ul>
                </li>
                <li><a href="OrderListAdmin.jsp">訂單管理&nbsp;&nbsp;&nbsp;</a></li>
                <li><a href="RoomListUser.jsp">訂房</a></li>
            </ul>
        </div>

        <div class="clock">
            当前时间：<span id="clock" charset="UTF-8"></span>
        </div>

        <div class="admin">
            欢迎，管理員：<c><%=request.getSession().getAttribute("admin_account")%></c>
            <a href="exit.jsp" target="_top" style="font-size: 15px;padding-left: 20px">退出账户</a>
        </div>


    </div>
</nav>


<p style="position: fixed;bottom:0;left:0;width:100%;text-align: center">
    Copyrighy © 酒店订房管理系统
</p>

</body>
</html>

<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
<script src="js/bootstrap.js"></script>
