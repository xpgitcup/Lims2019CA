<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <!--设置Base-->
    <base href="<%=basePath%>"/>

    <asset:stylesheet src="cn/edu/cup/cup.css"/>

    <!--引入easyui的相关内容-->
    <asset:stylesheet src="easyui/themes/default/easyui.css"/>
    <asset:stylesheet src="easyui/themes/icon.css"/>
    <asset:stylesheet src="easyui/themes/color.css"/>
    <!--asset:stylesheet src="easyui/themes/bootstrap/easyui.css"/-->
    <!--引入树形结构显示组件-->
    <asset:stylesheet src="bootstrap-treeview/bootstrap-treeview.min.css"/>
    <!--引入jqpagination的样式-->
    <!--asset:stylesheet src="jqpagination/jqpagination.css"/-->

    <!--引入CUP的相关内容-->
    <asset:stylesheet src="cn/edu/cup/cupEasyUi.css"/>

    <!--JS加载-->
    <asset:javascript src="jquery-3.3.1.min.js"/>

    <!--jquery ui-->
    <asset:javascript src="jquery-ui/jquery-ui.min.js"/>
    <asset:stylesheet src="jquery-ui/jquery-ui.min.css"/>

    <!--jquery datetimepicker-->
    <asset:javascript src="jquery-ui-datetimepicker/jquery.datetimepicker.full.min.js"/>
    <asset:stylesheet src="jquery-ui-datetimepicker/jquery.datetimepicker.css"/>

    <asset:javascript src="easyui/jquery.easyui.min.js"/>

    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="bootstrap-treeview/bootstrap-treeview.min.js"/>

    <asset:javascript src="jquery/jquery.cookie.js"/>

    <!--bootstrap datetimepicker-->
    <!--asset:javascript src="bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"/-->

    <!--引入jqpagination-->
    <!--asset:javascript src="jqpagination/jquery.jqpagination.min.js"/-->

    <!--引入拓扑图工具 -->
    <!--asset:javascript src="jtopo/jtopo-0.4.8-min.js"/-->

    <!--引入绘图工具 -->
    <asset:javascript src="echarts/echarts.js"/>

    <!--用户自定义的-->
    <asset:javascript src="cn/edu/cup/common/common.js"/>
    <asset:javascript src="cn/edu/cup/common/commonUI20190206.js"/>

    <!-- 界面设置结束 -->

    <g:layoutHead/>
</head>

<body>

<!--nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation"-->
<nav class="navbar navbar-expand-lg navbar-static-top-cup" role="navigation">
    <!--这是左边的图标，固定内容-->
    <a class="navbar-brand" href="/#"><asset:image
            src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("main")?.logo}" alt="程序Logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="applicationTitle">
        ${cn.edu.cup.common.Caption.findByName("main")?.title}
    </div>

    <!-- 这是右边的菜单，几个按钮，点击后下来菜单-->
    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
        <!-- 这一句指导页面将内容插入到这里 -->
            <g:pageProperty name="page.nav"/>

            <g:if test="${session.systemUser}">
            </g:if>
            <g:else>
                <li class="dropdown">
                    <a href="${createLink(uri: '/home/loginUI')}">去登录</a>
                </li>
            </g:else>
        </ul>
    </div>

</nav>

<!-- 这是现实的主体部分 -->
<g:layoutBody/>

<!-- 这里是页脚部分 -->
<div class="footer row" role="contentinfo">
    <div class="col">
        <a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">
            <asset:image src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("main")?.logo}" alt="中国石油大学"
                         class="float-left"/>
        </a>
        <strong class="centered"><a href="${cn.edu.cup.common.Caption.findByName("main")?.href}"
                                    target="_blank">${cn.edu.cup.common.Caption.findByName("main")?.title}</a></strong>

        <p>${cn.edu.cup.common.Caption.findByName("main")?.description}</p>

    </div>

    <div class="col">
        <a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">
            <asset:image src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("微信")?.logo}" alt="Grails Documentation"
                         class="float-left"/>
        </a>
        <strong class="centered"><a href="${cn.edu.cup.common.Caption.findByName("main")?.href}"
                                    target="_blank">Documentation</a></strong>

        <p>${cn.edu.cup.common.Caption.findByName("微信")?.description}</p>

    </div>

    <div class="col">
        <a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">
            <asset:image src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("微博")?.logo}" alt="Grails Slack"
                         class="float-left"/>
        </a>
        <strong class="centered"><a href="${cn.edu.cup.common.Caption.findByName("main")?.href}"
                                    target="_blank">${cn.edu.cup.common.Caption.findByName("微博")?.title}</a></strong>

        <p>${cn.edu.cup.common.Caption.findByName("微博")?.description}</p>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
