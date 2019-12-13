<%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/14
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增用户账号</title>
</head>
<body>
<%--<form id="form1" name="form1" method="post"action="hello?method=5" >--%>
<%--<table align="center" width="260" border="1" cellpadding="0" cellspacing="0" top="50">--%>
<%--<tr>--%>
<%--<th width="64" scope="row">用户账号：</th>--%>
<%--<td width="120"><input type="text" name="useraccount" id="textfield1"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row">用户密码：</th>--%>
<%--<td><input type="text" name="user_pwd" id="textfield2"/></td>--%>
<%--</tr>--%>
<%--<td colspan="2" align="center">--%>
<%--<input type="reset" name="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--<input type="submit" name="button2" id="button2" value="提交"/></td>--%>
<%--</tr>--%>
<%--</table>--%>

<%--<%--%>
<%--String result =(String) request.getAttribute("result");--%>
<%--if (result != null) {--%>
<%--out.println(result);--%>
<%--}--%>
<%--%>--%>
<%--</form>--%>


<form style="margin-top: 80px" action="hello?method=5" method="post" onsubmit="return doTable()">
    <table align="center" width="500">
        <tr>
            <td align="center" width="100">用&nbsp;户&nbsp;帐&nbsp;号：</td>
            <td>
                <b>*</b>
                <input type="text" name="useraccount"/>
                <span></span>
            </td>
        </tr>
        <tr>
            <td align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
            <td>
                <b>*</b>
                <input type="password" name="user_pwd"/>
                <span></span>
            </td>
        </tr>
        <tr>
            <td align="center">确认密码：</td>
            <td>
                <b>*</b>
                <input type="password" name="repass"/>
                <span></span>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="提交" />
            </td>
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

<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>

<script type="text/javascript">
    var gets = true;//是否让表单提交
    $(function(){
// 提示信息===========================================
        $("input[name=useraccount]").focus(function(){
            if($(this).val() == this.defaultValue){
                $(this).val('');
            }
        }).blur(function(){
            if($(this).val() == ''){
                $(this).val(this.defaultValue);
            }
        });
//当输入框失去焦点的时候，需要执行的方法
        $("input[name=useraccount]").blur(function(){doUsername();});
        $("input[name=user_pwd]").blur(function(){doPassword();});
        $("input[name=repass]").blur(function(){doRepass();});
    });
    // 用户名的验证==========================
    function doUsername(){
        var t = $("input[name=useraccount]");
        var span = t.next();
        if(/^\w{3,6}$/.test(t.val())){
            span.html("填写正确").css({color:"green",fontSize:"12px"});
            return true;
        }else{
            span.html("包含数字、字母、下划线").css({color:"red",fontSize:"12px"});
            return false;
        }
    }
    // 密码的验证==========================
    function doPassword(){
        var t = $("input[name=user_pwd]");
        var span = t.next();
        if(t.val() == ''){
            span.html("密码不能为空").css({color:"red",fontSize:"12px"});
            return false;
        }else{
            span.html('');
            if(/.{15,}/.test(t.val())){
                span.html("密码长度不合法");
                return false;
            }
            return true;
        }
    }
    // 确认密码的验证==========================
    function doRepass(){
        var t = $("input[name=repass]");
        var span = t.next();
        if(t.val() == $("input[name=user_pwd]").val() && t.val() != ''){
            span.html("填写正确").css({color:"green",fontSize:"12px"});
            return true;
        }else{
            span.html("两次密码不一致").css({color:"red",fontSize:"12px"});
            return false;
        }
    }
</script>
