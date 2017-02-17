package etaminstudio.core.signals.data;

import etaminstud.core.model.data.AsynchInputVO;
import msignal.Signal;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class LoadAsynchDataSgnl extends Signal1<AsynchInputVO> 
{
	
	public function new()
	{
		super(AsynchInputVO);
	}
	
}