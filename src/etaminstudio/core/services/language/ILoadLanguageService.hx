package etaminstud.core.services.language 
{
import com.etamin.core.services.language.helpers.ILoadLanguageParser;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */


interface ILoadLanguageService
{
	function getData(path:String):Void;
	
	function set parser(value:ILoadLanguageParser):Void;
}