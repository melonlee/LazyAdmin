<aside id="sidebar">

    <!-- Sidbar Widgets -->
    <div class="side-widgets overflow">
        <!-- Profile Menu -->
        <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
            <a href="" data-toggle="dropdown">
                <img class="profile-pic animated"
                     src="http://tva2.sinaimg.cn/crop.12.18.605.605.180/775c483fjw8f7t6x3xaglj20hs0l1go2.jpg" alt="">
            </a>
            <ul class="dropdown-menu profile-menu">
                <li><a href="">更改密码</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                <li><a href="../auth/logout">退出登录</a> <i class="icon left">&#61903;</i><i class="icon right">
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
        <li class="active">
            <a class="sa-side-home" href="dashboard.html">
                <span class="menu-item">视频管理</span>
            </a>
        </li>

        <li class="active">
            <a class="sa-side-home" href="dashboard.html">
                <span class="menu-item">账户管理</span>
            </a>
        </li>

        <li class="active">
            <a class="sa-side-home" href="dashboard.html">
                <span class="menu-item">角色管理</span>
            </a>
        </li>

        <li class="active">
            <a class="sa-side-home" href="dashboard.html">
                <span class="menu-item">权限管理</span>
            </a>
        </li>

        <li class="active">
            <a class="sa-side-home" href="dashboard.html">
                <span class="menu-item">视频中心</span>
            </a>
        </li>

        <li class="dropdown">
            <a class="sa-side-photos" href="">
                <span class="menu-item">系统管理</span>
            </a>
            <ul class="list-unstyled menu-item">
                <li><a href="#">11</a></li>
                <li><a href="#">22</a></li>
            </ul>
        </li>

    </ul>

</aside>