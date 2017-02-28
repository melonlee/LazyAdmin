<#import "/spring.ftl" as spring />
<aside id="sidebar">

    <!-- Sidbar Widgets -->
    <div class="side-widgets overflow">
        <!-- Profile Menu -->
        <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
            <a href="#" data-toggle="dropdown">
                <img class="profile-pic animated"
                     src="<@spring.url '/static/img/header.jpg'/>" alt="">
            </a>
            <ul class="dropdown-menu profile-menu">
                <li><a href="">更改密码</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                <li><a href="../logout">退出登录</a> <i class="icon left">&#61903;</i><i class="icon right">
                    &#61815;</i></li>
            </ul>
            <h4 class="m-0"><@shiro.principal/></h4>
        </div>

        <!-- Calendar -->
        <div class="s-widget m-b-25">
            <div id="sidebar-calendar"></div>
        </div>

    </div>

    <!-- Side Menu -->
    <ul class="list-unstyled side-menu">
    <@shiro.hasPermission name="video:view">
        <li class="dropdown">
            <a class="sa-side-photos" href="">
                <span class="menu-item">视频管理</span>
            </a>
            <ul class="list-unstyled menu-item">
                <li><a href="../video/create">新增视频</a></li>
                <li><a href="../video/all">视频列表</a></li>
            </ul>

        </li>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="admin:view">
        <li class="active">
            <a class="sa-side-photos" href="../admin/all">
                <span class="menu-item">账户管理</span>
            </a>
        </li>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="role:view">
        <li class="active">
            <a class="sa-side-widget" href="../role/all">
                <span class="menu-item">角色管理</span>
            </a>
        </li>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="permission:view">
        <li class="active">
            <a class="sa-side-table" href="../permission/all">
                <span class="menu-item">权限管理</span>
            </a>
        </li>
    </@shiro.hasPermission>

        <li class="dropdown">
            <a class="sa-side-photos" href="">
                <span class="menu-item">系统管理</span>
            </a>
            <ul class="list-unstyled menu-item">
                <li><a href="#">系统1</a></li>
                <li><a href="#">系统2</a></li>
            </ul>
        </li>
    </ul>

</aside>