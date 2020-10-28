import peasy.*;
import nervoussystem.obj.*;
import controlP5.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
import processing.opengl.*;


ControlP5 cp5;
PeasyCam cam;

PMatrix3D baseMat;                                 
PImage hulled, coque1, coque2;
PFont font, font2;
int menu;
boolean Export = false;
boolean ExportAction = false;
int iteration = 4;
float longitude1 = 0.2;
float latitude1 = 0.2;
float latitude2 = 1;
float longitude2 = 2;
int model = 0;
String dir2 = "";

void setup() {
  Export = false;
  globe = new PVector[total+1][total+1]; 
  baseMat = g.getMatrix(baseMat);                   

  hulled = loadImage("data/img/hulled.jpg");
  coque1 = loadImage("data/img/coque1.jpg");
  coque2 = loadImage("data/img/coque2.jpg");
  font = createFont("data/fonts/Roboto-Regular.ttf", 32);
  font2 = createFont("data/fonts/Roboto-Bold.ttf", 12);
  textFont(font);
  size(1000, 1000, P3D);
  strokeWeight(1);
  smooth();
  stroke(255);


  /*cam = new PeasyCam(this, 100);
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(500);*/

  cam = new PeasyCam(this, 2000);
  cp5 = new ControlP5(this);


  cp5.addSlider("latitude1")
    .setPosition(590, 10)
    .setRange(0.1, 2)
    .setSize(200, 30)
    .setFont(font2)
    .setColorBackground(color(98, 119, 107))
    .setColorForeground(color(181, 223, 199))
    .setColorActive(color(212, 249, 228))
    .setColorValue(color(0));

  cp5.getController("latitude1").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);



  cp5.addSlider("latitude2")
    .setPosition(590, 70)
    .setRange(0.1, 2)
    .setSize(200, 30)
    .setFont(font2)
    .setColorBackground(color(98, 119, 107))
    .setColorForeground(color(181, 223, 199))
    .setColorActive(color(212, 249, 228))
    .setColorValue(color(0));

  cp5.getController("latitude2").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);



  cp5.addSlider("longitude2")
    .setPosition(300, 70)
    .setRange(1, 1.9)
    .setSize(200, 30)
    .setFont(font2)
    .setColorBackground(color(98, 119, 107))
    .setColorForeground(color(181, 223, 199))
    .setColorActive(color(212, 249, 228))
    .setColorValue(color(0));

  cp5.getController("longitude2").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);



  cp5.addSlider("longitude1")
    .setPosition(300, 10)
    .setRange(0.1, 1)
    .setSize(200, 30)
    .setFont(font2)
    .setColorBackground(color(98, 119, 107))
    .setColorForeground(color(181, 223, 199))
    .setColorActive(color(212, 249, 228))
    .setColorValue(color(0));

  cp5.getController("longitude1").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);



  cp5.addSlider("iteration")
    .setPosition(10, 10)
    .setRange( 0, 20)
    .setSize(200, 30)
    .setFont(font2)
    .setColorBackground(color(98, 119, 107))
    .setColorForeground(color(181, 223, 199))
    .setColorActive(color(212, 249, 228))
    .setColorValue(color(0));

  cp5.getController("iteration").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);



  cp5.addRadioButton("model")
    .setPosition(10, 825)
    .setFont(font2)
    .setItemWidth(20)
    .setItemHeight(20)
    .addItem("FULL", 2)
    .addItem("SPLITTED", 1)
    .addItem("EXPERIMENTAL", 3)
    .activate(0)
    .setColorBackground(color(98, 119, 107))
    .setColorForeground(color(181, 223, 199))
    .setColorActive(color(212, 249, 228))
    .setColorValue(color(0));


  cp5.addButton("Export")
    .setDefaultValue(0)
    .setPosition(782, 952)
    .setSize(200, 30)
    .setFont(font2)
    .setColorBackground(color(98, 119, 107))
    .setColorForeground(color(181, 223, 199))
    .setColorActive(color(212, 249, 228))
    .setColorValue(color(0));









  cp5.setAutoDraw(false);
}







void draw() {
  background(0);
  if (mouseY<120) {                   
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }

  pushMatrix();                  
  g.setMatrix(baseMat);
  lights();
  popMatrix();
  drawmodel(model);
}                                                    


void drawmodel(int n) {
  if (ExportAction) {
    beginRecord("nervoussystem.obj.OBJExport", dir2 + "Export##.obj");
    ExportAction = false;
  }
  switch(n) {
  case 1:
    model1();
    break;
  case 2:
    model2();
    break;
  case 3:
    model3();
    break;
  default:
    accueil();
    clic();
    break;
  }
  endRecord();
  if ( n != 0 ) {
    export();
    gui();
    info();
  }
}

void model(int n) {
  switch(n) {
    case(0):
    model = 0;
    break;
    case(1):
    model = 1;
    break;
    case(2):
    model = 2;
    break;
    case(3):
    model = 3;
    break;
  }
}



void model1() {



  fill(220, 252, 229);
  sphere1(500);
  translate(0, -150, 0);
  sphere2(500);
  
}

void model2() {



  fill(220, 252, 229);
  sphereg();

}

void model3() {



  fill(220, 252, 229);
  sphere4();

}

void gui() {                                              
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  fill(255);
  rectMode(CORNER);
  rect(0, 933.333, 1000, 66.666);
  image(hulled, 70, 965, 300/3, 128/3);
  textAlign(CENTER);
  fill(0);
  textSize(14);
  text("Press any key for Help.", width/4.5, 979);

  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void export() {

  if ( Export ) {
    Export = false; 
    selectFolder("Select a folder to process:", "folderSelected");
  }
}
void folderSelected(File selection)
{
  if (selection == null)
  {
    return;
  } else
  {
    dir2 = selection.getPath()+ "\\";
    ExportAction = true;
    Export = false; 
  }
}
