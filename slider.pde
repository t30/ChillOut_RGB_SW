// Handle slider events
public void handleSliderEvents(GSlider slider) {
  if (slider==SliderPWR) {
    if (slider.isValueChanging()) { 
      //    pwmNew = map(slider.getValue(), 0, 100, 50, 255);
      pwmNew = slider.getValue();
      pwmNew = (int)map((float)pwmNew, (float)0, (float)100, (float)2, (float)255);
      //    println("integer value:" + slider.getValue() + " float value:" + slider.getValuef());
      //    println("pressed mouse key");
    }
  }
  else if (slider==SliderFST) {
    if (slider.isValueChanging()) { 
      newFSTperiod = slider.getValue();
      newFSTperiod = (int)map((float)newFSTperiod, (float)0, (float)100, (float)5, (float)100);
    }
  }
  else if (slider==SliderSLW) {
    if (slider.isValueChanging()) { 
      newSLWperiod = slider.getValue();
      newSLWperiod = (int)map((float)newSLWperiod, (float)0, (float)200, (float)5, (float)4095);
    }
  }
  else if (slider==SliderLOG) {
    if (slider.isValueChanging()) { 
      newLOGperiod = slider.getValue();
      newLOGperiod = (int)map((float)newLOGperiod, (float)0, (float)200, (float)5, (float)4095);
    }
  }
  else {
  }
}


// there are 3 types
// GWSlider.DECIMAL  e.g.  0.002
// GWSlider.EXPONENT e.g.  2E-3
// GWSlider.INTEGER
void createSlider() {
  //setting up max PWM value
  SliderPWR = new GWSlider(this, "blue18px", 20, 175, 250);
  SliderPWR.setValueType(GWSlider.INTEGER);
  SliderPWR.setLimits(100, 0, 100);
  SliderPWR.setRenderValueLabel(false);


  //setting up FastPeriod inerval
  SliderFST = new GWSlider(this, "blue18px", 20, 225, 250);
  SliderFST.setValueType(GWSlider.INTEGER);
  SliderFST.setLimits(50, 0, 100);
  SliderFST.setRenderValueLabel(false);

  //setting up SlowPeriod inerval
  SliderSLW = new GWSlider(this, "blue18px", 20, 275, 250);
  SliderSLW.setValueType(GWSlider.INTEGER);
  SliderSLW.setLimits(100, 0, 200);
  SliderSLW.setRenderValueLabel(false);

  //setting up LogPeriod inerval
  SliderLOG = new GWSlider(this, "blue18px", 20, 325, 250);
  SliderLOG.setValueType(GWSlider.INTEGER);
  SliderLOG.setLimits(100, 0, 200);
  SliderLOG.setRenderValueLabel(false);
}

