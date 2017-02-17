package etaminstudio.core.view; 

import etaminstudio.core.definitions.ViewVO;
import etaminstudio.core.definitions.AppConstants;
import msignal.Signal;
import openfl.system.System;
import openfl.utils.Dictionary;
import openfl.utils.Object;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class SectionView extends Sprite implements IView 
{
	public var data:Dynamic;
	public var stageW:Int;
	public var stageH:Int;
	public var scaleFactor:Float;
	public var ratioH:Float;
	public var ratioV:Float;
	
	public var assets:AssetManager;
	
	public var onReadySgnl:Signal0;
	
	public var transition:Int->Void;
	public var doVec:Array<DisplayObject>;
	public var isActive:Bool;
	
	public var languageDic:Dictionary<Object, Object>;
	
	
	public function new(assets:AssetManager)
	{
		super();
		this.assets = assets;
		onReadySgnl = new Signal0();
		doVec = new Array<DisplayObject>();
		languageDic = new Dictionary(null);
	}
	
	public function setAssets(assets:AssetManager):Void
	{
		this.assets=assets;
	}
	
	public function load(?data:ViewVO, ?transition: Int -> Void):Void
	{
		trace("data:" + data);
		trace("data.language:" + data.language);
		
		if(data !=null)	{
			this.data=data.data;
			languageDic=data.language;
		}
		this.transition = transition;
		active();
	}
	
	public function initialize():Void
	{		
		stageW=stage.stageWidth;
		stageH=stage.stageHeight;
		//scaleFactor=Starling.contentScaleFactor;
		ratioH=AppConstants.ratioH;
		ratioV=AppConstants.ratioV;
		
		if (transition != null) transition.bind(0);
	}
	
	public function setOrientation(orientation:String):Void {}
	public function update(data:Dynamic=null):Void {}
	
	public function active():Void
	{
		isActive=true;
	}
	
	public function openPopup():Void
	{
		
	}
	
	public function unactive():Void
	{
		isActive=false;
	}
	
	override public function dispose():Void
	{	
		doVec = null;
		if (onReadySgnl != null) onReadySgnl.removeAll(); onReadySgnl = null;
		var displayObj:DisplayObject;
		while (this.numChildren > 0){
			displayObj = getChildAt(0);
			removeChild(displayObj);
			displayObj.dispose();
			displayObj = null;
		}
		languageDic = null;
		
		super.dispose();
		//System.pauseForGCIfCollectionImminent();
		System.gc();
	}
	
}