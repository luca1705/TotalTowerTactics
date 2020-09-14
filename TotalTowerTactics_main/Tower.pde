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


  float cooldown = 0;
  void shoot() {
    cooldown -= 1/frameRate;
    if (target == null) {
      for (int i =0; i<creeps.size(); i++) {
        if (dist(creeps.get(creeps.size()-1-i).pos.x+25, creeps.get(creeps.size()-1-i).pos.y+25, pos.x + gSize/2, pos.y + gSize/2) <= r/2) {
          target = creeps.get(creeps.size()-1-i);
        }
      }
    } else {
      if (cooldown <= 0) {
        target.hp-=dmg;
        cooldown = 1/rate;
        strokeWeight(5);
        stroke(200, 200, 0);
        line(target.pos.x + 25, target.pos.y + 25, pos.x+25, pos.y+25);
        stroke(0, 0, 0, 50);
        strokeWeight(1);
      }
      if (dist(target.pos.x+25, target.pos.y+25, pos.x + gSize/2, pos.y + gSize/2) > r/2) {
        target = null;
      }

      if (target != null && target.hp <= 0)
        target = null;
    }
  }
}


//Machinegun Turret
class MG extends Tower {
  MG() {
    r = 200;
    rate = 4;
    dmg = 1;
  }

  void display() {
    rectMode(CENTER);
    fill(100, 200, 150);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);
    noFill();
    ellipse(pos.x + gSize/2, pos.y + gSize/2, r, r);
  }
}

class Hyper extends Tower {
  Hyper() {
    r = 150;
    rate = 8;
    dmg = 1;
  }

  void display() {
    rectMode(CENTER);
    fill(100, 200, 150);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);
    noFill();
    ellipse(pos.x + gSize/2, pos.y + gSize/2, r, r);
  }
}

class Sniper extends Tower {
  Sniper() {
    r = 600;
    rate = 0.5;
    dmg = 1;
  }

  void display() {
    rectMode(CENTER);
    fill(100, 200, 150);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);
    noFill();
    ellipse(pos.x + gSize/2, pos.y + gSize/2, r, r);
  }
}
