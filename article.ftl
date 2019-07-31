<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "../../common-template/macro-common_head.ftl">
<!DOCTYPE html>
<html>
<head>
    <@head title="${article.articleTitle} - ${blogTitle}" description="${article.articleAbstract?html}">
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/fa.css?${staticResourceVersion}"/>
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/jquery.mCustomScrollbar.min.css?${staticResourceVersion}"/>
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

<div id="main-container">
    <#include "header.ftl">
    <div id="content-outer">
        <div id="content-inner">
            <div id="recent-posts">

                <div class="main" id="pjax">
                    <#if pjax><!---- pjax {#pjax} start ----></#if>
                    <div class="content">
                        <article id="post">
                            <div class="post-header">
                                <div class="title">
                                    ${article.articleTitle}
                                </div>
                                <div class="container">
                                    <time class="button-hover post-date">
                                        <i class="fas fa-calendar-alt article-icon" aria-hidden="true"></i>
                                        发表于 ${article.articleCreateDate?string("yyyy-MM-dd")}
                                        |更新于 ${article.articleCreateDate?string("yyyy-MM-dd")}
                                    </time>
                                    <#list article.articleTags?split(",") as articleTag>
                                        <div class="button-hover categories"><i class="fa fa-tag article-icon"
                                                                                aria-hidden="true"></i><a
                                                    class="link-a"
                                                    href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
                                        </div>
                                    </#list>
                                </div>
                            </div>
                            <div class="main-content">
                                <div class="vditor-reset">
                                    ${article.articleContent}
                                    <#if "" != article.articleSign.signHTML?trim>
                                        <div>
                                            ${article.articleSign.signHTML}
                                        </div>
                                    </#if>
                                </div>
                            </div>
                        </article>
                    </div>


                    <div id="pagination">
                        <#if previousArticlePermalink??>
                            <div class="pull-right">
                                <span class="line line-top"></span>
                                <span class="line line-right"></span>
                                <span class="line line-bottom"></span>
                                <span class="line line-left"></span>
                                <a href="${servePath}${previousArticlePermalink}" rel="prev" title="${previousArticleTitle}">
                                    ${previousArticleTitle}
                                    <i class="fas fa-angle-right"></i>
                                </a>
                            </div>
                        </#if>
                        <#if nextArticlePermalink??>
                            <div class="pull-left">
                                <span class="line line-top"></span>
                                <span class="line line-right"></span>
                                <span class="line line-bottom"></span>
                                <span class="line line-left"></span>
                                <a href="${servePath}${nextArticlePermalink}" rel="next" title="${nextArticleTitle}">
                                    <i class="fas fa-angle-left"></i>
                                     ${nextArticleTitle}
                                </a>
                            </div>
                        </#if>
                    </div>
                    <#--    <#include "side.ftl">-->
                    <#if pjax><!---- pjax {#pjax} end ----></#if>
                </div>
            </div>
        </div>
    </div>

    <div class="button-hover" id="return-top" style="opacity: 1; display: block;"><i class="fas fa-arrow-up"
                                                                                     aria-hidden="true"></i></div>
    <#include "footer.ftl">
</div>
<script>
    $(".vditor-copy").find("span").children().replaceWith("<i class=\"fa fa-clipboard\" aria-hidden=\"true\"></i>")
    $(".vditor-copy").prepend("<span>code</span>")
    $("pre").find("code").each(function () {
        let str = $(this).attr("class")
        if (str != undefined && str.indexOf("language-") != -1) {
            $(this).prev().find("span").text(str.split("language-")[1])
        }
    })
</script>
</body>
</html>