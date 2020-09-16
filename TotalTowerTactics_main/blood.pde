ArrayList<Blood> blood = new ArrayList<Blood>(); 

class Blood {
  PVector pos;
  PVector vel;
  float lTime;

  int r, g, b;
  int s;
  
  Blood(PVector position) {
    pos = new PVector(position.x + gSize/2, position.y+gSize/2);
    lTime = random(10, 15);
    vel = new PVector(random(-1.2, 1.2), random(-1.2, 1.2));

    r=(int)random(180, 220);
    g=(int)random(10, 30);
    b=(int)random(40, 60);
    
    s = (int)random(1, 10);
  }


  void move() {


    pos.add(vel);
    vel.mult(0.95);
    
    lTime -= 1/frameRate;
    if (lTime < 0)
      blood.remove(this);
    }

    void display() {
      stroke(r, g, b);
      strokeWeight(s);
      point(pos.x, pos.y);
      stroke(0, 0, 0, 50);
      strokeWeight(1);
    }
}
