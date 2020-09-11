class GameManager{
  
  //Player
  int gold;
  Tower activeTower;
  
  //Creeps
  int wave;
  
  GameManager(){
    
  }
  
  void display(){
    fill(0);
    textSize(28);
//    textAlign(RIGHT);
    text("Gold: " + gold, width - 190, 35);
    text("Wave: " + wave, width - 190, 70);
  }
  
}
