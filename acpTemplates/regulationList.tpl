{include file='header' pageTitle='wcf.acp.regulation.action.list'}

<header class="boxHeadline">
    <h1>{lang}wcf.acp.regulation.action.list{/lang}</h1>

    <script data-relocate="true">
        //<![CDATA[
        $(function() {
            new WCF.Action.Delete('wcf\\data\\regulation\\action\\RegulationAction', '.jsAwardActionRow .jsDeleteButton');
        });
        //]]>
    </script>

</header>

<div class="contentNavigation">
    {pages print=true assign=pagesLinks controller="RegulationList" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}

    <nav>
        <ul>
            <li><a href="{link controller='RegulationAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.regulation.action.add{/lang}</span></a></li>

            {event name='contentNavigationButtonsTop'}
        </ul>
    </nav>
</div>

{if $objects|count}
    <div class="tabularBox tabularBoxTitle marginTop">
        <header>
            <h2>{lang}wcf.acp.regulation.action.list{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
        </header>

        <table class="table">
            <thead>
            <tr>
                <th class="columnID{if $sortField == 'regulationID'} active {@$sortOrder}{/if}" colspan="2"><a href="{link controller='RegulationList'}pageNo={@$pageNo}&sortField=regulationID&sortOrder={if $sortField == 'regulationID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.objectID{/lang}</a></th>
                <th class="columnTitle{if $sortField == 'name'} active {@$sortOrder}{/if}"><a href="{link controller='RegulationList'}pageNo={@$pageNo}&sortField=name&sortOrder={if $sortField == 'name' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.regulation.action.name{/lang}</a></th>
                <th class="columnIdentifier{if $sortField == 'identifier'} active {@$sortOrder}{/if}"><a href="{link controller='RegulationList'}pageNo={@$pageNo}&sortField=identifier&sortOrder={if $sortField == 'identifier' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.regulation.action.identifier{/lang}</a></th>
                <th class="columnCategory{if $sortField == 'categoryID'} active {@$sortOrder}{/if}"><a href="{link controller='RegulationList'}pageNo={@$pageNo}&sortField=categoryID&sortOrder={if $sortField == 'categoryID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.regulation.action.category{/lang}</a></th>
                <th class="columnSortOrder{if $sortField == 'sortOrder'} active {@$sortOrder}{/if}"><a href="{link controller='RegulationList'}pageNo={@$pageNo}&sortField=sortOrder&sortOrder={if $sortField == 'sortOrder' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.regulation.action.sortOrder{/lang}</a></th>

                {event name='columnHeads'}
            </tr>
            </thead>

            <tbody>
            {foreach from=$objects item=regulation}
                <tr class="jsAwardActionRow">
                    <td class="columnIcon">
                        <a href="{link controller='RegulationEdit' id=$regulation->regulationID}{/link}" title="{lang}wcf.global.button.edit{/lang}" class="jsTooltip"><span class="icon icon16 icon-pencil"></span></a>
                        <span class="icon icon16 icon-remove jsDeleteButton jsTooltip pointer" title="{lang}wcf.global.button.delete{/lang}" data-object-id="{@$regulation->regulationID}" data-confirm-message="{lang}wcf.acp.clan.regulation.delete.sure{/lang}"></span>

                        {event name='rowButtons'}
                    </td>
                    <td class="columnID">{$regulation->regulationID}</td>
                    <td class="columnTitle">{$regulation->name}</td>
                    <td class="columnIdentifier">{$regulation->identifier}</td>
                    <td class="columnCategory">{$regulation->getCategory()->getTitle()}</td>
                    <td class="columnSortOrder">{#$regulation->sortOrder}</td>

                    {event name='columns'}
                </tr>
            {/foreach}
            </tbody>
        </table>

    </div>

    <div class="contentNavigation">
        {@$pagesLinks}

        <nav>
            <ul>
                <li><a href="{link controller='RegulationAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.regulation.action.add{/lang}</span></a></li>

                {event name='contentNavigationButtonsBottom'}
            </ul>
        </nav>
    </div>
{else}
    <p class="info">{lang}wcf.global.noItems{/lang}</p>
{/if}

{include file='footer'}
