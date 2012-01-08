//create window and bar icon
void createICON()
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

  createICON();
  createButton();

  LBLPanelSelection = new GLabel(this, "RGB panel type:", 15, 370, 140, 0);
  LBLSerialPort = new GLabel(this, "Select COM: ", 15, 400, 120, 0);
  //LBLFooterSx = new GLabel(this, "Lettura (mm)", 10, 455, 200, 0);
  LBLFooterDx = new GLabel(this, "2011 © Ing. M.Lampugnani", 570, 455, 800, 0);

  createSlider();
  createCombos();
  img = loadImage("RGBR.png");
}

