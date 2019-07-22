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
<#--官方网站：http://leetcode.com/LeetCode 是一个美国的在线编程网站，上面主要收集了各大IT公司的笔试面试题，对于找工作是一个不可多得的好帮手。LeetCode上面的题目偏基础性...-->

<div id="article-list">
    <#list articles as article>
        <div id="article-list">
            <div class="recent-post-item">
                <#if article.articlePutTop>
                    <i class="article-top"></i>
                </#if>
                <a class="post-title" href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
                <div class="container">
                    <time class="button-hover post-date"><i class="fas fa-calendar-alt article-icon"
                                                            aria-hidden="true"></i> 更新于
                        ${article.articleUpdateDate?string("yyyy-MM-dd")}
                    </time>
                    <#list article.articleTags?split(",") as articleTag>
                        <div class="button-hover categories"><i class="fa fa-tag article-icon" aria-hidden="true"></i><a
                                    class="link-a" href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
                        </div>
                    </#list>

                </div>
                <div class="post-content">
                    <div class="main-content content"><p>${article.articleAbstractText}</p></div>
                </div>
                <a class="button-hover more" href="${servePath}${article.articlePermalink}">阅读全文</a></div>
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