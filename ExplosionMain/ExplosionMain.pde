public ArrayList<Particle> p = new ArrayList<>(2000);
private int l = 0;
private int AMOUNT = 10;

void setup(){
  size(400,400);
  for(int i = 0; i < AMOUNT; i++){
    p.add(new Particle());
  }
  frameRate(60);
}
void draw(){
  background(255);
  for(Particle c : p){
    c.draw();
    c.update();
   }  
   checkOld();
  if(mousePressed){
  while(l < p.size()){
    p.get(l).burst(mouseX,mouseY);
    l++;
  }
  
   for(int i = 0; i < AMOUNT; i++){
    p.add(new Particle());
  }
  }
}

void mousePressed(){
  
}

void checkOld(){
  for(int i = 0; i < p.size(); i++){
    if((p.get(i).getY() > height + 50) && p.get(i).isBurst == true || p.get(i).alpha <= 0){
      p.remove(i);
      l--;
    }
   } 
}
