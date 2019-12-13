<%@ page import="pojo.Customer" %>
<%@ page import="java.util.List" %><%--
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
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/sss.css" />

</head>

<script type="text/javascript" src="js/showtime.js"></script>

<body onload="showtime()" style="background:url(img/bg.jpg) no-repeat;background-size:100%;">
<jsp:useBean id="customerDao" class="dao.impl.CustomerDaoImpl"/>
<%
    List<Customer> list=customerDao.getAllCustomer();
    for (Customer customer:list){
%>
<nav class="navbar navbar-default" style="background: rgba(255,255,255,0.5);">
    <div class="container-fluid">
        <div class="head_pic">
            <a href=""><img src="img/pic.png" class="navbar-brand"/></a>
        </div>

        <div>
            <ul class="nav navbar-nav "style="margin-left:70px ;"id="head">
                <li><a href="shouye.jsp">首页&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        个人设置
                        <b class="caret"></b>&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="CustomerList.jsp">我的信息</a></li>
                        <li class="divider"></li>
                        <li><a href="cus.do?method=2&account=<%=customer.getUser_account()%>">修改资料</a></li>
                    </ul>
                </li>
                <li><a href="OrderList.jsp">我的訂單&nbsp;&nbsp;&nbsp;</a></li>
                <li><a href="RoomList.jsp">訂房</a></li>
            </ul>
        </div>

        <div class="clock">
            当前时间：<span id="clock" charset="UTF-8"></span>
        </div>

        <div class="admin">
            用户：<a><%=session.getAttribute("user")%></a>&nbsp;<a href="log_in.jsp">注销</a>
        </div>

    </div>
</nav>
<p style="position: fixed;bottom:0;left:0;width:100%;text-align: center;color: white;">
    Copyrighy © 酒店订房管理系统
</p>
<% }%>
</body>
</html>

<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
<script src="js/bootstrap.js"></script>
