package etaminstudio.core.view;

import etaminstudio.core.definitions.ViewVO;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

interface IView
{
	function setAssets(asset:AssetManager):Void;
	function load(data:ViewVO = null, transitionCB:Int->Void = null):Void;
	function initialize():Void;
	function setOrientation(orientation:String):Void;
	function update(data:Dynamic=null):Void;
	function active():Void;
	function unactive():Void;
	function dispose():Void;
	
}