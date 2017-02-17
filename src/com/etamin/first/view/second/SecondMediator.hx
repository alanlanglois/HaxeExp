package com.etamin.first.view.second;

import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */

@:rtti
@:keepSub
class SecondMediator extends Mediator 
{
	
	@inject public var view:SecondView;
	
	public function new() 
	{
		
	}
	
	override public function initialize():Void 
	{
		trace("++++ H O M E   M E D I A T O R +++++");
		//view.onReadySgnl.addOnce(_onReady);
		super.initialize();
		
		view.initialize();
		
	}
	
}