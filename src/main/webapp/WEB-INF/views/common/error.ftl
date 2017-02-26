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
    <link href="<@spring.url '/static/css/style.css'/>" rel="stylesheet">
    <link href="<@spring.url '/static/css/generics.css'/>" rel="stylesheet">
</head>
<body id="skin-blur-violate">
<section id="error-page" class="tile">
    <h1 class="m-b-10">ERROR</h1>
    <p>${exception}</p>
    <a class="underline" href="javascript:window.history.back();">返回上一步</a> or <a class="underline" href="../video/all">首页</a>
</section>

</body>
</html>