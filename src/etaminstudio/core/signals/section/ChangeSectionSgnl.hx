package etaminstudio.core.signals.section;

import etaminstudio.core.definitions.SectionVO;
import msignal.Signal;

/**
 * ...
 * @author Alan Langlois -<alan@etaminstudio.com>
 */

class ChangeSectionSgnl extends Signal1<SectionVO>
{
	
	public function new()
	{
		super(SectionVO);
	}
	
}