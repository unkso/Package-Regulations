<?php namespace wcf\system\cache\builder;

use wcf\data\regulation\Regulation;
use wcf\system\WCF;

class RegulationCacheBuilder extends AbstractCacheBuilder
{
    protected function rebuild(array $parameters)
    {
        $data = [];

        $sql = sprintf("SELECT * FROM %s ORDER BY sortOrder", Regulation::getDatabaseTableName());
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();

        while ($object = $statement->fetchObject(Regulation::class)) {
            $data[$object->identifier] = $object;
        }

        return $data;
    }
}