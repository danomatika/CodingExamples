// Spectrum
//
// Using an FFT to analyze the audio input and 
// draw circles based on the amplitude of two
// frequency bands.
//
// Install sound via the menu:
// Sketch->Import Library...->Add library...
//
// Dan Wilcox 2016

// requires the Processing Sound library
import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 32; // how many fft bands to compute
int scale = 10; // scaling factor when drawing
float r_width; // rect width based on num bands & screen width

// smoothed spectrum values
float[] spectrum = new float[bands];
float smooth_factor = 0.2; // spectrum value easing

// which frequency bands for the red & green circles
int redBand = 0;
int greenBand = 4;

void setup() {
  size(512, 360);
  background(255);
    
  // Create an Input stream which is routed into 
  // the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the AudioIn
  in.start();
  
  // patch the AudioIn into th fft
  fft.input(in);
  
  // calc rect width
  r_width = width/float(bands);
}      

void draw() { 
  background(255);
  noStroke();
  
  // analyze freq bands
  fft.analyze();

  // FFT freq band amplitudes are normalized 0-1
  for(int i = 0; i < bands; i++){
    
    // smooth the FFT data by smoothing factor
    spectrum[i] += (fft.spectrum[i] - spectrum[i]) * smooth_factor;
    
    // draw the band
    if(i == redBand) {
      fill(255, 0, 0);
    }
    else if(i == greenBand) {
      fill(0, 255, 0);  
    }
    else {
      fill(100);
    }
    rect( i*r_width, height, r_width, -spectrum[i]*height*scale );
  } 

  // draw the red circle using the amplitude for the size
  pushMatrix();
  fill(255, 0, 0);
  translate(width/4, height/2);
  scale(spectrum[redBand]*10);
  ellipse(0, 0, 200, 200);
  popMatrix();
  
  // draw the green circle using the amplitude for the size
  pushMatrix();
  fill(0, 255, 0);
  translate(3*width/4, height/2);
  scale(spectrum[greenBand]*10);
  ellipse(0, 0, 200, 200);
  popMatrix();
}