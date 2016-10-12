/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/120807*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                 ___   ___  ___  ___   ___        ___        __                                 ___   ___     //
//      .'|=|`.   |   |=|_.' `._|=|   |=|_.'   .'|=|_.'   .'|=|  |   .'|=|`.     .'|   .'|=|`.   |   |=|_.'     //
//    .'  | |  `. `.  |           |   |      .'  |  ___ .'  | |  | .'  | |  `. .'  | .'  | |  `. `.  |          //
//    |   |=|   |   `.|=|`.       |   |      |   |=|_.' |   |=|.'  |   | |   | |   | |   | |   |   `.|=|`.      //
//    |   | |   |  ___  |  `.     `.  |      |   |  ___ |   |  |`. `.  | |  .' |   | |   | |  .'  ___  |  `.    //
//    |___| |___|  `._|=|___|       `.|      |___|=|_.' |___|  |_|   `.|=|.'   |___| |___|=|.'    `._|=|___|    //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Lambert Wang 2013

// To be implemented:
// In no particular order
// 1. Acceleration Boost
// 3. Statistics
// 4. Web Leaderboards
// 5. Weapon slider

// Statistics
float[] accuracy;
int score, highscore;

// Asteroids and lasers and powerups
ArrayList<Asteroid> rocks;
ArrayList<Laser> pewpew;
ArrayList<JesusChrist> helpme;

// Enables guns
boolean[] bigFuckingGuns;
// 1. Standard
//    Firerate: 6
//    Index: -1
// 2. Twin Laser
//    Firerate: 4
//    Index: -2
// 3. Tri Laser
//    Firerate: 8
//    Index: -3
// 4. Burst Laser
//    Firerate: 5
//    Index: -5
// 5. Railgun
//    Firerate: 18
//    Index: -6
// 6. Seeker Missiles
//    Firerate: 10
//    Index: -7
// 7. Beam Laser
//    Firerate: 8
//    Index: -9
// 8. Seeker Missile Barrage
//    Index: -10
// 9. Rapidfire Weapon
//    Index: -11

// Different Game Settings
int[] options;
// 0. Drive type
//    1. Static Background
//    2. Static Ship
//    3. Ship Centered
// 1. Show Framerate
//    1. No
//    2. Yes

// Mercury
SpaceShip mercury;

// Game State
int thanksObama;
// 1. Playing
// 2. Paused
// 3. Game Over
// 4. Main menu
// 5. Options Menu
// 6. Stats

// Keyboard controls
//    uparrow : Accelerate
// rightarrow : Rotate Right
//  leftarrow : Rotate Left
//   spacebar : Shoot
//        1-7 : Select Weapon
//       v, b : Special Weapons
boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keyshoot = false;

// Button selection for menus
int selection;

// Menu Buttons
Button start;
Button option;
Button stat;
Button back;
// Options
Button mode;
Button showframes;

void setup() {
  // Basic screen setup
  size(768, 512);
  frameRate(30);
  colorMode(HSB);

  // Immeadiately starts up the game
  // thanksObama = 1;

  // Sets the object arrays
  rocks = new ArrayList<Asteroid>();
  pewpew = new ArrayList<Laser>();
  helpme = new ArrayList<JesusChrist>();
  bigFuckingGuns = new boolean[10];
  options = new int[2];
  options[0] = 1;
  options[1] = 1;
  accuracy = new float[14];
  for (int i = 0; i < accuracy.length; i++) {
    accuracy[i] = 0;
  }
  highscore = 0;

  // Launches the Mercury
  mercury = new SpaceShip();
  mercury.launch();

  start = new Button(width/4, height/2-32, 64, "Start", 1);
  option = new Button(width/4+64, height/2+32, 128, "Options", 2);
  stat = new Button(width/4+128, height/2+96, 192, "Stats", 3);
  back = new Button(width/4+128, height/2+96, 96, "Menu", 4);
  mode = new Button(width/4+64, height/2+32, 0, "Flight Mode", 5);
  showframes = new Button(width/4, height/2-32, 160, "Show Framerate", 6);

  // Starts game at menu
  gotoMenu();
}

void draw() {
  // Space, the final frontier
  background(0);

  if (thanksObama == 1) {
    playGame();
  }

  if (thanksObama == 4) {
    menu();
  }

  if (thanksObama == 5) {
    wtfjavascript();
  }

  if (thanksObama == 6) {
    omfgwhydoesntthiswork();
  }

  if (score > highscore) {
    highscore = score;
  }
  
  // Shows the active framerate
  if (options[1] == 2) {
    fill(75, 255, 255);
    textSize(12);
    text("FPS:" + frameRate, width-64, height-8);
  }
}

