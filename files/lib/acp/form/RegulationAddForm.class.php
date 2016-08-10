<?php
namespace wcf\acp\form;

use wcf\data\category\CategoryNodeTree;
use wcf\data\regulation\Regulation;
use wcf\data\regulation\RegulationAction;
use wcf\form\FormBuilder;
use wcf\system\WCF;

class RegulationAddForm extends FormBuilder
{
    public $activeMenuItem = 'wcf.acp.menu.link.clan.settings.regulation.add';

    public $neededPermissions = ['admin.clan.regulation.canManageRegulations'];

    public function getAttributes()
    {
        return [
            'categoryID' => [
                'type' => 'int',
                'rule' => 'class:wcf\data\category\Category',
            ],
            'description' => [
                'type' => 'string',
                'required' => false,
            ],
            'name' => [
                'type' => 'string',
                'required' => false,
            ],
            'identifier' => 'string',
            'sortOrder' => 'int',
            'isDisabled' => [
                'type' => 'bool',
                'required' => false,
            ]
        ];
    }

    protected function getObjectActionType()
    {
        return RegulationAction::class;
    }

    protected function getObjectTypeName()
    {
        return Regulation::class;
    }

    public function assignVariables()
    {
        parent::assignVariables();

        $categoryNodeTree = new CategoryNodeTree('com.clanunknownsoldiers.regulation.category', 0, true);

        WCF::getTPL()->assign([
            'categoryList' => $categoryNodeTree->getIterator(),
        ]);
    }
}