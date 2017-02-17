package etaminstudio.core.definitions 
{
/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class ConfigLanguageVO 
{
	
	public var languagesVec:Array<LanguageVO>;
	public var selectedLanguage:Int;
	
	public function new(languagesVec:Array<LanguageVO>, selectedLanguage:Int)
	{
		this.languagesVec = languagesVec;
		this.selectedLanguage = selectedLanguage;
	}
	
}