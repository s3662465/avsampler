
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++BASS intrument libray
AudioRecorder bass_recorder;
FilePlayer bass_play_back;
int bass_transpose = 2;

//============================================
class bassinstrument implements Instrument
{
  Oscil bass;
  Line  sinePhase;
  float phaseTarget;
  float target;

  bassinstrument( float frequency)
  {
    //To make a sine wave bass oscillator
    bass   = new Oscil( frequency, 0, Waves.SINE);
    println(frequency, target);

    sinePhase = new Line();
    phaseTarget = target;
    sinePhase.patch( bass.phase );
    sinePhase.patch( bass.amplitude );
  }
  void noteOn( float duration )
  {
    // reset sineOsc so we don't get a click when starting the note
    bass.reset();
    // sweep the sine's phase from 0 to 1
    sinePhase.activate( duration, 0, phaseTarget );
    // start the amplitude envelope (volume)
    sinePhase.activate( duration, 0.5f, 0 );
    // attach the oscil to the output so it makes sound
    bass.patch( out );
  }
  void noteOff()
  {
    bass.unpatch( out );
  }
}

//============================================
void bass_inst()
{
  minim = new Minim(this);  

  out = minim.getLineOut();

  bass_recorder = minim.createRecorder(out, "Operation/bassrecord.wav");

  //  out.pauseNotes();
  //  out.resumeNotes();
}

//============================================
void bass_inst_key()
{
  if ( key == t ) 
  {
    if ( bass_recorder.isRecording() ) 
    {
      bass_recorder.endRecord();
    } else 
    {
      bass_recorder.beginRecord();
      println("recording...");
    }
  }
  if ( key == y )
  {
    bass_recorder.endRecord();
    println("recorded...");
    bass_play_back = new FilePlayer(bass_recorder.save());
    bass_play_back.patch( out );
    bass_play_back.play();
    bass_play_back.loop();
  }
  if ( key == u )
  {
    if ( bass_play_back.isPlaying() ) 
    {
      bass_play_back.pause();
    } else
    {
      bass_play_back.play();
      bass_play_back.loop();
    }
  }
}