void keyPressed() {
  if (thanksObama < 4) {
    gameKeyPressed();
  }

  if (thanksObama > 3) {
    menuKeyPressed();
  }
}

void keyReleased() {
  if (thanksObama < 4) {
    gameKeyReleased();
  }
}

// What are these rocks doing in my face?!?!?!?!?!
void aaaaaaaaaugh(int i) {
  rocks.remove(i);

  // If no shield
  if (mercury.l == 0) {
    // Translation required to center the game over message
    // Merucury Centered and Static Mercury
    if (options[0] == 3 || options[0] == 2) {
      translate(-width/2, -height/2);
      translate(mercury.x, mercury.y);
    }

    // Merucury Centered
    if (options[0] == 3) {
      translate(32*cos(mercury.a)*mercury.v, 
      32*sin(mercury.a)*mercury.v);
    }

    // The pilot is incompetent
    textSize(64);
    fill(255);
    text("YOU SUCK", width/2-160, height/2);
    textSize(32);
    text("'R' to retry, idiot", width/2-160, height/2+32);
    text("'M' to go to the menu, loser...", width/2-160, height/2+64);

    // Sets the correct game state
    thanksObama = 3;


    // Untranslates
    // Merucury Centered
    if (options[0] == 3) {
      translate(-32*cos(mercury.a)*mercury.v, 
      -32*sin(mercury.a)*mercury.v);
    }

    // Merucury Centered and Static Mercury
    if (options[0] == 3 || options[0] == 2) {
      translate(-mercury.x, -mercury.y);
      translate(width/2, height/2);
    }

    // Stops the game
    noLoop();
  }
  // Removes 1 point from the mercury's shield if it has any
  else {
    mercury.l--;
  }
}

void weaponList() {
  // Displays your collection of weapons
  for (int i = 1; i < 10; i++) {
    if (bigFuckingGuns[i] == true) {

      // Displays the key that corresponds to the weapon
      textSize(24);
      fill(224, 255, 192);
      if (i < 8) {
        text(i, 16, 64+32*i);
      }
      else {
        switch(i) {
        case 8:
          text("V", 16, 64+32*i);
          break;
        case 9:
          text("B", 16, 64+32*i);
          break;
        }
      }

      // Renders the powerup next to the key
      JesusChrist temp = new JesusChrist(40, 52+32*i, -1);
      switch(i) {
      case 1:
        temp.c = -1;
        break;
      case 2:
        temp.c = -2;
        break;
      case 3:
        temp.c = -3;
        break;
      case 4:
        temp.c = -5;
        break;
      case 5:
        temp.c = -6;
        break;
      case 6:
        temp.c = -7;
        break;
      case 7:
        temp.c = -9;
        break;
      case 8:
        temp.c = -10;
        break;
      case 9:
        temp.c = -11;
        break;
      }
      temp.display();
    }
  }
}

// Displays your badassery level
public void ihatejavascript() {
  textSize(32);
  fill(150, 255, 255);
  text("Score:" + score, 8, 32);
}

// I got 100% acuraccy with the burst laser once... once
void sharpshooter() {
  textSize(16);
  fill(240, 255, 255);
  text("Accuracy:", 448, 160);
  text("Standard Laser", 448, 192);
  text("Twin Laser", 448, 224);
  text("Tri-Laser", 448, 256);
  text("Burst Laser", 448, 288);
  text("Railgun", 448, 320);
  text("Seeker Missile", 448, 352);
  text("Beam Laser", 448, 384);
  
  for (int i = 0; i < 7; i++) {
    // Renders the powerup next to the weapon
    JesusChrist temp = new JesusChrist(432, 184+32*i, -1);
    switch(i) {
    case 0:
      temp.c = -1;
      break;
    case 1:
      temp.c = -2;
      break;
    case 2:
      temp.c = -3;
      break;
    case 3:
      temp.c = -5;
      break;
    case 4:
      temp.c = -6;
      break;
    case 5:
      temp.c = -7;
      break;
    case 6:
      temp.c = -9;
      break;
    }
    temp.display();
    textSize(16);
    fill(240, 255, 255);
    
    // Displays the accuracy
    if (accuracy[i*2+1]!=0) {
      text(int(100*accuracy[i*2]/accuracy[i*2+1])+"%", 576, 192+32*i);
    }
    else {
      text("0%", 576, 192+32*i);
    }
  }
  
  // Displays the high score
  textSize(32);
  fill(150, 255, 255);
  text("High Score:" + highscore, 128, 160);
}

