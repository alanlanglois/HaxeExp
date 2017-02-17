package etaminstud.core.commands 
{
import etaminstud.core.model.data.ChangeHistoryDataVO;
import etaminstud.core.model.SectionEngineModel;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

@:rtti
@:keepSub
class ChangeHistoryDataCmd
{
	
	@inject	public var sectionEngineModel:SectionEngineModel;
	@inject	public var historyDataVO:ChangeHistoryDataVO;
	
	override public function execute():Void
	{
		trace(" please do it ! ");
		
		sectionEngineModel.updateHistoryElementData(historyDataVO.id, historyDataVO.associatedClass, historyDataVO.field, historyDataVO.data);
	}
}