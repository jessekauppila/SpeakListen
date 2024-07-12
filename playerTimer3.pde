//from randomPlayWorking...
void playerTimer3() {

  //if (!recording) {
    if (lastTrackisFinished) {
      numOfRecordings();
      loadRandomRecording();
      player.play();
      calculateLengthOfRecording();
    }
    if ((frameCount & 0xF) == 0)   print('.'); //displays dots for every.... what?
  //}
}
void loadRandomRecording() {

//int recordingsRange = recordingsCount-1;
  randomPlayID = int(random(0, recordingsCount));// changed from recordingsRange to recordingsCount
  
  recordingToCheck = new File(sketchPath("recording"+randomPlayID+".wav"));

    if (recordingToCheck.exists()) {
  println("\n\nPlaying recording" + randomPlayID + ".wav of " + recordingsCount + " different recordings.");
  player = minim.loadFile("recording"+randomPlayID+".wav", 2048);
  } else {
  println("\n\nTried to play recording"+randomPlayID +".wav but it does NOT exist!" );
    }
}

void calculateLengthOfRecording() {
  int recordingLength = player.length();
  println("This recording is " + recordingLength + " millis long.");
  final float waitTimeWhileRecordingPlays = (recordingLength/1000);
  createScheduleTimer(waitTimeWhileRecordingPlays);
  println("Timer scheduled for "
    + nf(waitTimeWhileRecordingPlays, 0, 2) + " secs.\n");
  if ((frameCount & 0xF) == 0)   print('.');
}

void createScheduleTimer(final float sec) {
  lastTrackisFinished = false;

  t.schedule(new TimerTask() {
    public void run() {
      print(" " + nf(sec, 0, 2));
      lastTrackisFinished = true;
    }
  }
  , (long) (sec*1e3));
}