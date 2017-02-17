package etaminstudio.core.model;

import etaminstudio.core.definitions.NavigatorTransitions;
import etaminstudio.core.definitions.SectionVO;
import etaminstudio.core.definitions.ViewVO;
import etaminstudio.core.signals.section.SectionChangingSgnl;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

@:rtti
@:keepSub
class NavigatorModel
{

	@inject	public var sectionChangingSgnl:SectionChangingSgnl;

	public var currentSection:SectionVO;
	public var isSectionChanging:Bool = false;	
	public var historyVec:Array<SectionVO>;

	public function new()
	{

		historyVec = new Array<SectionVO>();
	}

	public function addToHistory(sectionVO:SectionVO):Void
	{
		historyVec.push(sectionVO);
	}

	public function removeFromHistory():Void
	{
		if (historyVec.length > 1)
		{
			historyVec.pop();
		}
	}

	public function changeSection(currentSection:SectionVO):Void
	{

		trace("[MODEL]>>changeSection::" + currentSection.sectionName);
		//if (currentSection.isHistoricable)
			//addToHistory(currentSection);
			
		isSectionChanging=true;
		this.currentSection=currentSection;
		
		sectionChangingSgnl.dispatch(currentSection);
		
	}

	public function backInHistory(isBackHome:Bool):Void
	{
		/*if (historyVec.length>1)
		{
			if (!isBackHome)
			{
				this.currentSection=historyVec[historyVec.length - 2];
				this.currentSection.isHistoricable=false;
				removeFromHistory();
			}
			else
			{
				this.currentSection=historyVec[0];
				this.currentSection.isHistoricable=false;
				while (historyVec.length>1)
				{
					removeFromHistory();
				}
			}

			this.currentSection.transitionType=NavigatorTransitions.MOVE_RIGHT;
			this.currentSection.duration = 0.5;
			changeSection(currentSection);

		}
		else
		{
			trace("no section stored in the history");
		}*/

	}

	public function updateHistoryElementData(idElement:Int, field:String, data:Dynamic):Void
	{
		if (historyVec.length>0)
		{
			//var sectionVO:SectionVO = historyVec[idElement];
			//trace("sectionVO.viewVO.data:" + sectionVO.viewVO.data);
			//sectionVO.viewVO.data[field] = data;
		}

	}

	public function updateHistoryElementConfig(idElement:Int, field:String, data:Dynamic):Void
	{
		if (historyVec.length>0)
		{
			var sectionVO:SectionVO=historyVec[idElement];
			//ViewVO(sectionVO.viewVO)[field]=data;
		}

	}

}