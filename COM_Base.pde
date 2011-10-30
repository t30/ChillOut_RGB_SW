//! Send data over serial port
void sendDATA(String data) {
  myPort.write(data);
  //  drawPanelRGB();
}

//! gira in freerun ed intercetta gli eventi sulla porta seriale
void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  print(char(inByte));
}

//! Print data inside debug-shell
/*! Without newline terminator
*/
void printDATA(String data) {
  print(data);
  print(" -> ");
  //  drawPanelRGB();
}

//! Print data inside debug-shell
/*! With newline terminator
*/
void printlnDATA(String data) {
  //printDATA(data);
  println(data);
  //println();
  //  drawPanelRGB();
}
