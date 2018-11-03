//-----Control Mapping------------
int z = 'z';//Restart playback
int x = 'x';//Play/Pause
int c = 'c';//Split to visualiser screen


//====sampler====
int v = 'v';//Restart sampler
int b = 'b';//Rewind sampler
int n = 'n';//Play/Pause sampler
int m = 'm';//Fast Forward sampler
int h = 'h';//Play sampling loop
int j = 'j';//Begin sampling loop
int k = 'k';//End sampling loop

//====drumpad====
int d = 'd';//Bass drum
int s = 's';//Snare drum
int f = 'f';//Hat drum

//====keyboard + bass====
//On the keyboard: C : 1
//On the keyboard: D : 2
//On the keyboard: E : 3
//On the keyboard: F : 4
//On the keyboard: G : 5
//On the keyboard: A : 6
//On the keyboard: B : 7
//On the keyboard: C+ : 8
//Keyboard control: transpose down : 9
//Keyboard control: transpose up : 0

int t = 't';//Synth pattern start recording
int y = 'y';//Synth pattern end recording
int u = 'u';//Synth pattern playback

//====instrument selector====
int i = 'i';//Synth shape select : saw
int o = 'o';//Synth shape select : sine
int p = 'p';//Synth shape select : tri
int l = 'l';//Synth shape select : square
int q = 'q';//Synth select
int w = 'w';//Bass select
int e = 'e';//Drum select
int r = 'r';//Sampler select

//note: keyboard assignment can be modified by changing the assigned field in between. [ change the hash. e.g int + = '#'].

//--------------keyboard mapping--------------------


void instrument_selector() {


  if (synth_select == true) {
    synth_inst_key();
    //    println("synth can be tweak!");
    synth_keyboard_key();
    //    println("synth can be play!");
  }
  if (bass_select == true) {
    bass_inst_key();
    //    println("bass can be tweak!");
    bass_keyboard_key();
    //    println("bass can be play!");
  }
  if (drum_select == true) {
    drum_inst_key();
    //    println("drum can be play!");
  }
  if (sampler_select == true) {
    sampler_inst_key();
    //    println("sampler can be play!");
  }

  if (key == q) {

    if (synth_select == true) {
      synth_select =true;
      sineknob = true;
      println("synth not selected...");
    } else {
      synth_select = true;
      println("synth selected...");
      smlscr = "SYNTH SELECTED";
      sineknob = true;
      bass_select = false;
      drum_select = false;
      sampler_select = false;
    }
  }

  if (key == w) {
    if (bass_select == true) {
      bass_select =true;
      println("bass not selected...");
    } else {
      bass_select = true;
      println("bass selected...");
      smlscr = "BASS SELECTED";
      synth_select = false;
      drum_select = false;
      sampler_select = false;
    }
  }

  if (key == e) {
    if (drum_select == true) {
      drum_select =true;
      println("drum not selected...");
    } else {
      drum_select = true;
      println("drum selected...");
      smlscr = "DRUM SELECTED";
      synth_select = false;
      bass_select = false;
      sampler_select = false;
    }
  }

  if (key == r) {
    if (sampler_select == true) {
      sampler_select =true;
      println("sampler not selected...");
    } else {
      sampler_select = true;
      println("sampler selected...");
      smlscr = "SAMPLER SELECTED";
      synth_select = false;
      bass_select = false;
      drum_select = false;
    }
  }
}

void vidlink() {
  if (key == c) {
    if (split_to_vis == false) {
      split_to_vis = true;
      usb_connect = true;
      call_video();
      splitscr();
      println("visualiser connected...");
      smlscr = "SCREEN CONNECTED";
    } else {
      split_to_vis = false;
      usb_connect = false;
    }
  }
}


//-------------------------------mouse mapping-------------------------------
int gap_afterx = 79; //pad mapping formula
int gap_initialx = 92; //pad mapping formula

//----------------------------drum mapping to GUI-------------------------------------------------------------
void mouse_drum_mapping() {
  if (mouseX > 94
    && mouseX <  94+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) {
    drum_c();
  }

  if (mouseX > 94+gap_initialx
    && mouseX < 186+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) 
  {
    drum_d();
  }

  if (mouseX > 186+gap_initialx
    && mouseX < 278+gap_afterx 
    && mouseY > 308 
    && mouseY < 380)
  {
    drum_e();
  }
}

