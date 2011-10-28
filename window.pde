void ICONsetup()
{
  PGraphics icon = createGraphics(40, 40, JAVA2D);
  icon.beginDraw();
  icon.noStroke();
  icon.fill(#FFFFFF);
  icon.ellipse(20, 20, 100, 100);
  icon.fill(#55AAFF);
  icon.ellipse(8, 8, 40, 40);
  icon.fill(#FFEE22);
  icon.ellipse(9, 6, 8, 6);
  icon.stroke(#FF0000);
  icon.strokeWeight(14);
  icon.line(7, 0, 7, 40);
  icon.stroke(#00FF00);
  icon.strokeWeight(14);
  icon.line(20, 0, 20, 40);
  icon.stroke(#0000FF);
  icon.strokeWeight(14);
  icon.line(33, 0, 33, 40);
  icon.endDraw();
  frame.setIconImage(icon.image);
}

void settingGUI() {
  //GComponent.globalColor = GCScheme.getColor(this,  GCScheme.BLUE_SCHEME);
  GComponent.globalFont = GFont.getFont(this, "Georgia", 16);

  ICONsetup();

  BTNOn = new GButton(this, "On", 20, 20, 120, 40);
  BTNOff = new GButton(this, "Off", 150, 20, 120, 40);
  //BTNRand = new GButton(this, "Rand", 20, 70, 120, 40);
  //BTNFlsh = new GButton(this, "Flash", 150, 70, 120, 40);
  BTNRand = new GButton(this, "Rand", 20, 70, 80, 40);
  BTNFlsh = new GButton(this, "Flash", 105, 70, 80, 40);
  BTNUfo  = new GButton(this, "Ufo", 190, 70, 80, 40);
  BTNcircle  = new GButton(this, "Circle", 20, 120, 250, 40);

  SliderPWR = new GWSlider(this, "blue18px", 20, 175, 250);

  SliderFST = new GWSlider(this, "blue18px", 20, 225, 250);
  SliderFST.setValueType(GWSlider.INTEGER);
  SliderFST.setLimits(50, 0, 100);
  SliderFST.setRenderValueLabel(false);

  SliderSLW = new GWSlider(this, "blue18px", 20, 275, 250);
  SliderSLW.setValueType(GWSlider.INTEGER);
  SliderSLW.setLimits(100, 0, 4096);
  SliderSLW.setRenderValueLabel(false);

  SliderLOG = new GWSlider(this, "blue18px", 20, 325, 250);
  SliderLOG.setValueType(GWSlider.INTEGER);
  SliderLOG.setLimits(100, 0, 4096);
  SliderLOG.setRenderValueLabel(false);

  LBLPanelSelection = new GLabel(this, "RGB panel type:", 15, 370, 140, 0);
  LBLSerialPort = new GLabel(this, "Select COM: ", 15, 400, 120, 0);
  //LBLFooterSx = new GLabel(this, "Lettura (mm)", 10, 455, 200, 0);
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
