// Handle button events
public void handleButtonEvents(GButton button) {
  if (button.eventType == GButton.CLICKED) { 

    if (button == BTNOn) {
      println("BTNOn");
      myPort.write("set_100000\r\n");
    }       
    else if (button == BTNOff) {
      println("BTNOff");
      myPort.write("set_000000\r\n");
    }
    else if (button == BTNRand) {
      println("BTNRand");
      myPort.write("prg_R00000\r\n");
    }
    else if (button == BTNFlsh) {
      println("BTNFlsh");
      myPort.write("prg_F00000\r\n");
    }
    else if (button == BTNUfo) {
      println("BTNUfo");
      myPort.write("prg_U00000\r\n");
    }
    else if (button == BTNcircle) {
      println("BTNcircle");
      myPort.write("prg_C00000\r\n");
    }
    else {
      println("other");
    }
  }
}
