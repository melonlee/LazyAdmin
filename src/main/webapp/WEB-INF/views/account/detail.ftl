<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
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
            <div class="block-area" id="horizontal">
                <form class="form-horizontal" role="form" action="modify" method="post">
                    <input type="hidden" name="id" value="<#if (admin.id)??>${admin.id}</#if>">
                    <div class="form-group">
                        <label for="inputName1" class="col-md-2 control-label">账户名</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control input-sm" name="username"
                                   placeholder="例如:admin" value="<#if (admin.username)??>${admin.username}</#if>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputName1" class="col-md-2 control-label">账户密码</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control input-sm" name="password"
                                   placeholder="例如:123456" value="<#if (admin.password)??>${admin.password}</#if>">
                        </div>
                    </div>

                    <div class=" form-group">
                        <label for="inputName1" class="col-md-2 control-label">账户角色</label>
                        <div class="col-md-10">
                        <#list roles as role>
                            <label class="checkbox-inline">
                                <input type="checkbox" checked="checked" value="${role.id}"
                                       name="roles">
                            ${role.description}
                            </label>
                        </#list>
                        </div>
                    </div>

                    <br/>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <button type="submit" class="btn btn-info btn-sm m-t-5">提交</button>
                            <button type="button" onclick="javascript:window.history.back()"
                                    class="btn btn-sm m-t-5">取消
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</section>
<#include "../common/js.ftl">
</body>
</html>