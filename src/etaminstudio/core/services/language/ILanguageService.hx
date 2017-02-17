package etaminstudio.core.services.language 
{

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */


interface ILanguageService
{
	function changeLanguage(locale:String):Void;
	function getLanguageData(path:String):Void;
}