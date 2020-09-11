class Grid {
  PVector pos;
  int s, r, g, b;

  Tower gridTower;

  Grid(PVector position, int size) {
    pos = position;
    s = size;
    gSize = size;

    pos.x *= s;
    pos.y *= s;
    
    //
    r = (int)random(86, 126);
    g = (int)random(125, 200);
    b = (int)random(70,80);
  }

  void buildTower(Tower t) {
    gridTower = t;
  }

  void destroyTower() {
    gridTower = null;
  }

  //Draws rect at grid pos
  void display() {
    rectMode(CORNER);
    fill(r, g, b);
    rect(pos.x, pos.y, s, s);
    if (gridTower != null) {
      gridTower.display();
    }
  }

  //Draws blue square on top of grid if mouse is hovering above
  void activate() {
    if (mouseX > pos.x && mouseX <pos.x+s && mouseY > pos.y && mouseY < pos.y+s) {
      if (gridTower == null) {
        fill(120, 120, 200);
        if (mousePressed && mouseButton == LEFT) {
          //Adapter til købsmenu
          buildTower(new MG(pos));
        }
      } else if (mousePressed && mouseButton == RIGHT) {
        destroyTower();
      } else {
        fill (250, 25, 25, 120);
      }
      rectMode(CORNER);
      rect(pos.x, pos.y, s, s);
    }
  }
}

//Populates level with grids for tower placement
ArrayList<Grid> TowerGrid = new ArrayList<Grid>();
PVector[] gridRoute;
int gSize;
void populateGrid() {
  int sqrAmnt = 16;
  for (int x = 0; x < sqrAmnt; x++) {
    for (int y = 0; y < sqrAmnt; y++) {
      TowerGrid.add(new Grid(new PVector (x, y), w/sqrAmnt));
    }
  }

  //Sets gridsize
  gSize = w/sqrAmnt;

  //import route data and convert to PVector
  String[] routeData = loadStrings("level.txt");
  gridRoute = new PVector[routeData.length];
  for (int i = 0; i < gridRoute.length; i++) {
    //convert to PVector array
    String[] tempPos = split(routeData[i], " ");
    gridRoute[i] = new PVector (int(tempPos[0]), int(tempPos[1]));
  }
  //Clear grid where route is
  for (int i = 0; i < gridRoute.length; i++) {
    if (i < gridRoute.length-1) {
      for (int x = 0; x < abs(gridRoute[i].x - gridRoute[i+1].x)+1; x++) {
        for (int y = 0; y < abs(gridRoute[i].y - gridRoute[i+1].y)+1; y++) {
          for (int j = 0; j < TowerGrid.size(); j++) {
            if (gridRoute[i].x - gridRoute[i+1].x <= 0) {
              if (gridRoute[i].y - gridRoute[i+1].y <= 0) {
                if (TowerGrid.get(j).pos.x/TowerGrid.get(j).s == gridRoute[i].x + x
                  && TowerGrid.get(j).pos.y/TowerGrid.get(j).s == gridRoute[i].y + y) {
                  TowerGrid.remove(j);
                }
              } else if (gridRoute[i].y - gridRoute[i+1].y >= 0) {
                if (TowerGrid.get(j).pos.x/TowerGrid.get(j).s == gridRoute[i].x + x
                  && TowerGrid.get(j).pos.y/TowerGrid.get(j).s == gridRoute[i].y - y) {
                  TowerGrid.remove(j);
                }
              }
            } else if (gridRoute[i].x - gridRoute[i+1].x >= 0) {
              if (gridRoute[i].y - gridRoute[i+1].y <= 0) {
                if (TowerGrid.get(j).pos.x/TowerGrid.get(j).s == gridRoute[i].x - x
                  && TowerGrid.get(j).pos.y/TowerGrid.get(j).s == gridRoute[i].y + y) {
                  TowerGrid.remove(j);
                }
              } else if (gridRoute[i].y - gridRoute[i+1].y >= 0) {
                if (TowerGrid.get(j).pos.x/TowerGrid.get(j).s == gridRoute[i].x - x
                  && TowerGrid.get(j).pos.y/TowerGrid.get(j).s == gridRoute[i].y - y) {
                  TowerGrid.remove(j);
                }
              }
            }
          }
        }
      }
    }
  }
}
