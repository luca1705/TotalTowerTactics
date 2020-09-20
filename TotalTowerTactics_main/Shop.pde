class Shop {

  boolean mousedown = false;
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
      t = new Gatling();
      break;
    case 2:
      t = new Sniper();
      break;
    case 3:
      t = new Freezer();
      break;
    case 4:
      t = new Spike();
      break;
    case 5:
      t = new SuperLuperDuber();
      break;
    case 6:
      t = new Bank();
      break;
    }
  }

  void display() {
    fill(220);
    if (mouseX > pos.x
      && mouseX < pos.x + sizex
      && mouseY > pos.y
      && mouseY < pos.y + sizey) {
      fill(200, 120, 120);
      if (gm.gold >= t.price) {
        fill(120, 120, 200);
        if (mousePressed && mouseButton == LEFT) {
          gm.activeTower = t;
          switch(towerI) {
          case 0:
            t = new MG();
            break;
          case 1:
            t = new Gatling();
            break;
          case 2:
            t = new Sniper();
            break;
          case 3:
            t = new Freezer();
            break;
          case 4:
            t = new Spike();
            break;
          case 5:
            t = new SuperLuperDuber();
            break;
          case 6:
            t = new Bank();
            break;
          }
        }
      }
    }
    rectMode(CORNER);
    rect(pos.x, pos.y, sizex, sizey);
    t.pos = new PVector(pos.x, pos.y);
    t.display();
    textAlign(RIGHT);
    textSize(20);
    fill(20);
    text(t.price, pos.x + sizex - 5, pos.y + 25);
    text(t.name, pos.x + sizex - 5, pos.y + sizey - 5);


    if (gm.upgradeTower != null) {
      rectMode(CENTER);
      fill(180, 180, 180, 10);
      ellipse(gm.upgradeTower.pos.x + gSize/2, gm.upgradeTower.pos.y + gSize/2, gm.upgradeTower.r, gm.upgradeTower.r);
      fill(170);
      rect(w/2, height-75, 500, 100);

      fill(225);
      //Upgrades
      rect(w/2-175, height-75, 100, 75);
      rect(w/2+175, height-75, 100, 75);
      rect(w/2, height-75, 100, 75);

      if (mouseY > height-107 && mouseY < height-33) {

        //Range
        if (mouseX > w/2-225 && mouseX < w/2 - 125) {
          fill(120, 120, 200);
          if (gm.gold < gm.upgradeTower.upgradeR) {
            fill(200, 120, 120);
          } else if (!store.mousedown && mousePressed) {
            gm.upgradeTower.upgradeRange();
            store.mousedown = true;
          }
          rect(w/2-175, height-75, 100, 75);
        }
        //Fire Rate
        if (mouseX > w/2+125 && mouseX < w/2 + 225) {
          fill(120, 120, 200);
          if (gm.gold < gm.upgradeTower.upgradeRate) {
            fill(200, 120, 120);
          } else if (!store.mousedown && mousePressed) {
            gm.upgradeTower.upgradeFireRate();
            store.mousedown = true;
          }

          rect(w/2+175, height-75, 100, 75);
        }
        //Damage
        if (mouseX > w/2-50 && mouseX < w/2 + 50) {
          fill(120, 120, 200);
          if (gm.gold < gm.upgradeTower.upgradeDmg) {
            fill(200, 120, 120);
          } else if (!store.mousedown && mousePressed) {
            gm.upgradeTower.upgradeDamage();
            store.mousedown = true;
          }
          rect(w/2, height-75, 100, 75);
        }
      }
      fill(20);
      textAlign(CENTER, CENTER);
      text("Range", w/2-175, height-95);
      text("Damage", w/2, height-95);
      text("Fire Rate", w/2+175, height-95);
      text(gm.upgradeTower.upgradeR, w/2-175, height-65);
      text(gm.upgradeTower.upgradeDmg, w/2, height-65);
      text(gm.upgradeTower.upgradeRate, w/2+175, height-65);
    }
  }
}
