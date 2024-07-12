import ddf.minim.*; //This is imported to mess with audio
import java.io.File; // This is imported to work with files modifying/deleting
import java.util.Timer;
import java.util.TimerTask;
import java.io.FilenameFilter; // for counting the number of sound files that have been made...

JSONObject json;


Minim minim;
AudioInput in;
AudioRecorder recorder;
AudioPlayer player; //From AudioPlayerPlay Example

/*##########################*/


 File recordingToCheck; //this is to check to make sure a given recording exists before trying to play it. 

final static int recordingTiming = 1*60*50; // 
final static int recordingLength = 1*60*25; // 
final static int playTiming = 1*60*30; // 

static String recordMsg;
static String recordMsgTime;
static String recordMsgDate;

String thisRecording;

int count = 1; //am I still using this?
int recordID=0;

int randomRecordID;

int  randomPlayID;
int maxRecordings = 100;
int recordingsRange; //this is the number of recordings range = recordingsCount -1 that can be chosen from...

int recordingsCount;

boolean recordingSpeakTrigger = true; //triggers record...
boolean playerListenTrigger = true;

final Timer t = new Timer();
boolean lastTrackisFinished = true; //this is for playerTimer2
boolean recorded; /// don't think I'm using this anymore...

boolean recording = false; /// don't think I'm using this anymore...



int recordIDJSON;

/*##########################*/

void setup()
{
  
 
  
  
  
  
  size(512, 200, P3D);
  minim = new Minim(this);
  in = minim.getLineIn();
  textFont(createFont("Arial", 12));
  player = minim.loadFile("recording" + recordID + ".wav");//From AudioPlayerPlay Example
  recorder = minim.createRecorder(in, "recording" + recordID + ".wav");

}

void draw()
{
  
  background(0); 
  stroke(255);
  
   playerTimer3();
  displayWaveForms();//The below is to display waveforms alwayscoming in
  displayTextWhenRecording();//This displays a text saying that recording is happening
  displayTextWhenPlaying();  //This makes a little grean line go across screen when recording

  recordMsgDate = nf(month(), 2) + "/" + nf(day(), 2);
  recordMsgTime = nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2);

  displayPlaybackInformation();
  

}