// Yeahhhhh, I don't quite understand the code either
void playGame() {
  // Makes the grid
  strokeWeight(1);
  stroke(75, 64, 128);

  // Static space
  if (options[0] == 1) {
    for (int i = 0; i < height/32+1; i++) {
      line(-32, i*32, width+32, i*32);
    }
    for (int i = 0; i < width/32+1; i++) {
      line(i*32, -32, i*32, height+32);
    }
  }

  // Static Mercury
  if (options[0] == 2) {
    for (int i = 0; i < height/32+1; i++) {
      line(-32, i*32-(mercury.y%32), width+32, i*32-(mercury.y%32));
    }
    for (int i = 0; i < width/32+1; i++) {
      line(i*32-(mercury.x%32), -32, i*32-(mercury.x%32), height+32);
    }
  }

  // Mercury Centered
  // Mercury.x/y%32 translates the grid as the Mercury moves
  if (options[0] == 3) {
    for (int i = -8; i < height/32+8; i++) {
      line(-32, i*32-(mercury.y%32)-32*sin(mercury.a)*mercury.v, 
      width+32, i*32-(mercury.y%32)-32*sin(mercury.a)*mercury.v);
    }
    for (int i = -8; i < width/32+8; i++) {
      line(i*32-(mercury.x%32)-32*cos(mercury.a)*mercury.v, -32, 
      i*32-(mercury.x%32)-32*cos(mercury.a)*mercury.v, height+32);
    }
  }

  // Static Space
  if (options[0] == 1) {
    mercury.display();
    mercury.tick();
  }

  // Static Mercury
  if (options[0] == 2) {
    translate(width/2, height/2);
    mercury.show();
  }

  // Mercury Centered
  if (options[0] == 3) {
    translate(width/2-32*cos(mercury.a)*mercury.v, 
    height/2-32*sin(mercury.a)*mercury.v);
    translate(-mercury.x, -mercury.y);
    mercury.display();
    translate(mercury.x, mercury.y);
  }


  // The Mercury, a result of the human instinct to set no limits
  mercury.tick();

  // Static Mercury and Mercury Centered
  if (options[0] == 3 || options[0] == 2) {
    translate(-mercury.x, -mercury.y);
  }


  for (int j = 0; j < pewpew.size(); j++) {
    // This is my laser. There are many like it, but this one is mine
    Laser pew = pewpew.get(j);
    pew.dissipate(j);
    pew.display();
    pew.tick();
  }

  for (int i = 0; i < helpme.size(); i++) {
    // Jesus, take the control surfaces
    JesusChrist omfg = helpme.get(i);
    omfg.display();
    omfg.tick();
    // Detects when the mercury picks up powerups
    omfg.collision(mercury, i);
  }

  for (int i = 0; i < rocks.size(); i++) {

    // We're all just objects in space
    Asteroid rock = rocks.get(i);
    rock.display();
    rock.tick();

    for (int j = 0; j < pewpew.size(); j++) {
      // It's your fault I keep missing
      Laser pew = pewpew.get(j);
      // Detects collision between rocks and lasers
      rock.collision(pew, i, j);
    }
  }

  for (int i = 0; i < rocks.size(); i++) {
    Asteroid rock = rocks.get(i);
    // Detects collision between the Mercury and Rocks
    if (dist(rock.x, rock.y, mercury.x, mercury.y) < rock.s+mercury.s) {
      // UI_game
      aaaaaaaaaugh(i);
    }
  }

  // Merucury Centered and Static Mercury
  if (options[0] == 3 || options[0] == 2) {
    translate(mercury.x, mercury.y);
    translate(-width/2, -height/2);
  }

  // Mercury Centerd
  if (options[0] == 3) {

    translate(+32*cos(mercury.a)*mercury.v, 
    +32*sin(mercury.a)*mercury.v);
  }

  // UI_game
  ihatejavascript();
  weaponList();

  // Mercury Weapon Cooldowns
  if (mercury.d > 0) {
    mercury.d--;
  }
  if (mercury.q > 0) {
    mercury.q--;
  }
  if (mercury.q < 60) {
    mercury.f = mercury.t;
  }

  // Control Surfaces
  if (keyup == true) mercury.accelerate();
  if (keyleft == true) mercury.r -= 0.1;
  if (keyright == true) mercury.r += 0.1;
  if (keyshoot == true) mercury.shoot();

  // Space isn't a perfect vacuum
  mercury.v*=0.96;
}

