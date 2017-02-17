package com.etamin.first.view.home;

import etaminstudio.core.definitions.NavigatorTransitions;
import etaminstudio.core.definitions.SectionVO;
import etaminstudio.core.definitions.ViewVO;
import etaminstudio.core.signals.section.ChangeSectionSgnl;
import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */

@:rtti
@:keepSub
class HomeMediator extends Mediator 
{
	
	@inject public var view:HomeView;
	@inject public var changeSectionSgnl:ChangeSectionSgnl;
	
	public function new() 
	{
		
	}
	
	override public function initialize():Void 
	{
		trace("++++ H O M E   M E D I A T O R +++++");
		//view.onReadySgnl.addOnce(_onReady);
		super.initialize();
		
		view.onTouchCB = onTouchCB;
		view.initialize();
		
	}
	
	public function onTouchCB():Void
	{
		changeSectionSgnl.dispatch( new SectionVO( "com.etamin.first.view.second.SecondView", new ViewVO(), false, false, NavigatorTransitions.MOVE_LEFT, 0.5));
		trace("TEST TEST TEST");
	}
	
}