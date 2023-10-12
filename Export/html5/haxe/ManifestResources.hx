package;

import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_fonth__ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei35468y4:typey4:FONTy9:classNamey32:__ASSET__assets_fonts_fonth__ttfy2:idy27:assets%2Ffonts%2FFONTH_.TTFy7:preloadtgoy4:pathy24:assets%2Fimages%2Fa0.pngR0i13175R1y5:IMAGER5R9R7tgoR8y24:assets%2Fimages%2Fa1.pngR0i12137R1R10R5R11R7tgoR8y25:assets%2Fimages%2Fa10.pngR0i15478R1R10R5R12R7tgoR8y25:assets%2Fimages%2Fa11.pngR0i12175R1R10R5R13R7tgoR8y25:assets%2Fimages%2Fa12.pngR0i13866R1R10R5R14R7tgoR8y25:assets%2Fimages%2Fa13.pngR0i15962R1R10R5R15R7tgoR8y24:assets%2Fimages%2Fa2.pngR0i12941R1R10R5R16R7tgoR8y24:assets%2Fimages%2Fa3.pngR0i12234R1R10R5R17R7tgoR8y24:assets%2Fimages%2Fa4.pngR0i12844R1R10R5R18R7tgoR8y24:assets%2Fimages%2Fa5.pngR0i10242R1R10R5R19R7tgoR8y24:assets%2Fimages%2Fa6.pngR0i13197R1R10R5R20R7tgoR8y24:assets%2Fimages%2Fa7.pngR0i14522R1R10R5R21R7tgoR8y24:assets%2Fimages%2Fa8.pngR0i12232R1R10R5R22R7tgoR8y24:assets%2Fimages%2Fa9.pngR0i15686R1R10R5R23R7tgoR8y24:assets%2Fimages%2Fb0.pngR0i9015R1R10R5R24R7tgoR8y24:assets%2Fimages%2Fb1.pngR0i11446R1R10R5R25R7tgoR8y25:assets%2Fimages%2Fb10.pngR0i9746R1R10R5R26R7tgoR8y25:assets%2Fimages%2Fb11.pngR0i10315R1R10R5R27R7tgoR8y25:assets%2Fimages%2Fb12.pngR0i12952R1R10R5R28R7tgoR8y25:assets%2Fimages%2Fb13.pngR0i8625R1R10R5R29R7tgoR8y24:assets%2Fimages%2Fb2.pngR0i10794R1R10R5R30R7tgoR8y24:assets%2Fimages%2Fb3.pngR0i9057R1R10R5R31R7tgoR8y24:assets%2Fimages%2Fb4.pngR0i9460R1R10R5R32R7tgoR8y24:assets%2Fimages%2Fb5.pngR0i10265R1R10R5R33R7tgoR8y24:assets%2Fimages%2Fb6.pngR0i11445R1R10R5R34R7tgoR8y24:assets%2Fimages%2Fb7.pngR0i10525R1R10R5R35R7tgoR8y24:assets%2Fimages%2Fb8.pngR0i10080R1R10R5R36R7tgoR8y24:assets%2Fimages%2Fb9.pngR0i8950R1R10R5R37R7tgoR8y32:assets%2Fimages%2Fbackground.pngR0i75386R1R10R5R38R7tgoR8y32:assets%2Fimages%2FbtIniciar1.pngR0i2511R1R10R5R39R7tgoR8y32:assets%2Fimages%2FbtIniciar2.pngR0i4434R1R10R5R40R7tgoR8y32:assets%2Fimages%2FbtIniciar3.pngR0i4163R1R10R5R41R7tgoR8y27:assets%2Fimages%2Fverso.pngR0i12066R1R10R5R42R7tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fonth__ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_a9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_b9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_btiniciar1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_btiniciar2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_btiniciar3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_verso_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:font("Export/html5/obj/webfont/FONTH_.TTF") @:noCompletion #if display private #end class __ASSET__assets_fonts_fonth__ttf extends lime.text.Font {}
@:keep @:image("Assets/images/a0.png") @:noCompletion #if display private #end class __ASSET__assets_images_a0_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a1.png") @:noCompletion #if display private #end class __ASSET__assets_images_a1_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a10.png") @:noCompletion #if display private #end class __ASSET__assets_images_a10_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a11.png") @:noCompletion #if display private #end class __ASSET__assets_images_a11_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a12.png") @:noCompletion #if display private #end class __ASSET__assets_images_a12_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a13.png") @:noCompletion #if display private #end class __ASSET__assets_images_a13_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a2.png") @:noCompletion #if display private #end class __ASSET__assets_images_a2_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a3.png") @:noCompletion #if display private #end class __ASSET__assets_images_a3_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a4.png") @:noCompletion #if display private #end class __ASSET__assets_images_a4_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a5.png") @:noCompletion #if display private #end class __ASSET__assets_images_a5_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a6.png") @:noCompletion #if display private #end class __ASSET__assets_images_a6_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a7.png") @:noCompletion #if display private #end class __ASSET__assets_images_a7_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a8.png") @:noCompletion #if display private #end class __ASSET__assets_images_a8_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/a9.png") @:noCompletion #if display private #end class __ASSET__assets_images_a9_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b0.png") @:noCompletion #if display private #end class __ASSET__assets_images_b0_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b1.png") @:noCompletion #if display private #end class __ASSET__assets_images_b1_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b10.png") @:noCompletion #if display private #end class __ASSET__assets_images_b10_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b11.png") @:noCompletion #if display private #end class __ASSET__assets_images_b11_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b12.png") @:noCompletion #if display private #end class __ASSET__assets_images_b12_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b13.png") @:noCompletion #if display private #end class __ASSET__assets_images_b13_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b2.png") @:noCompletion #if display private #end class __ASSET__assets_images_b2_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b3.png") @:noCompletion #if display private #end class __ASSET__assets_images_b3_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b4.png") @:noCompletion #if display private #end class __ASSET__assets_images_b4_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b5.png") @:noCompletion #if display private #end class __ASSET__assets_images_b5_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b6.png") @:noCompletion #if display private #end class __ASSET__assets_images_b6_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b7.png") @:noCompletion #if display private #end class __ASSET__assets_images_b7_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b8.png") @:noCompletion #if display private #end class __ASSET__assets_images_b8_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/b9.png") @:noCompletion #if display private #end class __ASSET__assets_images_b9_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/background.png") @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/btIniciar1.png") @:noCompletion #if display private #end class __ASSET__assets_images_btiniciar1_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/btIniciar2.png") @:noCompletion #if display private #end class __ASSET__assets_images_btiniciar2_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/btIniciar3.png") @:noCompletion #if display private #end class __ASSET__assets_images_btiniciar3_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/verso.png") @:noCompletion #if display private #end class __ASSET__assets_images_verso_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_fonth__ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_fonth__ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/FONTH_"; #else ascender = 890; descender = -270; height = 1160; numGlyphs = 259; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 1000; #end name = "Fontdinerdotcom Huggable"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_fonth__ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_fonth__ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_fonth__ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_fonth__ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_fonth__ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_fonth__ttf ()); super (); }}

#end

#end
#end

#end

#end