void drum_c() 
{
  kick.trigger();
}
void drum_d() 
{
  snare.trigger();
}
void drum_e() 
{
  hat.trigger();
}

//----------------------------bass mapping to GUI-------------------------------------------------------------
void mouse_bass_mapping() {
  if (mouseX > 94
    && mouseX <  94+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) {
    bass_c();
  }

  if (mouseX > 94+gap_initialx
    && mouseX < 186+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) 
  {
    bass_d();
  }

  if (mouseX > 186+gap_initialx
    && mouseX < 278+gap_afterx 
    && mouseY > 308 
    && mouseY < 380)
  {
    bass_e();
  }

  if (mouseX > 278+gap_initialx
    && mouseX < 370+gap_afterx  
    && mouseY > 308 
    && mouseY < 380)
  {
    bass_f();
  }

  if (mouseX > 370+gap_initialx
    && mouseX < 462+gap_afterx
    && mouseY > 308 
    && mouseY < 380)
  {
    bass_g();
  }
  if (mouseX > 464+gap_initialx 
    && mouseX < 554+gap_afterx
    && mouseY > 308
    && mouseY < 380)
  {
    bass_a();
  }
  if ( mouseX > 648
    && mouseX < 729
    && mouseY > 308 
    && mouseY < 380)
  {
    bass_b();
  }
}

void bass_c() 
{
  out.pauseNotes();
  out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("C"+bass_transpose).asHz()));
  out.resumeNotes();
}
void bass_d() 
{
  out.pauseNotes();
  out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("D"+bass_transpose).asHz()));
  out.resumeNotes();
}
void bass_e() 
{
  out.pauseNotes();
  out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("E"+bass_transpose).asHz()));
  out.resumeNotes();
}
void bass_f() 
{
  out.pauseNotes();
  out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("F"+bass_transpose).asHz()));
  out.resumeNotes();
}
void bass_g() 
{
  out.pauseNotes();
  out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("G"+bass_transpose).asHz()));
  out.resumeNotes();
}
void bass_a() 
{
  out.pauseNotes();
  out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("A"+bass_transpose).asHz()));
  out.resumeNotes();
}
void bass_b() 
{
  out.pauseNotes();
  out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("B"+bass_transpose).asHz()));
  out.resumeNotes();
}


//----------------------------synth mapping to GUI-------------------------------------------------------------

void mouse_synth_mapping() {
  if (mouseX > 94
    && mouseX <  94+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) {
    synth_c();
  }

  if (mouseX > 94+gap_initialx
    && mouseX < 186+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) 
  {
    synth_d();
  }

  if (mouseX > 186+gap_initialx
    && mouseX < 278+gap_afterx 
    && mouseY > 308 
    && mouseY < 380)
  {
    synth_e();
  }

  if (mouseX > 278+gap_initialx
    && mouseX < 370+gap_afterx  
    && mouseY > 308 
    && mouseY < 380)
  {
    synth_f();
  }

  if (mouseX > 370+gap_initialx
    && mouseX < 462+gap_afterx
    && mouseY > 308 
    && mouseY < 380)
  {
    synth_g();
  }
  if (mouseX > 464+gap_initialx 
    && mouseX < 554+gap_afterx
    && mouseY > 308
    && mouseY < 380)
  {
    synth_a();
  }
  if ( mouseX > 648
    && mouseX < 729
    && mouseY > 308 
    && mouseY < 380)
  {
    synth_b();
  }
}

