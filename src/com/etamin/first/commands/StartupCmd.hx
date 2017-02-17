package com.etamin.first.commands;
import com.etamin.first.model.AppModel;
import robotlegs.bender.bundles.mvcs.Command;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */

@:rtti
@:keepSub
class StartupCmd extends Command 
{

	@inject public var appModel:AppModel;
	
	public function new() 
	{
	}
	
	override public function execute():Void
	{
		trace("+++++> CMD");
		appModel.loadSetup();
	}	
}