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
<header>
    <div class="header">

        <div class="title"><a href="${servePath}" class="hoverLeft" rel="start">${blogTitle}</a></div>
        <div class="link">
            <#list pageNavigations as page>
                <a href="${page.pagePermalink}" class=" hoverMiddle" target="${page.pageOpenTarget}" rel="section">
                    <#if page.pageIcon != ''></#if>${page.pageTitle}
                </a>
            </#list>
            <a href="https://88250.b3log.org/search" class="search hoverMiddle">
                搜索
            </a>
        </div>

    </div>
</header>