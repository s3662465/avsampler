AudioPlayer player;

String smlscr = "Ready...";


void wavvmachine()
{
  {
    wavv = loadImage("WAVMACHINE/ui_asset/wavmachine_on.png");
    wavv.resize(winx, winy);
    image(wavv, 0, 0);
  }
}

void audioplayback() {

  minim = new Minim(this);
  player = minim.loadFile("WAVMACHINE/audio_asset/slow_drum_beat.mp3", 1024);
}

void audioplayback_key()
{
  if (key==x) {

    if ( player.isPlaying() )
    {
      smlscr = "Base track paused";
      player.pause();
      println("music is paused");
    } else
    {
      smlscr = "Base track playing";
      player.play();
      println("music is playing");
      player.loop();
    }
    if (key==z)
    {
      player.rewind();
    }
  }
}


//===================text feedback ============================
void status() {  
  //loaded "now playing" file
  noStroke();
  fill(65, 64, 66);
  rect(120, 216, 178, 21);
  textSize(10);
  fill(0, 219, 255);
  text(string, 131, 221, 175, 20);  // Text wraps within text box

  //"..."
  noStroke();
  //stroke(1);
  fill(65, 64, 66);
  rect(277, 216, 28, 21);
  textSize(10);
  fill(0, 219, 255);
  text(endoffile, 278, 221, 181, 20);  // Text wraps within text box

  smallscreen();
}


//====================gaussian blur background=============================

int blobs = 10;
PImage backgroundblur;

void gaussianplate() {
  background(0);

  for (int i = 0; i < blobs; i++) {

    stroke(255);
    fill(random(255), random(255), random(255));
    rect(random(width), random(height), random(400), random(400));

    saveFrame("Operation/bblur.png");
  }
}

void blur() {
  backgroundblur = loadImage("Operation/bblur.png");
  backgroundblur.resize(winx, winy);
  image(backgroundblur, 0, 0);
  filter(BLUR, 45);
}



void smallscreen() {

  noStroke();
  fill(65, 64, 66);
  rect(120, 104, 184, 45);

  textSize(12);
  fill(0, 219, 255);
  text(smlscr, 131, 110, 175, 36);
}


//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
