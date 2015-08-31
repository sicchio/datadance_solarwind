
import ddf.minim.*;

int lastCheck = -60001;
float value =0;

Minim minim;
AudioPlayer listen;
AudioPlayer talk;
AudioPlayer continuous;
AudioPlayer stop;
AudioPlayer walking;
AudioPlayer magneticfields;
AudioPlayer bodyparts;
AudioPlayer lisadaniel;
AudioPlayer rightleft;
AudioPlayer melissa;

void setup() 
{
  size(40, 40);
  smooth();
  minim = new Minim(this);

  listen = minim.loadFile( "20150829_133311.wav", 51200);
  talk  = minim.loadFile( "20150829_133433.wav", 512);
  continuous = minim.loadFile( "20150829_134418.wav");
  stop = minim.loadFile( "20150829_133648.wav");
  walking = minim.loadFile( "20150829_133752.wav");
  magneticfields = minim.loadFile( "20150829_133924.wav");
  bodyparts = minim.loadFile( "20150829_134152.wav");
  lisadaniel = minim.loadFile( "801_0022.MP3");
  rightleft = minim.loadFile( "20150829_134303.wav");
  //melissa= minim.loadFile("EmilyDialogue.M4A");
}

void draw()
{
  if ( millis() - lastCheck > (1000*60) ) {
    String [] lines = loadStrings("http://services.swpc.noaa.gov/text/ace-magnetometer.txt");
    for ( String l : lines ) {
      if ( !(l.startsWith(":") || l.startsWith("#")) ) {
        l = l.replaceAll("[ ]+", "\t");
        String[] vs = split( l, "\t" );
        value = parseFloat(vs[7]);
        println( vs[7] );
        break;
      }
    }

   if ((value >=-2) && (value  < -1)) {
     //println("sound be playing!");
     listen.cue(0); // rewind
     listen.play();
   }
   
   if ((value >=-1) && (value < 0)) {
     talk.cue(0);
     talk.play();
   }
   
   if ((value >= 0) && (value <1)) {
     continuous.cue(0);
     continuous.play();
   }
   
   if ((value >=1) && (value < 2)) {
     stop.cue(0);
     stop.play();
   }
   
   if ((value >= 2) && (value <= 2.2)) {
     magneticfields.cue(0);
     magneticfields.play();
   }
   
   if ((value >= 2.2) && (value < 3)) {
     bodyparts.cue(0);
     bodyparts.play();
   }
   
   if ((value >= 3) && (value < 3.5)) {
     lisadaniel.cue(0);
     lisadaniel.play();
   }
  
  if ((value >= 3.5)) {
     rightleft.cue(0);
     rightleft.play();
   }
   
    lastCheck = millis();
  }
}
