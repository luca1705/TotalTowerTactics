class GameManager {

  //Player
  int gold = 500;
  Tower activeTower;

  //Creeps
  int wave;
  float spawnAmnt = 7, spawnDist = 30;

  GameManager() {
  }

  void wave() {
    if (creeps.size()==0) {
      wave++;
      int cToSpawn = (int)(wave*0.75+spawnAmnt);
      for (int i = 0; i < cToSpawn; i++) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist * (i+1));

        int cType = (int) random (0, 4.99);
        switch(cType) {
        case 0:
          creeps.add(new Creep(offset));
          break;
        case 1:
          creeps.add(new Sonic(offset));
        case 2:
          creeps.add(new Tank(offset));
        case 3:
          creeps.add(new shortSprinter(offset));
        case 4:
          creeps.add(new Splitter(offset));
        case 5: 
          if (wave >2) {
            creeps.add(new megaUltraDestroyer(offset));
          } else {
            creeps.add(new Creep(offset));
          }
        }
      }
    }
  }




  void display() {
    fill(0);
    textSize(28);
    textAlign(LEFT);
    text("Gold: " + gold, width - 190, 35);
    text("Wave: " + wave, width - 190, 70);
    if (activeTower != null) {
      ellipseMode(CENTER);
      fill(180, 180, 180, 40);
      ellipse(mouseX, mouseY, activeTower.r, activeTower.r);
    }
    if (mousePressed && mouseButton == RIGHT && activeTower != null) {
      activeTower = null;
    }
  }
}
