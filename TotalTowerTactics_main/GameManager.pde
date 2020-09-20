class GameManager {

  //Player
  int startingGold = 225;
  int gold;
  Tower activeTower;
  Tower upgradeTower;

  //Creeps
  int wave;
  float spawnAmnt = 7, spawnDist = 30;

  GameManager() {
    gold = startingGold;
  }

  void mainMenu() {
    background(20);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Welcome to", width/2, height/4 - 50);
    textSize(46);
    text("TotalXtremeG4m3rTowerDefence", width/2, height/4);
    text("AnnihilationTactics Version v3000.0", width/2, height/4+50);
    text("Insanity reRelease Mega Mortem Kill'em All", width/2, height/4+100);

    if (mouseX < width/2 + 125 
      && mouseX > width/2 - 125
      && mouseY < height/2 + 25
      && mouseY > height/2 - 50) {
      fill(200, 25, 25);
      if (mousePressed== true && mouseButton == LEFT)
        menu=false;
    }
    textSize(30);
    text("ACCEPT YOUR FATE", width/2, height/2);
  }

  void wave() {
    if (creeps.size()==0) {
      wave++;
      int cToSpawn = (int)(wave*0.75+spawnAmnt);
      for (int i = 0; i < cToSpawn; i++) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist * (i+1));

        int cType = (int) random (0, 5.99);
        switch(cType) {
        case 0:
          creeps.add(new Creep(offset));
          break;
        case 1:
          if (wave > 3)
            creeps.add(new Sonic(offset));
          else
            creeps.add(new Creep(offset));
          break;
        case 2:
          if (wave > 5)
            creeps.add(new Tank(offset));
          else
            creeps.add(new Creep(offset));
          break;
        case 3:
          if (wave > 7)
            creeps.add(new shortSprinter(offset));
          else
            creeps.add(new Creep(offset));
          break;
        case 4:
          if (wave > 10)
            creeps.add(new Splitter(offset));
          else 
          creeps.add(new Creep(offset));
          break;
        case 5: 
          if (wave > 15)
            creeps.add(new megaUltraDestroyer(offset));
          else 
          creeps.add(new Creep(offset));
          break;
        }
      }
      if (wave % 10 == 0) {
        PVector offset = new PVector(gridRoute[0].x - gridRoute[1].x, gridRoute[0].y - gridRoute[1].y);
        offset.normalize();
        offset.mult(spawnDist);
        creeps.add(new Mutant(offset));
      }
    }
  }

  void restartGame() {
    b = new Base(gridRoute[gridRoute.length-1]);
    creeps = new ArrayList<Creep>();
    gold = startingGold;
    TowerGrid = new ArrayList<Grid>();
    populateGrid();
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
    if (mousePressed && mouseButton == RIGHT && upgradeTower != null) {
      upgradeTower = null;
    }
  }
}
