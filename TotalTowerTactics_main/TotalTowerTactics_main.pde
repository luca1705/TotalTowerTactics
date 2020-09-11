int w, h;
ArrayList<PVector> level;

GameManager gm = new GameManager();
Shop store = new Shop(); 

void setup() {
  stroke(0,0,0, 50);
  size(1000, 800);

  w = width-200;
  h = height;

  //populate Grid
  populateGrid();
}

void draw() {
  background(160, 95, 20);
  //Draw Grid
  for (Grid a : TowerGrid) {
    a.display();
    a.activate();
  }
  
  //Misc
  store.display();
  gm.display();
}
