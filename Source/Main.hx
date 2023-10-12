package;

import models.Card;
import components.StartGameButton;
import components.TextBox;
import components.CardDeck;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.SimpleButton;
import openfl.events.MouseEvent;
import openfl.Assets;

class Main extends Sprite {
	private var cardNumber:Int = 14;
	private var cards:Array<Card> = [];
	private var cardsContainer:Sprite;
	private var startButton:SimpleButton;
	private var flippedCard1:Card;
	private var flippedCard2:Card;
	private var wrongPlays:Int = 0;
	private var rightPlays:Int = 0;

	public function new() {
		super();

		var background = new Bitmap(Assets.getBitmapData("assets/images/background.png"));
		addChild(background);

		background.width = stage.stageWidth;
		background.height = stage.stageHeight;

		TextBox.playsCount(wrongPlays, rightPlays);

		startButton = StartGameButton.createStartButton();
		addChild(startButton);

		cards = CardDeck.getCardDeck(cards, cardNumber);
		cards = CardDeck.suffleDeck(cards);

		startButton.addEventListener(MouseEvent.CLICK, onIniciarClick);
	}

	private function onIniciarClick(event:MouseEvent):Void {
		startButton.visible = false;
		cardsContainer = new Sprite();
		CardDeck.createCards(cards, flippedCard1, flippedCard2, rightPlays, wrongPlays, cardsContainer, cardNumber, stage);
		addChild(cardsContainer);
	}
}
