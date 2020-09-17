class Tower {
  float r, rate, dmg;
  PVector pos;
  Creep target;

  //Shop
  int price;
  String name = "";

  //Graphics
  PVector targetDir;
  float dir;

  Tower() {
  }

  Tower(PVector position) {
    pos = position;
  }

  void display() {
    //    rectMode(CENTER);
    //    rect (pos.x + gSize/2, pos.y + gSize/2, 25, 25);
  }


  void calcDir() {
    if (target != null) {
      targetDir = new PVector (target.pos.x - pos.x, target.pos.y - pos.y);
      dir = targetDir.heading();
    }
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
    r = 250;
    rate = 3;
    dmg = 1.5;
    price = 75;
    name = "MG Tower";
  }

  void display() {
    rectMode(CENTER);
    fill(120);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);

    //Turret
    pushMatrix();
    translate(pos.x + gSize/2, pos.y + gSize / 2);
    rotate(dir);
    fill(40);
    rect(0, 0, 9, 9);
    rect (10, 0, 20, 4);
    popMatrix();
  }
}

class Gatling extends Tower {
  Gatling() {
    r = 150;
    rate = 10;
    dmg = 0.6;
    price = 150;
    name = "Gatling Turret";
  }

  void display() {
    rectMode(CENTER);
    fill(120);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);

    //Turret
    pushMatrix();
    translate(pos.x + gSize/2, pos.y + gSize / 2);
    rotate(dir);
    fill(40);
    rect(0, 0, 6, 12);
    rect(6, 3, 14, 3);
    rect(6, -3, 14, 3);
    popMatrix();
  }
}

class Sniper extends Tower {
  Sniper() {
    r = 950;
    rate = 0.4;
    dmg = 8;
    price = 400;
    name = "Sniper nest";
  }

  void display() {
    rectMode(CENTER);
    fill(120);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);

    //Turret
    pushMatrix();
    translate(pos.x + gSize/2, pos.y + gSize / 2);
    rotate(dir);
    fill(40);
    rect(0, 0, 12, 12);
    rect (10, 0, 23, 5);
    rect(23, 0, 7, 7);
    popMatrix();
  }
}

class Freezer extends Tower {
  Freezer() {
    r = 175;
    rate = 1;
    dmg = 1.5;
    price = 500;
    name = "Freezer";
  }

  void shoot() {
    cooldown -= 1/frameRate;
    if (target == null) {
      for (int i =0; i<creeps.size(); i++) {
        if (dist(creeps.get(creeps.size()-1-i).pos.x+25, creeps.get(creeps.size()-1-i).pos.y+25, pos.x + gSize/2, pos.y + gSize/2) <= r/2 && !creeps.get(creeps.size()-1-i) .slowed) {
          target = creeps.get(creeps.size()-1-i);
        }
      }
    } else {
      if (cooldown <= 0) {
        target.slowed = true;
        cooldown = 1/rate;
        strokeWeight(9);
        stroke(0, 0, 250);
        line(target.pos.x + 25, target.pos.y + 25, pos.x+25, pos.y+25);
        stroke(0, 0, 0, 50);
        strokeWeight(1);
        target = null;
      }
      if (target != null && dist(target.pos.x+25, target.pos.y+25, pos.x + gSize/2, pos.y + gSize/2) > r/2) {
        target = null;
      }

      if (target != null && target.hp <= 0)
        target = null;
    }
  }


  void display() {
    rectMode(CENTER);
    fill(120);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);

    //Turret
    pushMatrix();
    translate(pos.x + gSize/2, pos.y + gSize / 2);
    rotate(dir);
    fill(40);
    rect(0, 0, 15, 15);
    rect (10, 0, 20, 10);
    popMatrix();
  }
}

class Bank extends Tower {

  int waveC;
  int goldToAdd = 25;

  Bank() {
    waveC = gm.wave;
    price = 500;
    name = "Bank";
  }

  void display() {
    fill(120);
    rectMode(CENTER);
    rect(pos.x + gSize/2, pos.y + gSize/2, 25, 25);
    textAlign(CENTER, CENTER);
    textSize(22);
    fill(255, 255, 20);
    text("$", pos.x + gSize/2, pos.y + gSize/2 - 3);
  }

  void shoot() {
    if (gm.wave > waveC) {
      gm.gold += goldToAdd;
      waveC = gm.wave;
    }
  }
}
class Spike extends Tower {
  Spike() {
    r = 250;
    rate = 7;
    dmg = 0.5;
    price = 75;
    name = "Spike Tower";
  }

  void display() {
    rectMode(CENTER);
    fill(120);
    ellipse(pos.x + gSize/2, pos.y + gSize/2, 35, 35);

    //Turret
    pushMatrix();
    translate(pos.x + gSize/2, pos.y + gSize / 2);
    rotate(dir);
    fill(40);
    ellipse(0, 0, 15, 15);
    for (float i = 0; i<PI*2; i= i+PI/12) {
      rotate(i);
      rect (10, 0, 20, 4);
    }

    popMatrix();
  }
  void shoot() {
    cooldown -= 1/frameRate;
    if (cooldown <= 0) {
      for (int i =0; i<creeps.size(); i++) {
        if ( dist(creeps.get(i).pos.x+25, creeps.get(i).pos.y+25, pos.x + gSize/2, pos.y + gSize/2) <= r/2) {
          creeps.get(i).hp-=dmg;
          cooldown = 1/rate;
          strokeWeight(9);
          stroke(0, 0, 250);
          line(creeps.get(i).pos.x + 25, creeps.get(i).pos.y + 25, pos.x+25, pos.y+25);
          stroke(0, 0, 0, 50);
          strokeWeight(1);
        }
      }
    }
  }
}
class SuperLuperDuber extends Tower {
  SuperLuperDuber() {
    r = 400;
    rate = 10;
    dmg = 5;
    price = 10000;
    name = "SLD Tower";
  }

  void display() {


    //Turret
    pushMatrix();
    translate(pos.x + gSize/2, pos.y + gSize / 2);
    rotate(dir);
    rectMode(CENTER);
    fill(120);
    triangle(-gSize/2 , gSize/3,-gSize/2 , -gSize/3 , gSize/2,  0);
    fill(40);
    rect(-gSize/4, 0, 9, 9);
    rect (gSize/20, 0, 20, 8);
    popMatrix();
  }
}
