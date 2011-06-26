import guicomponents.*;

// Subtractive Color Wheel with Serial
// Based on a Processing example by Ira Greenberg. 
// Serial output added by Tom Igoe
// 
// The primaries are red, yellow, and blue. The secondaries are green, 
// purple, and orange. The tertiaries are  yellow-orange, red-orange, 
// red-purple, blue-purple, blue-green, and yellow-green.
// 
// Create a shade or tint of the subtractive color wheel using
// SHADE or TINT parameters.

// Updated 29 November 2010.

import processing.serial.*;

int pwm = 255;     //!<  MAX brightness value
int pwmNew = 255;  //!<  New MAX brightness value (used by dynamic function)

int RGBMode = 0;    //!<  intial Mode for RGBPanel Selection
int bkgCol = 127;  //!<  Background Color
PImage img;	   //!<  Load Background image for 

int segs = 12;
int steps = 25;
float rotAdjust = TWO_PI / segs / 2;
float radius;
float segWidth;
float interval = TWO_PI / segs;

Serial myPort;    //!<  initialize serial port

GLabel LBLFooterSx, LBLFooterDx, LBLPanelSelection, LBLSerialPort;
GButton BTNOn, BTNOff, BTNRand, BTNFlsh, BTNUfo;
GWSlider SliderPWR;
GCombo CBORGBSel, CBOSerialPort;

void settingGUI() {
  //GComponent.globalColor = GCScheme.getColor(this,  GCScheme.BLUE_SCHEME);
  GComponent.globalFont = GFont.getFont(this, "Georgia", 16);


  BTNOn = new GButton(this, "On", 20, 20, 120, 40);
  BTNOff = new GButton(this, "Off", 150, 20, 120, 40);
  //BTNRand = new GButton(this, "Rand", 20, 70, 120, 40);
  //BTNFlsh = new GButton(this, "Flash", 150, 70, 120, 40);
  BTNRand = new GButton(this, "Rand", 20, 70, 80, 40);
  BTNFlsh = new GButton(this, "Flash", 105, 70, 80, 40);
  BTNUfo  = new GButton(this, "Ufo", 190, 70, 80, 40);

  SliderPWR = new GWSlider(this, "blue18px", 20, 125, 250);

  LBLPanelSelection = new GLabel(this, "RGB panel type:", 15, 165, 140, 0);
  LBLSerialPort = new GLabel(this, "Select COM: ", 15, 400, 120, 0);
  //  LBLFooterSx = new GLabel(this, "Lettura (mm)", 10, 455, 200, 0);
  //LBLFooterDx = new GLabel(this, "2011 © Ing. M.Lampugnani", 570, 455, 800, 0);
  LBLFooterDx = new GLabel(this, "2011 © Ing. M.Lampugnani", 570, 455, 800, 0);

  // there are 3 types
  // GWSlider.DECIMAL  e.g.  0.002
  // GWSlider.EXPONENT e.g.  2E-3
  // GWSlider.INTEGER
  SliderPWR.setValueType(GWSlider.INTEGER);
  SliderPWR.setLimits(100, 0, 100);
  SliderPWR.setRenderValueLabel(false);

  createCombos();
  img = loadImage("RGBR.png");
}

public void createCombos() {
  //Create combo for RGB panel type
  String[] RGBType = new String[] {
    "Shade", "Tint", "Full"
  };
  CBORGBSel = new GCombo(this, RGBType, 3, 150, 165, 120);
  CBORGBSel.setSelected(RGBMode);

  //println(CBORGBSel.selectedIndex());
  //  pnlControls.add(cboColor);
}

//!Test cambio porta seriale al volo
public void ChangeSerialSetup() {
  //  portName = Serial.list()[serial_device_number];
  CBOSerialPort.setSelected(serial_device_number);
  myPort = new Serial(this, portName, 9600); 
  myPort.clear();
  // catch and clear the first message in case it's garbage
  myPort.readStringUntil(59);
  //  serial_read_value = myPort.readStringUntil(59);
  //  serial_read_value = null;
  // println("from setup: serial_port.available = "+serial_port.available());
}

//! Porta in ordine numerico usata di default
int serial_device_number = 0;
String portName = Serial.list()[serial_device_number];

void change_serial(int device_number)
{
  println("Change to dev index: "+device_number);
  myPort.stop();

  portName = Serial.list()[device_number];
  ComboSerialPort();
  CBOSerialPort.setSelected(device_number);

  myPort = new Serial(this, portName, 9600); 
  myPort.clear();
  // catch and clear the first message in case it's garbage
  //myPort.readStringUntil(59);

  println("from setup: myPort.available = "+myPort.available() + " for port name" + portName);
} 

