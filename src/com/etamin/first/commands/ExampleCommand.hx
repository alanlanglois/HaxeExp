package com.etamin.first.commands;
import robotlegs.bender.bundles.mvcs.Command;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class ExampleCommand extends Command 
{
	
	public function new() { }
	
	override public function execute():Void
	{
		trace("->>>>>>");
		trace("SETUP READY");
		trace("->>>>>>");
	}
}