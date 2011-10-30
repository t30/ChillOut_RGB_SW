// Handle button events
public void handleButtonEvents(GButton button) {
  if (button.eventType == GButton.CLICKED) { 

    if (button == BTNOn) {
      printDATA("BTNOn");
      sendDATA("set_100000\r\n");
    }       
    else if (button == BTNOff) {
      printDATA("BTNOff");
      sendDATA("set_000000\r\n");
    }
    else if (button == BTNRand) {
      printDATA("BTNRand");
      sendDATA("prg_R00000\r\n");
    }
    else if (button == BTNFlsh) {
      printDATA("BTNFlsh");
      sendDATA("prg_F00000\r\n");
    }
    else if (button == BTNUfo) {
      printDATA("BTNUfo");
      sendDATA("prg_U00000\r\n");
    }
    else if (button == BTNcircle) {
      printDATA("BTNcircle");
      sendDATA("prg_C00000\r\n");
    }
    else {
      printDATA("other");
    }
  }
}

void createButton(){
  
  BTNOn = new GButton(this, "On", 20, 20, 120, 40);
  BTNOff = new GButton(this, "Off", 150, 20, 120, 40);
  BTNRand = new GButton(this, "Rand", 20, 70, 80, 40);
  BTNFlsh = new GButton(this, "Flash", 105, 70, 80, 40);
  BTNUfo  = new GButton(this, "Ufo", 190, 70, 80, 40);
  BTNcircle  = new GButton(this, "Circle", 20, 120, 250, 40);

}
