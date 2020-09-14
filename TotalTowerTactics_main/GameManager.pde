class GameManager {

  //Player
  int gold;
  Tower activeTower = new MG();

  //Creeps
  int wave;
  float spawnAmnt = 5, spawnDist = 30;

  GameManager() {
  }

  void wave() {
    if (creeps.size()==0) {
      for (int i = 0; i < spawnAmnt; i++) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist * (i+1));
        creeps.add(new Creep(offset));
      }
    }
  }

  void display() {
    fill(0);
    textSize(28);
    //    textAlign(RIGHT);
    text("Gold: " + gold, width - 190, 35);
    text("Wave: " + wave, width - 190, 70);
  }
}
