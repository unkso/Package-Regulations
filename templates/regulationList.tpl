{include file='documentHeader'}
<head>
    <title>{lang}wcf.page.regulations.title{/lang} - {PAGE_TITLE|language}</title>

    {include file='headInclude' sandbox=false}
</head>

<body id="tpl{$templateName|ucfirst}">
{include file='header'}

<header class="boxHeadline">
    <h1>{lang}wcf.page.regulations.title{/lang}</h1>
</header>

{include file='userNotice'}

<div class="container marginTop">
    <ul class="containerList awardList">
        <li class="awardBox">
            <div>
                <div class="containerHeadline">
                    <h3>Test</h3>
                    Regulations, Regulations! Regulations? Regulations.
                </div>
            </div>
        </li>
    </ul>
</div>

{include file='footer'}
</body>
</html>