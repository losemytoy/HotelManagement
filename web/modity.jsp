<%@ page import="pojo.Customer" %><%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/14
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改资料</title>
</head>
<body>
<jsp:include page="AdminIndex.jsp"/>
<%
    Customer customer = (Customer) request.getAttribute("customer");
    if (customer == null){
        return;
    }
%>

<form id="form1" name="form1" method="post"   action="cus.do?method=3">
    <input type="hidden" name="useraccount" value="<%=customer.getUser_account()%>">
    <table align="center" width="600"  border="1" cellpadding="0" cellspacing="0" style="position: relative;top: 100px;">
        <tr>
            <th width="64" style="text-align: center;background-color: darkslategray;color: white;" scope="row">客户名称：</th>
            <td width="450px"><input style="width: 450px;" type="text" name="username" id="textfield1"value="<%=customer.getUser_name()%>"/>
            </td>
        </tr>
        <tr>
            <th style="text-align: center;background-color: darkslategray;color: white;" scope="row">客户性别：</th>
            <td  width="450px"><input style="width: 450px;" type="text" name="usersex" id="textfield2" value="<%=customer.getUser_sex()%>"/></td>
        </tr>
        <tr>
            <th style="text-align: center;background-color: darkslategray;color: white;" scope="row" >客户年龄：</th>
            <td  width="450px"><input style="width: 450px;" type="text" name="userage" id="textfield3"value="<%=customer.getUser_age()%>"/></td>
        </tr>
        <tr>
            <th style="text-align: center;background-color: darkslategray;color: white;" scope="row" >客户身份证：</th>
            <td  width="450px"><input style="width: 450px;" type="text" name="usersfz" id="textfield4"value="<%=customer.getUser_sfz()%>"/></td>
        </tr>
        <tr>
            <th style="text-align: center;background-color: darkslategray;color: white;" scope="row" >联系方式：</th>
            <td  width="450px"><input style="width: 450px;" type="text" name="usertel" id="textfield5"value="<%=customer.getUser_tel()%>"/></td>
        </tr>

    </table>
    <table align="center" style="position: relative;top: 100px;">
        <tr>
            <td  colspan="2" align="center"><input style="width: 60px;height: 40px;border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;font-family: Microsoft YaHei;color: white;font-size: 17px;position: relative;left: 30px;"
                type="reset" name="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp; <input
                    style="width: 60px;height: 40px;border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;font-family: Microsoft YaHei;color: white;font-size: 17px;position: relative;left: 30px;"
                    type="submit" name="button2" id="button2" value="提交"/></td>
        </tr>
    </table>

    <%
        String result =(String) request.getAttribute("result");
        if (result != null) {
            out.println(result);
        }
    %>
</form>
<p>&nbsp;</p>
</body>
</html>
