<#include "../../common-template/macro-common_head.ftl">
<!DOCTYPE html>
<html>
<head>
    <@head title="${articleLabel} - ${blogTitle}">
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/fa.css?${staticResourceVersion}"/>
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/jquery.mCustomScrollbar.min.css?${staticResourceVersion}"/>
    </@head>
</head>
<body>
<div id="MathJax_Message" style="display: none;"></div>
<canvas id="universe"></canvas>
<#include "side.ftl">

<div id="main-container">
    <#include "header.ftl">
    <div id="content-outer">
        <div id="content-inner">
            <div id="recent-posts">

                <div class="main" id="pjax">
                    <#if pjax><!---- pjax {#pjax} start ----></#if>
                    <div class="content">
                        <h1 class="article-sort-item title">${articleLabel} - ${statistic.statisticPublishedBlogArticleCount}</h1>
<#--                        <#include "abc-list.ftl">-->
<#--                        ${articles}-->
                        <#list articles as article>
                            1111
                        </#list>
                    </div>
                    <#--    <#include "side.ftl">-->
                    <#if pjax><!---- pjax {#pjax} end ----></#if>
                </div>
            </div>
        </div>
    </div>

    <div class="button-hover" id="return-top" style="opacity: 1; display: block;"><i class="fas fa-arrow-up" aria-hidden="true"></i></div>
    <#include "footer.ftl">
</div>

</body>
</html>