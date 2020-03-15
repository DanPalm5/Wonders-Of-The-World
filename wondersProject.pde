PImage img;
PImage img2;
PShape globe;
PImage redeemer;
PImage gardens;
PImage itza;
PImage taj_mahal;
PImage machu_picchu;
PImage colosseum;
PImage wall_china;


enum State {
  DISPLAY_GLOBE,
  INFO_1,
  INFO_2,
  INFO_3,
  INFO_4,
  INFO_5,
  INFO_6,
  INFO_7
};

State currentState = State.DISPLAY_GLOBE;

java.awt.Point click = null;

//float angle = 0.0;
String welcome_message = ("Welcome to the World of Wonders!");
String welcome_message2 = ("Click on a color to get started.");
void setup()
{
 noStroke();
  size(800, 600, P3D);
 smooth();
 img = loadImage("space2.jpg");
 img2 = loadImage("earth4.jpg");
 
 //draws globe, adds earth texture to sphere
 globe = createShape(SPHERE, 200); 
 globe.setTexture(img2);
}

float lastX = -1;
float rotAngle = (float)Math.PI/2; //0;

void draw()
{
  background(255);
  if (currentState == State.DISPLAY_GLOBE) {
    do_globe();
  }else if (currentState == State.INFO_1){
    do_info1();
  }else if (currentState == State.INFO_2){
    do_info2();
  }else if (currentState == State.INFO_3){
    do_info3();
  }else if (currentState == State.INFO_4){
    do_info4();
  }else if (currentState == State.INFO_5){
    do_info5();
  }else if (currentState == State.INFO_6){
    do_info6();
  }else if (currentState == State.INFO_7){
    do_info7();
  }
    
  click = null;
}

void do_globe() {
  // draws globe
  image(img, 0, 0);
  translate(width/2, height/2);
  
  fill(255);
  textSize(40);
  text(welcome_message,-350,-250);// welcome to the world of wonders
  text(welcome_message2, -320, 270);// click on a wonder to get started
  rotateY(rotAngle);
  shape(globe);
  

  if (click != null) {
    int mouseX = click.x;
    int mouseY = click.y;
    loadPixels();
    int idx = mouseY*800 + mouseX;
     color c = pixels[idx];
     
     if (isPink(c)) {// Christ Redeemer, 430 and 445
      println("It's pink!");
      currentState = State.INFO_1;
      
     }else if (isBlack(c) && mouseX > 300 && mouseX < 600){ //Hanging gardens of bablyon, 135 and 145
       println("It's black!");
        currentState = State.INFO_2;
        
     }else if(isOrange(c)){//Machu Picchu, 365 and 380
       println("it's Orange!");
        currentState = State.INFO_3;
        
     }else if(isYellow(c)){//Chichen Itza, 190 and 200
       println("It's yellow!");
        currentState = State.INFO_4;
        
     }else if(isRed(c)){//Colosseum, 105 and 114
       println("It's red!");
        currentState = State.INFO_5;
        
     }else if(isCyan(c)){//Great Wall of China, 150 and 160
      println("it's Cyan!");
       currentState = State.INFO_6;
       
     }else if(isPurple(c)){//Taj Mahal, 175 and 189
     println("it's Purple!");
      currentState = State.INFO_7;
    }
   }
}

boolean isPink(color c) {
  float red = red(c);
  float green = green(c);
  float blue = blue(c);
  
  
  return red > 240 && green < red && blue < red && green >= 170 && blue >= 190 && blue > green;
}

boolean isBlack(color c) {
  float red = red(c);
  float green = green(c);
  float blue = blue(c);
 
  return red < 10 && green < 10 && blue < 10 && red+blue+green < 20 && red+green+blue != 0;
}

boolean isYellow(color c) {
  float red = red(c);
  float green = green(c);
  float blue = blue(c);

  return red > 240 && green > 240 && blue < 10 && green > blue && red > blue;
}

boolean isOrange(color c) {
  float red = red(c);
  float green = green(c);
  float blue = blue(c);
  
  return red > 245 && green > 120 && blue < 50 && red > green && green > blue && green < 170;
}

boolean isRed(color c) {
  float red = red(c);
  float green = green(c);
  float blue = blue(c);
 
  return red > 230 && green < 40 && blue < 50 && red > green && red > blue;
}

boolean isCyan(color c) {
  float red = red(c);
  float green = green(c);
  float blue = blue(c);
 
  return red < 10 && green > 150 && blue > 220 && green > red && blue > red && blue > green;
}

boolean isPurple(color c) {
  float red = red(c);
  float green = green(c);
  float blue = blue(c);
  
  return red > 160 && green < 80 && blue > 160 && green < red && green < blue;
}

void mousePressed() {
  lastX = mouseX;
}

void mouseDragged() {
  if (lastX >= 0) {
    double xdiff = mouseX - lastX;
    rotAngle += (xdiff * 0.003);
  }
  lastX = mouseX;
}

void mouseClicked() {
  click = new java.awt.Point((int)mouseX, (int)mouseY);
}

