//----------------------------knob mapping to GUI-------------------------------------------------------------
float krotator_vol;
float krotator_tra;
float krotator_sha;

//----text---------
String string = "Track: "+"Slow_Drum_Beat.mp3"; //main track.
String endoffile = "..."; //end of track name border.
String recording = "> recording..."; //recording status.
String recorded = "> recorded!"; //end recording status.
String volume = "VOLUME"; //volume description.
String transpose = "TRANSPOSE"; //transpose description.
String shape = "SHAPE"; //synth shape description.

//-------shape boolean----------
boolean sawknob = false;
boolean sineknob = false;
boolean squareknob = false;
boolean triangleknob = false;

//--------knob selecttion boolean-------
boolean volume_select = false;
boolean transpose_select = false;
boolean shape_select = false;

//------synth shape definition------

void shapedefinition() {

  if (sawknob == true) {
    sineknob = false;
    squareknob = false;
    triangleknob = false;
  }
  if (sineknob == true) {
    sawknob = false;
    squareknob = false;
    triangleknob = false;
  }
  if (squareknob == true) {
    sineknob = false;
    sawknob = false;
    triangleknob = false;
  }
  if (triangleknob == true) {
    sineknob = false;
    squareknob = false;
    sawknob = false;
  }
}

//---------knob selection----------

void knob_selection() {

  if (mouseX > 649
    && mouseX < 704
    && mouseY > 45 
    && mouseY < 100)
  {
    volume_select = true;
    transpose_select = false;
    shape_select = false;
  }
  if (mouseX > 537
    && mouseX < 594
    && mouseY >  45
    && mouseY < 100)
  {
    volume_select = false;
    transpose_select = true;
    shape_select = false;
  }
  if (mouseX > 424
    && mouseX < 482
    && mouseY > 45 
    && mouseY < 102)
  {
    volume_select = false;
    transpose_select = false;
    shape_select = true;
  }
}

//---------------------------knob sub library used in draw()---------------------
void knob_status() {  

  knob_volume(); //knob volume control.
  knob_transpose(); //knob transpose control.
  knob_shape(); //knob synth shape control.
  roundvalueknob(); //knob synth shape text feedback.
  knob_selection(); // knob selection boolean.

  textSize(9.5);
  fill(0, 219, 255);
}

void launch_controller_capabilities() {

  krotator_vol_control();
  krotator_tra_control();
  krotator_sha_control();
}

void knob_render() {
  knob_1 = loadImage("WAVMACHINE/ui_asset/knob_1.png");

  //knob_3
  pg.beginDraw();
  pg.translate(676, 70); //for third knob.
  pg.rotate(radians(krotator_vol)); //call rotation degrees.
  pg.imageMode (CENTER); //postition the knob origin.
  pg.image(knob_1, 0, 0, 60, 60); // to draw knob on sketch.
  pg.endDraw();
  image(pg, 0, 0);

  //knob_2
  pg.beginDraw();
  pg.translate(564, 70); //for second knob.
  pg.rotate(radians(krotator_tra)); //call rotation degrees.
  pg.imageMode (CENTER); //postition the knob origin.
  pg.image(knob_1, 0, 0, 60, 60); // to draw knob on sketch.
  pg.endDraw();
  image(pg, 0, 0);

  //knob_1
  pg.beginDraw();
  pg.translate(452, 70); //for first knob.
  pg.rotate(radians(krotator_sha)); //call rotation degrees.
  pg.imageMode (CENTER); //postition the knob origin.
  pg.image(knob_1, 0, 0, 60, 60); // to draw knob on sketch.
  pg.endDraw();
  image(pg, 0, 0);

  knob_status();
}


//---------------------------knob control loaded in keyPressed()------------------------
void knob_keyboard_control() {

  knob_controller_vol();
  knob_controller_tra();
  knob_controller_sha();
  redraw();
}


//-----------------------------------knob sub_library------------------------
void krotator_vol_control() {
  try
  { 
    controller = new LaunchController(this);

    controller.getKnob(KNOBS.KNOB_8_LOW).range(1.0, 360.0).defaultValue(1.0).variable("krotator_vol");

    volume_select = true;
  }
  catch(Exception e) {
    println("Unfortunately we could not detect that Launch Control is connected to this computer :(");
  }
}

void krotator_tra_control() {
  try
  { 
    controller = new LaunchController(this);

    controller.getKnob(KNOBS.KNOB_7_LOW).range(1.0, 360.0).defaultValue(1.0).variable("krotator_tra");

    transpose_select = true;
  }
  catch(Exception e) {
    println("Unfortunately we could not detect that Launch Control is connected to this computer :(");
  }
}

void krotator_sha_control() {
  try
  { 
    controller = new LaunchController(this);

    controller.getKnob(KNOBS.KNOB_6_LOW).range(1.0, 360.0).defaultValue(1.0).variable("krotator_sha");

    shape_select = true;
  }
  catch(Exception e) {
    println("Unfortunately we could not detect that Launch Control is connected to this computer :(");
  }
}

