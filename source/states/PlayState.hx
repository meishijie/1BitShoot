// This simple example uses HaxeFlixel

// Copyright © 2014 John Watson (Example in JS and Assets)
// Copyright © 2014 Christopher Kaster (Port to HaxeFlixel)
// Licensed under the terms of the MIT License

package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.math.FlxAngle;
import objects.Enemy;

class PlayState extends FlxState {

	// a sprite that represents our gun
	private var gun:FlxSprite;

	// group that contains the bullets
	public static var bulletPool(default,null):FlxTypedGroup<FlxSprite>;
	public static var enemyPool(default,null):FlxTypedGroup<Enemy>;

	// variable to track the elapsed time
	private var elapsed:Float = 0xFFFF;

	// define constants
	private var SHOT_DELAY = 0.01; // 100ms
	private var BULLET_SPEED = 1000;
	private var NUMBER_OF_BULLETS = 2;
	private var NUMBER_OF_ENEMYS = 1;

	// setup the example
	public override function create():Void {
		super.create();

		// set stage background to something sky colored
		FlxG.cameras.bgColor = 0xFF4488CC; // ARGB
		
		// create the gun sprite
		gun = new FlxSprite(FlxG.width/2, FlxG.height);
		gun.y = FlxG.height - 100;
		gun.loadGraphic("assets/bullet.png");

		// create a pool of bullets that we can shoot
		bulletPool = new FlxTypedGroup<FlxSprite>();
		enemyPool = new FlxTypedGroup<Enemy>();

		// fill the bulletPool with the maximum number of bullets that can exist at once
		for(i in 0...NUMBER_OF_BULLETS) {
			// create bullet
			var bullet = new FlxSprite(gun.x, gun.y);
			bullet.loadGraphic("assets/bullet.png");

			// add bullet to pool
			bulletPool.add(bullet);

			// set its initial state to "dead" - it will be revived when it's shot
			bullet.kill();
		}
		for(i in 0...NUMBER_OF_ENEMYS) {
			// create bullet
			var enemy = new Enemy(0, 0);
			enemy.loadGraphic("assets/bullet.png");

			// add bullet to pool
			enemyPool.add(enemy);

			// set its initial state to "dead" - it will be revived when it's shot
			enemy.kill();
		}

		// add gun and bulletPool to this FlxState (this is what causes them to update and draw)
		add(gun);
		add(bulletPool);
		add(enemyPool);
	}

	public override function destroy():Void {
		super.destroy();
	}

	// update() method is called every frame
	public override function update(elapsed:Float):Void{
		makeEnemy();
		// set the gun angle
		gun.angle = FlxAngle.angleBetweenMouse(gun, true);

		// if primary mouse button is pressed and enough time has elapsed since last shot
		if(FlxG.mouse.justReleased && elapsed >= SHOT_DELAY) {
			shootBullet();
		}

		// if a bullet is alive and not on screen, kill it!
		for(bullet in bulletPool) {
			if(bullet.alive && !bullet.isOnScreen(FlxG.camera)) {
				bullet.kill();
			}
		}
		super.update(elapsed);
	}

	private function shootBullet():Void {
		// get a dead bullet from the pool
		var bullet:FlxSprite = cast bulletPool.getFirstDead();

		// if there is no dead bullet return
		if(bullet == null) {
			return;
		}
		// mark bullet as alive
		bullet.revive();
		// set the bullet position to the gun position.
		bullet.reset(gun.x, gun.y);
		MoveToAngle(bullet);
		
	}
	private function makeEnemy(){
		// get a dead bullet from the pool
		var e:Enemy = cast enemyPool.getFirstDead();

		// if there is no dead bullet return
		if(e == null) {
			return;
		}
		// mark bullet as alive
		e.revive();
		// set the bullet position to the gun position.
		e.reset(0, 50);
	}
	private function MoveToAngle(obj:FlxSprite){
		//向某个方向移动
		// set the  angle
		obj.angle = FlxAngle.angleBetweenMouse(obj, true);
		// shoot in the right direction! Peng!
		obj.velocity.x = Math.cos(obj.angle * FlxAngle.TO_RAD) * BULLET_SPEED;
		obj.velocity.y = Math.sin(obj.angle * FlxAngle.TO_RAD) * BULLET_SPEED;
	}

}
