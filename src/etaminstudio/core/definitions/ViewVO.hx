package etaminstudio.core.definitions;

import openfl.geom.Point;
import openfl.utils.Dictionary;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class ViewVO
{
	public var data:Dynamic;
	public var language:Dictionary<Dynamic, Dynamic>;
	public var initPos:Point;

	public function new(?data:Dynamic, ?initPos:Point, ?language:Dictionary<Dynamic, Dynamic>)
	{
		(initPos == null)? this.initPos = new Point():this.initPos = initPos;
		
		this.data = data;
		this.language = language;
	}

}