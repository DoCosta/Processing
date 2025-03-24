public class Plattform{
  private int x, y, alpha = 255;
  public Plattform(){
    x = width/2 - 50;
    y = height/2;
  }
  public void draw(){
    fill(alpha);
    rect(x,y,100,20); 
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  
  public void incrementY(int y){this.y += y;}
  public void incrementX(int x){this.x += x;}
}
