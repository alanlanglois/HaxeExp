package etaminstud.core.commands;

import etaminstud.core.model.SectionEngineModel;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

@:rtti
@:keepSub
class BackInHistoryCmd   
{
	
	@inject	public var sectionEngineModel:SectionEngineModel;
	@inject public var isBackHome:Bool;
	
	public function execute():Void
	{
		if(!sectionEngineModel.isSectionChanging){
			sectionEngineModel.backInHistory(isBackHome);
		}
	}
}