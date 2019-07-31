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
<div id="sidebar">
    <div class="author-info">
        <aside class="sidebar">
            <#if article?? && article.articleToC?? && article.articleToC?size &gt; 0>
                <#include "../../common-template/toc.ftl"/>
            </#if>
            <section>
                <img class="site-author-image" src="${adminUser.userAvatar}" title="${userName}"/>
                <p class="site-author-name">${userName}</p>
                <#if "" != noticeBoard>
                    <p class="site-description motion-element">${blogSubtitle}</p>
                </#if>
                <div class="feed-link">
                    <a href="${servePath}/rss.xml" class="button-hover" rel="alternate">
                        RSS
                    </a>
                    <a href="${servePath}/tags.html" class="button-hover" rel="section">
                        标签
                    </a>
                    <a href="${servePath}/archives.html" class="button-hover">
                        存档
                    </a>
                </div>
                <div class="svg-list">
                    <#include "../../common-template/macro-user_site.ftl"/>
                    <@userSite dir=""></@userSite></div>
                <div class="links-of-author">
                    <#if isLoggedIn>
                        <span class="links-of-author-item">
                <a href="${servePath}/admin-index.do#main" title="${adminLabel}">
                    <i class="icon-setting"></i> ${adminLabel}
                </a>
            </span>

                        <span class="links-of-author-item">
                <a href="${logoutURL}">
                    <i class="icon-logout"></i> ${logoutLabel}
                </a>
            </span>
                    <#else>
                        <span class="links-of-author-item">
                <a href="${servePath}/start">
                    ${startToUseLabel}
                </a>
            </span>
                    </#if>
                </div>

                <#if 0 != links?size>
                    <div class="links-of-author">
                        <p class="site-author-name">友情链接</p>
                        <#list links as link>
                            <span class="links-of-author-item">
                <a rel="friend" href="${link.linkAddress}"
                   title="${link.linkDescription}" target="_blank">
                    ${link.linkTitle}
                </a>
            </span>
                        </#list>
                    </div>
                </#if>


                <#if noticeBoard??>
                    <div class="links-of-author">
                        ${noticeBoard}
                    </div>
                </#if>
            </section>
        </aside>
    </div>
</div>