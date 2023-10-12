package models;

import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class Card extends Sprite {
	public var image:BitmapData;
	public var backSide:Bitmap = new Bitmap(Assets.getBitmapData("assets/images/verso.png"));
	public var revealed:Bool = false;
	public var cardNumber:Int;

	public function new(Image:BitmapData, cardNumber:Int) {
		super();
		this.image = Image;
		this.cardNumber = cardNumber;
		addChild(new Bitmap(image));
		addChild(backSide);
	}
}
