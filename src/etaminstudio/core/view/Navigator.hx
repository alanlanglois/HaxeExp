package etaminstudio.core.view; 

import openfl.geom.Rectangle;
import starling.core.Starling;
import starling.display.Sprite;
import starling.events.ResizeEvent;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class Navigator extends Sprite
{
	public var assets:AssetManager;
	
	public var currentContainer:Sprite;
	public var nextContainer:Sprite;
	
	public var iView:IView;
	public var nextiView:IView;
	
	public var stageW:Int;
	public var stageH:Int;
	
	public function new(assets:AssetManager):Void
	{
		super();
		this.assets = assets;		
	}
	
	public function onRegistred():Void
	{		
		
		stageW = stage.stageWidth;
		stageH = stage.stageHeight;
		
		currentContainer = new Sprite();
		addChild(currentContainer);
		
	}
	
	public function getStageResolution(e:ResizeEvent):Void
	{
		stage.stageWidth = e.width;
		stage.stageHeight = e.height;
		
		stageW = stage.stageWidth;
		stageH = stage.stageHeight;
		
	}
	
}