package com.etamin.first.services.data;

import com.etamin.first.model.AppModel;
import etaminstudio.core.definitions.AsynchInputVO;
import etaminstudio.core.services.data.ILoadAsynchDataService;
import etaminstudio.core.services.data.helpers.IAsynchDataParser;
import etaminstudio.core.signals.section.SectionChangedSgnl;
import openfl.Vector;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */

@:rtti
@:keepSub
class LoadAsynchDataService implements ILoadAsynchDataService 
{

	@inject public var appModel:AppModel;
	
	@inject public var sectionChangedSgnl:SectionChangedSgnl;

	private var _startTime:Float;
	private var _asynchRequestVec:Vector<AsynchInputVO>;
	private var _dataParser:IAsynchDataParser;
		
	public function new() 
	{
		
	}
	
	
	/* INTERFACE etaminstud.core.services.data.ILoadAsynchDataService */
	
	public function addToQueue(asynchInput:AsynchInputVO):Void 
	{
		_asynchRequestVec.push( asynchInput );	

	}
	
	public function directLoad():Void 
	{
		_processQueue();

	}
	
	private function _processQueue():Void 
	{
		if ( _asynchRequestVec.length > 0  ) {
			
			var item:AsynchInputVO = _asynchRequestVec[ 0 ];
			_asynchRequestVec.shift();
			
			_getData( item );
			
		}
	}
	
	private function _getData( asynchInput:AsynchInputVO ):Void { 
		
		//switch ( asynchInput.type ) {
			//case AsynchTypeList.KB_LETTER_SELECTED :
				//_getCorect
				//_getSampleData( int(asynchInput.data) );
			//break;
		//}
		
	}
	
	private function _getSampleData( inputParams:Dynamic ):Void 
	{ 
		// Request
		//_db.sqlRequest( "SELECT id, author, title, original_url, license FROM background WHERE id = " + inputParams, _parseCredits );					
	}
	
	/*private function _parseSampleData( o:SQLResult ):Void 
	{
		
		//_dataParser = new CreditsParser();
		//_dataParser.parse( o, data );
		//_dataParser = null;
		
		//appModel.directChangeData( data ) ;
		
		_processQueue();
	}*/	
	
	public function resetQueue():Void
	{
		_asynchRequestVec = null;
		_asynchRequestVec = new Vector<AsynchInputVO>();
		_dataParser = null;
		
		//System.gc();
		
	}
}


