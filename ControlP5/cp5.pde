import controlP5.*;

ControlP5 p5;
void setup(){
  size(600,600);
  p5 = new ControlP5(this);
  
  p5.addButton("button1").setLabel("Hello").setSize(100,50).setPosition(100,100);
  p5.addScrollableList("Scroll1")
  .setLabel("Select..")
  .setPosition(100,180)
  .addItem("Item1",1)
  .addItem("Item2", 2)
  .setItemHeight(25);
  
}

void draw(){
  background(255);
}


void button1(){
  println("button1 clicked");
  if(p5.getController("button1").getLabel() == "Clicked"){ p5.getController("button1").setLabel("Hello");} 
  else{p5.getController("button1").setLabel("Clicked");}
  
}
