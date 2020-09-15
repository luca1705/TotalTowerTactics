class Base {
  int HP;
  PVector pos;
  
  Base (PVector position){
    pos = new PVector (position.x * 50, position.y * 50);
  }
  
  void display(){
    fill(155);
    rectMode(CORNER);
    rect(pos.x, pos.y, 50, 50);
    fill(0);
    textAlign(CENTER);
    text(HP, pos.x + 25, pos.y+35);
  }
}
