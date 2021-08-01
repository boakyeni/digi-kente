class Rectangle extends Shape {
  float rectWidth;
  float rectHeight;
  Rectangle(float x, float y, float w, float h){
    super();
    setPosition(x,y);
    rectWidth = w;
    rectHeight = h;
  }
  
  void setWidth(float w){
    rectWidth = w;
    
  }
  void setHeight(float h){
    if(h > 0){
      rectHeight = h;
    }else {
      rectHeight = 0;
    }
  }
  float getWidth(){
    return this.rectWidth;
  }
  float getHeight(){
    return this.rectHeight;
  }
  
  void display(){
    if(this.rectHeight != 0){
      fill(shapeColor);
      stroke(strokeColor);
      rect(position.x, position.y, rectWidth, rectHeight);
    }else{
      stroke(0, 0);
      noFill();
      rect(position.x, position.y, rectWidth, 0);
    }
  }
    
  
}
