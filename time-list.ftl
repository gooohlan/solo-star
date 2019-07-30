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

<div id="tag">
    <#assign year = "999">
    <#list articles as article>
        <#if year != article.articleUpdateDate?string("yyyy")>
            <#assign year = article.articleUpdateDate?string("yyyy")>
            <div class="article-sort-item year">${year}</div>
        </#if>
        <div class="article-sort-item">
            <time class="article-time">${article.articleUpdateDate?string("yyyy-MM-dd")}</time>
            <a class="article-link" href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
        </div>
    </#list>
</div>
<#if 0 != paginationPageCount>
    <div id="pagination">
        <div class="pagination">
            <#if 1 != paginationPageNums?first>
                <a class="extend prev" rel="prev" href="${servePath}${path}?p=${paginationPreviousPageNum}">
                    <i class="fas fa-angle-left"></i>
                </a>
                <a class="page-number" href="${servePath}${path}">1</a>
                <span class="space">…</span>
            </#if>
            <#list paginationPageNums as paginationPageNum>
                <#if paginationPageNum == paginationCurrentPageNum>
                    <span class="page-number current">${paginationPageNum}</span>
                <#else>
                    <a class="page-number"
                       href="${servePath}${path}?p=${paginationPageNum}">${paginationPageNum}</a>
                </#if>
            </#list>
            <#if paginationPageNums?last != paginationPageCount>
                <span class="space">…</span>
                <a href="${servePath}${path}?p=${paginationPageCount}"
                   class="page-number">${paginationPageCount}</a>
                <a class="extend next" rel="next" href="${servePath}${path}?p=${paginationNextPageNum}">
                    <i class="fas fa-angle-right"></i>
                </a>
            </#if>
        </div>
    </div>
</#if>