<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html class="ie9">
<#include "../common/style.ftl">

<body id="skin-blur-violate">
<#include  "../common/header.ftl">
<div class="clearfix"></div>
<section id="main" class="p-relative" role="main">
    <!-- Sidebar -->
<#include "../common/sidebar.ftl">
    <!-- Content -->
    <section id="content" class="container">
        <!-- Messages Drawer -->
    <#include "../common/messages.ftl">
        <h2 class="page-title">角色管理</h2>
        <hr class="whiter">
        <div class="block-area">
        <@shiro.hasPermission name="role:create">
            <h2 class="block-title">
                <a href="create">+新增角色</a>
            </h2>
            <hr class="whiter">
            <br/><br/>
        </@shiro.hasPermission>
            <div class="row">
            <#if roles?exists>
                <div class="table-responsive overflow">
                    <table class="table table-bordered table-hover tile">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>角色描述</th>
                            <th>角色代码</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list roles as role >
                            <tr>
                                <td>${role.id}</td>
                                <td>${role.description}</td>
                                <td>${role.role}</td>
                                <td>${role.createdate}</td>
                                <td>
                                    <@shiro.hasPermission name="role:modify">
                                        <a href="${role.id}"><span class="icon">&#61952;</span></a>
                                    </@shiro.hasPermission>
                                    &nbsp;&nbsp;&nbsp;
                                    <@shiro.hasPermission name="role:delete">
                                        <a href="delete?id=${role.id}">
                                            <span class="icon">&#61918;</span></a>
                                    </@shiro.hasPermission>
                                </td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
            </#if>
            </div>
        </div>
    </section>
</section>
<#include "../common/js.ftl">
</body>
</html>