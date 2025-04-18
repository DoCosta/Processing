public class Pixel{
  private int pixelX, pixelY, red, green, blue;
  private float size;
  public Pixel(int x, int y, int r, int g, int b){
    pixelX = x;
    pixelY = y;
    red = r;
    green = g;
    blue = b;
    size = random(5,15);
  }
  private void draw(){
    fill(red, green, blue);
    stroke(red, green, blue);
    ellipse(pixelX,pixelY,size,size);
  }
}