void knob_controller_vol() { //keyboard control for knob.

  if (volume_select == true) {

    if (keyCode == UP) {
      krotator_vol = krotator_vol + 20.0;
      krotator_vol = constrain(krotator_vol, 1.0, 360.0);
    }
    if (keyCode == DOWN) {
      krotator_vol = krotator_vol - 20.0;
      krotator_vol = constrain(krotator_vol, 1.0, 360.0);
    } else { 
      volume_select = false;
    }
  }
}
void knob_controller_tra() { //keyboard control for knob.

  if (transpose_select == true) {

    if (keyCode == UP) {
      krotator_tra = krotator_tra + 20.0;
      krotator_tra = constrain(krotator_tra, 1.0, 360.0);
    }
    if (keyCode == DOWN) {
      krotator_tra = krotator_tra - 20.0;
      krotator_tra = constrain(krotator_tra, 1.0, 360.0);
    } else {
      transpose_select = false;
    }
  }
}

void knob_controller_sha() { //keyboard control for knob.

  if (shape_select == true) {

    if (keyCode == UP) {
      krotator_sha = krotator_vol + 20.0;
      krotator_sha = constrain(krotator_sha, 1.0, 360.0);
    }
    if (keyCode == DOWN) {
      krotator_sha = krotator_sha - 20.0;
      krotator_sha = constrain(krotator_sha, 1.0, 360.0);
    } else {
      shape_select = false;
    }
  }
}


void knob_volume() {
  noStroke();
  fill(65, 64, 66);
  rect(641, 122, 69, 12);

  textSize(10);
  fill(0, 255, 133);
  text(volume, 654, 122, 175, 20);//knob_3 : Reactive text to knob for volume.
}


void knob_transpose() {
  noStroke();
  fill(65, 64, 66);
  rect(529, 122, 69, 12);

  textSize(10);
  fill(0, 255, 133);
  text(transpose, 536, 122, 175, 20); //knob_2 : Reactive text to knob for transposition.
}

void knob_shape() {
  noStroke();
  fill(65, 64, 66);
  rect(415, 122, 69, 12);

  textSize(10);
  fill(0, 255, 133);
  text(shape, 433, 122, 175, 20); //knob_1 : Reactive text to knob for synth shape.
}
void launchControllerKnobChanged(KNOBS knob) {
  //Printing the knob name and value, for demonstration purposes only
  println(String.format("Launch Control knob changed: %s  Value: %.1f", knob.name(), 1.0));
}



//------knob rotation to round value mapping---------

void boundingbox_sha() {
  noStroke();
  fill(65, 64, 66);
  rect(415, 122, 69, 12);
}

void boundingbox_tra() {
  noStroke();
  fill(65, 64, 66);
  rect(529, 122, 69, 12);
}

void boundingbox_vol() {
  noStroke();
  fill(65, 64, 66);
  rect(641, 122, 69, 12);
}


void roundvalueknob() {


  //------tra-------
  if (transpose_select == true) {

    if (krotator_tra > 2) {
      synth_transpose = 0;
      boundingbox_tra();
      fill(0, 255, 133);
      text("0", 560, 122, 175, 20);
    }
    if (krotator_tra > 72) {
      synth_transpose = 1;
      boundingbox_tra();
      fill(0, 255, 133);
      text("1", 560, 122, 175, 20);
    }
    if (krotator_tra > 144) { 
      synth_transpose = 2;
      boundingbox_tra();
      fill(0, 255, 133);
      text("2", 560, 122, 175, 20);
    }    
    if (krotator_tra > 216) {
      synth_transpose = 3;
      boundingbox_tra();
      fill(0, 255, 133);
      text("3", 560, 122, 175, 20);
    }
    if (krotator_tra > 288) {
      synth_transpose = 4;
      boundingbox_tra();
      fill(0, 255, 133);
      text("4", 560, 122, 175, 20);
    }
  }

  //------vol-------

  if (volume_select == true) {

    if (krotator_vol > 1) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("1", 672, 122, 175, 20);
    }
    if (krotator_vol > 36) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("2", 672, 122, 175, 20);
    }
    if (krotator_vol > 72) { 
      boundingbox_vol();
      fill(0, 255, 133);
      text("3", 672, 122, 175, 20);
    }    
    if (krotator_vol > 108) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("4", 672, 122, 175, 20);
    }    
    if (krotator_vol > 144) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("5", 672, 122, 175, 20);
    }    
    if (krotator_vol > 180) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("6", 672, 122, 175, 20);
    }
    if (krotator_vol > 216) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("7", 672, 122, 175, 20);
    }
    if (krotator_vol > 252) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("8", 672, 122, 175, 20);
    }
    if (krotator_vol > 288) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("9", 672, 122, 175, 20);
    }
    if (krotator_vol > 324) {
      boundingbox_vol();
      fill(0, 255, 133);
      text("10", 672, 122, 175, 20);
    }
  }

  //------shape-------

  if (shape_select == true) {

    if (krotator_sha > 2) {
      sawknob = true;
      boundingbox_sha();
      fill(0, 255, 133);
      text("SAW", 442, 122, 175, 20);
    }
    if (krotator_sha > 72) {
      sineknob = true;
      boundingbox_sha();
      fill(0, 255, 133);
      text("SINE", 442, 122, 175, 20);
    }
    if (krotator_sha > 144) { 
      triangleknob = true;
      boundingbox_sha();
      fill(0, 255, 133);
      text("TRIANGLE", 431, 122, 175, 20);
    }    
    if (krotator_sha > 216) {
      squareknob = true;
      boundingbox_sha();
      fill(0, 255, 133);
      text("SQUARE", 436, 122, 175, 20);
    }
  }
}

//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
