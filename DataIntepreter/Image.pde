public class Image{
  private int counter = 0;
  private ArrayList<Pixel> allP;
  public Image(){
    allP = new ArrayList<>();
  }
  
  private void addPixel(String s){
       
    String[] a = s.split(",");
    int[] numbers = new int[a.length];
    for(int i = 0;i < a.length;i++)
    {
       numbers[i] = Integer.parseInt(a[i]);
    }
      allP.add(new Pixel(numbers[0],numbers[1],numbers[2],numbers[3],numbers[4]));
    }
    
  private void printI(){
    counter = allP.size();
    background(255);
    for(Pixel i : allP){
      
      i.draw();
    }
  }
  private void printP(){
    if(counter < allP.size()){
      allP.get(counter).draw();
      counter++;
    }
  }
}
