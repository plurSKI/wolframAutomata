CA ca;
int curVal = 1;
boolean randomize = true;

void setup() {
  size(860, 860, P2D);
  frameRate(30);
  background(0);
  int[] ruleset = {0,0,0,0,0,0,0,0,0,0};   
  ca = new CA(ruleset);         
  ca.randomize();
}

void draw() 
{
  ca.render();   
  ca.generate(); 
  if (ca.finished()) newRun();
}

// If return is pressed restart early
void keyPressed() 
{
  if(key == '\n') newRun();
  if(key == 'r') randomize = !randomize;
  if ( key >= '0' && key <= '9') ca.changeRule((int)(key - '0'), curVal);
  if(key == 'a') curVal = 0;
  if(key == 's') curVal = 1;
  if(key == 'd') curVal = 2;
  if(key == 'f') curVal = 3;
  if(key == ' ') ca.randomize();
  print("Current Value is: " + curVal + "\n");
  print("Randomize(" + randomize + ")\n");
}


void newRun()
{
    background(0);
    if(randomize) ca.randomize();
    ca.restart(); 
}



class CA {
  int[] cells;     // An array of 0s and 1s 
  int generation;  // How many generations?
  int scl;         // How many pixels wide/high is each cell?

  int[] rules;     // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}

  CA(int[] r) {
    rules = r;
    scl = 1;
    cells = new int[width/scl];
    restart();
  }
  
   CA() {
    scl = 1;
    cells = new int[width/scl];
    randomize();
    restart();
  }
  
  // Set the rules of the CA
  void setRules(int[] r) {
    rules = r;
  }
  
  // Make a random ruleset
  void randomize() {
    for (int i = 0; i < rules.length; i++) {
      rules[i] = int(random(4));
    }
  }
  
  // Reset to generation 0
  void restart() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;    // We arbitrarily start with just the middle cell having a state of "1"
    generation = 0;
  }

  // The process of creating the new generation
  void generate() {
    // First we create an empty array for the new values
    int[] nextgen = new int[cells.length];
    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];   // Left neighbor state
      int me = cells[i];       // Current state
      int right = cells[i+1];  // Right neighbor staten
      nextgen[i] = rules(left,me,right); // Compute next generation state based on ruleset
    }
    // Copy the array into current value
    cells = (int[]) nextgen.clone();
    generation++;
  }
  
  void changeRule(int i, int value)
  { 
    rules[i] = value;
  }
  
  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  void render() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0,0,255);
      else if (cells[i] == 2) fill(0,255, 0);
      else if (cells[i] == 3) fill(255, 0, 0);
      else               fill(0);
      noStroke();
      
      // Radiate from the center
      rect(i*scl,height/2 + (generation*scl), scl,scl);
      rect(i*scl,height/2 - (generation*scl), scl,scl);
      rect(height/2 + (generation*scl),i*scl, scl,scl);
      rect(height/2 - (generation*scl),i*scl, scl,scl);
    }
  }
  
  // Implementing the Wolfram rules
  // Could be improved and made more concise, but here we can explicitly see what is going on for each case
  int rules (int a, int b, int c) {
    // 0 == Off
    // 1 == Blue
    // 2 == Green
    int retIndex = a+b+c;
    if(mousePressed) retIndex = rules[rules.length - retIndex - 1];
    return rules[retIndex];
  }
  
  // The CA is done if it reaches the bottom of the screen
  boolean finished() {
    if (generation > height/scl/2) {
       return true;
    } else {
       return false;
    }
  }
}

