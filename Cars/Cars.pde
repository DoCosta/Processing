private Spawner sp = new Spawner();
private int WIDTH = 500;
public void setup(){
  size(500,500);
  frameRate(60);
}

void draw() {
  background(153);
  form();
  sp.run();
  if(sp.isAlive == false && mousePressed){
    sp = new Spawner();
  }
}

public void form(){
    fill(255);
    rect(0, 0, WIDTH,50);  
    rect(0, 450, WIDTH,50);
    rect(0, 225, WIDTH,50);
  }
