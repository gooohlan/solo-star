
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