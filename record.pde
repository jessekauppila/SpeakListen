void keyReleased() {
  if ( key == 'r' ) 
  {
    // to indicate that you want to start or stop capturing audio data, you must call
    // beginRecord() and endRecord() on the AudioRecorder object. You can start and stop
    // as many times as you like, the audio data will be appended to the end of whatever 
    // has been recorded so far.

    if (!recording) {
      //if ( recorder.isRecording() ) 
      //{
      //  endSpeakRecord(); 
      //  delay(10);r
      //} else 

      {
       // player.pause();
        //println("Pause Player");
        beginSpeakRecord(); // this does recorder.beginRecord... and other stuff
        delay(10);
      }
    }
  }
  if ( key == 's' )
  {

    if (recording) {
      
        //playerTimer3();

       // player.play();

      /////////
      //Look at Basic Audio Sketch 3 for how to play immediately after recording!
      //////////
      // we've filled the file out buffer, 
      // now write it to the file we specified in createRecorder
      // the method returns the recorded audio as an AudioRecording, 
      // see the example  AudioRecorder >> RecordAndPlayback for more about that
      endSpeakRecord();
      delay(10);
    }
  }
}

void beginSpeakRecord() {
  //if ( recorder.isRecording() ) 
  //{
  //  recorder.endRecord();
  //}
  recording = true;
  loadFileToRecorder();

  println("Recording triggered on " + recordMsgDate + " @ " + recordMsgTime); //this prints a line say recording started
  recorder.beginRecord(); //this is begins the recording

  createNextRecordID();
}

void createNextRecordID() {
  //json = new JSONObject();
  json = loadJSONObject("new.json");
  recordIDJSON =json.getInt("savedRecordID");

  if (recordIDJSON  < maxRecordings) {
    recordIDJSON++;
  } else {
    recordIDJSON = 1;
  }

  json.setInt("savedRecordID", recordIDJSON);
  saveJSONObject(json, "data/new.json");
}

void loadFileToRecorder() {
  String whichRecording = "recording" + recordIDJSON + ".wav";
  File thisRecording = new File(dataPath(whichRecording));

  if (thisRecording.exists()) { // writes over recording if it already exists
    thisRecording.delete();
  }

  recorder = minim.createRecorder(in, whichRecording);
  println(whichRecording);
}



void endSpeakRecord() {
  recording = false;
  
  delay(recordingLength);// 
  recorder.save();
  println("Done saving.");
  recorder.endRecord();
  recorded = true;
}


//boolean succes = file.delete();
//if (succes) { println("The file was deleted"); }
//if (!file.exists()) { println("The file no longer exists"); }

//change the file name, everytime +1