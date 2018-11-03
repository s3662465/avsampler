//----vidd--------
viddmachine win; //video extension

//----minim-------
import ddf.minim.*;       //audio library
import ddf.minim.ugens.*; //synth library
Minim minim;              //audio library
AudioOutput   out;        //audio line out

//----int---------
int winx = 821; //window width setup.
int winy = 442; //window height setup.

//----PImage------
PImage wavv;    //wavmachine base

//----PGraphics---
PGraphics pg; //PGraphics for knob rendering.

//----boolean-----
boolean synth_select = false;
boolean bass_select = false;
boolean sampler_select = false;
boolean drum_select = false;
boolean split_to_vis = false;
boolean usb_connect = false;

//----launchcontroller capabilities----
import pLaunchController.*; //Launch Controller library.
LaunchController controller; //Launch Controller loader.

//===================================
public void settings() {
  size(winx, winy);
  smooth();
}

//===================================
void setup() {
  size(821, 442); //x and y values should be the same as 'winx' and 'winy'.



  gaussianplate(); //random rect generator.
  blur(); //apply blur to generated rect for artistic background.
  wavvmachine(); //user interface main background image.

  shapedefinition(); //boolean controlled synth shape.

  audioplayback(); //main track playback.

  launch_controller_capabilities();
  pg = createGraphics (821, 442);

  synth_selected(); //synth instrument load.
  bass_selected(); //bass instrument load.
  sampler_selected(); //sampler instrument load.
  drum_selected(); //drum instrument load.


  pause(); //load pause button to indicate no audio is playing.
  rec_disarm(); //load unarmed rec button to indicate no audio is recording.

  status(); //text overlays to communicate status etc.

  inst_loader(); //instrument operational setup.
  instrument_selector(); //call instrument selection operation.

  launch_controller_capabilities(); //integrate launch control capabilities for knobs.
  call_video();
}

//====================================
void draw() {
  //  println(frameRate); //monitor framerate

  GUI_caller(); //GUI operational loader.
  status(); //text feedback for main track.

  knob_render(); //draw knob GUI.
}

//====================================
void keyPressed() {
  redraw();


  vidlink(); //call external video sampler.
  knob_keyboard_control();
}

//====================================
void keyReleased() {
  redraw();
  cycler();
  instrument_selector(); //call instrument selection operation.
  audioplayback_key(); //call main track playback functionality.
}

//====================================
void mousePressed() {
  redraw();

  //coordinates mapping
  //  ellipse( mouseX, mouseY, 2, 2 );
  //  text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
}

void mouseReleased() {
  redraw();

  interactive_elements();

  //boolean controlled GUI interaction.
  if (synth_select == true) 
  {
    mouse_synth_mapping();
    println("synth ready...");
  }

  if (bass_select == true) 
  {
    mouse_bass_mapping();
    println("bass ready...");
  }

  if (sampler_select == true) 
  {
    mouse_sampler_mapping();
    println("sampler ready...");
  }
}

//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
