package etaminstudio.core.view;
import etaminstudio.utils.sound.player.SoundManager;
import openfl.Vector;
import openfl.text.Font;
import starling.core.Starling;
import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.utils.formatString;
import sys.io.File;

/**
 * ...
 * @author Alan Langlois - Etamin Studio
 */
class BaseView extends Sprite
{
	public var assets:AssetManager;
	public var stageW:AssetManager;
	public var stageH:Int;
	public var stageH:Int;
	public var fontsVec:Vector.<Font>;

	public function new( assets:AssetManager, stageW:Int, stageH:Int, fontsVec:Vector.<Font> ) 
	{
		this.assets = assets;
		this.stageW = stageW;
		this.stageH = stageH;
		this.fontsVec = fontsVec;
	}
	
	public function setup( assetsVec:Vector.<String> ):Void
	{	
		var appDir:File = File.applicationDirectory;
		assets.useMipMaps = false;
			
		var fileArr:Array;
		for ( var i:int = 0 ; i < assetsVec.length ; i++ ) {
		
			fileArr = assetsVec[i].split(".");
			var name:String = fileArr[0];
			var ext:String = fileArr[1];
			trace( "setup:: " + name + "." + ext );
			
			if ( ext == "mp3" ) {
				SoundManager.addSound( "app:/000/sounds/" + name + ".mp3", name );
			}
			else {
				if (assets.getTextureAtlas( name ) == null)
				{
					assets.enqueue( appDir.resolvePath( formatString( "000/assets/x{0}/" + assetsVec[i], int(Starling.contentScaleFactor))));
					assets.enqueue( appDir.resolvePath( formatString( "000/assets/x{0}/" + name +".xml", int(Starling.contentScaleFactor))));		
				}
			}
		}
		
		fileArr = null;
		assets.loadQueue( _onProgress );		
	}
	
	private function _onProgress( ratio:Number ):void 
	{
		if ( ratio == 1 ) {
			areAssetsLoaded = true;
		}
		
	}
	
	public function playSound( path:String, onCompleteCB:Function = null):void
	{
		if ( !areAssetsLoaded ) {
			setTimeout( playSound, 100, path, onCompleteCB );
			return;
		}
		SoundManager.playSound(path, 1, onCompleteCB );
	}
	
	
}