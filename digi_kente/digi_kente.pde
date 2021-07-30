import java.util.*;

Kente digiKente = new Kente();
Patch p;
void setup() {
  fullScreen();
  background(0);
  p = new Patch((width/2)- (width/16), (height/2)-(height/8));
  p.display();
  
}

void draw() {
  color c = color(255, 0, 0);
  p.linesOverlay(c);
}
