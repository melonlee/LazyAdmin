<#import "/spring.ftl" as spring />
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <meta name="format-detection" content="telephone=no">
    <meta charset="UTF-8">
    <title>LazyAdmin</title>
    <!-- CSS -->
    <link href="<@spring.url '/static/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<@spring.url '/static/css/form.css'/>" rel="stylesheet">
    <link href="<@spring.url '/static/css/style.css'/>" rel="stylesheet">
    <link href="<@spring.url '/static/css/animate.css'/>" rel="stylesheet">
    <link href="<@spring.url '/static/css/generics.css'/>" rel="stylesheet">


</head>
<body id="skin-blur-violate">
<section id="login">
    <header>
        <h2>[LazyAdmin]</h2>
    </header>

    <div class="clearfix"></div>
    <!-- Login -->
    <form class="box tile animated active" id="box-login" method="post" action="login">
        <h2 class="m-t-0 m-b-15">Account</h2>
        <input type="text" class="login-control m-b-10" placeholder="UserName..." name="username">
        <input type="password" class="login-control" placeholder="Password..." name="password">
        <br/> <br/> <br/>
        <button type="submit" class="btn btn-sm m-r-5">Login</button>
    </form>

</section>

<!-- jQuery -->
<script src="<@spring.url '/static/js/jquery.min.js'/>"></script>
<!-- Bootstrap -->
<script src="<@spring.url '/static/js/bootstrap.min.js'/>"></script>
<!-- All JS functions -->
<script src="<@spring.url '/static/js/functions.js'/>"></script>
</body>
</html>

