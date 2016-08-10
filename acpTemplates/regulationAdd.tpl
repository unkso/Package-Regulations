{include file='header' pageTitle='wcf.acp.regulation.action.'|concat:$action}

<script data-relocate="true">
	//<![CDATA[
	$(function() {
		WCF.TabMenu.init();
	});
	//]]>
</script>

<header class="boxHeadline">
	<h1>{lang}wcf.acp.regulation.action.{$action}{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
	<p class="success">{lang}wcf.global.success.{$action}{/lang}</p>
{/if}

<div class="contentNavigation">
	<nav>
		<ul>
			<li><a href="{link controller='RegulationList'}{/link}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.acp.menu.link.clan.regulation.list{/lang}</span></a></li>

			{event name='contentNavigationButtons'}
		</ul>
	</nav>
</div>

<form method="post" action="{if $action == 'add'}{link controller='RegulationAdd'}{/link}{else}{link controller='RegulationEdit' id=$primaryID}{/link}{/if}">
	<div class="container containerPadding marginTop">
		<fieldset>
			<legend>{lang}wcf.acp.regulation.action.general{/lang}</legend>
			<dl>
				<dt><label for="regulationName">{lang}wcf.acp.regulation.action.name{/lang}</label></dt>
				<dd>
					<input id="regulationName" name="name" value="{$object->name|or:''}" type="text" class="medium" />
					{if $errorField == 'name'}
						<small class="innerError">
							{lang}wcf.global.form.error.{$errorType}{/lang}
						</small>
					{/if}
				</dd>
			</dl>
			<dl>
				<dt><label for="regulationIdentifier">{lang}wcf.acp.regulation.action.identifier{/lang}</label></dt>
				<dd>
					<input id="regulationIdentifier" name="identifier" value="{$object->identifier|or:''}" type="text" class="medium" />
					{if $errorField == 'identifier'}
						<small class="innerError">
							{lang}wcf.global.form.error.{$errorType}{/lang}
						</small>
					{/if}
				</dd>
			</dl>
			<dl>
				<dt><label for="regulationCategory">{lang}wcf.acp.regulation.action.category{/lang}</label></dt>
				<dd>
					<select name="categoryID" id="regulationCategory">
						{assign var=selectedCategory value=$object->categoryID}
						{foreach from=$categoryList item=category}
							<option value="{@$category->categoryID}"{if $category->categoryID == $selectedCategory} selected="selected"{/if}>{$category->title}</option>
						{/foreach}
					</select>
					{if $errorField == 'categoryID'}
						<small class="innerError">
							{lang}wcf.global.form.error.{$errorType}{/lang}
						</small>
					{/if}
				</dd>
			</dl>
			<dl>
				<dt><label for="regulationDescription">{lang}wcf.acp.regulation.action.description{/lang}</label></dt>
				<dd>
					<textarea id="regulationDescription" name="description" cols="40" rows="5">{$object->description|or:''}</textarea>
					{if $errorField == 'description'}
						<small class="innerError">
							{lang}wcf.global.form.error.{$errorType}{/lang}
						</small>
					{/if}
				</dd>
			</dl>
			<dl>
				<dt><label for="sortOrder">{lang}wcf.acp.regulation.action.relevance{/lang}</label></dt>
				<dd>
					<input type="number" id="sortOrder" name="sortOrder" value="{$object->sortOrder|or:1}" class="tiny" min="0" />
					{if $errorField == 'sortOrder'}
						<small class="innerError">
							{lang}wcf.global.form.error.{$errorType}{/lang}
						</small>
					{/if}
				</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd>
					{assign var=disabled value=$object->isDisabled|or:'0'}
					<label><input type="checkbox" name="isDisabled" value="1"{if $disabled} checked="checked"{/if} /> {lang}wcf.acp.regulation.action.isDisabled{/lang}</label>
					{if $errorField == 'isDisabled'}
						<small class="innerError">
							{lang}wcf.global.form.error.{$errorType}{/lang}
						</small>
					{/if}
				</dd>
			</dl>
		</fieldset>

		<div class="formSubmit">
			<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
			{@SECURITY_TOKEN_INPUT_TAG}
		</div>

		{event name='fieldsets'}
	</div>
</form>

{include file='footer'}