package components;

import openfl.Lib;
import openfl.display.SimpleButton;
import openfl.display.Bitmap;
import openfl.Assets;

class StartGameButton {
    public static function createStartButton():SimpleButton {
        var imagemIniciar1 = new Bitmap(Assets.getBitmapData("assets/images/btIniciar1.png"));
        var imagemIniciar2 = new Bitmap(Assets.getBitmapData("assets/images/btIniciar2.png"));
        var imagemIniciar3 = new Bitmap(Assets.getBitmapData("assets/images/btIniciar3.png"));
        var iniciarButton:SimpleButton = new SimpleButton(imagemIniciar1, imagemIniciar2, imagemIniciar3, imagemIniciar1);

        iniciarButton.x = (Lib.current.stage.stageWidth - iniciarButton.width) / 2;
        iniciarButton.y = (Lib.current.stage.stageHeight - iniciarButton.height) / 2;
        

        return iniciarButton;
    }
}
