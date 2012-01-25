// Handle combo events
public void handleComboEvents(GCombo combo) {
  if (CBODBGlvl == combo) {
    int DBGlvl = CBODBGlvl.selectedIndex();
    printDATA("CBODBGlvl: "+DBGlvl);
    sendDATA("dbg_" +  DBGlvl + "00000\r\n" );
  }
  
    if (CBOTMRsht == combo) {
    int TMRtick = CBOTMRsht.selectedIndex();
    printDATA("CBOTMRsht: "+TMRtick);
    sendDATA("set_T" +  TMRtick + "0000\r\n" );
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
  CBODBGlvl = new GCombo(this, DBGlvl, 10, 280, 70, 35);
  CBODBGlvl.setSelected(9);
  
    //Create combo for Timer level setup
  String[] TMRsht = new String[] {
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
  };
  CBOTMRsht = new GCombo(this, TMRsht, 5, 280, 20, 35);
  //CBOTMRsht.setSelected(9);

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
  CBORGBSel = new GCombo(this, RGBType, 2, 150, 370, 120);
  CBORGBSel.setSelected(RGBMode);
}

