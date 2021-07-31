class Rectangle extends Shape {
  float rectWidth;
  float rectHeight;
  Rectangle(float x, float y, float w, float h){
    super();
    setPosition(x,y);
    rectWidth = w;
    rectHeight = h;
    shape = createShape(RECT, position.x, position.y, rectWidth, rectHeight);
  }
  
  void setWidth(float w){
    rectWidth = w;
    shape.width = w;
  }
  void setHeight(float h){
    shape.height = h;
    rectHeight = h;
  }
  float getWidth(){
    return this.rectWidth;
  }
  float getHeight(){
    return this.rectHeight;
  }
  
  void display(){
    fill(shapeColor);
    shape(shape);
  }
    
  
}
