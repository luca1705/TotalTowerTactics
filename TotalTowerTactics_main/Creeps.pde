ArrayList<Creep> creeps;

class Creep {
  float speed, hp;
  int step, maxStep;

  Creep() {
    step = 0;
    hp = 10;
    speed = 1;
    maxStep = gridRoute.length;
  }

  void move() {
  }

  void health() {
    if (hp <= 0) {
      creeps.remove(this);
    }
  }
}
