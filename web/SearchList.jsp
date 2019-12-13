<%@ page import="pojoAdmin.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/15
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户查询</title>
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<%
    Customer customer = (Customer) request.getAttribute("customer");
    if (customer == null){
        return;
    }
%>

<form id="form1" name="form1" method="post"   action="hello?method=">
    <input type="hidden" name="useraccount" value="<%=customer.getUser_account()%>">
    <table align="center" width="260" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th width="64" scope="row">客户名称：</th>
            <td width="120"><%=customer.getUser_name()%></td>
        </tr>
        <tr>
            <th scope="row">客户性别：</th>
            <td><%=customer.getUser_sex()%></td>
        </tr>
        <tr>
            <th scope="row" >客户年龄：</th>
            <td><%=customer.getUser_age()%></td>
        </tr>
        <tr>
            <th scope="row" >客户身份证：</th>
            <td><%=customer.getUser_sfz()%></td>
        </tr>
        <tr>
            <th scope="row" >联系方式：</th>
            <td><%=customer.getUser_tel()%></td>
        </tr>
    </table>

    <%
        String result =(String) request.getAttribute("result");
        if (result != null) {
            out.println(result);
        }
    %>
</form>
</body>
</html>
