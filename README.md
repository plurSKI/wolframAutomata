USAGE INSTRUCTIONS
-------------------
    * wolframKeyboardInput.pde -- The simple version that takes mouse and 
      keyboard events. Usage:
          o Mouse click: Inverts ruleset for as long as depressed
          o r: Toggles random generation on new iteration. 
               If off it uses the old pattern
          o Enter: Starts a new generation early. 
                   A new generation starts automatically when the screen fills
          o Space: Randomize ruleset
          o 0 to 9: Set the corresponding rule (0-9) to what's currently in 
                    the buffer, defined below.
          o a: Set the buffer to 0 (Off)
          o s: Set the buffer to 1 (Blue)
          o d: Set the buffer to 2 (Green)
          o f: Set the buffer to 3 (Red)
          o Example, change rule 2 to be red: f 2
          o Note: That if you have a way to see stdout, then every keypress 
                  will spit out the buffer and whether random generation is on 
                  or off

     * wolframMusicInput.pde -- There are two variables to set at the top. 
          o filename:  contains the path to an mp3 file. 
          o tolerance: is used to set song pace. The faster paced the song the 
                       higher the tolerance should be to get good results. For 
                       reference, I was using 10 for the 'Frost Waltz' video 
                       and 4 for the 'Ghost Procession' video.


[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/ffb0b231a9b5500c769af422a8d6bae4 "githalytics.com")](http://githalytics.com/plurSKI/wolframAutomata)
