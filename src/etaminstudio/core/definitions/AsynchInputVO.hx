package etaminstudio.core.definitions;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class AsynchInputVO 
{
	
	public var type:String;
	public var data:Dynamic;
	public var fullyDirect:Bool;
	public var makeItPrio:Bool;
	
	public function new(type:String, data:Dynamic, fullyDirect:Bool=false, makeItPrio:Bool=false)
	{
		this.type = type;
		this.data = data;
		this.fullyDirect = fullyDirect;
		this.makeItPrio = makeItPrio;
	}
	
}