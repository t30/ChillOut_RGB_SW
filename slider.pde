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
      //    pwmNew = map(slider.getValue(), 0, 100, 50, 255);
      newFSTperiod = slider.getValue();
      newFSTperiod = (int)map((float)newFSTperiod, (float)0, (float)100, (float)5, (float)100);
      //    println("integer value:" + slider.getValue() + " float value:" + slider.getValuef());
      //    println("pressed mouse key");
    }
  }
  else if (slider==SliderSLW) {
    if (slider.isValueChanging()) { 
      //    pwmNew = map(slider.getValue(), 0, 100, 50, 255);
      newSLWperiod = slider.getValue();
      newSLWperiod = (int)map((float)newSLWperiod, (float)0, (float)4096, (float)5, (float)4096);
      //    println("integer value:" + slider.getValue() + " float value:" + slider.getValuef());
      //    println("pressed mouse key");
    }
  }
  else if (slider==SliderLOG) {
    if (slider.isValueChanging()) { 
      //    pwmNew = map(slider.getValue(), 0, 100, 50, 255);
      newLOGperiod = slider.getValue();
      newLOGperiod = (int)map((float)newLOGperiod, (float)0, (float)4096, (float)5, (float)4096);
      //    println("integer value:" + slider.getValue() + " float value:" + slider.getValuef());
      //    println("pressed mouse key");
    }
  }
  else {
  }
}
