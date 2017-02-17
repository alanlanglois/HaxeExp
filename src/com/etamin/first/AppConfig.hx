package com.etamin.first;
import com.etamin.first.commands.ExampleCommand;
import com.etamin.first.commands.StartupCmd;
import com.etamin.first.model.AppModel;
import com.etamin.first.services.data.LoadDataService;
import com.etamin.first.view.home.HomeMediator;
import com.etamin.first.view.home.HomeView;
import com.etamin.first.view.second.SecondMediator;
import com.etamin.first.view.second.SecondView;
import etaminstudio.core.commands.ChangeSectionCmd;
import etaminstudio.core.commands.SectionChangedCmd;
import etaminstudio.core.model.NavigatorModel;
import etaminstudio.core.services.data.ILoadDataService;
import etaminstudio.core.signals.config.StartupSgnl;
import etaminstudio.core.signals.data.DirectChangeDataSgnl;
import etaminstudio.core.signals.section.ChangeSectionSgnl;
import etaminstudio.core.signals.section.SectionChangedSgnl;
import etaminstudio.core.signals.section.SectionChangingSgnl;
import etaminstudio.core.view.AppRootMediator;
import etaminstudio.core.view.AppRootView;
import etaminstudio.core.view.Navigator;
import etaminstudio.core.view.NavigatorMediator;
import openfl.display3D.Context3DProfile;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.display.base.api.IRenderContext;
import robotlegs.bender.extensions.display.base.api.IRenderer;
import robotlegs.bender.extensions.display.base.api.IStack;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.extensions.signalCommandMap.impl.signals.AppSetupCompleteSignal;
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
	@inject public var contextView:ContextView;
	@inject public var commandMap:ISignalCommandMap;
	@inject public var mediatorMap:IMediatorMap;
	@inject public var injector:IInjector;
	@inject public var stack:IStack;
	@inject public var rendererContext:IRenderContext;
	@inject public var renderer:IRenderer;

	public function new() { }
	
	public function configure():Void
	{
		context.logLevel = LogLevel.DEBUG;
		context.afterInitializing(_init);
		
	}
	
	private function _init():Void
	{
		rendererContext.onReady.addOnce( OnContext3DReady );
		rendererContext.setup(Context3DProfile.BASELINE_EXTENDED);
	}
	
	
	private function OnContext3DReady():Void
	{
		mapMediators();
		initView();
		renderer.start();
	}
	
	private function mapMediators():Void
	{
		// Configure logger.
		
		// Map commands
		commandMap.map(AppSetupCompleteSignal).toCommand(ExampleCommand);
		
		commandMap.map( StartupSgnl ).toCommand( StartupCmd );
		commandMap.map( ChangeSectionSgnl ).toCommand( ChangeSectionCmd );
		commandMap.map( SectionChangedSgnl ).toCommand( SectionChangedCmd );
		//commandMap.map( BackInHistrorySgnl ).toCommand( BackInHistoryCmd );
		//commandMap.map( LoadAsynchDataSgnl ).toCommand( LoadAsynchDataCmd );
		
		injector.map( NavigatorModel ).asSingleton();
		injector.map( AppModel ).asSingleton();
				
		injector.map( SectionChangingSgnl ).asSingleton();
		injector.map( DirectChangeDataSgnl ).asSingleton();
			
			
		mediatorMap.map( AppRootView ).toMediator( AppRootMediator );
		mediatorMap.map( Navigator ).toMediator( NavigatorMediator );
		mediatorMap.map( HomeView ).toMediator( HomeMediator );
		mediatorMap.map( SecondView ).toMediator( SecondMediator );
		
		//injector.map( ILanguageService ).toSingleton( LanguageService );
		//injector.map( ILanguageParser ).toSingleton( LanguageParser );
		injector.map( ILoadDataService ).toSingleton( LoadDataService );
		//injector.map( ILoadAsynchDataService ).toSingleton( LoadAsynchDataService );
		
		trace("++++ APPConfig");
		trace("+++ APP READY");
		//initUI();
		
	}
	
	function initView() 
	{
		
		stack.addLayer( AppRootView );
	}
}