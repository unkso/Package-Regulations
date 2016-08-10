<?php
namespace wcf\acp\form;

class RegulationEditForm extends RegulationAddForm
{
    protected $requiresValidObject = true;

    protected $modelAction = 'update';

    protected $templateAction = 'edit';
}