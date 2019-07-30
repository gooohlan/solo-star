<#include "../../common-template/macro-common_head.ftl">
<#include "macro-comments.ftl">
<#include "../../common-template/macro-comment_script.ftl">
<!DOCTYPE html>
<html>
<head>
    <@head title="${article.articleTitle} - ${blogTitle}" description="${article.articleAbstract?html}">
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
    </@head>
</head>
<body>
<div id="MathJax_Message" style="display: none;"></div>
<canvas id="universe"></canvas>
<#include "side.ftl">
<script>
    console.log( ${article})
</script>
<div id="main-container">
    <#include "header.ftl">
    <div id="content-outer">
        <div id="content-inner">
            <div id="recent-posts">

                <div class="main" id="pjax">
                    <#if pjax><!---- pjax {#pjax} start ----></#if>
                    <div class="content">
                        <article id="post">
                            <div>
                                ${article.articleTitle}
                            </div>
                            发表于:
                            ${article.articleCreateDate?string("yyyy-MM-dd")}|更新于${article.articleCreateDate?string("yyyy-MM-dd")}
                            <#list article.articleTags?split(",") as articleTag>
                                <div class="button-hover categories"><i class="fa fa-tag article-icon" aria-hidden="true"></i><a
                                            class="link-a" href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
                                </div>
                            </#list>
                            ${article.articleContent}
                            <#if "" != article.articleSign.signHTML?trim>
                                <div>
                                    ${article.articleSign.signHTML}
                                </div>
                            </#if>
                            <div class="post-nav fn-clear">
                                <#if previousArticlePermalink??>
                                    <div class="post-nav-prev post-nav-item fn-right">
                                        <a href="${servePath}${previousArticlePermalink}" rel="prev" title="${previousArticleTitle}">
                                            ${previousArticleTitle} >
                                        </a>
                                    </div>
                                </#if>
                                <#if nextArticlePermalink??>
                                    <div class="post-nav-next post-nav-item fn-left">
                                        <a href="${servePath}${nextArticlePermalink}" rel="next" title="${nextArticleTitle}">
                                            < ${nextArticleTitle}
                                        </a>
                                    </div>
                                </#if>
                            </div>
                        </article>
                    </div>
                    <#if pjax><!---- pjax {#pjax} end ----></#if>
                </div>
            </div>
        </div>
    </div>

    <div class="button-hover" id="return-top" style="opacity: 1; display: block;"><i class="fas fa-arrow-up"
                                                                                     aria-hidden="true"></i></div>
    <#include "footer.ftl">
</div>

</body>
</html>