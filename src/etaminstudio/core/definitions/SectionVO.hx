package etaminstudio.core.definitions;

import etaminstudio.core.definitions.ViewVO;


/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class SectionVO
{
	
	public var viewVO:ViewVO;
	public var sectionName:String;
	public var canBeMultiple:Bool;
	public var isHistoricable:Bool;
	public var transitionType:String;
	public var duration:Float;
	public var easing:Void->Void;	
	public var nextView:SectionVO=null;
	public var delayBeforeNext:Int=0;
	
	public function new(sectionName:String = "", viewVO:ViewVO = null,  canBeMultiple:Bool = false, isHistoricable:Bool = false, transitionType:String = "", duration:Float =-1, easing:Void->Void = null, nextView:SectionVO = null, delayBeforeNext:Int = 0):Void
	{
		this.sectionName=sectionName;
		this.viewVO=viewVO;
		this.canBeMultiple=canBeMultiple;
		this.isHistoricable=isHistoricable;
		this.transitionType=transitionType;
		this.duration=duration;
		this.easing=easing;
		this.nextView=nextView;
		this.delayBeforeNext=delayBeforeNext;
	}
	
}