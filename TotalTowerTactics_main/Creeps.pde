ArrayList<Creep> creeps = new ArrayList<Creep>(); 

class Creep {
  float speed, hp = 1;
  int step, maxStep;
  PVector pos;
  int farve_r, farve_g, farve_b;
  int cashOnKill;
  boolean slowed = false;
  float slowspeed;

  Creep() {
  }

  Creep(PVector Offset) {
    cashOnKill = 5;

    hp = 3;
    hp *= (1+gm.wave/10);

    speed = 1.75;
    slowspeed = 1;

    farve_r = 0;
    farve_g = 0;
    farve_b = 0;

    step = 0;
    maxStep = gridRoute.length;

    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }

  void display() {
    ellipseMode(CENTER);
    fill(farve_r, farve_g, farve_b);
    ellipse(pos.x + 25, pos.y + 25, 20, 20);
  }

  void move() {
    PVector dir = new PVector(0, 0);
    if (step < maxStep-1) {
      dir = new PVector(gridRoute[step+1].x-gridRoute[step].x, gridRoute[step+1].y-gridRoute[step].y);
      dir.normalize();
      if (!slowed ) { 
        pos.add(new PVector(dir.x * speed, dir.y*speed));
      } else {
        pos.add(new PVector(dir.x * slowspeed, dir.y*slowspeed));
      }
      if (pos.x <= gridRoute[step+1].x * 50 +speed &&
        pos.x >= gridRoute[step+1].x * 50 - speed &&
        pos.y <= gridRoute[step+1].y * 50 + speed &&
        pos.y >= gridRoute[step+1].y * 50 - speed) {
        step++;
      }
    } else {
      creeps.remove(this);
      b.hp--;
    }
  }

  void health() {
    if (hp <= 0) {
      gm.gold += cashOnKill;
      for (int i = 0; i < 15; i++) {
        blood.add(new Blood(pos));
      }
      creeps.remove(this);
    }
  }
}


class Sonic extends Creep {
  Sonic(PVector Offset) {
    cashOnKill = 5;
    hp = 2;
    hp *= (1+gm.wave/10);

    speed = 4;
    slowspeed = 2;

    farve_r = 255;
    farve_g = 0;
    farve_b = 0;

    step = 0;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }
}

class Tank extends Creep {
  Tank(PVector Offset) {
    cashOnKill = 15;
    hp = 10;
    hp *= (1+gm.wave/10);

    speed = 1.1;
    slowspeed = 0.8;



    farve_r = 201;
    farve_g = 201;
    farve_b = 201;

    step = 0;
    maxStep = gridRoute.length;

    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }
}

class megaUltraDestroyer extends Creep {
  megaUltraDestroyer(PVector Offset) {
    cashOnKill = 20;
    hp = 25;
    hp *= (1+gm.wave/10);

    speed = 1.7;
    slowspeed = 1;

    farve_r = 247;
    farve_g = 15;
    farve_b = 236;

    step = 0;
    maxStep = gridRoute.length;

    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }
}
class shortSprinter extends Creep {

  //  boolean halfway = false;
  shortSprinter (PVector Offset) {

    cashOnKill = 10;
    hp = 5;
    hp *= (1+gm.wave/10);

    speed = 7;
    slowspeed = 4;

    farve_r = 255;
    farve_g = 255;
    farve_b = 255;

    step = 0;
    maxStep = gridRoute.length;

    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }

  void move() {
    PVector dir = new PVector(0, 0);
    if (step < maxStep-1) {
      dir = new PVector(gridRoute[step+1].x-gridRoute[step].x, gridRoute[step+1].y-gridRoute[step].y);
      dir.normalize();

      if (!slowed) { 
        pos.add(new PVector(dir.x * speed, dir.y*speed));
      } else {
        pos.add(new PVector(dir.x * slowspeed, dir.y*slowspeed));
      }

      if (step>(maxStep-1)/2) {
        speed = 2;
        slowspeed = 1.5;
      }
      if (pos.x <= gridRoute[step+1].x * 50 +speed &&
        pos.x >= gridRoute[step+1].x * 50 - speed &&
        pos.y <= gridRoute[step+1].y * 50 + speed &&
        pos.y >= gridRoute[step+1].y * 50 - speed) {
        step++;
        pos = new PVector (gridRoute[step].x * 50, gridRoute[step].y * 50);
      }
    } else {
      creeps.remove(this);
      b.hp--;
    }
  }
}

class Splitter extends Creep {
  Splitter(PVector Offset) {

    cashOnKill = 10;
    hp = 7;
    hp *= (1+gm.wave/10);

    speed = 1.1;
    slowspeed = 0.7;

    farve_r = 201;
    farve_g = 201;
    farve_b = 201;

    step = 0;
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
      for (int i = 0; i < 15; i++) {
        blood.add(new Blood(pos));
      }
      gm.gold += cashOnKill;
      creeps.add(new Sonic(new PVector(0, 0)));
      creeps.get(creeps.size()-1).step = step;
      creeps.get(creeps.size()-1).pos = pos;
      if (slowed)
        creeps.get(creeps.size()-1).slowed = slowed;
      creeps.remove(this);
    }
  }
}

class Mutant extends Creep {
  Mutant(PVector Offset) {
    cashOnKill = 100;
    hp = 30;
    hp *= (1+gm.wave/10);

    speed = 0.7;
    slowspeed = 0.5;

    farve_r = 170;
    farve_g = 20;
    farve_b = 170;

    step = 0;
    maxStep = gridRoute.length;

    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }

  void health() {
    if (hp <= 0) {
      for (int i = 0; i < 15; i++) {
        blood.add(new Blood(pos, farve_r, farve_g, farve_b));
      }
      gm.gold += cashOnKill;
      creeps.add(new Splitter(new PVector(0, 0)));
      creeps.get(creeps.size()-1).step = step;
      creeps.get(creeps.size()-1).pos = pos;
      if (slowed)
        creeps.get(creeps.size()-1).slowed = slowed;
      creeps.remove(this);
    }
  }
}
