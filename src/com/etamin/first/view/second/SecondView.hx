package com.etamin.first.view.second;

import etaminstudio.core.view.SectionView;
import starling.display.Quad;
import starling.events.Event;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */
class SecondView extends SectionView 
{
	public function new(assets:AssetManager) 
	{
		super(assets);
		
		trace("H O M E   V I E W !!!");
		
		this.addEventListener( Event.ADDED_TO_STAGE, _onStage);
		
	}
	
	private function _onStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, _onStage);
		
		trace("ON STAGE");

		var quad:Quad = new Quad( stageW, stageH, 0xFF0000);
		quad.x = 0;
		quad.y = 0;
		addChild( quad );
		
	}
	
}