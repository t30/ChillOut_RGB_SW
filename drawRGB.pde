//setta i parametri necessari per disegnare il pannello di
//selezione colori RGB
void setDrawRGBparam() {
  int segs = 12;
  steps = 25;
  rotAdjust = TWO_PI / segs / 2;
  interval = TWO_PI / segs;
  // make the diameter 90% of the sketch area
  radius = min(width, height) * 0.45;
  segWidth = radius / steps;
}

//draw the RGB selection panel
void drawPanelRGB() {
  setDrawRGBparam();
  background(bkgCol);
  switch(RGBMode) {
    case(0): 
    {
      setDrawRGBparam();
      drawShadeWheel();
      break;
    }
    case(1): 
    {
      setDrawRGBparam();
      drawTintWheel();
      break;
    }
    case(2): 
    {
      image(img, 300, 0);
      img.loadPixels();
      break;
    }
  default: 
    {
      //default choice
      setDrawRGBparam();
      drawShadeWheel();
      break;
    }
  }
}

void drawShadeWheel() {
  for (int j = 0; j < steps; j++) {
    color[] cols = { 
      color(255-(255/steps)*j, 255-(255/steps)*j, 0), 
      color(255-(255/steps)*j, (255/1.5)-((255/1.5)/steps)*j, 0), 
      color(255-(255/steps)*j, (255/2)-((255/2)/steps)*j, 0), 
      color(255-(255/steps)*j, (255/2.5)-((255/2.5)/steps)*j, 0), 
      color(255-(255/steps)*j, 0, 0), 
      color(255-(255/steps)*j, 0, (255/2)-((255/2)/steps)*j), 
      color(255-(255/steps)*j, 0, 255-(255/steps)*j), 
      color((255/2)-((255/2)/steps)*j, 0, 255-(255/steps)*j), 
      color(0, 0, 255-(255/steps)*j), 
      color(0, 255-(255/steps)*j, (255/2.5)-((255/2.5)/steps)*j), 
      color(0, 255-(255/steps)*j, 0), 
      color((255/2)-((255/2)/steps)*j, 255-(255/steps)*j, 0)
    };
    for (int i = 0; i < segs; i++) {
      fill(cols[i]);
      arc((width/2)+150, (height/2), radius, radius, 
      interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }
}


void drawTintWheel() {
  for (int j = 0; j < steps; j++) {
    color[] cols = { 
      color((255/steps)*j, (255/steps)*j, 0), 
      color((255/steps)*j, ((255/1.5)/steps)*j, 0), 
      color((255/steps)*j, ((255/2)/steps)*j, 0), 
      color((255/steps)*j, ((255/2.5)/steps)*j, 0), 
      color((255/steps)*j, 0, 0), 
      color((255/steps)*j, 0, ((255/2)/steps)*j), 
      color((255/steps)*j, 0, (255/steps)*j), 
      color(((255/2)/steps)*j, 0, (255/steps)*j), 
      color(0, 0, (255/steps)*j), 
      color(0, (255/steps)*j, ((255/2.5)/steps)*j), 
      color(0, (255/steps)*j, 0), 
      color(((255/2)/steps)*j, (255/steps)*j, 0)
    };
    for (int i = 0; i < segs; i++) {
      fill(cols[i]);
      arc(width/2+150, height/2, radius, radius, 
      interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }
}
