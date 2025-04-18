import de.bezier.data.sql.*;
import controlP5.*;

ControlP5 cp5;
SQLite db;
DropdownList d1;
Button saveButton, createButton, delButton;
Textfield tf1, tf2, tf3, tf4;

void setup()
{
  size( 500, 500 );
  cp5 = new ControlP5(this);
  db = new SQLite( this, "data/db.sqlite" );  
  tf1 = cp5.addTextfield("Name").setPosition(100, 100);
  tf2 = cp5.addTextfield("Phone").setPosition(100, 150);   
  tf3 = cp5.addTextfield("Address").setPosition(100, 200);
  tf4 = cp5.addTextfield("Age").setPosition(100, 250); 
  cT(tf1);cT(tf2);cT(tf3);cT(tf4);
           
  d1 = cp5.addDropdownList("selected")
          .setPosition(350, 100)
          .setBackgroundColor(color(190))
          .setItemHeight(20)
          .setBarHeight(15).setColorBackground(color(60))
          .setColorActive(color(255, 128)) 
          ;
  
  try {
    if ( db.connect() )
    {

      db.query( "SELECT * FROM contacts" );

      //next():
      //Check if more results (rows) are available. This needs to be called before any results can be retrieved. 
      while (db.next()) 
      {
        //Hint: Dependent on the data type (int, String, float, double, etc)
        //there are getXYZ methods available: 
        d1.addItem(db.getString("name"), " ");
        print( db.getString("name") +", ");
        print( db.getString("address") +", ");
        print( db.getString("phone") +", ");
        print( db.getInt("age"));
        
      }
      /*
      db.query( "UPDATE contacts SET age = age + 1 WHERE name = \"Oak Tree\"");
      
      try {
        db.query( "INSERT INTO contacts VALUES(\"Oak Tree\", \"Test 1 \", 4, 123)");
      } catch (Exception e) {
        //Your only way to see whether an UPDATE or INSERT statement worked 
        //is when no exception occurred 
        e.printStackTrace();
      }
      */
    }
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  saveButton = cp5.addButton("button1").setPosition(40, 350).setLabel("save");
  createButton = cp5.addButton("button2").setPosition(145, 350).setLabel("create new");
  delButton = cp5.addButton("button3").setPosition(250, 350).setLabel("delete");
  cB(saveButton);
  cB(createButton);
  cB(delButton);
  
}

void draw() {
  background(240);
}

void selected(){
  if ( db.connect() )
    {

     int index = int(d1.getValue());
     String selectedName = (String)d1.getItem(index).get("text");
     db.query("SELECT * FROM contacts WHERE name = '" + selectedName + "'");


      //next():
      //Check if more results (rows) are available. This needs to be called before any results can be retrieved. 
      while (db.next()) 
      {        
        tf1.setText(db.getString("name"));
        tf2.setText(db.getString("phone"));
        tf3.setText(db.getString("address"));
        tf4.setText(db.getString("age"));
        println();
        
      }
    }
}


void button1(){
  if ( db.connect() )
    {
    // Assume you want to update the row with a matching name.
    int index = int(d1.getValue());
    String selectedName = (String)d1.getItem(index).get("text");
    db.query("UPDATE contacts SET name = '"+tf1.getText()+"', address = '"+tf3.getText()+"', phone = '"+tf2.getText()+"', age = '"+tf4.getText()+"' WHERE name = '" + selectedName + "'");
    update();
    }
}

void button2(){
  if ( db.connect() )
    { try {
    db.query( "INSERT INTO contacts VALUES(\""+tf1.getText()+"\", \""+tf3.getText()+"\", "+tf2.getText()+", "+tf4.getText()+")");
    update();
    }catch (Exception e) {
        //Your only way to see whether an UPDATE or INSERT statement worked 
        //is when no exception occurred 
        e.printStackTrace();
      }
    }
}
void button3(){
  
    int index = int(d1.getValue());
    String selectedName = (String)d1.getItem(index).get("text");
  if ( db.connect() )
  
    { try {
    db.query( "DELETE FROM contacts WHERE name = '" + selectedName + "'");
    update();
    tf1.setText("");tf2.setText("");tf3.setText("");tf4.setText("");
    }catch (Exception e) {
        //Your only way to see whether an UPDATE or INSERT statement worked 
        //is when no exception occurred 
        e.printStackTrace();
      }
    }
}

void update(){
  if ( db.connect() ){
  db.query( "SELECT * FROM contacts" );  
  d1.clear();
  while (db.next()) 
      {
        //Hint: Dependent on the data type (int, String, float, double, etc)
        //there are getXYZ methods available: 
        d1.addItem(db.getString("name"), " ");
        
      }}
}

void cT(Textfield t){
 t.setSize(200, 30)
   .setFont(createFont("Arial", 16))
   .setFocus(true)              
   .setColorBackground(color(200))
   .setColorForeground(color(0))
   .setColorValue(0);
 t.getCaptionLabel().setColor(0);
}
void cB(Button b){
  b.setSize(100, 30).setColorBackground(color(0)).setColorActive(color(150, 200, 255));
}
