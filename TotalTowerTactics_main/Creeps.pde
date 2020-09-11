ArrayList<Creep> creeps = new ArrayList<Creep>(); 


class Creep {
  float speed, hp;
  int step, maxStep;
  PVector pos;

  Creep() {
    step = 0;
    hp = 10;
    speed = 2;
    maxStep = gridRoute.length;
    pos = new PVector(gridRoute[0].x * 50, gridRoute[0].y * 50);
  }

  void display() {
ellipseMode(CENTER);
    ellipse(pos.x+25, pos.y+25, 20, 20);
  }

  void direction() {
    PVector dir = new PVector(0, 0);
    if (step < maxStep) {
      dir = new PVector(gridRoute[step+1].x-gridRoute[step].x, gridRoute[step+1].y-gridRoute[step].y);
      dir.normalize();
    }

    if (pos.x <= gridRoute[step+1].x * 50 +speed &&
        pos.x >= gridRoute[step+1].x * 50 - speed &&
        pos.y <= gridRoute[step+1].y * 50 + speed &&
        pos.y >= gridRoute[step+1].y * 50 - speed) {
      println("true");
      step++;
    }
    
    println(pos);
    println(new PVector (gridRoute[step+1].x * 50, gridRoute[step+1].y * 50));
    
    pos.add(new PVector(dir.x * speed, dir.y*speed));
    speed = 1;
    maxStep = gridRoute.length;
  }

  void health() {
    if (hp <= 0) {
      creeps.remove(this);
    }
  }
}
