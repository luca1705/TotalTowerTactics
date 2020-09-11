int w, h;
ArrayList<PVector> level;


GameManager gm = new GameManager();
Shop store = new Shop(); 


void setup() {
  stroke(0, 0, 0, 50);
  size(1000, 800);
  w = width-200;
  h = height;

  //populate Grid
  populateGrid();

  for (int i =0; i<2; i++) {
    creeps.add(new Creep());
    println(creeps.get(i).pos);
//    println(gridRoute[0]);
//    println(creeps.size());
//   println(creeps.getloc);
  }
}

void draw() {
  background(160, 95, 20);
  //Draw Grid
  for (Creep a : creeps) {
    a.display();
    a.direction();
    a.move();
  }
  for (Grid a : TowerGrid) {
    a.display();
    a.activate();
  }

  //Misc
  store.display();
  gm.display();
}
