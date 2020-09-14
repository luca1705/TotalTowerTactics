class Tower {
  float r, rate, dmg;
  PVector pos;
  Creep target;
  
  Tower(){
  }

  Tower(PVector position) {
    pos = position;
  }

  void targetCreep() {

    for (int i = 0; i < creeps.size(); i++) {

    }
  }

  void display() {
    rectMode(CENTER);
    rect (pos.x + gSize/2, pos.y + gSize/2, 25, 25);
  }
}


//Machinegun Turret
class MG extends Tower {

  MG() {
    r = 100;
    rate = 3;
    dmg = 1;
  }

  void display() {
    rectMode(CENTER);
    fill(100);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);
  }
}
