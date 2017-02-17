package etaminstudio.core.commands;

import etaminstudio.core.definitions.SectionVO;
import etaminstudio.core.model.NavigatorModel;
//import etaminstudio.core.services.data.ILoadAsynchDataService;
import etaminstudio.core.services.data.ILoadDataService;


/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

@:rtti
@:keepSub
class ChangeSectionCmd 
{
	@inject	public var sectionVO:SectionVO;
	@inject	public var sectionEngineModel:NavigatorModel;
	@inject	public var dataService:ILoadDataService;
	//@inject	public var asynchDataService:ILoadAsynchDataService;
	
	public function execute():Void
	{
		//stop any the Async data Requests
		//asynchDataService.resetQueue();
		trace("----------------------------------------------");
		trace("---->sectionName:" + sectionVO.sectionName);
		trace("----------------------------------------------");

		if(!sectionEngineModel.isSectionChanging)
		{
			
			if(sectionEngineModel.currentSection==null)
			{
				trace("sectionVO.sectionName:" + sectionVO.sectionName);
				//sectionEngineModel.changeSection(sectionVO);
				dataService.getData(sectionVO);// call the service to get the relative content
				
			}
			else if(sectionVO.sectionName !=null)
			{
				if(sectionEngineModel.currentSection.sectionName !=sectionVO.sectionName || sectionVO.canBeMultiple)
				{
					sectionEngineModel.isSectionChanging=true;
					dataService.getData(sectionVO);// call the service to get the relative content
				}
				else
				{
					trace("This section is already displayed");
				}
			}
			else
			{
				trace("ClassRef param is null, impossible to load the section");
			}
		}
		else
		{
			trace("Is already changing...");
		}
	}
}