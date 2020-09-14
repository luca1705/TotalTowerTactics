class Tower {
  float r, rate, dmg;
  PVector pos;
  Creep target;

  Tower() {
  }

  Tower(PVector position) {
    pos = position;
  }

  void display() {
    rectMode(CENTER);
    rect (pos.x + gSize/2, pos.y + gSize/2, 25, 25);
  }
  void check() {

    for (int i =0; i<creeps.size(); i++) {

      if (dist(creeps.get(i).pos.x, creeps.get(i).pos.y, pos.x + gSize/2, pos.y + gSize/2)<r) {
        println("true");
      }
    }
  }
}


//Machinegun Turret
class MG extends Tower {

  MG() {
    r = 200;
    rate = 3;
    dmg = 1;
  }

  void display() {
    rectMode(CENTER);
    fill(100, 200, 150);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);
    noFill();
    ellipse(pos.x + gSize/2, pos.y + gSize/2, r, r);
  }
  void check() {

    if (target == null) {
      for (int i =0; i<creeps.size(); i++) {
        if (dist(creeps.get(creeps.size()-1-i).pos.x+25, creeps.get(creeps.size()-1-i).pos.y+25, pos.x + gSize/2, pos.y + gSize/2) <= r/2) {
          target = creeps.get(creeps.size()-1-i);
        }
      }
    } else {
      line(target.pos.x + 25, target.pos.y + 25, pos.x+25, pos.y+25);

      target.hp =target.hp-(5/ frameRate);
      println(target.hp);

      if (dist(target.pos.x+25, target.pos.y+25, pos.x + gSize/2, pos.y + gSize/2) > r/2) {
        target = null;
      }

      if (target != null && target.hp <= 0)
        target = null;
      //target = null;
    }
  }
}
