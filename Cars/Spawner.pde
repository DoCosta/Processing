import java.util.*;
class Spawner{
  private Coin c = new Coin();
  public Street s = new Street();
  private Player p = new Player();
  private float x;
  private float x2;
  private float amount = 100;
  public boolean isAlive;
  private Random r = new Random();
  public Spawner(){
    x = 500;
    x2 = 0;
    isAlive = true;
  }
  public void run(){
      if(s.checkHit(mouseX,mouseY)){isAlive = false;}
      if(isAlive){
        c.draw();
        p.draw();
        s.run();
      int randomNumber = (int)r.nextDouble(amount);
        
        switch(randomNumber){
          case 0:
            if(!s.checkHit(x - 50, 100)){s.addCar(new Car(x, 100));}
            break;
          case 1:
            if(!s.checkHit(x - 50, 200)){s.addCar(new Car(x, 200));}
            break;
          case 2:
            if(!s.checkHit(x2 + 50, 300)){s.addCar(new Car(x2, 300));}
            break;
          case 3:
            if(!s.checkHit(x2 + 50, 400)){s.addCar(new Car(x2, 400));}
            break;
          default:
            break;
          
        }if(amount >= 15){amount -= 0.02;}
      }else{
          fill(255);
          rect(0,0,width,height);
          fill(0);
          textSize(20);
          text("You Lost :(", width / 2 - 50, height / 2);
          text("Score: " + c.score , width / 2 - 40, height / 2 + 50);
          }
          
    
  }
    
}
