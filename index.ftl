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
    </@head>
</head>
<body>
<div id="MathJax_Message" style="display: none;"></div>
<canvas id="universe"></canvas>
<body>
<#include "side.ftl">

<div id="main-container">
    <#include "header.ftl">
    <div id="content-outer">
        <div id="content-inner">
            <div id="recent-posts">

                ${statistic}
            </div>
            <div id="pagination">

            </div>
        </div>
    </div>
    <div class="button-hover" id="return-top"><i class="fas fa-arrow-up" aria-hidden="true"></i></div>
    <!-- 底部 -->
    <#include "footer.ftl">
</div>


<#--    <div class="left">-->

<#--    </div>-->
<#--    <div class="right">-->
<#--        <#include "header.ftl">-->
<#--        <div class="main" id="pjax">-->
<#--            <#if pjax><!---- pjax {#pjax} start --&ndash;&gt;</#if>-->
<#--            <div class="content" style="height: 5000px">-->
<#--                这是首页-->
<#--                <main>-->
<#--                </main>-->
<#--            </div>-->
<#--            &lt;#&ndash;    <#include "side.ftl">&ndash;&gt;-->
<#--            <#if pjax><!---- pjax {#pjax} end --&ndash;&gt;</#if>-->
<#--        </div>-->
<#--        <#include "footer.ftl">-->
<#--    </div>-->


</body>
</html>