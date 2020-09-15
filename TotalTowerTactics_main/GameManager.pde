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
      int cToSpawn = (int)(wave*0.5+spawnAmnt);
      for (int i = 0; i < cToSpawn; i++) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist * (i+1));
        creeps.add(new Creep(offset));
      }
      for (int j = 0; j < random(wave,wave+3); j++) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist * (j+1));

        if (wave>2) {
          creeps.add(new Sprinter(offset));
        }
        println("Sprinter = "+j);
      }
      
      
      for (int h = 0; h < random(wave,wave+5); h++) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist * (h+1));
        if (wave>3) {
          creeps.add(new Tank(offset));
        }
       println("Tank = "+h);
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
