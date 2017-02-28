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
        <h2 class="page-title">角色管理</h2>
        <hr class="whiter">
        <div class="block-area">
            <div class="block-area" id="horizontal">
                <h3 class="block-title">角色信息编辑</h3>
                <form class="form-horizontal" role="form" action="modify" method="post">
                    <input type="hidden" name="id" value="<#if (role.id)??>${role.id}</#if>">
                    <div class="form-group">
                        <label for="inputName1" class="col-md-2 control-label">角色名</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control input-sm" name="role"
                                   placeholder="例如:admin" value="<#if (role.role)??>${role.role}</#if>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputName1" class="col-md-2 control-label">角色描述</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control input-sm" name="description"
                                   placeholder="例如:系统管理员" value="<#if (role.description)??>${role.description}</#if>">
                        </div>
                    </div>
                    <div class=" form-group">
                        <label for="inputName1" class="col-md-2 control-label">角色权限</label>
                        <div class="col-md-10">

                        <#list permissions as permission>
                            <label class="checkbox-inline">
                                <input type="checkbox" <#if permission.selected==1>
                                       checked="checked"
                                </#if>
                                       value="${permission.id}"
                                       name="permissions">
                            ${permission.description}
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