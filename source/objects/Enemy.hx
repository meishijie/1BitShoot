package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import states.PlayState;

class Enemy extends FlxSprite {
    // setup the example
	public override function new(?X:Float = 0, ?Y:Float = 0):Void {
		super(X, Y);
        makeGraphic(50,50,FlxColor.RED);
		
	}

	public override function destroy():Void {
		super.destroy();
	}

	// update() method is called every frame
	public override function update(elapsed:Float):Void{
		this.velocity.x =1000;
		if(!this.isOnScreen()){
			this.kill();
		}
		super.update(elapsed);
		FlxG.overlap(PlayState.bulletPool,this,hitBullets);
	}

	private function hitBullets(bullets:FlxSprite,me:Enemy){
		bullets.kill();
		this.kill();
	}

}