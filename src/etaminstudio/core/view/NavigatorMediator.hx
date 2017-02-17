package etaminstudio.core.view;

import etaminstudio.core.definitions.NavigatorTransitions;
import etaminstudio.core.definitions.SectionVO;
import etaminstudio.core.definitions.ViewVO;
import etaminstudio.core.signals.section.SectionChangedSgnl;
import etaminstudio.core.signals.section.SectionChangingSgnl;
import motion.Actuate;
import openfl.system.System;
import robotlegs.bender.bundles.mvcs.Mediator;
import starling.display.DisplayObjectContainer;
import starling.display.Sprite;
import starling.events.ResizeEvent;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

@:rtti
@:keepSub
class NavigatorMediator extends Mediator
{

	@inject public var view:Navigator;

	@inject public var sectionChangingSgnl:SectionChangingSgnl;
	@inject public var sectionChangedSgnl:SectionChangedSgnl;

	private var _isRegistred:Bool = false;
	private var _transition:String;
	private var _transitionType:String;
	private var _duration:Float;
	//private var _easing:Function;

	private var _mask:Sprite;

	public function new()
	{
		trace("++++++++++++++++++NAVIGATOR++++++++++");		
	}

	override public function initialize():Void
	{
		sectionChangingSgnl.add( changeSection );
		
		_isRegistred = true;
		
		view.onRegistred();
		view.stage.addEventListener(ResizeEvent.RESIZE, _onResize);
		
		trace("++++++++++++++++++NAVIGATOR INIT++++++++++");
	}

	private function _onResize(e:ResizeEvent):Void
	{
		view.getStageResolution(e);
	}

	public function changeSection(newSection:SectionVO):Void
	{
		trace("newSection: " + newSection );
		
		while (_isRegistred == false) changeSection(newSection);
		
		setSection(newSection.sectionName, newSection.viewVO, newSection.transitionType, newSection.duration);
	}

	public function setSection(sectionName:String, data:ViewVO, transitionType:String, duration:Float):Void
	{
		_transitionType = transitionType;
		_duration = duration;
		
		
		
		//_easing=easing;
		//
		//var classRef:SectionView = cast(sectionRef, SectionView);
		//
		//var classRef:Class<Dynamic> = Type.createInstance(Type.resolveClass("path.to.MyClass"), []);
		trace("setSection---->"+ sectionName );
		
		var classRef:Class<Dynamic> =  Type.resolveClass( sectionName );
//

		
		if (classRef != null){
			
			
			view.nextiView = Type.createInstance( classRef, [view.assets]);
			//
			view.nextiView.load(data, transition);
			view.nextContainer = new Sprite();
			view.nextContainer.alpha = 0;
			//
			if (view.iView != null) view.iView.unactive();
			//
			view.addChild(view.nextContainer);
			//////_mask=new Sprite();
			//////_mask.graphics.beginFill(0x000000);
			//////_mask.graphics.drawRect(0, 0, view.stageW, view.stageH);
			//////view.nextContainer.addChild(_mask);
			//////subContainer.mask=_mask;
			//
			//view.nextContainer.addChild(DisplayObjectContainer(view.nextiView));
			view.nextContainer.addChild( cast( view.nextiView, SectionView ));
			//
		}
		else {
			trace("ERROR::fail on trying set section. The class ref:'" + sectionName +"' doesn't seems to match with an existing Class");
		}
	}
	
	

	public function transition( delay:Int = 50):Void
	{
		trace("transition(:" + transition);
		
		//if (delay>0)
		//{
			//setTimeout(transition, delay, 0);
			//return;
		//}
		//
		var transitionType:String = _transitionType;
		var duration:Float = _duration;
		//var easing:Function = (_easing == null)? Cubic.easeInOut:_easing;
		//
		switch (transitionType)
		{
			
			case NavigatorTransitions.ALPHA:
				
				Actuate.tween(view.nextContainer, duration, { alpha: 1 }).onComplete(dispose);
				
			case NavigatorTransitions.CROSS_FADE:
				
				Actuate.tween(view.currentContainer, duration, { alpha: 0 });
				Actuate.tween(view.nextContainer, duration, { alpha: 1 }).onComplete(dispose);
				
			case NavigatorTransitions.MOVE_TOP:
				
				view.nextContainer.alpha = 1;
				view.nextContainer.y = view.stageH ;
				Actuate.tween(view.nextContainer, duration, { y: 0});
				Actuate.tween(view.currentContainer, duration, {  y: - view.stageH }).onComplete(dispose);
				
			case NavigatorTransitions.MOVE_LEFT:
				
				view.nextContainer.alpha = 1;
				view.nextContainer.x = view.stageW;
				Actuate.tween(view.nextContainer, duration, { x: 0});
				Actuate.tween(view.currentContainer, duration, {  x: - view.stageW }).onComplete(dispose);

			case NavigatorTransitions.MOVE_RIGHT:
				
				view.nextContainer.alpha = 1;
				view.nextContainer.x = - view.stageW;
				Actuate.tween(view.nextContainer, duration, { x: 0});
				Actuate.tween(view.currentContainer, duration, {  x:view.stageW }).onComplete(dispose);
				
			case NavigatorTransitions.MOVE_BOTTOM:
				view.nextContainer.alpha = 1;
				view.nextContainer.y = - view.stageH;
				Actuate.tween(view.nextContainer, duration, { y: 0});
				Actuate.tween(view.currentContainer, duration, {  y:view.stageH}).onComplete(dispose);	
		}
	}

	public function dispose():Void
	{
		trace( "DISPOSE OLD VIEW");
		if (view.iView !=null)
		{
			view.iView.dispose();
			view.iView=null;
		}
		//
		while (view.currentContainer.numChildren > 0)	view.currentContainer.removeChildAt(0);
		view.removeChild(view.currentContainer, true);
		view.currentContainer = null;
		//
		view.currentContainer = view.nextContainer;
		//
		view.iView = view.nextiView;
		view.iView.active();
		view.nextiView = null;
		//
		System.gc();
		//
		sectionChangedSgnl.dispatch();
	}

}