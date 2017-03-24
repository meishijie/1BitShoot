package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/area02_level_tiles2.png", "assets/area02_level_tiles2.png");
			type.set ("assets/area02_level_tiles2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/bullet.png", "assets/bullet.png");
			type.set ("assets/bullet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/lizardhead3.png", "assets/lizardhead3.png");
			type.set ("assets/lizardhead3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/lurkmonsta.png", "assets/lurkmonsta.png");
			type.set ("assets/lurkmonsta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/mapCSV_Group1_Map1.csv", "assets/mapCSV_Group1_Map1.csv");
			type.set ("assets/mapCSV_Group1_Map1.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
