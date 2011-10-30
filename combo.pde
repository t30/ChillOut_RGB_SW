// Handle combo events
public void handleComboEvents(GCombo combo) {
  if (CBODBGlvl == combo) {
    //RGBMode = CBODBGlvl.selectedIndex();
    printDATA("CBODBGlvl: "+RGBMode);
    sendDATA("dbg_" +  CBODBGlvl.selectedIndex() + "00000\r\n" );
  }

  if (CBORGBSel == combo) {
    RGBMode = CBORGBSel.selectedIndex();
    printlnDATA("RGBMode: "+RGBMode);
    drawPanelRGB();
    //lblAction.setText("Color changed to " + cboColor.selectedText());
  }


  if (CBOSerialPort == combo) {
    int CBO = CBOSerialPort.selectedIndex();
    change_serial(CBO);
    printlnDATA("SErialPortSelected: "+CBO);
  }
}

public void createCombos() {

  //Create combo for DEBUG level setup
  String[] DBGlvl = new String[] {
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
  };
  CBODBGlvl = new GCombo(this, DBGlvl, 10, 280, 20, 35);


  //Create combo for Serial port selection
  //for NOT-cyclic update of serial port list
  //comment this 4 line and comment the same 4 line in serial_port file
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

