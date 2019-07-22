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
    <@head title="${blogTitle}">
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/fa.css?${staticResourceVersion}"/>
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/jquery.mCustomScrollbar.min.css?${staticResourceVersion}"/>
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
                    <div id="content-inner">
                        <article id="page">
                            <div class="tag-cloud">
                                <div class="tag-cloud-title">标签</div>
                                <span class="tag-cloud-line">-</span><span class="tag-cloud-amount">${tags?size}</span>
                                <ul class="tag-cloud-tags tags" id="tags">
                                    <#list tags as tag>
                                        <li>
                                            <a rel="tag" data-count="${tag.tagPublishedRefCount}"
                                               href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}"
                                               title="${tag.tagTitle}">
                                                ${tag.tagTitle}(<b>${tag.tagPublishedRefCount}</b>)
                                            </a>
                                        </li>
                                    </#list>
                                </ul>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "footer.ftl">
    <script type="text/javascript">
        Util.buildTags();
    </script>
</div>

</body>
</html>