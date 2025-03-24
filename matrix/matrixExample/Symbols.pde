import java.util.Random;
public class Symbols{
  private int x, y;
  private int i;
  private char c;
  private int tSize = 36;
  public int alpha = 255;
  private int alphaM = 10;
  private boolean onP = false;
  private boolean isPressed = false;
  
  public Random rn = new Random();
  
  public boolean hitBox(int w, int h){
    if(w > x - textWidth(c)/2 && w < x + textWidth(c)/2 && h > y - 8 && h < y + 8){
      return true;
    }
    return false;
  }
  public void force(){if(onP){x+=rn.nextInt(31)-15; y -= (int)random(1,10);}}
  
  public void draw(){
    textSize(tSize);
    
      fill(0,255,0,alpha);
      
      if(isPressed){fill(rn.nextInt(255) + 1,rn.nextInt(255) + 1,rn.nextInt(255) + 1);}
      text(i, x, y); // i for random Numbers, c for file data

  }
  public Symbols(int x, int y){
    i = rn.nextInt(10);
    this.x = x;
    this.y = y;
    alphaM = rn.nextInt(15) + 1;
  }
  public void update(char c, int xx, int yy){
    isPressed = true;
    this.c = c;
    i = rn.nextInt(10);
    if((y >= yy - (tSize) && y <= yy) && (xx < x && xx+100 > x)){onP = true; this.y = yy;}
    else{y += tSize; onP = false;}
    if(!onP){alpha -= alphaM;}
  }
  public void update(char c){
    isPressed = false;
    this.c = c;
    i = rn.nextInt(10);
    y += tSize;
    alpha -= alphaM;
  }
  public int getY(){return y;}
  
  public int getX(){return x;}
  
}
