package com.etamin.first.model;

import etaminstudio.core.definitions.NavigatorTransitions;
import etaminstudio.core.definitions.SectionVO;
import etaminstudio.core.definitions.ViewVO;
import etaminstudio.core.signals.data.DirectChangeDataSgnl;
import etaminstudio.core.signals.section.ChangeSectionSgnl;
import motion.Actuate;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */

@:rtti
@:keepSub
class AppModel 
{
	var _value:Int;

	@inject public var changeSectionSgnl:ChangeSectionSgnl;
	@inject public var directChangeDataSgnl:DirectChangeDataSgnl;
	
	public function new() 
	{
		
	}
	
	public function loadSetup():Void
	{
		//SectionNameList.init();			
		trace("loadSetup :: ");
		changeSection( new SectionVO( "com.etamin.first.view", new ViewVO(), false, false, NavigatorTransitions.ALPHA, 1, null));
	}
	
	//private function set_value(value:Int):Int 
	//{
		////if (_value == value) return value;
		////_value = value;
		////change.dispatch();
		////return value;
	//}
	//
	
	public function changeSection( sectionVO:SectionVO, ?delay:Float = 0):Void
	{
		if ( delay > 0 ) {
			Actuate.timer( 1 ).onComplete( changeSection, [sectionVO] );
			return;
		}			
		changeSectionSgnl.dispatch( sectionVO );
	}
}
