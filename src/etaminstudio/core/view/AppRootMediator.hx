package etaminstudio.core.view;

import etaminstudio.core.signals.config.StartupSgnl;
import robotlegs.bender.bundles.mvcs.Mediator;
/**
 * ...
 * @author Alan Langlois
 */

@:rtti
@:keepSub
class AppRootMediator extends Mediator
{
	@inject	public var view:AppRootView;
	@inject public var startupSgnl:StartupSgnl;
	
	public function new()
	{
		trace("++++>> APP ROOT MEDIATOR ");
	}
	
	
	override public function initialize():Void 
	{
		trace("+++++++++++++++++++++++++++++");
		view.onReadySgnl.addOnce(_onReady);
		super.initialize();
		
		view.initialize();
		
	}
	
	private function _onReady():Void 
	{
		trace("_onReady dispatched +++++++++++++++++++++++++++++>");
		startupSgnl.dispatch();

	}
	
}