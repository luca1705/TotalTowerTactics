ArrayList<Creep> creeps = new ArrayList<Creep>(); 

class Creep {
  float speed, hp = 1;
  int step, maxStep;
  PVector pos;
  int farve_r, farve_g, farve_b;
  int cashOnKill;

  Creep() {
  }

  Creep(PVector Offset) {
    step = 0;
    hp = 10;
    speed = 1.75;
    cashOnKill = 10;
    farve_r = 0;
    farve_g = 0;
    farve_b = 0;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }

  void display() {
    ellipseMode(CENTER);
    fill(farve_r, farve_g, farve_b);
    ellipse(pos.x+25, pos.y+25, 20, 20);
  }

  void move() {
    PVector dir = new PVector(0, 0);
    if (step < maxStep-1) {
      dir = new PVector(gridRoute[step+1].x-gridRoute[step].x, gridRoute[step+1].y-gridRoute[step].y);
      dir.normalize();

      if (pos.x <= gridRoute[step+1].x * 50 +speed &&
        pos.x >= gridRoute[step+1].x * 50 - speed &&
        pos.y <= gridRoute[step+1].y * 50 + speed &&
        pos.y >= gridRoute[step+1].y * 50 - speed) {
        step++;
      }
    } else {
      creeps.remove(this);
      b.HP--;
    }

    pos.add(new PVector(dir.x * speed, dir.y*speed));
    maxStep = gridRoute.length;
  }

  void health() {
    if (hp <= 0) {
      gm.gold += cashOnKill;
      creeps.remove(this);
    }
  }
}


class Sonic extends Creep {
  Sonic(PVector Offset) {
    cashOnKill = 15;
    hp = 7;
    speed = 3.5;
    step = 0;
    farve_r = 255;
    farve_g = 0;
    farve_b = 0;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }
}
class Tank extends Creep {
  Tank(PVector Offset) {

    cashOnKill = 30;
    hp = 23;
    speed = 1.1;

    step = 0;
    farve_r = 201;
    farve_g = 201;
    farve_b = 201;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }
}

class megaUltraDestroyer extends Creep {
  megaUltraDestroyer(PVector Offset) {

    cashOnKill = 30;
    hp = 50;
    speed = 1.7;

    step = 0;
    farve_r = 247;
    farve_g = 15;
    farve_b = 236;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }
}
class shortSprinter extends Creep {
  shortSprinter (PVector Offset) {

    cashOnKill = 30;
    hp = 5;
    speed = 10;

    step = 0;
    farve_r = 255;
    farve_g = 255;
    farve_b = 255;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }
  void move() {
    PVector dir = new PVector(0, 0);
    if (step < maxStep-1) {
      dir = new PVector(gridRoute[step+1].x-gridRoute[step].x, gridRoute[step+1].y-gridRoute[step].y);
      dir.normalize();
      if (step>(maxStep-1)/2) {
        speed = 1;
      }
      if (pos.x <= gridRoute[step+1].x * 50 +speed &&
        pos.x >= gridRoute[step+1].x * 50 - speed &&
        pos.y <= gridRoute[step+1].y * 50 + speed &&
        pos.y >= gridRoute[step+1].y * 50 - speed) {
        step++;
      }
    } else {
      creeps.remove(this);
      b.HP--;
    }

    pos.add(new PVector(dir.x * speed, dir.y*speed));

    maxStep = gridRoute.length;
  }
}

class Splitter extends Creep {
  Splitter(PVector Offset) {

    cashOnKill = 30;
    hp = 23;
    speed = 1.1;

    step = 0;
    farve_r = 201;
    farve_g = 201;
    farve_b = 201;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
    
  }
  void display() {
    ellipseMode(CENTER);
    fill(farve_r, farve_g, farve_b);
    ellipse(pos.x+25, pos.y+25, 40, 20);
  }
  void health() {
    if (hp <= 0) {
      gm.gold += cashOnKill;
      creeps.add(new Tank(new PVector(0,0)));
      creeps.get(creeps.size()-1).pos =pos;
      creeps.get(creeps.size()-1).step =step;
      creeps.add(new Sonic(new PVector(0,0)));
       creeps.get(creeps.size()-1).pos =pos;
      creeps.get(creeps.size()-1).step =step;
      creeps.remove(this);
      
    }
  }
}
