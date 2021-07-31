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
    fill(shapeColor);
    stroke(strokeColor);
    if(rectHeight != 0){
      stroke(strokeColor);
      rect(position.x, position.y, rectWidth, rectHeight);
    }else{
      stroke(0, 0);
      rect(position.x, position.y, rectWidth, rectHeight);
    }
  }
    
  
}
