//encapsulate video loader boolean.
void call_video() {
  if (usb_connect == true) {
    split_to_vis = true;
    connect_video();
    redraw();
    noLoop();
  }
  if (usb_connect == false) {
    split_to_vis = false;
  }
}

//encapsulate video loader.
void connect_video() {
  win = new viddmachine(); //load external video sampler.
}



//===================================================================
class viddmachine extends PApplet {

  public viddmachine() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  boolean glitch = false;

  void settings() {
    //    size(winx, winy); //size is reference from variables in AV_sampler.
    size(640, 720, P3D);
    smooth();
  }
  void setup() {

    colorMode(HSB, 100, 100, 100, 100);

    frameRate(60);
  }


  void draw() {    
    //  println(frameRate);

    if (glitch == true) {
  
      gaussianplate();
    
  } else {
      glitch = false;
      background(0);
    }

    if (!mousePressed) {
      hint(ENABLE_DEPTH_SORT);
    } else {
      hint(DISABLE_DEPTH_SORT);
    }


    noStroke();
    //background(0);

    translate(width/2, height/2, -300);
    scale(scalefactor);

    int rot = frameCount;

    rotateZ(radians(10));
    rotateX(radians(rot/60.0f * 10));
    rotateY(radians(rot/60.0f * shape_speed));

    blendMode(BLEND);

    for (int i = 0; i < 100; i++) {
      fill(map(i % 10, 0, 10, 0, 100), 100, 100, 30);

      beginShape(TRIANGLE);
      vertex(200, 50, -50);
      vertex(100, 100, 50);
      vertex(100, 0, 20);
      endShape();

      rotateY(radians(270.0f/100));
    }

    if (frameCount % 30 == 0) println(frameRate);
  }


  int shape_speed = 30;
  float scalefactor =0.50;
  float clr = 100;

  //-----keyboard mappingfor video sampling-------

  void keyPressed() {
    if (key == 'z') {
      scalefactor++;
      scalefactor = scalefactor + 0.05;
      scalefactor =constrain(scalefactor++, 0.50, 1.8999987);
      println("zooooom in...");
    }
    if (key == 'c') {
      shape_speed = shape_speed + 1;
      shape_speed = constrain(shape_speed, 30, 270);
      println("go faster...");
      println(shape_speed);
    }
    if (key == 'x') {
      shape_speed = shape_speed - 1;
      shape_speed = constrain(shape_speed, 30, 270);
      println("go slower...");
      println(shape_speed);
    }
    if (key == 'v') {
      glitch = true;
      println("rectangles rendering");
    }
  }




  void keyReleased() {
    if (key == 'z') {
      scalefactor--;
      scalefactor = scalefactor + 0.05;
      scalefactor =constrain(scalefactor++, 0.50, 1.8999987);
      println("zooooom out...");
    }
    if (key == 'c') {
      shape_speed = shape_speed + 1;
      shape_speed = constrain(shape_speed, 30, 270);
      println("go faster...");
      println(shape_speed);
    }
    if (key == 'x') {
      shape_speed = shape_speed - 1;
      shape_speed = constrain(shape_speed, 30, 270);
      println("go slower...");
      println(shape_speed);
    }
    if (key == 'v') {
      glitch = false;
      println("rectangles not rendering");
    }
  }

  int blobs = 6;

  void gaussianplate() {
    background(0);

    for (int i = 0; i < blobs; i++) {

      noStroke();
      fill(random(255), random(255), random(255));
      rect(random(width), random(height), random(400), random(400));

      //      saveFrame("Operation/bblur.png");
    }
  }
}



//=====================================================================================
//The visual example is referenced from Processing example sketch by Jakub Valtur.

// Depth sorting example by Jakub Valtar 
// https://github.com/JakubValtar
//=====================================================================================

//For Computational Prototyping class ARCH1477.
//Assignment 3
//s3662465
//Nazry Yazid

//=====================================================================================
