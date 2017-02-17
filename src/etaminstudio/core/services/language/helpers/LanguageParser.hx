package etaminstud.core.services.language.helpers 
{
import etaminstud.utils.parsers.YAML;
import openfl.utils.Dictionary;
import openfl.utils.getTimer;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class LanguageParser implements ILanguageParser
{
	
	public function parseData(results:String):Dictionary
	{
		return YAML.decodeAsDictionary(results);
	}
	
}