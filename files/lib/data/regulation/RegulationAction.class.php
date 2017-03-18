<?php namespace wcf\data\regulation;

use wcf\data\AbstractDatabaseObjectAction;
use wcf\data\IToggleAction;

class RegulationAction extends AbstractDatabaseObjectAction implements IToggleAction
{
    protected $className = RegulationEditor::class;

    protected $permissionsDelete = ['admin.clan.regulation.canManageRegulations'];

    protected $permissionsUpdate = ['admin.clan.regulation.canManageRegulations'];

    protected $requireACP = ['delete', 'toggle', 'update', 'create'];

    public function toggle()
    {
        foreach ($this->objects as $regulation) {
            $regulation->update([
                'isHidden' => $regulation->isHidden ? 0 : 1,
            ]);
        }
    }

    public function validateToggle()
    {
        parent::validateUpdate();
    }
}