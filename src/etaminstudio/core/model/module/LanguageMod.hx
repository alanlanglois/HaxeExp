package etaminstudio.core.model.module;

import etaminstudio.core.definitions.LanguageVO;
import openfl.net.SharedObject;
import openfl.system.Capabilities;
import openfl.utils.Dictionary;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class LanguageMod 
{
	static public var isReady:Bool;
	
	static private var sSo:SharedObject;
	static private var sLanguagesDic:Dictionary<Dynamic,Dynamic>;
	static private var sIsInitialized:Bool;
	static private var sLanguagesVec:Array<LanguageVO>;
	static private var sLanguageSelected:Int;
	static private var sLanguageDic:Dictionary<Dynamic,Dynamic>;
	
	public static function initialize(so:SharedObject):Void
	{
		//trace("[LanguageMod]:Initialize");
		sSo=so;
		sLanguagesDic=new Dictionary();
		sLanguagesVec=new Array<LanguageVO>();
		sIsInitialized=true;
	}
	
	
	public static function addLanguage(name:String, abbr:String):Void
	{
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");
		//trace("[LanguageMod]:Add Language");
		sLanguagesVec.push(new LanguageVO(name, abbr));
		sLanguagesDic[ abbr ]=sLanguagesVec.length - 1;
	}
	
	
	public static function saveLanguage(abbr:String):Void {
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");
		//trace("[LanguageMod]:Save Language");
		sLanguageSelected=sLanguagesDic[ abbr ];
		sSo.data.language=sLanguageSelected;
		sSo.flush();
	}
	
	public static function setLanguageData(languageDic:Dictionary<Dynamic,Dynamic>):Void
	{
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");
		//trace("[LanguageMod]:set Language Data");
		sLanguageDic=null;
		sLanguageDic=languageDic;
		isReady=true;
	}
	
	
	public static function load():Void
	{
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");
		
		//trace("[LanguageMod]:Load");
		trace("sSo.data.language "  + sSo.data.language);
		if(sSo.data.language !=undefined){
			sLanguageSelected=(sSo.data.language<sLanguagesVec.length)? Std.int(sSo.data.language):0;
		}
		else {
			if(sLanguagesDic[ Capabilities.language ] !=undefined){
				saveLanguage(Capabilities.language);
			}
			else {
				saveLanguage(sLanguagesVec[0].abbr);
			}
		}
	}
	
	public static function getLanguages():Array<LanguageVO>
	{
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");
		
		//trace("[LanguageMod]:get Languages");
		return sLanguagesVec;
	}
	
	public static function getSelectedLanguageIndex():Int
	{
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");
		return sLanguageSelected;
	}
	
	public static function getLanguage():String
	{
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");

		//trace("[LanguageMod]:get Language");
		return sLanguagesVec[ sLanguageSelected ].abbr;
	}
	
	public static function getSectionLanguage(sectionName:String):Dictionary
	{
		if(!sIsInitialized)throw new Dynamic("[LanguageMod] error, the language has to be initialized first!");

		//trace("[LanguageMod]:get Section Language");
		
		var sectionLanguageDic:Dictionary=(sLanguageDic[ sectionName ]==null)? new Dictionary():sLanguageDic[ sectionName ];
		
		var dicGlobal:Dictionary=sLanguageDic["global"];
		if(dicGlobal !=null){
			for(i in dicGlobal){ 
				sectionLanguageDic[i]=dicGlobal[i];
			}
		}
		
		dicGlobal=null;
		
		return sectionLanguageDic;	
	}
}