/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:824501:
  appc.background(230);
} //_CODE_:window1:824501:

public void StartSim(GButton source, GEvent event) { //_CODE_:startButton:848603:
  loop();
} //_CODE_:startButton:848603:

public void PauseSim(GButton source, GEvent event) { //_CODE_:pauseButton:450187:
  pause = !pause; 
  if (pause == true){
    loop();
  }
  else {
    noLoop();
    pauseButton.setText("Unpause");
  }
} //_CODE_:pauseButton:450187:

public void button1_click1(GButton source, GEvent event) { //_CODE_:speedDown:794286:
  frame =- 0.2;
} //_CODE_:speedDown:794286:

public void button2_click1(GButton source, GEvent event) { //_CODE_:speedUp:712485:
  frame =+ 0.2;
} //_CODE_:speedUp:712485:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 240, 250, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  startButton = new GButton(window1, 80, 45, 80, 30);
  startButton.setText("Start");
  startButton.addEventHandler(this, "StartSim");
  pauseButton = new GButton(window1, 81, 92, 80, 30);
  pauseButton.setText("Pause");
  pauseButton.addEventHandler(this, "PauseSim");
  speedDown = new GButton(window1, 20, 136, 80, 30);
  speedDown.setText("Speed Down");
  speedDown.addEventHandler(this, "button1_click1");
  speedUp = new GButton(window1, 124, 136, 80, 30);
  speedUp.setText("Speed Up");
  speedUp.addEventHandler(this, "button2_click1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton startButton; 
GButton pauseButton; 
GButton speedDown; 
GButton speedUp; 
