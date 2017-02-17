package com.etamin.first.services.language;

import com.etamin.first.model.AppModel;
import etaminstud.core.model.SectionEngineModel;
import etaminstud.core.model.module.LanguageMod;
import etaminstud.core.services.language.ILanguageService;
import etaminstud.core.services.language.helpers.ILanguageParser;
import openfl.net.URLLoader;
import openfl.utils.Dictionary;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */

@:rtti
@:keepSub
class LanguageService implements ILanguageService 
{

	private var _parser:ILanguageParser;
	private var _loader:URLLoader;

	@inject	public var model:AppModel;
	@inject	public var sectionEngineModel:SectionEngineModel; 
	@inject	public function set parser(value:ILanguageParser):Void { _parser = value; }
	
	
	public function new() 
	{
		
	}
	
	/* INTERFACE etaminstud.core.services.language.ILanguageService */
	public function changeLanguage(locale:String):Void 
	{
		
	}
	
	public function getLanguageData(path:String):Void 
	{
		
	}
	
	public function LanguageService():void
	{
		
	}
	
	private function _onError( title:String, message:String, btnLabel:String, onClickCB:Function, isModal:Bool = false, clearSO:Bool = false ):Void 
	{
		trace( title, message, btnLabel, onClickCB, isModal );
	}
	
	public function changeLanguage( language:String ):Void
	{
		LanguageMod.saveLanguage( language );
		getLanguageData("data/language-"+ LanguageMod.getLanguage() +".yml");
		
		//var urlLoader:ServiceUrlLoader = new ServiceUrlLoader( _onLanguageSetted, _onError, model.changeSection );
		//var urlVar:EncodedVariables = new EncodedVariables( ServicesConstants.configService );
		//
		//urlVar.add("id", model.getLoginInfo().playerID);
		//urlVar.add("locale", language);	
		
		//ADD SHAREOBJ SAVE
		//urlLoader.addLoader( ServicesConstants.configService, urlVar );
		
	}
	
	public function getLanguageData( path:String ):Void
	{
		trace( "Loading language... "  + path );
		if ( _loader != null ) {
			_loader.close();
			_loader = null ;
		}
		
		_loader = new URLLoader();
		
		
		_loader.load( new URLRequest ( "app:/" + path ));
		var loadedSgnl:NativeSignal = new NativeSignal( _loader, Event.COMPLETE, Event);
		loadedSgnl.addOnce( _onLoaded );
	}
	
	private function _onLoaded( e:Event ):Void
	{
		trace( ">  Language loaded."  );
		var data:String = _loader.data;
		
		var languageDic:Dictionary = _parser.parseData( data );
			
		LanguageMod.setLanguageData( languageDic );			
		model.directChangeDataSgnl.dispatch( LanguageMod.getSectionLanguage( sectionEngineModel.currentSection.sectionName ) );
		
	}
	
	
	private function _onLanguageSetted( o:* ):void 
	{
		trace( "[LANGUAGE] o : " + o );
	}	
	
}


	
		


		
	