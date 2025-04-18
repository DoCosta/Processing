import de.bezier.data.sql.*;
import controlP5.*;

ControlP5 cp5;
SQLite db;
DropdownList d1;
Button saveButton;
Textfield tf1;
Textfield tf2;
Textfield tf3;
Textfield tf4;

void setup()
{
  size( 500, 500 );
  cp5 = new ControlP5(this);
  db = new SQLite( this, "data/db.sqlite" );  
  tf1 = cp5.addTextfield("Name").setPosition(100, 100);
  tf2 = cp5.addTextfield("Phone").setPosition(100, 150);   
  tf3 = cp5.addTextfield("Address").setPosition(100, 200);
  tf4 = cp5.addTextfield("Age").setPosition(100, 250);
           
  customize(tf1);
  customize(tf2);
  customize(tf3);
  customize(tf4);
           
  d1 = cp5.addDropdownList("selected")
          .setPosition(100, 20)
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
        
        println();
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
  saveButton = cp5.addButton("button1")  
               .setPosition(100, 350)
               .setSize(100, 30)         
               .setLabel("Save")    
               .setColorBackground(color(0))
               .setColorActive(color(150, 200, 255));
  
  
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
        //Hint: Dependent on the data type (int, String, float, double, etc)
        //there are getXYZ methods available: 
        print( db.getString("name") +", ");
        print( db.getString("address") +", ");
        print( db.getString("phone") +", ");
        print( db.getInt("age"));
        
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

    }
}

void customize(Textfield t){
 t.setSize(200, 30)
   .setFont(createFont("Arial", 16))
   .setFocus(true)              
   .setColorBackground(color(200))
   .setColorForeground(color(0))
   .setColorValue(0);
 t.getCaptionLabel().setColor(0);
}
