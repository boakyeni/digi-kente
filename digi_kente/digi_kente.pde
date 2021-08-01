import java.util.*;


Kente digiKente = new Kente();
Patch p;
PixelArrow pa;
Rectangle r;
color gold = color(218,165,32);
PVector loc;
void setup() {
  fullScreen(P2D);
  
  p = new ArrowPatch((width/2)- (width/16), (height/2)-(height/8));
  r = new Rectangle((width/2)- (width/16), (height/2)-(height/8), 25,25);
  loc = new PVector();
  loc.x = (width/16)-(width/112);
  loc.y = 0;
  pa = new PixelArrow(loc,p);

  
  
}

void draw() {
  background(gold);
  //color c = color(255, 0, 0);
  //p.linesOverlay(c);
  //r.setColor(255);
  //r.display();
  p.display();
  p.update();
  
  
  if(mousePressed) exit();
}
