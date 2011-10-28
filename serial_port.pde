//! Porta in ordine numerico usata di default
int serial_device_number = 0;
String portName = Serial.list()[serial_device_number];

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

void change_serial(int device_number)
{
  println("Change to dev index: "+device_number);
  myPort.stop();

  portName = Serial.list()[device_number];
  //ComboSerialPort();
  CBOSerialPort.setSelected(device_number);

  myPort = new Serial(this, portName, 9600); 
  myPort.clear();

  println("from setup: myPort.available = "+myPort.available() + " for port name " + portName);
}

public void ComboSerialPort() {
  println("portName: "+portName);
  //Create combo for Serial port selection
  //for cyclic update of serial port list
  //uncomment this 4 line and comment the same 4 line in combo file
  //CreateCombos() function
//  String[] SerialPort = new String[] {
//    "Select", " "
//  };
//  CBOSerialPort = new GCombo(this, SerialPort, 2, 120, 400, 150);
  for (int i=0;i<Serial.list().length;i++) {
    //Rimuove l'opzione che sta per rimpiazzare
    CBOSerialPort.removeOption(i);
    CBOSerialPort.addOption(i, Serial.list()[i]);
    println("port avalaible: "+i+","+ Serial.list()[i]);
  }   
  //CBOSerialPort.setSelected(0);
}
