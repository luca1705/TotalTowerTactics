class Shop {
  
  Shop() {
  
  }

  void display() {
    fill(120);
    rectMode(CORNER);
    rect(width-200, 0, 200, height);

    int shopItems = 7;
    fill(200);
    for (int i = 0; i < shopItems; i++) {
      rect(width-180, 100*i + 100, 160, 80);
    }
  }
}
