<%@ page import="pojo.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.CustomerDao" %>
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
    <title>我的信息</title>
</head>
<body>
<jsp:include page="AdminIndex.jsp"/>
<jsp:useBean id="customerDao" class="dao.impl.CustomerDaoImpl"/>
    <div style="width: 15%;float: left;position: relative;left: 423px;top:80px;background-color: darkslategray;">
        <tr>
            <td width="94px"><div style="height: 60px;border: 1px solid gray;line-height: 60px;color: white;" align="center">账号:</div></td>
        </tr>
        <tr>
            <td width="155"><div style="height: 60px;border: 1px solid gray;line-height: 60px;color: white;" align="center">密码:</div></td>
        </tr>
        <tr>
            <td width="133"><div style="height: 60px;border: 1px solid gray;line-height: 60px;color: white;" align="center">名字:</div></td>
        </tr>
        <tr>
            <td width="133"><div style="height: 60px;border: 1px solid gray;line-height: 60px;color: white;" align="center">性别:</div></td>
        </tr>
        <tr>
            <td width="133"><div style="height: 60px;border: 1px solid gray;line-height: 60px;color: white;" align="center">年龄:</div></td>
        </tr>
        <tr>
            <td width="81"><div style="height: 60px;border: 1px solid gray;line-height: 60px;color: white;" align="center">身份证:</div></td>
        </tr>
        <tr>
            <td width="81"><div style="height: 60px;border: 1px solid gray;line-height: 60px;color: white;"  align="center">联系方式:</div></td>
        </tr>
    </div>

    <div style="width: 30%;float: right;position: relative;right: 423px;top:80px;background-color: white;">
        <%
            List<Customer> list=customerDao.getAllCustomer();
            for (Customer customer:list){
        %>

        <tr >
            <td>
                <div style="height: 60px;border: 1px solid gray;line-height: 60px" align="center"><%=customer.getUser_account()%></div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 60px;border: 1px solid gray;line-height: 60px" align="center"><%=customer.getUser_pwd()%></div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 60px;border: 1px solid gray;line-height: 60px" align="center"><%=customer.getUser_name()%></div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 60px;border: 1px solid gray;line-height: 60px" align="center"><%=customer.getUser_sex()%></div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 60px;border: 1px solid gray;line-height: 60px" align="center"><%=customer.getUser_age()%></div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 60px;border: 1px solid gray;line-height: 60px" align="center"><%=customer.getUser_sfz()%></div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 60px;border: 1px solid gray;line-height: 60px" align="center"><%=customer.getUser_tel()%></div>
            </td>
        </tr>

        <% }%>
    </div>


</body>
</html>
