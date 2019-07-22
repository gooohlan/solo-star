<#include "../../common-template/macro-common_head.ftl">
<!DOCTYPE html>
<html>
<head>
    <@head title="${allTagsLabel} - ${blogTitle}">
        <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
    </@head>
</head>
<body>
${topBarReplacement}
<#include "header.ftl">
<div class="body">
    <div class="wrapper">
        <div class="main">
            <ul id="tags" class="tags">
                <#list tags as tag>
                    <li>
                        <a rel="tag" data-count="${tag.tagPublishedRefCount}"
                           href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}" title="${tag.tagTitle}">
                            <span>${tag.tagTitle}</span>
                            (<b>${tag.tagPublishedRefCount}</b>)
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
        <#include "side.ftl">
        <div class="clear"></div>
    </div>
</div>
<#include "footer.ftl">
<script type="text/javascript">
    Util.buildTags();
</script>
</body>
</html>