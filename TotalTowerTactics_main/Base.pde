class Base {
  int hp;
  PVector pos;

  Base (PVector position) {
    pos = new PVector (position.x * 50, position.y * 50);
    hp = 20;
  }

  void baseHP() {
    if (hp <= 0) {
      background(200, 25, 25);
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(56);
      text("GAME OVER", width/2, height / 4);


      if (mouseX < width/2 + 125 
        && mouseX > width/2 - 125
        && mouseY < height/2 - 25
        && mouseY > height/2 - 100) {
        fill(227, 200, 0);
        if (mousePressed== true && mouseButton == LEFT)
          gm.restartGame();
      }

      textSize(30);
      text("Restart Game", width/2, height/2-75);
    }
  }



  void display() {
    fill(155);
    rectMode(CORNER);
    rect(pos.x, pos.y, 50, 50);
    fill(0);
    textAlign(CENTER);
    text(hp, pos.x + 25, pos.y+35);
  }
}
