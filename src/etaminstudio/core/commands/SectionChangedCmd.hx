package etaminstudio.core.commands;

import etaminstudio.core.model.NavigatorModel;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */
@:rtti
@:keepSub
class SectionChangedCmd 
{			
	@inject	public var sectionEngineModel:NavigatorModel;
	
	public function execute():Void
	{
		sectionEngineModel.isSectionChanging=false;
	}
}