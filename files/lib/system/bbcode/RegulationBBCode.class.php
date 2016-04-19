<?php namespace wcf\system\bbcode;

use wcf\util\StringUtil;

class RegulationBBCode extends AbstractBBCode 
{

	public function getParsedTag(array $openingTag, $content, array $closingTag, BBCodeParser $parser) 
	{
		$content = StringUtil::trim($content);
		
		$regulationText  = 'Regulation Test';
		$regulationTitle = '=US= Regulation '. $content;
		$regulationLink  = '#';

		// Regulation with name $content
		// Get permalink
		
		$html = <<<UNKNOWNSOLDIERS
<blockquote class="quoteBox container containerPadding quoteBoxSimple" cite="$regulationLink">
    <header>
        <h3>
            <a href="$regulationLink" target="_blank">$regulationTitle</a>
        </h3>
    </header>
    
    <div>
        $regulationText
    </div>
</blockquote>
UNKNOWNSOLDIERS;

		return $html;
	}
	
}
