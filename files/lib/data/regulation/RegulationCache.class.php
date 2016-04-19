<?php namespace wcf\data\regulation;

use wcf\system\cache\builder\RegulationCacheBuilder;
use wcf\system\SingletonFactory;

class RegulationCache extends SingletonFactory
{
    protected $cachedRegulations = [];

    protected function init()
    {
        $this->cachedRanks = RegulationCacheBuilder::getInstance()->getData(array(), 'regulations');
    }

    public function getRegulations()
    {
        return $this->cachedRegulations;
    }
}