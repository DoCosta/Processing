BufferedReader br;
private Plattform p;
public int SIZE = 600;
private Matrix m;

public void setup(){
  background(0);
  size(1000,1000);
  br = createReader("data.txt");
  frameRate(20);
  m = new Matrix();
  p = new Plattform();
}

public void draw(){
  try {
    char c = (char)br.read();
    
      if(mousePressed){
        background(0);
        p.draw();
        m.draw(c, p.getX(),p.getY());
        m.addSym(mouseX, mouseY);
      }else{m.addSym();
    m.draw(c);}
    
  } catch (IOException e) {
    e.printStackTrace(); 
  }
}


void keyPressed(KeyEvent event){
    if(event.getKey() == 'w' || event.getKey() == 'W') {
        p.incrementY(-5);
      }
      else if (event.getKey() == 'a' || event.getKey() == 'A') {
        p.incrementX(-5);
      }
      else if (event.getKey() == 'd' || event.getKey() == 'D') {
        p.incrementX(5);
      }
      else if (event.getKey() == 's' || event.getKey() == 'S') {
        p.incrementY(5);
      }
    }
