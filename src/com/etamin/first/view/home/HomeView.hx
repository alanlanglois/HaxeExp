package com.etamin.first.view.home;

import etaminstudio.core.view.SectionView;
import starling.display.Quad;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */
class HomeView extends SectionView 
{
	
	public var onTouchCB:Void->Void;
	
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

		var quad:Quad = new Quad( stageW, stageH, 0xFFFF00);
		quad.x = 0;
		quad.y = 0;
		addChild( quad );
		
		
		this.addEventListener(TouchEvent.TOUCH, _onTouch);
		
	}
	
	private function _onTouch(e:TouchEvent):Void 
	{
		
		if (e.getTouch(this, TouchPhase.ENDED) != null){
			trace("+++ ON TOUCH");
			onTouchCB();
		}
	}	
}