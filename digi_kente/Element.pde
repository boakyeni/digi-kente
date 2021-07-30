class Element {
  /*
   * Elements are patterns found on patches. They can have multiple
   * colors. 
   */
  float x, y;
  ArrayList<Integer> colors = new ArrayList<Integer>();
  Element(){
    
  }
  
  void place(float x,float y) {
    this.x = x;
    this.y = y;
  }
}
