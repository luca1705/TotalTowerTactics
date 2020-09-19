int w, h;
ArrayList<PVector> level;

GameManager gm = new GameManager();

boolean menu = true;

Base b;
Shop store; 

void setup() {
  stroke(0, 0, 0, 50);
  size(1000, 800);
  store = new Shop();

  w = width-200;
  h = height;

  //populate Grid
  populateGrid();

  b = new Base(gridRoute[gridRoute.length-1]);
}

void draw() {
  background(160, 95, 20);
  if (menu) {
    gm.mainMenu();
  } else {
    if (b.hp > 0) {
      //Game Functions
      for (Grid a : TowerGrid) {
        a.display();
        a.activate();
      }
      for (int i = 0; i < blood.size(); i++) {
        blood.get(i).display();
        blood.get(i).move();
      }
      for (int i = 0; i < creeps.size(); i++) {
        creeps.get(i).display();
        creeps.get(i).health();
      }

      for (int i = 0; i < creeps.size(); i++) {
        creeps.get(i).move();
      }

      //Misc
      store.display();
      gm.display();
      gm.wave();
      b.display();
    }
    b.baseHP();
  }
}