// Is this a game? Does this look like a game to you?
// Oh wait, it is...
void gameKeyPressed() {
  // Toggles movement and shooting
  if (key == CODED) {
    if (keyCode == UP) keyup = true;
    if (keyCode == LEFT) keyleft = true;
    if (keyCode == RIGHT) keyright = true;
  }
  if (key == ' ') keyshoot = true;

  // Restarts the game
  if (key == 'r') {
    mercury.launch();
    thanksObama = 1;
    loop();
  }

  // Pauses and unpauses the game
  if (key == 'p') {
    if (thanksObama == 1) {
      textSize(64);
      fill(255);
      text("QQ MOAR", width/2-160, height/2-64);
      textSize(32);
      text("'P' to man the f*ck up", width/2-160, height/2-32);
      text("'M' to be a wimp", width/2-160, height/2);
      thanksObama = 2;
      noLoop();
    }
    else {
      if (thanksObama == 2) {
        thanksObama = 1;
        loop();
      }
    }
  }

  if (key == 'm') {
    if (thanksObama == 2 || thanksObama == 3) {
      gotoMenu();
    }
  }

  // Debug control, enables all weapons
  if (key == 'e') {
    for (int i = 0; i < 10; i++) {
      //bigFuckingGuns[i] = true;
    }
  }

  // Weapon switching
  switch(key) {
  case '1': 
    if (bigFuckingGuns[1] == true) {
      mercury.c = -1; 
      mercury.f = 6;
      mercury.t = 6;
    } 
    break;
  case '2': 
    if (bigFuckingGuns[2] == true) {
      mercury.c = -2;
      mercury.f = 4;
      mercury.t = 4;
    }
    break;
  case '3': 
    if (bigFuckingGuns[3] == true) {
      mercury.c = -3;
      mercury.f = 8;
      mercury.t = 8;
    }
    break;
  case '4': 
    if (bigFuckingGuns[4] == true) {
      mercury.c = -5;
      mercury.f = 5;
      mercury.t = 5;
    }
    break;
  case '5': 
    if (bigFuckingGuns[5] == true) {
      mercury.c = -6;
      mercury.f = 18;
      mercury.t = 18;
    }
    break;
  case '6': 
    if (bigFuckingGuns[6] == true) {
      mercury.c = -7;
      mercury.f = 10;
      mercury.t = 10;
    }
    break;
  case '7': 
    if (bigFuckingGuns[7] == true) {
      mercury.c = -9;
      mercury.f = 8;
      mercury.t = 8;
    }
    break;
  case 'v': 
    if (bigFuckingGuns[8] == true) {
      mercury.p = 1;
      mercury.wreckShit();
    }
    break;
  case 'b': 
    if (bigFuckingGuns[9] == true) {
      mercury.p = 2;
      mercury.wreckShit();
    }
    break;
  }
}

void gameKeyReleased() {
  // Untoggles movement and shooting
  if (key == CODED) {
    if (keyCode == UP) keyup = false;
    if (keyCode == LEFT) keyleft = false;
    if (keyCode == RIGHT) keyright = false;
  }
  if (key == ' ') keyshoot = false;
}

// This was a good spenditure of time
void menu() {

  for (int i = 0; i < rocks.size(); i++) {
    Asteroid rock = rocks.get(i);
    rock.display();
    rock.tick();
  }

  start.display();
  stat.display();
  option.display();

  fill(75, 128, 255);
  textSize(96);
  text("ASTEROIDS", 124, 124);

  fill(75, 255, 128);
  text("ASTEROIDS", 132, 132);

  fill(75, 255, 255);
  text("ASTEROIDS", 128, 128);
  textSize(16);
  text("Created by Lambert Wang", 444, 148);

  fill(120, 255, 255);
  text("Instructions", 448, 192);
  text("Up and Down to navigate menu", 448, 224);
  text("Spacebar to select menu options", 448, 256);
  text("In game:", 448, 288);
  text("Up to Accelerate", 448, 320);
  text("Left and right to turn", 448, 352);
  text("Spacebar to shoot", 448, 384);
  text("1 - 7 to select weapons", 448, 416);
  text("V and B to use special weapons", 448, 448);
  text("P to pause", 448, 480);
}

