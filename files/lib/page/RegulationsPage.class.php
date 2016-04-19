<?php namespace wcf\page;

class RegulationsPage extends AbstractPage
{
    public $activeMenuItem = 'wcf.page.training.regulations';

    public $templateName = 'regulationList';

    public function assignVariables() {
        parent::assignVariables();

        //WCF::getTPL()->assign(array(
        //    'awards' => Award::getAllAwards()
        //));
    }
}

