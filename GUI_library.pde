PImage power_on; 
PImage power_off;

PImage splitscr;
PImage splitscr_off;

PImage sam_inst_ui;
PImage drum_inst_ui;
PImage key_inst_ui;
PImage bass_inst_ui;

PImage knob_1;
PImage knob_2;
PImage knob_3;

PImage play;
PImage pause;

PImage rec_arm;
PImage rec_disarm;

boolean record_toggle = false;

//---------GUI loader---------------

void GUI_caller() {
  if (synth_select == true) {
    key_inst_ui();
    //    println("synth ui loaded ");
  }
  if (bass_select == true) {
    bass_inst_ui();
    //    println("bass ui loaded");
  }
  if (sampler_select == true) {
    sam_inst_ui();
    //    println("sampler ui loaded");
  }
  if (drum_select  == true) {
    drum_inst_ui();
    //    println("drum ui loaded");
  }
  if (split_to_vis  == true) {
    splitscr();
    //    println("visualiser ui loaded");
  } else if (split_to_vis == false) {
    splitscr_off();
    //    println("visualiser ui is not loaded");
  }
  if (record_toggle == true) {
    rec_arm();
  } 
  if (record_toggle == false) {
    rec_disarm();
  }
}


//-------GUI library--------

void power_on() {
  wavv = loadImage("WAVMACHINE/ui_asset/wavmachine_on.png");
  wavv.resize(winx, winy);
  image(wavv, 0, 0);
}

void splitscr_off() {
  splitscr_off = loadImage("WAVMACHINE/ui_asset/splitscr_off.png");
  splitscr_off.resize(winx, winy);
  image( splitscr_off, 0, 0);
}

void splitscr() {
  splitscr = loadImage("WAVMACHINE/ui_asset/splitscr.png");
  splitscr.resize(winx, winy);
  image( splitscr, 0, 0);
}

void rec_disarm() {
  rec_disarm = loadImage("WAVMACHINE/ui_asset/rec_disarm.png");
  rec_disarm.resize(winx, winy);
  image(rec_disarm, 0, 0);
}

void rec_arm() {
  rec_arm = loadImage("WAVMACHINE/ui_asset/rec_arm.png");
  rec_arm.resize(winx, winy);
  image(rec_arm, 0, 0);
}

void pause() {
  pause = loadImage("WAVMACHINE/ui_asset/pause.png");
  pause.resize(winx, winy);
  image(pause, 0, 0);
}

void play() {
  play = loadImage("WAVMACHINE/ui_asset/play.png");
  play.resize(winx, winy);
  image(play, 0, 0);
}

void knob_1() {
  knob_1 = loadImage("WAVMACHINE/ui_asset/knob_1.png");
  //  knob_1.resize(winx, winy);
  image(knob_1, 0, 0);
}

void key_inst_ui() {
  key_inst_ui = loadImage("WAVMACHINE/ui_asset/key_inst.png");
  key_inst_ui.resize(winx, winy);
  image(key_inst_ui, 0, 0);
}

void drum_inst_ui() {
  drum_inst_ui = loadImage("WAVMACHINE/ui_asset/drum_inst.png");
  drum_inst_ui.resize(winx, winy);
  image(drum_inst_ui, 0, 0);
}

void bass_inst_ui() {
  bass_inst_ui = loadImage("WAVMACHINE/ui_asset/bass_inst.png");
  bass_inst_ui.resize(winx, winy);
  image(bass_inst_ui, 0, 0);
}

void sam_inst_ui() {
  sam_inst_ui = loadImage("WAVMACHINE/ui_asset/sam_inst.png");
  sam_inst_ui.resize(winx, winy);
  image( sam_inst_ui, 0, 0);
}

//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
