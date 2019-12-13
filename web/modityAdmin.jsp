<%@ page import="pojoAdmin.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/14
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改客户信息</title>
    <link rel="stylesheet" href="css/1.css" />
</head>
<body>
<jsp:include page="AdminIndexAdmin.jsp"/>
<%
    Customer customer = (Customer) request.getAttribute("customer");
    if (customer == null){
        return;
    }
%>

<%--<form id="form1" name="form1" method="post"   action="hello?method=3">--%>
<%--<input type="hidden" name="useraccount" value="<%=customer.getUser_account()%>">--%>
<%--<table align="center" width="260" border="1" cellpadding="0" cellspacing="0">--%>
<%--<tr>--%>
<%--<th width="64" scope="row">客户名称：</th>--%>
<%--<td width="120"><input type="text" name="username" id="textfield1"value="<%=customer.getUser_name()%>"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row">客户性别：</th>--%>
<%--<td><input type="text" name="usersex" id="textfield2" value="<%=customer.getUser_sex()%>"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row" >客户年龄：</th>--%>
<%--<td><input type="text" name="userage" id="textfield3"value="<%=customer.getUser_age()%>"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row" >客户身份证：</th>--%>
<%--<td><input type="text" name="usersfz" id="textfield4"value="<%=customer.getUser_sfz()%>"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row" >联系方式：</th>--%>
<%--<td><input type="text" name="usertel" id="textfield5"value="<%=customer.getUser_tel()%>"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>

<%--<td colspan="2" align="center"><input type="reset"--%>
<%--name="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp; <input--%>
<%--type="submit" name="button2" id="button2" value="提交"/></td>--%>
<%--</tr>--%>
<%--</table>--%>

<%--<%--%>
<%--String result =(String) request.getAttribute("result");--%>
<%--if (result != null) {--%>
<%--out.println(result);--%>
<%--}--%>
<%--%>--%>
<%--</form>--%>


<div class="contact" >
    <form name="form1" method="post" action="hello?method=3">
        <input type="hidden" name="useraccount" value="<%=customer.getUser_account()%>">
        <ul>
            <li>
                <label>客户名称：</label>
                <input type="text" name="username" value="<%=customer.getUser_name()%>"/><span class="tips">名称可为中文或英文</span>
            </li>
            <li>
                <label>客户性别：</label>
                <input type="text" name="usersex" value="<%=customer.getUser_sex()%>"/><span class="tips" id="divpassword1">必填</span>
            </li>
            <li>
                <label>客户年龄：</label>
                <input type="text" name="userage" value="<%=customer.getUser_age()%>"/><span class="tips" id="divpassword2">可不填</span>
            </li>
            <li>
                <label>客户身份证：</label>
                <input type="text" name="usersfz" value="<%=customer.getUser_sfz()%>"/><span class="tips" id="divmail">请如实填写</span>
            </li>
            <li>
                <label>联系方式：</label>
                <input type="text" name="usertel" value="<%=customer.getUser_tel()%>"/><span class="tips">必填</span>
            </li>
        </ul>
        <b class="btn"><input type="submit" value="提交"/>
            <input type="reset" value="取消"/></b>
    </form>
    <%
        String result =(String) request.getAttribute("result");
        if (result != null) {
            out.println(result);
        }
    %>

</div>
<p>&nbsp;</p>
</body>
</html>
