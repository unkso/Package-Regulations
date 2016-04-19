<?php namespace wcf\system\cache\builder;

use wcf\data\regulation\Regulation;
use wcf\system\WCF;

class RegulationCacheBuilder extends AbstractCacheBuilder
{
    protected function rebuild(array $parameters)
    {
        $data = [
            'regulations' => []
        ];

        $sql = sprintf("SELECT * FROM wcf%s_%s ORDER BY displayOrder", WCF_N, Regulation::getDatabaseTableName());
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();

        while ($object = $statement->fetchObject('wcf\data\regulation\Regulation')) {
            $data['regulations'][$object->identifier][$object->regulationID] = $object;
        }

        return $data;
    }
}