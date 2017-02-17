package etaminstud.core.commands;

import etaminstud.core.model.data.AsynchInputVO;
import etaminstud.core.services.data.ILoadAsynchDataService;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */
@:rtti
@:keepSub
class LoadAsynchDataCmd  
{
	
	@inject	public var asynchDataVO:AsynchInputVO;
	@inject	public var loadAsynchDataService:ILoadAsynchDataService;
	
	public function execute():Void
	{
		
		loadAsynchDataService.addToQueue(asynchDataVO);
		
		if(asynchDataVO.fullyDirect){
			loadAsynchDataService.directLoad();
		}
	}
}