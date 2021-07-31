import java.util.*;

Kente digiKente = new Kente();
Patch p;
PixelArrow pa;
Rectangle r;
PVector loc;
void setup() {
  fullScreen();
  background(70);
  p = new ArrowPatch((width/2)- (width/16), (height/2)-(height/8));
  r = new Rectangle((width/2)- (width/16), (height/2)-(height/8), 25,25);
  loc = new PVector();
  loc.x = (width/16)-(width/112);
  loc.y = 0;
  pa = new PixelArrow(loc,p);

  
  
}

void draw() {
  //color c = color(255, 0, 0);
  //p.linesOverlay(c);
  //r.setColor(255);
  //r.display();
  p.display();
  if(mousePressed) exit();
}
