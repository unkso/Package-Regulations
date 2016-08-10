<?php namespace wcf\page;

use wcf\data\regulation\RegulationCache;
use wcf\system\WCF;

class RegulationListPage extends AbstractPage
{
    public $activeMenuItem = 'wcf.page.training.regulations';

    public $templateName = 'regulationList';

    public function assignVariables() {
        parent::assignVariables();

        $cache = RegulationCache::getInstance();

        $map = [];
        foreach ($cache->getCategories() as $category) {
            $map[$category->categoryID] = [
                'title' => $category->getTitle(),
                'regs' => [],
            ];
        }

        foreach ($cache->getRegulations() as $regulation) {
            $map[$regulation->categoryID]['regs'][] = $regulation;
        }

        WCF::getTPL()->assign(array(
            'regulations' => $map,
        ));
    }
}

