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
                <a data-toggle="modal" href="#modalDefault" class="btn btn-sm">+新增账户</a>
            </h2>
            <hr class="whiter">
            <br/><br/>
            <div class="block-area" id="horizontal">

                <form class="form-horizontal" role="form" action="modify" method="post">
                    <input type="hidden" name="id" value="<#if (admin.id)??>${admin.id}</#if>">
                    <div class="form-group">
                        <label for="inputName1" class="col-md-2 control-label">账户名</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control input-sm" name="role"
                                   placeholder="例如:admin" value="<#if (admin.username)??>${admin.username}</#if>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputName1" class="col-md-2 control-label">账户密码</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control input-sm" name="role"
                                   placeholder="例如:admin" value="<#if (admin.password)??>${admin.password}</#if>">
                        </div>
                    </div>

                    <div class=" form-group">
                        <label for="inputName1" class="col-md-2 control-label">账户角色</label>
                        <div class="col-md-10">
                        <#list roles as role>
                            <label class="checkbox-inline">
                                <input type="checkbox" checked="checked" value="${role.id}"
                                       name="permissions">
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

<!-- Modal Default -->
<div class="modal fade" id="modalDefault" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">编辑权限</h4>
            </div>
            <div class="modal-body">
                <div class="block-area" id="horizontal">
                    <form class="form-horizontal" role="form" method="post" action="modify">

                        <input type="hidden" name="id">

                        <div class="form-group">
                            <label for="inputName1" class="col-md-2 control-label">权限代码</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control input-sm"
                                       placeholder="例如:user:create" name="permission">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail1" class="col-md-2 control-label">权限描述</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control input-sm"
                                       placeholder="例如:新增用户" name="description">
                            </div>
                        </div>
                        <br/>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <button type="submit" class="btn  btn-sm m-t-30">提交</button>
                                <button type="button" class="btn btn-sm  m-t-30" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<#include "../common/js.ftl">
</body>
</html>