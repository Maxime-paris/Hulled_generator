int drag1 = 1;
int drag2 = 1;
int instruction = 1 ;


void info() 
{

  if ( keyPressed == true  ) { 
    cam.beginHUD();
    fill(255,255,255,150);
    rectMode(CENTER);
    rect(width/2, height/2+25,600,650);
    textSize(24);
    fill(0);
    textAlign(CENTER);

      text("Hold left clic to rotate model.", width/2, height/2);
      text("Change variables to generate prametric model !", width/2, height/4);
      text("Clic Export to save a .OBJ file of your model !", width/2, height-200);

    cam.endHUD();
  }
}
