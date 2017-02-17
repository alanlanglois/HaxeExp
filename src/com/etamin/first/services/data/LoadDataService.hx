package com.etamin.first.services.data;

import com.etamin.first.model.AppModel;
import etaminstudio.core.definitions.SectionVO;
import etaminstudio.core.model.NavigatorModel;
import etaminstudio.core.services.data.ILoadDataService;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */

@:rtti
@:keepSub
class LoadDataService implements ILoadDataService 
{
	private var _sectionVO:SectionVO;
	//private var _dataParser:IDataParser;
	
	@inject	public var navigatorModel:NavigatorModel;
	@inject	public var appModel:AppModel;
	
	public function new() 
	{
		
	}
	
	
	/* INTERFACE etaminstud.core.services.data.ILoadDataService */
	
	public function getData(sectionVO:SectionVO, delay:Int = 0):Void 
	{
		_sectionVO = sectionVO;
			
		
		//if ( LanguageMod.isReady ){
			//_sectionVO.viewVO.language = LanguageMod.getSectionLanguage( _sectionVO.sectionName );
		//}
		changeSection( _sectionVO );
		//switch (_sectionVO.sectionName)
		//{
			//case SectionNameList.HOME: 
				//changeSection( _sectionVO );
				//break;
			//default:
				//changeSection( _sectionVO );
				//break;
			//
		//}
		
	}
	
	public function changeSection(sectionVO:SectionVO):Void
	{
		navigatorModel.changeSection( sectionVO );
	}
	
}