<?php namespace wcf\data\regulation;

use wcf\data\DatabaseObjectEditor;
use wcf\data\IEditableCachedObject;
use wcf\system\cache\builder\RegulationCacheBuilder;

class RegulationEditor extends DatabaseObjectEditor implements IEditableCachedObject
{
    protected static $baseClass = 'wcf\data\regulation\Regulation';

    public static function resetCache()
    {
        RegulationCacheBuilder::getInstance()->reset();
    }
}