package etaminstudio.core.services.data;

//import com.etamin.utils.sqlite.ConnectDB;
import etaminstudio.core.definitions.AsynchInputVO;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

interface ILoadAsynchDataService 
{		
	//function setDB(db:ConnectDB):Void;
	
	function addToQueue(asynchInput:AsynchInputVO):Void;
	
	function directLoad():Void;
	
	function resetQueue():Void;		
	
}