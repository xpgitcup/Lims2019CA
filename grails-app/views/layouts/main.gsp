<!doctype html>
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

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <!--这是左边的图标，固定内容-->
    <a class="navbar-brand" href="/#"><asset:image src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("main")?.logo}" alt="程序Logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- 这是右边的菜单，几个按钮，点击后下来菜单-->
    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <!-- 这一句指导页面将内容插入到这里 -->
            <g:pageProperty name="page.nav"/>
        </ul>
    </div>

</nav>

<!-- 这是现实的主体部分 -->
<g:layoutBody/>

<!-- 这里是也叫部分 -->
<div class="footer row" role="contentinfo">
    <div class="col">
        <a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">
            <asset:image src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("main")?.logo}" alt="中国石油大学" class="float-left"/>
        </a>
        <strong class="centered"><a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">${cn.edu.cup.common.Caption.findByName("main")?.title}</a></strong>
        <p>${cn.edu.cup.common.Caption.findByName("main")?.description}</p>

    </div>
    <div class="col">
        <a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">
            <asset:image src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("微信")?.logo}" alt="Grails Documentation" class="float-left"/>
        </a>
        <strong class="centered"><a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">Documentation</a></strong>
        <p>${cn.edu.cup.common.Caption.findByName("微信")?.description}</p>

    </div>

    <div class="col">
        <a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">
            <asset:image src="cn/edu/cup/${cn.edu.cup.common.Caption.findByName("微博")?.logo}" alt="Grails Slack" class="float-left"/>
        </a>
        <strong class="centered"><a href="${cn.edu.cup.common.Caption.findByName("main")?.href}" target="_blank">${cn.edu.cup.common.Caption.findByName("微博")?.title}</a></strong>
        <p>${cn.edu.cup.common.Caption.findByName("微博")?.description}</p>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
