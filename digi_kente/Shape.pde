class Shape {
  PShape shape;
  color shapeColor;
  PVector position;
  Shape(){
    shape = new PShape();
    position = new PVector();
  }
  
  void setColor(color c){
    shapeColor = c;
    shape.setFill(c);
  }
  
  void setPosition(float x, float y){
    shape.translate(x,y);
    position.x += x;
    position.y += y;
  }
  void rotateShape(float rad){
    shape.rotate(rad);
  }
  
  
}
