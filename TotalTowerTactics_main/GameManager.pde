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
      wave++;
//      int cToSpawn = (int)(sqrt((wave-1))+spawnAmnt);
        int cToSpawn = (int)(wave*0.5+5);
      for (int i = 0; i < cToSpawn; i++) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist * (i+1));
        creeps.add(new Creep(offset));
        creeps.add(new Sprinter(offset));
        creeps.add(new Tank(offset));
      }
    }
  }

  void display() {
    fill(0);
    textSize(28);
    textAlign(LEFT);
    text("Gold: " + gold, width - 190, 35);
    text("Wave: " + wave, width - 190, 70);
  }
}
