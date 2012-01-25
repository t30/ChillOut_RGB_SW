/*! @file ChillOut_RGB_SW.pde
// Control an RGB network lamp via RF module
//
// Subtractive Color Wheel with Serial
// Color Wheel function by Ira Greenberg. 
// 
// The primaries are red, yellow, and blue. The secondaries are green, 
// purple, and orange. The tertiaries are  yellow-orange, red-orange, 
// red-purple, blue-purple, blue-green, and yellow-green.
// 
// Create a shade or tint of the subtractive color wheel using
// SHADE or TINT parameters.

 @author Ing. M.Lampugnani
 @par Company:
 MyCompany
 @version 0.0.1-RF brach
 @date 31th October 2011 */

import guicomponents.*;
import processing.serial.*;

int pwm = 255;     //!<  MAX brightness value
int pwmNew = 255;  //!<  New MAX brightness value (used by dynamic function)

int FSTperiod = 100;
int newFSTperiod = 100;
int SLWperiod = 100;
int newSLWperiod = 100;
int LOGperiod = 100;
int newLOGperiod = 100;

int RGBMode = 0;    //!<  intial Mode for RGBPanel Selection
int bkgCol = 127;   //!<  Background Color
PImage img;	    //!<  Load Background image for 

int segs = 12;
int steps = 25;
float rotAdjust = TWO_PI / segs / 2;
float radius;
float segWidth;
float interval = TWO_PI / segs;

Serial myPort;     //!<  initialize serial port

GLabel LBLFooterSx, LBLFooterDx, LBLPanelSelection, LBLSerialPort;
GButton BTNOn, BTNOff, BTNRand, BTNFlsh, BTNUfo, BTNcircle;
GWSlider SliderPWR, SliderFST, SliderSLW, SliderLOG;
GCombo CBORGBSel, CBOSerialPort, CBODBGlvl, CBOTMRsht;
GTextField TXTlog;


void setup() {
  size(800, 480);
  //  ImageIcon titlebaricon = new ImageIcon(loadBytes("myicon.gif"));
  //  frame.setIconImage("favicon.ico");
  frame.setTitle("RGB-SW test - 2011  ↄ⃝  Ing. M.Lampugnani");

  background(bkgCol);
  smooth();
  ellipseMode(RADIUS);
  noStroke();

  // make the diameter 90% of the sketch area
  radius = min(width, height) * 0.45;
  segWidth = radius / steps;

  //  drawShadeWheel();

  settingGUI();

  ComboSerialPort();
  ChangeSerialSetup();

  //do not start looping draw() func
  //noLoop();
  //draw the RGB Selection panel the first time
  drawPanelRGB();
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
  if (mouseX > 320) {  //controllo per non eseguire le operazioni in zona tasti
    // get the component values:
    int r = int(red(targetColor));
    int g = int(green(targetColor));
    int b = int(blue(targetColor));
    // make a comma-separated string:
    String colorString = "rgb_" + hex(r, 2) + hex(g, 2) + hex(b, 2) + "\r\n";
    printDATA(colorString);
    // send it out the serial port:
    sendDATA(colorString );
  }
  noLoop();
  if (pwmNew != pwm) {
    pwm = pwmNew;
    printDATA("NewMaxPwm: "+pwm);
    sendDATA("pwm_" +  hex( pwm, 2 ) + "0000\r\n" );
  }
  if (newFSTperiod != FSTperiod) {
    FSTperiod = newFSTperiod;
    printDATA("newFSTperiod: "+FSTperiod);
    sendDATA("clk_0" + hex( FSTperiod, 3 ) + "00\r\n" );
  }
  if (newSLWperiod != SLWperiod) {
    SLWperiod = newSLWperiod;
    printDATA("newSLWperiod: "+SLWperiod);
    sendDATA("clk_1" + hex( SLWperiod, 3 ) + "00\r\n" );
  }
  if (newLOGperiod != LOGperiod) {
    LOGperiod = newLOGperiod;
    printDATA("newLOGperiod: "+LOGperiod);
    sendDATA("clk_2" + hex( LOGperiod, 3 ) + "00\r\n" );
  }
}


// Handle Option events
public void handleOptionEvents(GOption selected, GOption deselected) {
  println("Option selected: "+selected+" deselected:"+deselected);
}

