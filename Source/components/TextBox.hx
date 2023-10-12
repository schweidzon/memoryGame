package components;

import openfl.text.TextFormatAlign;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.filters.DropShadowFilter;
import openfl.display.Sprite;

class TextBox {
	public static function playsCount(wrongPlays:Int, rightPlays:Int):Sprite {
		var component:Sprite = new Sprite();

		var boxWidth:Float = 100;
		var boxHeight:Float = 60;

		component.graphics.beginFill(0xCCCCCC);
		component.graphics.drawRoundRect(0, 0, boxWidth, boxHeight, 10, 10);
		component.graphics.endFill();

		var shadow:DropShadowFilter = new DropShadowFilter();
		shadow.distance = 4;
		shadow.angle = 45;
		shadow.color = 0x000000;
		shadow.alpha = 0.7;
		shadow.blurX = 4;
		shadow.blurY = 4;
		component.filters = [shadow];

		var text:String = "Erros: " + wrongPlays + "\nAcertos: " + rightPlays;
		var format:TextFormat = new TextFormat();
		format.size = 16;
		format.color = 0x000000;
		format.align = TextFormatAlign.CENTER;

		var label:TextField = new TextField();
		label.defaultTextFormat = format;
		label.text = text;

		label.width = boxWidth;
		label.height = boxHeight;
		label.x = 5;
		label.y = 5;

		component.addChild(label);

		var topMargin:Float = 5;
		var rightMargin:Float = 5;
		component.x = Lib.current.stage.stageWidth - boxWidth - rightMargin;
		component.y = topMargin;

		Lib.current.addChild(component);

		return component;
	}

	public static function finalMessageBox(wrongPlays:Int, rightPlays:Int):Sprite {
		var finalMessage:Sprite = new Sprite();

		var boxWidth:Float = 480;
		var boxHeight:Float = 140;

		finalMessage.graphics.beginFill(0xCCCCCC);
		finalMessage.graphics.drawRoundRect(0, 0, boxWidth, boxHeight, 10, 10);
		finalMessage.graphics.endFill();

		var shadow:DropShadowFilter = new DropShadowFilter();
		shadow.distance = 4;
		shadow.angle = 45;
		shadow.color = 0x000000;
		shadow.alpha = 0.7;
		shadow.blurX = 4;
		shadow.blurY = 4;
		finalMessage.filters = [shadow];

		var text:String = "Parabéns, você ganhou com " + (wrongPlays + rightPlays) + " jogadas!";
		var format:TextFormat = new TextFormat();
		format.size = 25;
		format.color = 0x000000;
		format.align = TextFormatAlign.CENTER;

		var label:TextField = new TextField();
		label.defaultTextFormat = format;
		label.wordWrap = true;
		label.text = text;

		label.width = boxWidth;
		label.height = boxHeight - 20;
		label.y = 50;

		finalMessage.addChild(label);

		finalMessage.x = (Lib.current.stage.stageWidth - boxWidth) / 2;
		finalMessage.y = (Lib.current.stage.stageHeight - boxHeight) / 2;

		Lib.current.addChild(finalMessage);

		return finalMessage;
	}
}
