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
        <h2 class="page-title">权限管理</h2>
        <hr class="whiter">
        <div class="block-area">
        <@shiro.hasPermission name="permission:create">
            <h2 class="block-title">
                <a id="modal" data-toggle="modal" href="#permission_info">+新增权限</a>
            </h2>
            <hr class="whiter">
            <br/><br/>
        </@shiro.hasPermission>
            <div class="row">
            <#if permissions?exists>
                <div class="table-responsive overflow">
                    <table class="table table-bordered table-hover tile">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>权限描述</th>
                            <th>权限代码</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list permissions as permission >
                            <tr>
                                <td>${permission.id}</td>
                                <td>${permission.description}</td>
                                <td>${permission.permission}</td>
                                <td>${permission.createdate}</td>
                                <td>
                                    <@shiro.hasPermission name="permission:modify">
                                        <a class="modify" href="#"><span class="icon">&#61952;</span></a>
                                        &nbsp;&nbsp;&nbsp;
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="permission:delete">
                                        <a href="delete?id=${permission.id}"><span
                                                class="icon">&#61918;</span></a>
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
<div class="modal fade" id="permission_info" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">编辑权限</h4>
            </div>
            <div class="modal-body">
                <div class="block-area" id="horizontal">
                    <form class="form-horizontal" role="form" method="post" action="modify">

                        <input type="hidden" name="id" id="id">

                        <div class="form-group">
                            <label for="inputName1" class="col-md-2 control-label">权限代码</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control input-sm" id="permission"
                                       placeholder="例如:user:create" name="permission">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail1" class="col-md-2 control-label">权限描述</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control input-sm" id="description"
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
<script type="text/javascript">
    $(".modify").click(function () {
        var $tds = $(this).parents('tr').find('td');
        $("#id").val($tds.eq(0).text());
        $("#description").val($tds.eq(1).text());
        $("#permission").val($tds.eq(2).text());
        $("#modal").click();
    });
</script>
</body>
</html>