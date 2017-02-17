package etaminstudio.core.services.data;

import etaminstudio.core.definitions.SectionVO;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

interface ILoadDataService 
{
	//function setDB(db:ConnectDB):Void;
	
	function getData(sectionVO:SectionVO, delay:Int=0):Void;		
}