public void ComboSerialPort() {
  println("portName: "+portName);
  //Create combo for Serial port selection
  String[] SerialPort = new String[] {
    "Select", " "
  };
  CBOSerialPort = new GCombo(this, SerialPort, 2, 120, 400, 150);
  for (int i=0;i<Serial.list().length;i++) {
    //Rimuove l'opzione che sta per rimpiazzare
    CBOSerialPort.removeOption(i);
    CBOSerialPort.addOption(i, Serial.list()[i]);
    println("port avalaible: "+i+","+ Serial.list()[i]);
  }   
  //CBOSerialPort.setSelected(0);
}

void setup() {
  size(800, 480);
  //  ImageIcon titlebaricon = new ImageIcon(loadBytes("myicon.gif"));
  //  frame.setIconImage("favicon.ico");
  frame.setTitle("RGB-SW test - 2011  ↄ⃝  Ing. M.Lampugnani");

  background(bkgCol);
  smooth();
  ellipseMode(RADIUS);
  noStroke();

  settingGUI();

  // make the diameter 90% of the sketch area
  radius = min(width, height) * 0.45;
  segWidth = radius / steps;

  //  drawShadeWheel();

  //  println("Before func: ");
  //  println(Serial.list());

  ComboSerialPort();
  ChangeSerialSetup();
  //  ComboSerialPort();

  //! List all the available serial ports:
  //  println("After func: ");
  //  println(Serial.list());

  // open the first serial port in your computer's list
  //myPort = new Serial(this, Serial.list()[0], 9600);

  //do not start looping draw() func
  noLoop();
  //draw the RGB Selection panel the first time
  drawPanelRGB();
}

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

void draw() {
  // nothing happens here
  //delay(1000);
  // swap which line is commented out to draw the other version
  // drawTintWheel();
  // drawShadeWheel();
  drawPanelRGB();
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  // get the color of the mouse position's pixel:
  color targetColor = get(mouseX, mouseY);
  if (mouseX > 300) {  //controllo per non eseguire le operazioni in zona tasti
    // get the component values:
    int r = int(red(targetColor));
    int g = int(green(targetColor));
    int b = int(blue(targetColor));
    // make a comma-separated string:
    String colorString = "rgb " + hex(r, 2) + hex(g, 2) + hex(b, 2) + "\n";
    print(colorString);
    // send it out the serial port:
    myPort.write(colorString );
  }
  noLoop();
  if (pwmNew != pwm) {
    pwm = pwmNew;
    println("NewMaxPwm: "+pwm);
    myPort.write("pwm " +  hex( pwm, 2 )  );
  }
}


// Handle button events

public void handleButtonEvents(GButton button) {
  if (button.eventType == GButton.CLICKED) { 

    if (button == BTNOn) {
      println("BTNOn");
      myPort.write("set 1\r\n");
    }       
    else if (button == BTNOff) {
      println("BTNOff");
      myPort.write("set 0\r\n");
    }
    else if (button == BTNRand) {
      println("BTNRand");
      myPort.write("prg R\r\n");
    }
    else if (button == BTNFlsh) {
      println("BTNFlsh");
      myPort.write("prg F\r\n");
    }
    else if (button == BTNUfo) {
      println("BTNUfo");
      myPort.write("prg U\r\n");
    }
    else {
      println("other");
    }
  }
}

// Handle slider events
public void handleSliderEvents(GSlider slider) {
  if (slider.isValueChanging()) { 

    //    pwmNew = map(slider.getValue(), 0, 100, 50, 255);
    pwmNew = slider.getValue();
    pwmNew = (int)map((float)pwmNew, (float)0, (float)100, (float)2, (float)255);
    //    println("integer value:" + slider.getValue() + " float value:" + slider.getValuef());
    //    println("pressed mouse key");
  }
}

// Handle combo events
public void handleComboEvents(GCombo combo) {
  if (CBORGBSel == combo) {
    RGBMode = CBORGBSel.selectedIndex();
    println("RGBMode: "+RGBMode);
    drawPanelRGB();
    //lblAction.setText("Color changed to " + cboColor.selectedText());
  }

  if (CBOSerialPort == combo) {
    int CBO = CBOSerialPort.selectedIndex();
    change_serial(CBO);
    println("SErialPortSelected: "+CBO);
    //lblAction.setText("Color changed to " + cboColor.selectedText());
  }
}

// Handle Option events
public void handleOptionEvents(GOption selected, GOption deselected) {
  println("Option: "+selected);
}

