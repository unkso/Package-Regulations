<?php namespace wcf\data\regulation;

use wcf\system\cache\builder\CategoryCacheBuilder;
use wcf\system\cache\builder\RegulationCacheBuilder;
use wcf\system\SingletonFactory;

class RegulationCache extends SingletonFactory
{
    protected $regulations = [];

    protected $categories = [];

    protected function init()
    {
        $this->regulations = RegulationCacheBuilder::getInstance()->getData();
        $this->categories = CategoryCacheBuilder::getInstance()->getData([], 'categories');

        $this->categories = array_filter($this->categories, function ($category) {
            return $category->objectType == 'com.clanunknownsoldiers.regulation.category';
        });
    }

    public function getRegulations()
    {
        return $this->regulations;
    }

    public function getCategories()
    {
        return $this->categories;
    }
}