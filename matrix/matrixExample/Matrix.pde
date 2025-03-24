 import java.util.Random;
public class Matrix{
  public Random rn = new Random();
  public ArrayList<Symbols> lines = new ArrayList<>(1000);
  
  public Matrix(){
    
  }
  
  public void draw(char c, int x, int y){
    fill(0,20);
    rect(0,0,width,height);    
    update(c, x, y);
    for(int i = 0; i < lines.size(); i++){
    if(lines.get(i).getY() >= height || lines.get(i).alpha <= 0){lines.remove(i);}
      for(Symbols s : lines){
          if(lines.get(i).hitBox(s.getX(),s.getY()) && lines.get(i) != s){lines.get(i).force();}
      }  }
  }
  public void draw(char c){
    fill(0,20);
    rect(0,0,width,height);    
    for(int i = 0; i < lines.size(); i++){
      lines.get(i).draw();
      lines.get(i).update(c);
    }
  }
  
  public void update(char c, int x, int y){
  for(int i = 0; i < lines.size(); i++){
      lines.get(i).draw();
      lines.get(i).update(c, x, y);
      if(lines.get(i).getY() >= height || lines.get(i).alpha <= 0){lines.remove(i);}
    }
  }
  
  public void addSym(){
    lines.add(new Symbols(rn.nextInt((width)), 0));
  }
  
  public void addSym(int x, int y){
    lines.add(new Symbols(x, y));
  }
  
}
