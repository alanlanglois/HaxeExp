package etaminstudio.core.view;

import msignal.Signal;
import openfl.events.Event;
import robotlegs.bender.extensions.display.stage3D.starling.impl.StarlingLayer;
import starling.display.Quad;
import starling.display.Sprite;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */
class AppRootView extends StarlingLayer
{

	public var onReadySgnl:Signal0;
	
	public function new()
    {
        super();
		trace("++++ VIEW::");
		
		this.addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage);
		onReadySgnl = new Signal0();
    }	
	
	public function initialize():Void
	{		
		trace("++++++++++++++++ VIEW INITIALIZE");
	}
	
	private function _onAddedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		
		var quad:Quad = new Quad(50, 50, 0x333333 );
		quad.x = 10;
		quad.y = 10;
		addChild( quad );
		
	}
	
	public function start(assets:AssetManager):Void
	{
		trace("++++> ROOT START");
		// NAVIGATOR
		var navigator:Navigator = new Navigator(assets);
		addChild(navigator);	
		
		//trace("[ROOT]>>View Engine Initialized!");
		onReadySgnl.dispatch();
	}
}