void do_info1() {//christ redeemer
  // TODO: draw
  redeemer = loadImage("christ_redeemer.jpg");
  image(redeemer, 0, 0);
  String info1 = "The Art Deco-style Christ the Redeemer statue has been looming over 
  the Brazilians from upon Corcovado mountain in an awe-inspiring state of eternal blessing since 1931. 
  The 130-foot reinforced concrete-and-soapstone statue was designed by Heitor da Silva Costa and cost 
  approximately $250,000 to build - much of the money was raised through donations. The statue has become 
  an easily recognized icon for Rio and Brazil.";
  fill(50);
  textSize(25);
  text(info1, 10, 250, 750, 600);
  
  // on click, return to globe screen
  if (click != null) {
    currentState = State.DISPLAY_GLOBE;
  }
}

void do_info2() {//gardens of babylon
  // TODO: draw
  gardens = loadImage("gardens_of_bab.jpg");
  image(gardens, 0, 0);
  String info2_a = "The Hanging Gardens of Babylon are thought to have been built in the ancient city of Babylon. 
  Even though there is no proof that they actually existed, they are considered to be one of the Seven Wonders of the World.";

  String info2_b = "It is called the Hanging Gardens because the gardens were built high above the ground on multi-level stone 
  terraces. The plants weren't rooted in the earth like a traditional garden. If it existed it was likely the most beautiful man-made gardens ever created.";
  fill(50);
  textSize(25);
  text(info2_a, 420, 10, 350, 700);
  text(info2_b, 10, 350, 780, 300);
  // on click, return to globe screen
  if (click != null) {
    currentState = State.DISPLAY_GLOBE;
  }
}

void do_info3() {//machu picchu
  // TODO: draw
  machu_picchu = loadImage("machu_picchu.jpg");
  image(machu_picchu, 0, 0);
  String info3_a = "Machu Picchu, an Incan city of sparkling granite precariously perched between 2 towering Andean peaks, 
  is thought by scholars to have been a sacred archaeological center for the nearby Incan capital of Cusco. Built at the peak of the Incan Empire in the mid-1400s, 
  this mountain citadel was later abandoned by the Incas.";

  String info3_b = "The site remained unknown except to locals until 1911, when it was rediscovered by archaeologist Hiram Bingham. 
  The site can only be reached by foot, train or helicopter; most visitors visit by train from nearby Cusco.";
  fill(50);
  textSize(23);
  text(info3_a, 440, 0, 365, 600);
  text(info3_b, 5, 450, 800, 600);
  
  // on click, return to globe screen
  if (click != null) {
    currentState = State.DISPLAY_GLOBE;
  }
}

void do_info4() {//chichen itza
  // TODO: draw
  itza = loadImage("chichenitza.jpg");
  image(itza, 0, 0);
  String info4 = "The genius and adaptability of Mayan culture can be seen in the splendid ruins of Chichen Itza. 
  This powerful city, a trading center for cloth, slaves, honey and salt, flourished from approximately 800 to 1200, 
  and acted as the political and economic hub of the Mayan civilization. The most familiar ruin at the site is El Caracol, a sophisticated astronomical observatory.";
  fill(50);
  textSize(25);
  text(info4, 410, 5, 365, 700);
  
  // on click, return to globe screen
  if (click != null) {
    currentState = State.DISPLAY_GLOBE;
  }
}


void do_info5() {//colosseum
  // TODO: draw
  colosseum = loadImage("colosseum.jpg");
  image(colosseum, 0, 0);
  String info5_a = "Rome's, if not Italy's, most enduring icon is undoubtedly its Colosseum. Built between A.D. 70 and 80 A.D., 
  it was in use for some 500 years. The elliptical structure sat nearly 50,000 spectators, who gathered to watch the gladiatorial 
  events as well as other public spectacles, including battle reenactments, animal hunts and executions.";

  String info5_b = "Earthquakes and stone-robbers have left the Colosseum in a state of ruin, but portions of the structure remain 
  open to tourists, and its design still influences the construction of modern-day amphitheaters, some 2,000 years later.";
  fill(50);
  textSize(23);
  text(info5_a, 400, 0, 400, 500);
  text(info5_b, 10, 400, 800, 200);
  
  // on click, return to globe screen
  if (click != null) {
    currentState = State.DISPLAY_GLOBE;
  }
}

void do_info6() {//great wall
  // TODO: draw
  wall_china = loadImage("wall_of_china.jpg");
  image(wall_china, 0, 0);
  String info6 = "Built between the 5th century B.C. and the 16th century, the Great Wall of China 
  is a stone-and-earth fortification created to protect the borders of the Chinese Empire from invading Mongols. 
  The Great Wall is actually a succession of multiple walls spanning approximately 4,000 miles, making it the world's longest manmade structure.";
  fill(50);
  textSize(25);
  text(info6, 5, 300, 790, 600);
  
  
  // on click, return to globe screen
  if (click != null) {
    currentState = State.DISPLAY_GLOBE;
  }
}

void do_info7() {//taj mahal
  // TODO: draw
  taj_mahal = loadImage("taj_mahal.jpg");
  image(taj_mahal, 0, 0);
  String info7 = "A mausoleum commissioned for the wife of Mughal Emperor Shah Jahan, the Taj 
  Mahal was built between 1632 and 1648. Considered the most perfect specimen of Muslim art in India, 
  the white marble structure actually represents a number of architectural styles, including Persian, Islamic, 
  Turkish and Indian. The Taj Mahal also encompasses formal gardens of raised pathways, sunken flower beds and a linear reflecting pool.";
  fill(50);
  textSize(25);
  text(info7, 370, 10, 400, 550);
  
  // on click, return to globe screen
  if (click != null) {
    currentState = State.DISPLAY_GLOBE;
  }
}
