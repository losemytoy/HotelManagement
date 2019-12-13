<%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2019/6/18
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增房间</title>
</head>
<body>
<%--<jsp:include page="AdminIndexAdmin.jsp"/>--%>
<%--<form id="form1" name="form1" method="post"   action="helloroom?method=5">--%>
<%--<table align="center" width="260" border="1" cellpadding="0" cellspacing="0">--%>
<%--<tr>--%>
<%--<th width="64" scope="row">房间号：</th>--%>
<%--<td width="120"><input type="text" name="roomid" id="textfield1"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row">房间状态：</th>--%>
<%--<td><input type="text" name="roomstat" id="textfield2"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th scope="row">房间价格：</th>--%>
<%--<td><input type="text" name="roomprice" id="textfield3"/></td>--%>
<%--</tr>--%>
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

<form style="margin-top: 80px" action="helloroom?method=5" method="post" onsubmit="return doTable()">
    <table align="center" width="500">
        <tr>
            <td align="center" width="100">房&nbsp;间&nbsp;号：</td>
            <td><b>*</b><input type="text" name="roomid"/>
                <span></span>
            </td>
        </tr>
        <tr>
            <td align="center">房&nbsp;间&nbsp;状&nbsp;态：</td>
            <td><b>*</b><input type="text" name="roomstat"/>
                <span></span>
            </td>
        </tr>
        <tr>
            <td align="center">房&nbsp;间&nbsp;价&nbsp;格：</td>
            <td><b>*</b><input type="text" name="roomprice"/>
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
        $("input[name=roomid]").focus(function(){
            if($(this).val() == this.defaultValue){
                $(this).val('');
            }
        }).blur(function(){
            if($(this).val() == ''){
                $(this).val(this.defaultValue);
            }
        });
//当输入框失去焦点的时候，需要执行的方法
        $("input[name=roomid]").blur(function(){doRoomId();});
        $("input[name=roomstat]").blur(function(){doRoomStat();});
        $("input[name=roomprice]").blur(function(){doRoomPrice();});
    });
    // 房间号的验证==========================
    function doRoomId(){
        var t = $("input[name=roomid]");
        var span = t.next();
        if(/^\w{3,6}$/.test(t.val())){
            span.html("填写正确").css({color:"green",fontSize:"12px"});
            return true;
        }else{
            span.html("包含数字、字母、下划线").css({color:"red",fontSize:"12px"});
            return false;
        }
    }
    // 房间状态的验证==========================
    function doRoomStat(){
        var t = $("input[name=roomstat]");
        var span = t.next();
        if(/^\w{3,6}$/.test(t.val())){
            span.html("填写正确").css({color:"green",fontSize:"12px"});
            return true;
        }else{
            span.html("有/无").css({color:"red",fontSize:"12px"});
            return false;
        }
    }
    // 房间价格的验证==========================
    function doRoomPrice(){
        var t = $("input[name=roomprice]");
        var span = t.next();
        if(/^\w{3,6}$/.test(t.val())){
            span.html("填写正确").css({color:"green",fontSize:"12px"});
            return true;
        }else{
            span.html("包含数字，长度在3-6之间").css({color:"red",fontSize:"12px"});
            return false;
        }
    }
</script>

