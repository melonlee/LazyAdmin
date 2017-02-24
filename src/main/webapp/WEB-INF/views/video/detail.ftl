<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
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

        <h2 class="page-title">视频中心</h2>

        <hr class="whiter">

        <div class="block-area" id="horizontal">
            <h3 class="block-title">视频信息编辑</h3>


            <form class="form-horizontal" role="form" action="modify.html" method="post">


            <#if (video.id)??>
                <input type="hidden" value="${video.id}" name="id">
            </#if>
                <div class="form-group">
                    <label for="inputName1" class="col-md-2 control-label">视频标题</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control input-sm" value="${(video.title)!""}" name="title"
                               placeholder="...">
                    </div>
                </div>
                <br/>

            <#if (video.url)??>
                <div class="form-group">

                    <label for="inputName1" class="col-md-2 control-label"></label>
                    <div class="col-md-10">
                        <video controls width="400px" height="200px" id="multiCodec"
                               id="media" src="${video.url}"/>
                        </video>
                    </div>
                </div>
            </#if>

                <div class="form-group">
                    <label for="inputName1" class="col-md-2 control-label">CDN地址</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control input-sm" value="${(video.url)!""}" name="url"
                               placeholder="...">
                    </div>
                </div>

            <#--<br/>-->

            <#--<div class="form-group">-->
            <#--<label for="inputEmail1" class="col-md-2 control-label">视频文件</label>-->
            <#--<div class="col-md-10">-->

            <#--<div class="fileupload fileupload-new" data-provides="fileupload">-->
            <#--<span class="btn btn-file btn-sm btn-alt">-->
            <#--<span class="fileupload-new">选择视频文件</span>-->
            <#--<span class="fileupload-exists">更换文件</span>-->
            <#--<input type="file"/>-->
            <#--</span>-->
            <#--<span class="fileupload-preview"></span>-->
            <#--<a href="#" class="close close-pic fileupload-exists" data-dismiss="fileupload">-->
            <#--<i class="fa fa-times"></i>-->
            <#--</a>-->
            <#--</div>-->

            <#--</div>-->
            <#--</div>-->
                <br/>
                <div class="form-group">
                    <label for="inputMessage" class="col-md-2 control-label">视频描述</label>
                    <div class="col-md-10">
                            <textarea class="form-control auto-size input-sm" name="content"
                                      placeholder="...">${(video.content)!""}</textarea>
                    </div>
                </div>
                <br/> <br/>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <button type="submit" class="btn btn-info btn-sm m-t-5">提交</button>
                        <button type="button" onclick="javascript:window.history.back()" class="btn btn-sm m-t-5">取消
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </section>

<#include "../common/js.ftl">
    <!--  Form Related -->
    <script src="<@spring.url '/static/js/fileupload.min.js'/>"></script> <!-- File Upload -->
    <script src="<@spring.url '/static/js/autosize.min.js'/>"></script> <!-- Textare autosize -->
</body>
</html>