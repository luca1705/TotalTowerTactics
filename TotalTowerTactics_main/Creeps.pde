ArrayList<Creep> creeps = new ArrayList<Creep>(); 

class Creep {
  float speed, hp = 1;
  int step, maxStep;
  PVector pos;
  int farve_r,farve_g,farve_b;
  Creep() {
  }
  Creep(PVector Offset) {
    step = 0;
    hp = 10;
    speed = 1;
    farve_r = 0;
    farve_g = 0;
    farve_b = 0;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }

  void display() {
    ellipseMode(CENTER);
    fill(farve_r,farve_g,farve_b);
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
      creeps.remove(this);
    }
  }
}


class Sprinter extends Creep {


  Sprinter(PVector Offset) {

    hp = 5;
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

    hp = 20;
    speed = 0.5;
     step = 0;
      farve_r = 201;
    farve_g = 201;
    farve_b = 201;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50 + Offset.x, gridRoute[0].y * 50 + Offset.y);
  }

  }
