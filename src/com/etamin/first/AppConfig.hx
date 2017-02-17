package com.etamin.first;
import com.etamin.first.commands.StartupCmd;
import etaminstudio.core.signals.config.StartupSgnl;
import etaminstudio.core.view.AppRootView;
import etaminstudio.core.view.Navigator;
import etaminstudio.core.view.NavigatorMediator;
import etaminstudio.core.view.AppRootMediator;
import openfl.display.Sprite;
import openfl.display3D.Context3DProfile;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.display.base.api.IRenderContext;
import robotlegs.bender.extensions.display.base.api.IRenderer;
import robotlegs.bender.extensions.display.base.api.IStack;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IInjector;
import robotlegs.bender.framework.api.LogLevel;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */
@:rtti
@:keepSub
class AppConfig implements IConfig 
{
	//@inject	public var context:IContext;
	//@inject public var commandMap:ISignalCommandMap;
	//@inject public var injector:IInjector;
	//@inject public var mediatorMap:IMediatorMap;
	//@inject public var renderer:IRenderer;
	
	@inject public var context:IContext;
	@inject public var commandMap:ISignalCommandMap;
	@inject public var mediatorMap:IMediatorMap;
	@inject public var stack:IStack;
	@inject public var renderer:IRenderContext;
	@inject public var contextView:ContextView;

	public function new() { }
	
	public function configure():Void
	{
		context.afterInitializing(_init);
		// Configure logger.
		context.logLevel = LogLevel.DEBUG;
			
		// Map commands
		commandMap.map( StartupSgnl ).toCommand( StartupCmd );
		//commandMap.map( ChangeSectionSgnl ).toCommand( ChangeSectionCmd );
		//commandMap.map( SectionChangedSgnl ).toCommand( SectionChangedCmd );
		//commandMap.map( BackInHistrorySgnl ).toCommand( BackInHistoryCmd );
		//commandMap.map( LoadAsynchDataSgnl ).toCommand( LoadAsynchDataCmd );
		
		//injector.map(ExampleSignal).asSingleton();
		
		mediatorMap.map( AppRootView ).toMediator( AppRootMediator );
		mediatorMap.map( Navigator ).toMediator( NavigatorMediator );
		
		
		trace("++++ APPConfig");	
		contextView.view.addChild(new Sprite());

	}
	
	
	private function _init() 
	{
		trace("+++ APP READY ");
		
	}
}