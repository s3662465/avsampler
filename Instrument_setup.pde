//instrument loader

void inst_loader() {
  if (synth_select == true) {
    synth_selected();
    println("synth ready now...");
    redraw();
    // noLoop();

    bass_select = false;
    drum_select = false;
    sampler_select = false;
  }

  if (bass_select == true) {
    bass_selected();
    println("bass ready now...");
    redraw();
    // noLoop();

    synth_select = false;
    drum_select = false;
    sampler_select = false;
  }

  if (drum_select == true) {
    drum_selected();
    println("drum ready now...");
    redraw();
    // noLoop();

    bass_select = false;
    synth_select = false;
    sampler_select = false;
  }  

  if (sampler_select == true) {
    sampler_selected();
    println("sampler ready now...");
    redraw();
    // noLoop();

    bass_select = false;
    drum_select = false;
    synth_select = false;
  }
}




//instrument keyboard loader

void inst_key_loader() {
  if (synth_select) {
    synth_panel();
  } else if (( bass_select = true) ||
    (drum_select = true) ||
    (sampler_select = true)) 
  {
    synth_select = false;
  }

  if (bass_select) {
    bass_panel();
    redraw();
    // noLoop();
  } else if (( synth_select = true) ||
    (drum_select = true) ||
    (sampler_select = true))
  {
    bass_select = false;
  }

  if (drum_select) {
    drum_panel();
    redraw();
    // noLoop();
  } else if (( bass_select = true) ||
    (synth_select = true) ||
    (sampler_select = true))
  {
    drum_select = false;
  }  

  if (sampler_select) {
    sampler_panel();
    redraw();
    // noLoop();
  } else if ( ( bass_select = true) ||
    (drum_select = true) ||
    (synth_select = true)) 
  {
    sampler_select = false;
  }
}




//=============instrument loader library=================

//---------------------synth---------------------------
void synth_selected() {

  synth_inst();

  synth_select = true;
  println("synth loaded...");

  bass_select = false;
  drum_select = false;
  sampler_select = false;
  // noLoop();
}


void synth_panel() {
  if (synth_select) {

    bass_select = false;
    sampler_select = false;
    drum_select = false;

    synth_inst_key();
  } else {
    synth_select = false;
  }
}

void synth_keyboard() {
  if (synth_select) {

    bass_select = false;
    sampler_select = false;
    drum_select = false;

    synth_keyboard_key();
  } else {
    synth_select = false;
  }
}

//---------------------bass---------------------------

void bass_selected() {
  bass_inst();

  bass_select = true;
  println("bass loaded...");

  synth_select = false;
  drum_select = false;
  sampler_select = false;
  redraw();
  // noLoop();
}

void bass_panel() {
  if (bass_select) {

    synth_select = false;
    sampler_select = false;
    drum_select = false;

    bass_inst_key();
  } else {
    bass_select = false;
  }
}

void bass_keyboard() {
  if (bass_select) {

    synth_select = false;
    sampler_select = false;
    drum_select = false;

    bass_keyboard_key();
  } else {
    bass_select = false;
  }
}

//---------------------sampler---------------------------

void sampler_selected() {
  sampler_inst();

  sampler_select = true;
  println("sampler loaded...");

  synth_select = false;
  drum_select = false;
  bass_select = false;
  redraw();
  // noLoop();
}

void sampler_panel() {
  if (sampler_select) {

    synth_select = false;
    bass_select = false;
    drum_select = false;

    sampler_inst_key();
  } else {
    sampler_select = false;
  }
}

//---------------------drum---------------------------

void drum_selected() {
  drum_inst();

  drum_select = true;
  println("bass loaded...");

  synth_select = false;
  bass_select = false;
  sampler_select = false;
}

void drum_panel() {
  if (drum_select) {

    synth_select = false;
    bass_select = false;
    sampler_select = false;

    drum_inst_key();
  } else {
    drum_select = false;
  }
}


//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
