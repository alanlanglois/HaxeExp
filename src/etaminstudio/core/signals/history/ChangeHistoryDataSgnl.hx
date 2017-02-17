package etaminstudio.core.signals.history; 

import com.etamin.core.model.data.ChangeHistoryDataVO;
import msignal.Signal;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class ChangeHistoryDataSgnl extends Signal 
{
	
	public function new()
	{
		super(ChangeHistoryDataVO);
	}
	
}