
void numOfRecordings(){
    File recordingsDir = new File(sketchPath());

    FilenameFilter ff = new FilenameFilter() {
      public boolean accept(File recordingsDir, String name) {
         return name.endsWith(".wav");
          }
        };

     String[] theList = recordingsDir.list(ff);
     recordingsCount = theList.length;
     println(str(recordingsCount) + " recordings");
     
     recordingsRange = recordingsCount-1;
}