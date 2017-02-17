package com.etamin.first.view.home;

import etaminstudio.core.view.SectionView;
import starling.display.Quad;
import starling.utils.AssetManager;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */
class HomeView extends SectionView 
{
	public function new(assets:AssetManager) 
	{
		super(assets);
		
		var quad:Quad = new Quad( 100, 100, 0x220066);
		quad.x = 50;
		quad.y = 50;
		addChild( quad );
		
	}
	
}