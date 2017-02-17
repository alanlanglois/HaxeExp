package com.etamin.first.view.home;

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
	
	public function new() 
	{
		
	}
	
}