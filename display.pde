void displayTextWhenPlaying() // is this really what it does?
{
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    stroke(255, 0, 0);
    line(i, 30 + in.left.get(i)*50, i+1, 30 + in.left.get(i+1)*50);
    line(i, 70 + in.right.get(i)*50, i+1, 70 + in.right.get(i+1)*50);
  }
}

void displayTextWhenRecording() {
  color c1 = color(256, 0, 0);
  stroke(c1);
  if ( recorder.isRecording() )
  {
    text("Currently recording: recording" + recordIDJSON + ".wav", 5, 15);
  } else
  {
    text("Not recording.", 5, 15);
  }
}

void displayWaveForms()
{
  //if (randomRecordID > 0) {

    // draw the waveforms
    // the values returned by left.get() and right.get() will be between -1 and 1,
    // so we need to scale them up to see the waveform
    // note that if the file is MONO, left.get() and right.get() will return the same value
    for (int i = 0; i < player.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, player.bufferSize(), 0, width );
      float x2 = map( i+1, 0, player.bufferSize(), 0, width );
      stroke(116, 212, 255);
      line( x1, 130 + player.left.get(i)*50, x2, 130 + player.left.get(i+1)*50 );
      line( x1, 170 + player.right.get(i)*50, x2, 170 + player.right.get(i+1)*50 );
    }

    // draw a line to show where in the song playback is currently located
    float posx = map(player.position(), 0, player.length(), 0, width);
    stroke(0, 200, 0);
    line(posx, 100, posx, height);
  //}
}

void displayPlaybackInformation()
{ stroke(0, 200, 0);
  if ( player.isPlaying() )
  {
    text("Playing: recording"+randomPlayID+".wav", 5, 113 );
  } else
  {
    text("Not Playing :(", 5, 113 );
  }
}