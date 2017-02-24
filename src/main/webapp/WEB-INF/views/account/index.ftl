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
        <h2 class="page-title">账户管理</h2>
        <hr class="whiter">
        <div class="block-area">
            <h2>
                <a href="create" class="btn btn-sm">+新增账户</a>
            </h2>
            <hr class="whiter">
            <br/><br/>
            <div class="row">
            <#if admins?exists>
                <div class="table-responsive overflow">
                    <table class="table table-bordered table-hover tile">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>账户名称</th>
                            <th>账户角色</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list admins as admin >
                            <tr>
                                <td>${admin.id}</td>
                                <td>${admin.username}</td>
                                <td>${admin.id}</td>
                                <td>${admin.id}</td>
                                <td><a href="${admin.id}"><span class="icon">&#61952;</span></a>
                                    &nbsp;&nbsp;&nbsp;<a href="delete?id=${admin.id}"><span
                                            class="icon">&#61918;</span></a>
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