//============================================
void bass_keyboard_key()
{
  //Synth Keyboard mapping
  if (key=='1') {
    out.pauseNotes();
    out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("C"+bass_transpose).asHz()));
    out.resumeNotes();
  }
  if (key=='2') {
    out.pauseNotes();
    out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("D"+bass_transpose).asHz()));
    out.resumeNotes();
  }
  if (key=='3') {
    out.pauseNotes();
    out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("E"+bass_transpose).asHz()));
    out.resumeNotes();
  }
  if (key=='4') {
    out.pauseNotes();
    out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("F"+bass_transpose).asHz()));
    out.resumeNotes();
  }
  if (key=='5') {
    out.pauseNotes();
    out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("G"+bass_transpose).asHz()));
    out.resumeNotes();
  }
  if (key=='6') {
    out.pauseNotes();
    out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("A"+bass_transpose).asHz()));
    out.resumeNotes();
  }
  if (key=='7') {
    out.pauseNotes();
    out.playNote( 0, 0.9, new bassinstrument( Frequency.ofPitch("B"+bass_transpose).asHz()));
    out.resumeNotes();
  }

  if (key=='0') {
    bass_transpose ++;
    bass_transpose = constrain(bass_transpose, 2, 3);
    println(bass_transpose);
  }
  if (key=='9') {
    bass_transpose --;
    bass_transpose = constrain(bass_transpose, 2, 3);
    println(bass_transpose);
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++DRUM instrument library
AudioSample kick;
AudioSample snare;
AudioSample hat;

void drum_inst() {

  minim = new Minim(this);

  out = minim.getLineOut();

  kick  = minim.loadSample("WAVMACHINE/audio_asset/kick_drum.mp3", 512);
  snare = minim.loadSample("WAVMACHINE/audio_asset/snare_drum.mp3", 512);
  hat = minim.loadSample("WAVMACHINE/audio_asset/hat_drum.mp3", 512);
}

void drum_inst_key()
{
  if ( key == s ) snare.trigger();
  if ( key == d ) kick.trigger();
  if ( key == f ) hat.trigger();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++SAMPLER instrument library
AudioPlayer sample;
int loopBegin; 
int loopEnd;

//============================================
void sampler_inst() {
  minim = new Minim(this);
  // load a file from the data folder, use a sample buffer of 1024 samples
  sample = minim.loadFile("WAVMACHINE/audio_asset/sampler_track_honne.mp3", 1024);
}

//============================================
void sampler_inst_key() {
  {
    //restart sampler
    if (key==v)
    {
      pause();
      sample.rewind();
    }
  }

  //for slow rewind
  {
    if (key==b)
    {
      pause();
      int pos = sample.position();
      if ( pos > 200 )
      {
        sample.skip(-200);
      } else {
        sample.rewind();
      }
    }
  }
  //for fast forward
  {
    if (key==m)
    {
      pause();
      int pos = sample.position();
      if ( pos < sample.length() - 40 ) 
      {
        sample.skip(60);
      } else {
        sample.cue( sample.length() );
      }
      sample.play();
    }
  }
  //for playback
  {
    if (key==n)
    {
      if ( sample.isPlaying() ) 
      {
        pause();
        sample.pause();
      } else {
        play();
        sample.play();
        sample.loop();
      }
    }
  }
  {
    int ms = sample.position();
    if (key==k) 
    {
            smlscr = "Loop begin end";
      record_toggle = false;
      sample.setLoopPoints(loopBegin, ms);
      loopEnd = ms;
      println("loop End set");
      sample.loop();
    }
    if (key==j)
    {
      smlscr = "Loop begin set";
      record_toggle = true;
      sample.setLoopPoints(ms, loopEnd);
      loopBegin = ms;
      play();
      println("loop Begin set");
    }

    if (key==h) {
      smlscr = "Loop playing...";
      play();
      sample.loop();
      println("loop playing 2x times");
    }
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++SYNTH instrument library
AudioRecorder recorder;
FilePlayer synth_play_back;
int synth_transpose = 4;

//============================================================================


class synthSAWinstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;

  synthSAWinstrument( float frequency)
  {

    //To make a SAW wave oscillator
    wave   = new Oscil( frequency, 0, Waves.SAW);
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }
  void noteOn( float duration )
  {
    // start the amplitude envelope (volume)
    ampEnv.activate( duration, 1f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }
  void noteOff()
  {
    wave.unpatch( out );
  }
}

class synthSINEinstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;

  synthSINEinstrument( float frequency)
  {

    //To make a SAW wave oscillator
    wave   = new Oscil( frequency, 0, Waves.SINE);
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }
  void noteOn( float duration )
  {
    // start the amplitude envelope (volume)
    ampEnv.activate( duration, 1f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }
  void noteOff()
  {
    wave.unpatch( out );
  }
}

class synthSQUAREinstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;

  synthSQUAREinstrument( float frequency)
  {

    //To make a SAW wave oscillator
    wave   = new Oscil( frequency, 0, Waves.SQUARE);
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }
  void noteOn( float duration )
  {
    // start the amplitude envelope (volume)
    ampEnv.activate( duration, 1f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }
  void noteOff()
  {
    wave.unpatch( out );
  }
}

class synthTRIANGLEinstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;

  synthTRIANGLEinstrument( float frequency)
  {

    //To make a SAW wave oscillator
    wave   = new Oscil( frequency, 0, Waves.TRIANGLE);
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }
  void noteOn( float duration )
  {
    // start the amplitude envelope (volume)
    ampEnv.activate( duration, 1f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }
  void noteOff()
  {
    wave.unpatch( out );
  }
}



//============================================
void synth_inst()
{
  minim = new Minim(this);  

  out = minim.getLineOut();

  recorder = minim.createRecorder(out, "Operation/synthrecord.wav", true);
}

//============================================
void synth_inst_key()
{
  if ( key == t ) 
  {
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
    } else 
    {
      recorder.beginRecord();
      println("recording...");
    }
  }
  if ( key == y )
  {
    recorder.endRecord(); 
    println("recorded...");
    synth_play_back = new FilePlayer (recorder.save());
    synth_play_back.patch( out );
    synth_play_back.play();
    synth_play_back.loop();
  }
  if ( key == u )
  {
    println("playing back");
    if ( synth_play_back.isPlaying() ) 
    {
      synth_play_back.pause();
    } else
    {
      synth_play_back.play();
      synth_play_back.loop();
    }
  }
}

//============================================


void synth_keyboard_key()
{
  //Synth Keyboard mapping
  if (key=='1') {
    if (sawknob == true) {
      out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
    } else if (sineknob == true) {
      out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
    } else if (squareknob == true) {
      out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
    } else if (triangleknob == true) {
      out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "C"+synth_transpose).asHz() ));
    }
  }
  if (key=='2') {
    if (sawknob == true) {
      out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
    } else   if (sineknob == true) {
      out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
    } else    if (squareknob == true) {
      out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
    } else    if (triangleknob == true) {
      out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "D"+synth_transpose).asHz() ));
    }
  } 
  if (key=='3') {
    if (sawknob == true) {
      out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
    } else      if (sineknob == true) {
      out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
    } else      if (squareknob == true) {
      out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
    } else      if (triangleknob == true) {
      out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "E"+synth_transpose).asHz() ));
    }
  } 
  if (key=='4') {
    if (sawknob == true) {
      out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
    } else        if (sineknob == true) {
      out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
    } else        if (squareknob == true) {
      out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
    } else        if (triangleknob == true) {
      out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "F"+synth_transpose).asHz() ));
    }
  }
  if (key=='5') {
    if (sawknob == true) {
      out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
    } else        if (sineknob == true) {
      out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
    } else        if (squareknob == true) {
      out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
    } else        if (triangleknob == true) {
      out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "G"+synth_transpose).asHz() ));
    }
  }
  if (key=='6') {
    if (sawknob == true) {
      out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
    } else          if (sineknob == true) {
      out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
    } else          if (squareknob == true) {
      out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
    } else          if (triangleknob == true) {
      out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "A"+synth_transpose).asHz() ));
    }
  }
  if (key=='7') {
    if (sawknob == true) {
      out.playNote( 0, 0.4, new synthSAWinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
    } else          if (sineknob == true) {
      out.playNote( 0, 0.4, new synthSINEinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
    } else          if (squareknob == true) {
      out.playNote( 0, 0.4, new synthSQUAREinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
    } else          if (triangleknob == true) {
      out.playNote( 0, 0.4, new synthTRIANGLEinstrument( Frequency.ofPitch( "B"+synth_transpose).asHz() ));
    }
  }

  if (key=='0') {
    synth_transpose ++;
    println(synth_transpose);
  }
  if (key=='9') {
    synth_transpose --;
    println(synth_transpose);
  }
}

//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
