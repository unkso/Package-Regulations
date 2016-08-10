<?php namespace wcf\data\regulation;

use wcf\data\category\Category;
use wcf\data\DatabaseObject;
use wcf\system\cache\builder\RegulationCacheBuilder;

class Regulation extends DatabaseObject
{
	protected static $databaseTableName = 'unkso_regulation';
	
	protected static $databaseTableIndexName = 'regulationID';

    protected static $cache = null;

    public function getCategory()
    {
        return new Category($this->categoryID);
    }

    protected static function getCache()
    {
        if (self::$cache === null) {
            self::$cache = RegulationCacheBuilder::getInstance()->getData();
        }

        return self::$cache;
    }

    public static function getByIdentifier($identifier)
    {
        $cache = self::getCache();

        if (isset($cache[$identifier])) {
            return $cache[$identifier];
        }

        return null;
    }
}
