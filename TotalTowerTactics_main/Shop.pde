class Shop {

  shopitems[] si = new shopitems[7];
  Shop() {
    for (int i = 0; i <si.length; i++) {
      si[i] = new shopitems(new PVector(width-180, 100 * i + 100), 160, 80, i);
    }
  }

  void display() {
    fill(120);
    rectMode(CORNER);
    rect(width-200, 0, 200, height);


    fill(200);
    for (int i = 0; i < si.length; i++) {
      si[i].display();
    }
  }
}

class shopitems {

  PVector pos;

  int sizex, sizey;

  int towerI;
  Tower t;

  shopitems(PVector postion, int sx, int sy, int tower) {

    pos = postion;
    sizex = sx;
    sizey = sy;

    towerI = tower;
    switch(towerI) {
    case 0:
      t = new MG();
      break;
    case 1:
      t = new Hyper();
      break;
    case 2:
      t = new Sniper();
      break;
    case 3:
      t = new MG();
      break;
    case 4:
      t = new MG();
      break;
    case 5:
      t = new MG();
      break;
    case 6:
      t = new MG();
      break;
    }
  }

  void display() {
    fill(220);
    if (mouseX > pos.x
      && mouseX < pos.x + sizex
      && mouseY > pos.y
      && mouseY < pos.y + sizey) {
      fill(120, 120, 200);
      if (mousePressed && mouseButton == LEFT) {
        gm.activeTower = t;
        switch(towerI) {
        case 0:
          t = new MG();
          break;
        case 1:
          t = new Hyper();
          break;
        case 2:
          t = new Sniper();
          break;
        case 3:
          t = new MG();
          break;
        case 4:
          t = new MG();
          break;
        case 5:
          t = new MG();
          break;
        case 6:
          t = new MG();
          break;
        }
      }
    }
    rect(pos.x, pos.y, sizex, sizey);
  }
  void mouse() {
  }
}
