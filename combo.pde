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

public void createCombos() {

  //Create combo for Serial port selection
  //for NOT-cyclic update of serial port list
  //uncomment this 4 line and comment the same 4 line in serial_port file
  //ComboSerialPort() function
  String[] SerialPort = new String[] {
    "Select", " "
  };
  CBOSerialPort = new GCombo(this, SerialPort, 2, 120, 400, 150);

  //Create combo for RGB panel type
  String[] RGBType = new String[] {
    "Shade", "Tint", "Full"
  };
  CBORGBSel = new GCombo(this, RGBType, 3, 150, 370, 120);
  CBORGBSel.setSelected(RGBMode);
}
