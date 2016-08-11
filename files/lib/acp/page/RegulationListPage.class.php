<?php
namespace wcf\acp\page;

use wcf\data\regulation\RegulationList;
use wcf\page\SortablePage;

class RegulationListPage extends SortablePage
{
    public $activeMenuItem = 'wcf.acp.menu.link.clan.settings.regulation.list';

	public $defaultSortField = 'regulationID';

	public $neededPermissions = ['admin.clan.regulation.canManageRegulations'];

	public $objectListClassName = RegulationList::class;

	public $templateName = 'regulationList';

	public $validSortFields = ['regulationID', 'identifier', 'name', 'categoryID', 'sortOrder'];
}