void synth_c() 
{
  out.pauseNotes();
  if (sawknob == true) {
    out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
  } else if (sineknob == true) {
    out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
  } else if (squareknob == true) {
    out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
  } else if (triangleknob == true) {
    out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
  }
  out.resumeNotes();
}
void synth_d() 
{
  out.pauseNotes();
  if (sawknob == true) {
    out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
  } else  if (sineknob == true) {
    out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
  } else  if (squareknob == true) {
    out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
  } else  if (triangleknob == true) {
    out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
  }
  out.resumeNotes();
}
void synth_e() 
{
  out.pauseNotes();
  if (sawknob == true) {
    out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
  } else  if (sineknob == true) {
    out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
  } else  if (squareknob == true) {
    out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
  } else if (triangleknob == true) {
    out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
  }
  out.resumeNotes();
}
void synth_f() 
{
  out.pauseNotes();
  if (sawknob == true) {
    out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
  } else  if (sineknob == true) {
    out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
  } else  if (squareknob == true) {
    out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
  } else  if (triangleknob == true) {
    out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
  }
  out.resumeNotes();
}
void synth_g() 
{
  out.pauseNotes();
  if (sawknob == true) {
    out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
  } else  if (sineknob == true) {
    out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
  } else  if (squareknob == true) {
    out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
  } else  if (triangleknob == true) {
    out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
  }
  out.resumeNotes();
}
void synth_a() 
{
  out.pauseNotes();
  if (sawknob == true) {
    out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
  } else  if (sineknob == true) {
    out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
  } else  if (squareknob == true) {
    out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
  } else  if (triangleknob == true) {
    out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
  }
  out.resumeNotes();
}
void synth_b() 
{
  out.pauseNotes();
  if (sawknob == true) {
    out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
  } else  if (sineknob == true) {
    out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
  } else  if (squareknob == true) {
    out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
  } else  if (triangleknob == true) {
    out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
  }
  out.resumeNotes();
}
//------------synth cycler------------

void cycler() {
  if (key == i) {
    sawknob = true;
    println("saw");

    sineknob = false;
    squareknob = false;
    triangleknob = false;
  }

  if (key == o) {
    sineknob = true;
    println("sine");

    sawknob = false;
    squareknob = false;
    triangleknob = false;
  } 
  if (key == p) {
    triangleknob = true;
    println("triangle");

    sineknob = false;
    squareknob = false;
    sawknob = false;
  } 
  if (key == l) {
    squareknob = true;
    println("square");

    sineknob = false;
    sawknob = false;
    triangleknob = false;
  }
}

//----------------------------sampler mapping to GUI-------------------------------------------------------------

void  mouse_sampler_mapping() {
  if (mouseX > 94
    && mouseX <  94+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) {
    sampler_c();
  }

  if (mouseX > 94+gap_initialx
    && mouseX < 186+gap_afterx 
    && mouseY > 308 
    && mouseY < 380) 
  {
    sampler_d();
  }

  if (mouseX > 186+gap_initialx
    && mouseX < 278+gap_afterx 
    && mouseY > 308 
    && mouseY < 380)
  {
    sampler_e();
  }

  if (mouseX > 278+gap_initialx
    && mouseX < 370+gap_afterx  
    && mouseY > 308 
    && mouseY < 380)
  {
    sampler_f();
  }

  if (mouseX > 370+gap_initialx
    && mouseX < 462+gap_afterx
    && mouseY > 308 
    && mouseY < 380)
  {
    sampler_g();
  }
  if (mouseX > 464+gap_initialx 
    && mouseX < 554+gap_afterx
    && mouseY > 308
    && mouseY < 380)
  {
    sampler_a();
  }
  if ( mouseX > 648
    && mouseX < 729
    && mouseY > 308 
    && mouseY < 380)
  {
    sampler_b();
  }
}

void  sampler_c() {
  {
    pause();
    sample.rewind();
  }
}
void  sampler_d() {
  pause();
  int pos = sample.position();
  if ( pos > 200 )
  {
    sample.skip(-500);
  } else {
    sample.rewind();
  }
}
void  sampler_e() {
  {
    play();
    sample.play();
  }
}
void  sampler_f() { 
  {
    pause();
    sample.pause();
  }
}
void  sampler_g() {
  pause();
  int pos = sample.position();
  if ( pos < sample.length() - 40 ) 
  {
    sample.skip(200);
  } else {
    sample.cue( sample.length() );
  }
  sample.play();
}
void  sampler_a() {
  record_toggle = true;
  int ms = sample.position();
  sample.setLoopPoints(ms, loopEnd);
  loopBegin = ms;
  println("loop Begin set");
}
void  sampler_b() {
  record_toggle = false;
  int ms = sample.position();
  sample.setLoopPoints(loopBegin, ms);
  loopEnd = ms;
  sample.loop();
  println("loop End set + playing loop");
}

void interactive_elements() {

  if ( mouseX > 139
    && mouseX < 178
    && mouseY > 20 
    && mouseY < 57)
  {
    if (usb_connect == false) {
      split_to_vis =true;
      usb_connect = true;
      win = new viddmachine();
    }
  }
}


//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