void wtfjavascript() {
  for (int i = 0; i < rocks.size(); i++) {
    Asteroid rock = rocks.get(i);
    rock.display();
    rock.tick();
  }

  back.display();
  mode.display();
  showframes.display();
  textSize(40);
  text(":" + options[0], width/4+280, height/2+48);
  text(":" + options[1], width/4+300, height/2-16);

  fill(150, 128, 255);
  textSize(96);
  text("OPTIONS", 124, 124);

  fill(150, 255, 128);
  text("OPTIONS", 132, 132);

  fill(150, 255, 255);
  text("OPTIONS", 128, 128);
}

void omfgwhydoesntthiswork() {
  for (int i = 0; i < rocks.size(); i++) {
    Asteroid rock = rocks.get(i);
    rock.display();
    rock.tick();
  }

  back.display();

  fill(225, 128, 255);
  textSize(96);
  text("STATISTICS", 124, 124);

  fill(225, 255, 128);
  text("STATISTICS", 132, 132);

  fill(225, 255, 255);
  text("STATISTICS", 128, 128);

  sharpshooter();
}

void gotoMenu() {
  loop();
  thanksObama = 4;
  rocks.clear();
  selection = 1;

  for (int i = 0; i < 16; i++) {
    rocks.add(new Asteroid(random(0, width), random(0, height), random(-PI, PI), random(0.6, 1.2), random(-PI/100, PI/100), random(12, 32), 0));
  }
}

void gotoOption() {
  loop();
  thanksObama = 5;
  rocks.clear();
  selection = 4;

  for (int i = 0; i < 16; i++) {
    rocks.add(new Asteroid(random(0, width), random(0, height), random(-PI, PI), random(0.6, 1.2), random(-PI/100, PI/100), random(12, 32), 3));
  }
}

void gotoStat() {
  loop();
  thanksObama = 6;
  rocks.clear();
  selection = 4;

  for (int i = 0; i < 16; i++) {
    rocks.add(new Asteroid(random(0, width), random(0, height), random(-PI, PI), random(0.6, 1.2), random(-PI/100, PI/100), random(12, 32), 2));
  }
}

void menuKeyPressed() {
  if (key == CODED) {
    if (keyCode == UP) { 
      switch(thanksObama) {
      case 4:
        switch(selection) {
        case 1:
          selection = 3;
          break;
        case 2:
          selection = 1;
          break;
        case 3:
          selection = 2;
          break;
        }
        break;
      case 5:
        switch(selection) {
        case 4:
          selection = 5;
          break;
        case 5:
          selection = 6;
          break;
        case 6:
          selection = 4;
          break;
        }
        break;
      case 6:
        switch(selection) {
        case 4:
          break;
        }
        break;
      }
    }
  }
  if (keyCode == DOWN) { 
    switch(thanksObama) {
    case 4:
      switch(selection) {
      case 1:
        selection = 2;
        break;
      case 2:
        selection = 3;
        break;
      case 3:
        selection = 1;
        break;
      }
      break;
    case 5:
      switch(selection) {
      case 4:
        selection = 6;
        break;
      case 5:
        selection = 4;
        break;
      case 6:
        selection = 5;
        break;
      }
      break;
    case 6:
      switch(selection) {
      case 4:
        break;
      }
      break;
    }
  }

  if (key == ' ') {
    switch(thanksObama) {
    case 4:
      switch(selection) {
      case 1:
        mercury.launch();
        thanksObama = 1;
        break;
      case 2:
        gotoOption();
        break;
      case 3:
        gotoStat();
        break;
      }
      break;
    case 5:
      switch(selection) {
      case 4:
        gotoMenu();
        break;
      case 5:
        switch(options[0]) {
        case 1:
          options[0] = 2;
          break;
        case 2:
          options[0] = 3;
          break;
        case 3:
          options[0] = 1;
          break;
        }
        break;
      case 6:
        switch(options[1]) {
        case 1:
          options[1] = 2;
          break;
        case 2:
          options[1] = 1;
          break;
        }
        break;
      }
      break;
    case 6:
      switch(selection) {
      case 4:
        gotoMenu();
        break;
      }
      break;
    }
  }
}