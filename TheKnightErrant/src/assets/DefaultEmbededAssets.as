package assets
{
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------

	/**
	 * DefaultEmbededAssets.as class.For obtainning static embeded resources.
	 * @see http://livedocs.adobe.com/flex/3/html/help.html?content=embed_3.html
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Aug 12, 2011 10:32:59 AM
	 */
	public class DefaultEmbededAssets
	{
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		// Texture cache
		private static var sTextures:Dictionary=new Dictionary();
		private static var sSounds:Dictionary=new Dictionary();
		private static var sTextureAtlas:TextureAtlas;
		private static var sBitmapFontsLoaded:Boolean;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		//tollgate icon class here
		[Embed(source="/assets/images/icons/tollgate01_50x50.png")]
		public static const ICON_TOLLGATE_01:Class;

		[Embed(source="/assets/images/icons/tollgate02_50x50.png")]
		public static const ICON_TOLLGATE_02:Class;

		[Embed(source="/assets/images/icons/tollgate03_50x50.png")]
		public static const ICON_TOLLGATE_03:Class;

		[Embed(source="/assets/images/icons/tollgate04_50x50.png")]
		public static const ICON_TOLLGATE_04:Class;

		[Embed(source="/assets/images/icons/tollgate04_50x50.png")]
		public static const ICON_TOLLGATE_05:Class;

		//plugin category icon class here.
		[Embed(source="/assets/images/icons/store_50x50.png")]
		public static const ICON_STORE:Class;

		[Embed(source="/assets/images/icons/coin_50x50.png")]
		public static const ICON_COIN:Class;

		[Embed(source="/assets/images/icons/account_50x50.png")]
		public static const ICON_ACCOUNT:Class;
		//
		// Bitmaps

		[Embed(source="/assets/images/background.png")]
		private static const IMG_BACK_GROUND:Class;

		[Embed(source="/assets/media/textures/starling_sheet.png")]
		private static const StarlingSheet:Class;

		[Embed(source="/assets/media/textures/flash_egg.png")]
		private static const FlashEgg:Class;

		[Embed(source="/assets/media/textures/starling_front.png")]
		private static const StarlingFront:Class;

		[Embed(source="/assets/media/textures/logo.png")]
		private static const Logo:Class;

		[Embed(source="/assets/media/textures/button_back.png")]
		private static const ButtonBack:Class;

		[Embed(source="/assets/media/textures/button_big.png")]
		private static const ButtonBig:Class;

		[Embed(source="/assets/media/textures/button_normal.png")]
		private static const ButtonNormal:Class;

		[Embed(source="/assets/media/textures/button_square.png")]
		private static const ButtonSquare:Class;

		[Embed(source="/assets/media/textures/benchmark_object.png")]
		private static const BenchmarkObject:Class;

		// Compressed textures

		[Embed(source="/assets/media/textures/compressed_texture.atf", mimeType="application/octet-stream")]
		private static const CompressedTexture:Class;

		// Fonts

		// The 'embedAsCFF'-part IS REQUIRED!!!!
		[Embed(source="/assets/media/fonts/Ubuntu-R.ttf", embedAsCFF="false", fontFamily="Ubuntu")]
		private static const UbuntuRegular:Class;

		[Embed(source="/assets/media/fonts/desyrel.fnt", mimeType="application/octet-stream")]
		private static const DesyrelXml:Class;

		[Embed(source="/assets/media/fonts/desyrel.png")]
		private static const DesyrelTexture:Class;

		// Texture Atlas
		[Embed(source="/assets/media/textures/defaultAtlas.xml", mimeType="application/octet-stream")]
		private static const AtlasXml:Class;
		
		[Embed(source="/assets/media/textures/defaultAtlasTexture.png")]
		private static const AtlasTexture:Class;

		// Sounds

		[Embed(source="/assets/media/audio/wing_flap.mp3")]
		private static const StepSound:Class;
		
		//for testing
		[Embed(source="/assets/swfs/RED_MARSHAL.png")]
		public static const RED_MARSHAL:Class;
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 

		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//-------------------------------------------------------------------------- 

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		//
		public static function getTexture(name:String):Texture
		{
			if (sTextures[name] == undefined)
			{
				var data:Object=new DefaultEmbededAssets[name]();
				//
				if (data is Bitmap)
					sTextures[name]=Texture.fromBitmap(data as Bitmap);
				else if (data is ByteArray)
					sTextures[name]=Texture.fromAtfData(data as ByteArray);
			}

			return sTextures[name];
		}

		//
		public static function getSound(name:String):Sound
		{
			var sound:Sound=sSounds[name] as Sound;
			if (sound)
				return sound;
			else
				throw new ArgumentError("Sound not found: " + name);
		}

		//
		public static function getTextureAtlas():TextureAtlas
		{
			if (sTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTexture");
				var xml:XML = XML(new AtlasXml());
				sTextureAtlas = new TextureAtlas(texture, xml);
			}
			
			return sTextureAtlas;
		}

		//
		public static function loadBitmapFonts():void
		{
			if (!sBitmapFontsLoaded)
			{
				var texture:Texture=getTexture("DesyrelTexture");
				var xml:XML=XML(new DesyrelXml());
				TextField.registerBitmapFont(new BitmapFont(texture, xml));
				sBitmapFontsLoaded=true;
			}
		}

		//
		public static function prepareSounds():void
		{
			sSounds["Step"]=new StepSound();
		}
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
	}

}
