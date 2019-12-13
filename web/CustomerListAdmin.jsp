<%@ page import="pojoAdmin.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="daoAdmin.CustomerDao" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/13
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
    <link rel="stylesheet" href="css/1.css" />
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<jsp:useBean id="customerDao" class="daoAdmin.impl.CustomerDaoImpl"/>


<%--<table style="margin: auto;margin-top: 10vh;background-color: #cccccc">--%>
<%--<tr>--%>
<%--<th width="94" height="25"><div align="center">客户账号</div></th>--%>
<%--<th width="155"><div align="center">客户密码</div></th>--%>
<%--<th width="125"><div align="center">客户名称</div></th>--%>
<%--<th width="133"><div align="center">客户性别</div></th>--%>
<%--<th width="133"><div align="center">客户年龄</div></th>--%>
<%--<th width="81"><div align="center">客户身份证</div></th>--%>
<%--<th width="81"><div align="center">联系方式</div></th>--%>
<%--<th width="81"><div align="center">操作</div></th>--%>
<%--</tr>--%>
<%--<%--%>
<%--List<Customer> list=customerDao.getAllCustomer();--%>
<%--for (Customer customer:list){--%>
<%--%>--%>

<%--<tr bgcolor="#FFFFFF" style="text-align: center">--%>
<%--<td><%=customer.getUser_account()%>--%>
<%--</td>--%>
<%--<td>--%>
<%--<p style="max-width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><%=customer.getUser_pwd()%></p>--%>
<%--</td>--%>
<%--<td>--%>
<%--<%=customer.getUser_name()%>--%>
<%--</td>--%>
<%--<td>--%>
<%--<%=customer.getUser_sex()%>--%>
<%--</td>--%>
<%--<td>--%>
<%--<%=customer.getUser_age()%>--%>
<%--</td>--%>
<%--<td>--%>
<%--<%=customer.getUser_sfz()%>--%>
<%--</td>--%>
<%--<td>--%>
<%--<%=customer.getUser_tel()%>--%>
<%--</td>--%>
<%--<td align="center">--%>
<%--<a href="hello?method=2&account=<%=customer.getUser_account()%>">修改&nbsp;&nbsp;</a>--%>
<%--<a href="hello?method=4&account=<%=customer.getUser_account()%>">删除</a></td>--%>
<%--</tr>--%>
<%--<% }%>--%>
<%--</table>--%>


<table class="hovertable" >
    <tr>
        <th>客户账号</th>
        <th>客户密码</th>
        <th>客户名称</th>
        <th>客户性别</th>
        <th>客户年龄</th>
        <th>客户身份证</th>
        <th>联系方式</th>
        <th>操作</th>

    </tr>
    <%
        List<Customer> list=customerDao.getAllCustomer();
        for (Customer customer:list){
    %>
    <tr>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=customer.getUser_account()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=customer.getUser_pwd()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=customer.getUser_name()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=customer.getUser_sex()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=customer.getUser_age()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=customer.getUser_sfz()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';"><%=customer.getUser_tel()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';">
            <a href="hello?method=2&account=<%=customer.getUser_account()%>">修改&nbsp;&nbsp;</a>
            <a href="hello?method=4&account=<%=customer.getUser_account()%>">删除</a>
        </td>
    </tr>
    <%}%>
</table>
</body>
</html>
