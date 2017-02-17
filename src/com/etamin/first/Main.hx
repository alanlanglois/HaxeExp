package com.etamin.first;

import etaminstudio.core.definitions.AppConstants;
import etaminstudio.core.view.AppRootView;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display3D.Context3DRenderMode;
import flash.errors.Error;
import flash.geom.Rectangle;
import flash.system.Capabilities;
import flash.system.System;
import openfl.display.StageScaleMode;
import openfl.utils.ByteArray;
import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.bundles.stage3D.Stage3DBundle;
import robotlegs.bender.bundles.stage3D.StarlingBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

import haxe.Timer;

import openfl.Assets;
import openfl.Vector;

import starling.core.Starling;
import starling.display.Stage;
import starling.events.Event;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.RenderTexture;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.AssetManager;
import starling.utils.Max;
import starling.utils.RectangleUtil;


/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */
class Main extends Sprite 
{
    private var mStarling:Starling;
	var mContext:IContext;

	public function new() 
	{
		super();
		
		if (stage != null) start();
        else addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Dynamic):Void
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
		stage.scaleMode = StageScaleMode.NO_SCALE;
		
        start();		
    }
	
	private function start():Void
    {
        // We develop the game in a *fixed* coordinate system of 320x480. The game might
        // then run on a device with a different resolution; for that case, we zoom the
        // viewPort to the optimal size for any display and load the optimal textures.

        Starling.multitouchEnabled = true; // for Multitouch Scene
        Starling.handleLostContext = true; // recommended everywhere when using AssetManager
        RenderTexture.optimizePersistentBuffers = true; // should be safe on Desktop

        //mStarling = new Starling(AppRootView, stage, null, null, Context3DRenderMode.AUTO, "auto");
        //mStarling.stage.stageWidth = 800;
        //mStarling.stage.stageHeight = 640;
        //mStarling.simulateMultitouch = true;
        //mStarling.enableErrorChecking = Capabilities.isDebugger;
        //mStarling.addEventListener(Event.ROOT_CREATED, _onRootCreated);
        //mStarling.addEventListener(Event.CONTEXT3D_CREATE, _on3DContectCreated);
		
		mContext = new Context()
			.install([MVCSBundle, Stage3DBundle, StarlingBundle])
			.configure(AppConfig)
			.configure(new ContextView(this));
			
		//mContext = new Context();
		//mContext.install([MVCSBundle, Stage3DBundle, StarlingBundle]);
		//mContext.configure(AppConfig);
		//mContext.configure(new ContextView(this));
		//mContext.initialize();
		
		
        this.stage.addEventListener(Event.RESIZE, onResize, false, Max.INT_MAX_VALUE, true);

        //mStarling.start();
    }
	
	private function _on3DContectCreated(e:Event):Void 
	{
        //mStarling.removeEventListener(Event.CONTEXT3D_CREATE, _on3DContectCreated);
		
	}
	
	private function _onRootCreated(e:Event):Void 
	{
		//var assetManager:AssetManager = new AssetManager( AppConstants.starlingRatio, false );
		//assetManager.verbose = true;
		
		//cast ( mStarling.root, AppRootView ).start( assetManager );
	}
	
	private function onResize(e:openfl.events.Event):Void
    {
		trace("+++> " + stage.stageWidth + "x" + stage.stageHeight);
        //var viewPort:Rectangle = RectangleUtil.fit(new Rectangle(0, 0, 800, 640), new Rectangle(0, 0, stage.stageWidth, stage.stageHeight));
        //var viewPort:Rectangle = new Rectangle(0, 0, 800, 640);
        //try
        //{
            //this.mStarling.viewPort = viewPort;
        //}
        //catch(error:Error) {}
    }
}
