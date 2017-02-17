package etaminstudio.core.definitions;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */
class AppConstants 
{		
	static public var ratioH:Float=1;
	static public var ratioV:Float=1;
	static public var rapport:Float=1;
	static public var starlingRatio:Int=1;
	
	static public var stageW:Int;
	static public var stageH:Int;
	
	
	
	static public function setRatio(horizontal:Float =-100, vertical:Float =-100, starlingRatio:Int =-100):Void
	{
		if (horizontal !=-100) ratioH = horizontal;
		if (vertical !=-100) ratioV = vertical;		
		if (starlingRatio !=-100) AppConstants.starlingRatio = starlingRatio;
	}
	
	static public function getAppInfo():Dynamic {
		
		//var appXml:XML=NativeApplication.nativeApplication.applicationDescriptor;
		//var ns:Namespace=appXml.namespace();
		
		//var o:Dynamic=new Dynamic();
		//o.version=appXml.ns::versionNumber[0];
		//o.id=appXml.ns::id[0];
		//return o;
		return "0000";
		
	}
}