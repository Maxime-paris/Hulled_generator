void accueil() {
  cam.beginHUD();
  background(255);
  imageMode(CENTER);
  image(hulled, 500, 250, 300*1.3, 128*1.3);
  fill(0);
  textSize(14);
  text("Welcome on Hulled, a software that generate parametric shells.\nTry me, clic one the sphere below !", 300, 875);
  if ( mouseX>425 & mouseX<575 & mouseY>450 & mouseY<600) {
    coque1.resize(150, 150);
    image(coque1, 500, 550);
  } else {
    coque2.resize(150, 150);
    image(coque2, 500, 550);
  }
  cam.endHUD();
  clic();
}

void clic() {
  if (mousePressed == true & mouseX>425 & mouseX<575 & mouseY>425 & mouseY<575 ) {
    model = 2;
  }
}
