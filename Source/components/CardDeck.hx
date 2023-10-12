package components;

import openfl.display.Stage;
import openfl.display.Sprite;
import haxe.Timer;
import openfl.events.MouseEvent;
import openfl.Assets;
import models.Card;

class CardDeck {
	public static function getCardDeck(cards:Array<Card>, cardNumber:Int) {
		for (i in 0...cardNumber) {
			var animalImage = Assets.getBitmapData("assets/images/a" + i + ".png");
			var animalName = Assets.getBitmapData("assets/images/b" + i + ".png");

			cards.push(new Card(animalImage, i));
			cards.push(new Card(animalName, i));
		}
		return cards;
	}

	public static function suffleDeck(cards:Array<Card>) {
		for (i in 0...cards.length - 1) {
			var randomIndex = Math.floor(Math.random() * cards.length);
			var temp = cards[i];
			cards[i] = cards[randomIndex];
			cards[randomIndex] = temp;
		}
		return cards;
	}

	public static function createCards(cards:Array<Card>, flippedCard1:Card, flippedCard2:Card, rightPlays:Int, wrongPlays:Int, cardsContainer:Sprite, cardNumber:Int, stage:Stage):Void {
		var cartaWidth:Float = 150;
		var cartaHeight:Float = 130;
		var numRows:Int = 4;
		var numCols:Int = 7;
		var horizontalSpacing:Float = 10;
		var verticalSpacing:Float = 10;

							
		var totalWidth:Float = numCols * cartaWidth + (numCols - 1) * horizontalSpacing;
		var totalHeight:Float = numRows * cartaHeight + (numRows - 1) * verticalSpacing;
								
		var startX:Float = (stage.stageWidth - totalWidth) / 2;
		var startY:Float = (stage.stageHeight - totalHeight) / 2;

		for (i in 0...cards.length) {
			var card = cards[i];

			var col:Int = i % numCols;
			var row:Int = Std.int(i / numCols);		
						   
			var posX:Float = startX + col * (cartaWidth + horizontalSpacing);
			var posY:Float = startY + row * (cartaHeight + verticalSpacing);

			card.x = posX;
			card.y = posY;

			card.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
				var selectedCard:Card = e.currentTarget;
				if (selectedCard.revealed || (flippedCard1 != null && flippedCard2 != null)) {
					return;
				}

				if (flippedCard1 == null) {
					flippedCard1 = selectedCard;
					flippedCard1.backSide.visible = false;
					flippedCard1.revealed = true;
				} else {
					flippedCard2 = selectedCard;
					flippedCard2.backSide.visible = false;
					flippedCard2.revealed = true;

					if (flippedCard1.cardNumber == flippedCard2.cardNumber) {
						flippedCard1 = null;
						flippedCard2 = null;
						rightPlays++;
						TextBox.playsCount(wrongPlays, rightPlays);
						if (rightPlays == cardNumber) {
							TextBox.finalMessageBox(wrongPlays, rightPlays);
						}
					} else {
						wrongPlays++;
						trace(wrongPlays);
						var timer = new Timer(500);
						timer.run = function() {
							flippedCard1.backSide.visible = true;
							flippedCard2.backSide.visible = true;
							flippedCard1.revealed = false;
							flippedCard2.revealed = false;
							flippedCard1 = null;
							flippedCard2 = null;
							TextBox.playsCount(wrongPlays, rightPlays);

							timer.stop();
						};
					};
				}
			});

			// card.addEventListener(MouseEvent.CLICK,);

			cardsContainer.addChild(card);
		}
	}

	public static function flipCard(e:MouseEvent, flippedCard1:Card, flippedCard2:Card, rightPlays:Int, wrongPlays:Int) {
		var selectedCard:Card = e.currentTarget;
		if (selectedCard.revealed || (flippedCard1 != null && flippedCard2 != null)) {
			return;
		}

		if (flippedCard1 == null) {
			flippedCard1 = selectedCard;
			flippedCard1.backSide.visible = false;
			flippedCard1.revealed = true;
			
		} else {
			flippedCard2 = selectedCard;
			flippedCard2.backSide.visible = false;
			flippedCard2.revealed = true;

			if (flippedCard1.cardNumber == flippedCard2.cardNumber) {
				flippedCard1 = null;
				flippedCard2 = null;
				rightPlays++;
				TextBox.playsCount(wrongPlays, rightPlays);
				if (rightPlays == 1) {
					TextBox.finalMessageBox(wrongPlays, rightPlays);
				}
			} else {
				
				wrongPlays++;
				trace(wrongPlays);
				var timer = new Timer(500);
				timer.run = function() {
					flippedCard1.backSide.visible = true;
					flippedCard2.backSide.visible = true;
					flippedCard1.revealed = false;
					flippedCard2.revealed = false;
					flippedCard1 = null;
					flippedCard2 = null;
					TextBox.playsCount(wrongPlays, rightPlays);

					timer.stop();
				};
			};
		}
	}
}
