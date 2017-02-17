package etaminstudio.core.signals.section; 

import etaminstudio.core.definitions.SectionVO;
import msignal.Signal;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class SectionChangingSgnl extends Signal1<SectionVO> 
{
	
	public function new()
	{
		super(SectionVO);
		
	}
	
}