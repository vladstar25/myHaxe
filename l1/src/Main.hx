package;
 
import js.Browser;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.MouseEvent;
import js.Lib;
 
class Main extends Sprite {
public static function main() {
	var count:Int = 5;	
	var maxXPosition:Int = Math.round(Browser.window.innerWidth); 
	var maxYPosition:Int = Math.round(Browser.window.innerHeight);	
	var myParent:Int = 0;
	
	bums(myParent, count, maxXPosition, maxYPosition);	
}

public static function bums (myParent:Int, count:Int, maxXPosition:Int, maxYPosition:Int){
	var kubs:Array<Kvadrat> = new Array();
	for (i in 0...count) {
		var x1:Int = Std.random(maxXPosition);
		var x2:Int = x1 + 50;
		var y1:Int = Std.random(maxYPosition);
		var y2:Int = y1 + 50;
		if (count!=0){
			kubs[i] = new Kvadrat(x1, y1, x2, y2, myParent);
			openfl.Lib.current.addChild(kubs[i]);
			bums(kubs[i].number, count-1, maxXPosition, maxYPosition); //рекурсивный вызов 
		} else {
			trace(kubs.length);
		}
 	}
 }
}

class Kvadrat extends Sprite {

public static var counter: Int = 0;

public var number: Int;
var myParent: Int;
var x1:Int;	var y1:Int;
var x2:Int;	var y2:Int;

public function new (x1:Int, y1:Int, x2:Int, y2:Int, myParent:Int){
	super();
	Kvadrat.counter++;
	this.myParent = myParent;
	this.number = Kvadrat.counter;
	addEventListener(MouseEvent.MOUSE_DOWN, function(e){trace(this.number+" -> "+this.myParent); e.stopPropagation(); }); //Browser.alert(this.number+" -> "+this.myParent)
	this.x1 = x1;
	this.y1 = y1;
	this.x2 = x2;
	this.y2 = y2;

	graphics.beginFill(Math.round(Math.random() * 0xFFFFFF));
	graphics.moveTo(x1,y1); // Откуда будем рисовать,  Левый верхний угол
	graphics.lineTo(x2,y1); // Правый верхний угол
	graphics.lineTo(x2,y2); // Правый нижний угол
	graphics.lineTo(x1,y2); // Левый нижний угол
	graphics.endFill();	
}
} 