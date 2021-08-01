class Shape {
  color shapeColor;
  color strokeColor;
  PVector position;
  PVector velocity;
  PVector center;
  Shape(){
    position = new PVector();
    velocity = new PVector();
    center = new PVector();
  }
  
  void setColor(color c){
    shapeColor = c;
  }
  color getColor(){
    return shapeColor;
  }
  void setStrokeColor(color c){
    strokeColor = c;
  }
  color getStrokeColor(){
    return strokeColor;
  }
  
  void setPosition(float x, float y){
    position.x = x;
    position.y = y;
  }
  float getX (){
   return position.x; 
  }
  float getY (){
   return position.y; 
  }
  
  void offSet(float x, float y) {
    position.x += x;
    position.y += y;
  }
  
  void rotateShape(float deg){
    pushMatrix();
    translate(this.center.x, this.center.y);
    rotate(radians(deg));
    popMatrix();
    
  }
  
  
}
