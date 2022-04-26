int state = 0;
import processing.sound.*;

PImage marsImg;
PImage plantImg;
PImage spaceShipImg;
PImage spaceGuy;
PImage earth;
PImage lose;
PImage water;
PImage enemy;



SoundFile shootSound;
SoundFile UpdatedBSound;
SoundFile mainMenu;
SoundFile yay;
SoundFile loseScreen;



//declaring vars

int xSpeed;
ArrayList<Bullet> bulletList;
ArrayList<Platform> platformList;
ArrayList<Platform> platform2List;
ArrayList<Platform> platform3List;
ArrayList<Alien> alienList;
ArrayList<Raindrop> raindropList;

Player player;

//platforms
Platform platform1;
Platform platform2;
Platform platform3;
Platform platform4;
Platform platform5;
Platform platform6;
Platform platform7;
Platform platform8;
Platform platform9;
Platform platform10;
Platform platform11;
Platform platform12;
Platform platform13;
Platform platform14;
Platform platform15;



Alien alien1;
Alien alien2;
Alien alien3;


Raindrop raindrop1;
Raindrop raindrop2;
Raindrop raindrop3;



void setup() {
  // set the size of the window
  size(800, 600);

  // image / icons
  marsImg = loadImage("mars.jpeg");
  //resize image to fit background
  marsImg.resize(800, 600);

  //player
  spaceGuy = loadImage("spaceGuy.png");

  //main menu background
  earth = loadImage("earth.jpeg");

  //lose screen alien
  lose = loadImage("lose.png");
  
  //water
  water = loadImage("water.png");
  
  //alien
  enemy = loadImage("enemy.png");
 

  //Sounds
  shootSound = new SoundFile( this, "shoot.wav");

  shootSound.rate(2.0);
  shootSound.amp(1.0);

  UpdatedBSound = new SoundFile( this, "UpdatedB.wav");

  UpdatedBSound.rate(2.0);
  UpdatedBSound.amp(0.5);
  
   //sound
  mainMenu = new SoundFile( this, "beginning.wav");
  
  mainMenu.rate(0.5);
  mainMenu.amp(0.5);
  
 //win sound 
  yay = new SoundFile(this, "yay.wav");
  
  yay.rate(1.0);
  yay.amp(0.5);
  
  //lose sound
  loseScreen = new SoundFile( this, "lose.wav");
  
  loseScreen.rate(1.0);
  loseScreen.amp(1.0);
  

  
  


  //intialize vars
  player = new Player(35, 550, 40, 50, color(255, 255, 255));
  bulletList = new ArrayList<Bullet> ();
  //Platforms level 1
  platform1 = new Platform(100, 500);
  platform2 = new Platform(300, 400);
  platform3 = new Platform(400, 300);
  platform4 = new Platform(200, 200);
  platform5 = new Platform(400, 100);
  // level 2
  platform6 = new Platform(150, 200);
  platform7 = new Platform(250, 400);
  platform8 = new Platform(375, 300);
  platform9 = new Platform(350, 100);
  platform10 = new Platform(50, 500);
  //level 3
  platform11 = new Platform(500, 500);
  platform12 = new Platform(375, 400);
  platform13 = new Platform(430, 300);
  platform14 = new Platform(210, 200);
  platform15 = new Platform(500, 100);

  //aliens
  alien1= new Alien( 200, 580 - 20, 40, 40, color(0, 255, 0));
  alien2 = new Alien( 300, 180 - 20, 40, 40, color(0, 255, 0));
  alien3 = new Alien( 500, 280 - 20, 40, 40, color(0, 255, 0));


  //level one platforms
  platformList = new ArrayList<Platform>();
  platformList.add(platform1);
  platformList.add(platform2);
  platformList.add(platform3);
  platformList.add(platform4);
  platformList.add(platform5);
  //// level 2 platforms
  platform2List = new ArrayList<Platform>();
  platform2List.add(platform6);
  platform2List.add(platform7);
  platform2List.add(platform8);
  platform2List.add(platform9);
  platform2List.add(platform10);
  // level 3 platforms
  platform3List = new ArrayList<Platform>();
  platform3List.add(platform11);
  platform3List.add(platform12);
  platform3List.add(platform13);
  platform3List.add(platform14);
  platform3List.add(platform15);

  alienList = new ArrayList<Alien>();
  alienList.add(alien1);
  alienList.add(alien2);
  alienList.add(alien3);


  raindropList = new ArrayList<Raindrop>();
  raindrop1 = new Raindrop( 200, platform1.top - platform1.h - 10, 20, 20, color( 0, 0, 255));
  raindrop2 = new Raindrop( 400, platform2.top - platform2.h - 10, 20, 20, color( 0, 0, 255));
  raindrop3 = new Raindrop( 500, platform5.top - platform5.h - 10, 20, 20, color( 0, 0, 255));

  //raindrop4 = new Raindrop( 550, platform5.top - platform5.h, 10, 10, color( 0, 0, 255));
  //raindrop5 = new Raindrop( 575, platform1.top - platform1.h, 10, 10, color( 0, 0, 255));
  //raindrop6 = new Raindrop( 450, platform2.top - platform1.h, 10, 10, color( 0, 0, 255));


  raindropList.add(raindrop1);
  raindropList.add(raindrop2);
  raindropList.add(raindrop3);
}



void draw() {
  //background
  background(marsImg);
  
  // my switch statement/ finite state machine
  switch(state) {
  case 0:
    mainMenu();
    break;
  case 1:
    level1();
    break;
  case 2:
    level2();
    break;
  case 3:
    level3();
    break;
  case 4:
    lose();
    break;
  case 5:
    win();
    break;
  }
}


// coded buttons to move
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player.isMovingRight = true;
    }
    if (keyCode == LEFT) {
      player.isMovingLeft = true;
    }
  }
  if (key == 'r') {
    setup();
    state = 0;
    //player.x = 50;
    //player.y = 580;
    //player.isDead = false;
    //for(Alien aAlien : alienList) {
    //  aAlien.isDead=false;  
    //}
    //for(Raindrop aRaindrop : raindropList) {
    //  aRaindrop.isCollected=false;  
    //}
  }
  if ( key == 'd') {
    bulletList.add(new Bullet(player.x + player.w, player.y + player.h/2+15, true));
    if ( shootSound.isPlaying() == false)
      shootSound.play();
  }
  if ( key == 'a') {
    bulletList.add(new Bullet(player.x + player.w, player.y + player.h/2+15, false));
    if ( shootSound.isPlaying() == false)
      shootSound.play();
  }
  if (key == CODED) {
    if ( keyCode == UP && player.isFalling == false && player.isJumping == false) {
      player.isJumping = true;
    }
    if ( key == 'p') {
      state = 1;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player.isMovingRight = false;
    }
    if (keyCode == LEFT) {
      player.isMovingLeft = false;
    }
  }
}

//case 0 function
void mainMenu() {
  //sound
   if (mainMenu.isPlaying() == false)
    mainMenu.play();
   shootSound.stop();

    
  
  //background
  earth.resize(800, 600);
  background(earth);
  // space ship
  spaceShipImg = loadImage("spaceShip.png");
  spaceShipImg.resize(800, 800);
  image(spaceShipImg, -190, -70);

  fill(#517466);
  noStroke();
  rect(445, 110, 300, 10);
  rect(440, 110, 10, 80);
  rect(745, 110, 10, 80);
  rect(445, 180, 300, 10);

  textSize(30);
  fill(#DB504B);
  text("Press 's' to Start!", 480, 550);

  textSize(75);
  fill(#DB504B);
  text("MISSION:", 450, 95);

  textSize(35);
  fill(#517466);
  text("Make Mars Green!!", 465, 160);

  textSize(35);
  fill(#DB504B);
  text("How to Play:", 485, 440);


  textSize(25);
  fill(255, 255, 255);
  text(" Press arrows to move left, right, & up", 388, 475);


  textSize(25);
  fill(255, 255, 255);
  text(" to shoot press a and d!", 450, 510);


  if (key == 's') {
    mainMenu.stop();
    state = 1;
  }
}

// case 1 function
void level1() {
  if (UpdatedBSound.isPlaying() == false)
    UpdatedBSound.play();

  //draw, move and wall detect player

  println(player.y);

  for (Platform aPlatform : platformList) {
    aPlatform.render();
    aPlatform.updateHitbox();
    aPlatform.landedOn(player);
  }
  if (player.isDead == false) {
    player.render();
  }

  player.move();
  player.updateHitbox();
  player.jump();
  player.reachTopOfJump();
  player.fall();
  player.land();
  player.fallOffPlatform(platformList);
  //player.isDead(alien);
 
  lose();


  // draw move and wall detect alien
  for (Alien aAlien : alienList) {
    aAlien.checkIfDead(bulletList);
    if (aAlien.isDead == false) {
      aAlien.render();
    }
    player.checkIfIsDead(aAlien);
  }

  // render move and update bullet

  for ( Bullet bullet : bulletList) {
    bullet.render();
    bullet.move();
    bullet.updateHitbox();
  }

  //render and update raindrops
  for (Raindrop raindrop : raindropList) {
    raindrop.checkIfCollected(player);
    if ( raindrop.isCollected == false) {
      raindrop.render();
    }
  }
  boolean winCondition=true;
  
  for (Raindrop aRaindrop : raindropList) {
    winCondition = winCondition && aRaindrop.isCollected;  
  }

  if ( player.y == 0 && winCondition==true ) {
    println( "YAY");
    player.y = height;
    renderAlien();
    renderRaindrop();
    state ++;
  }
     if (key == 'r') {
    
    player.x = 50;
    player.y = 100; //580
    player.isDead = false;
    player.isFalling = false;
    for(Alien aAlien : alienList) {
      aAlien.isDead=false;
      state = 0;
    }
  }
}

// case 2
void level2() {
  if (UpdatedBSound.isPlaying() == false)
    UpdatedBSound.play();


  for (Platform aPlatform : platform2List) {
    aPlatform.render();
    aPlatform.updateHitbox();
    aPlatform.landedOn(player);
  }
  if (player.isDead == false) {
    player.render();
  }

  player.move();
  player.updateHitbox();
  player.jump();
  player.reachTopOfJump();
  player.fall();
  player.land();
  player.fallOffPlatform(platformList);
  //player.isDead(alien);
  lose();

  // draw move and wall detect alien
  for (Alien aAlien : alienList) {
    aAlien.checkIfDead(bulletList);
    if (aAlien.isDead == false) {
      aAlien.render();
    }
    player.checkIfIsDead(aAlien);
  }

  // render move and update bullet

  for ( Bullet bullet : bulletList) {
    bullet.render();
    bullet.move();
    bullet.updateHitbox();
  }

  //render and update raindrops
  for (Raindrop raindrop : raindropList) {
    raindrop.checkIfCollected(player);
    if ( raindrop.isCollected == false) {
      raindrop.render();
    }
  }
  
  boolean winCondition=true;
  
  for (Raindrop aRaindrop : raindropList) {
    winCondition = winCondition && aRaindrop.isCollected;  
  }
  if ( player.y == 0 && winCondition==true) {
    println(" next level");
    player.y = height;
    renderAlien3();
    renderRaindrop3();
    state = 3;
  }
     if (key == 'r') {
    
    player.x = 50;
    player.y = 580;
    player.isDead = false;
    for(Alien aAlien : alienList) {
      aAlien.isDead=false;  
      state = 0;
    }
  }
}
// case 3
void level3() {
  if (UpdatedBSound.isPlaying() == false)
    UpdatedBSound.play();

  //draw, move and wall detect player



  for (Platform aPlatform : platform3List) {
    aPlatform.render();
    aPlatform.updateHitbox();
    aPlatform.landedOn(player);
  }
  if (player.isDead == false) {
    player.render();
  }

  player.move();
  player.updateHitbox();
  player.jump();
  player.reachTopOfJump();
  player.fall();
  player.land();
  player.fallOffPlatform(platform3List);
  //player.isDead(alien);
  
  lose();
  // draw move and wall detect alien
  for (Alien aAlien : alienList) {
    aAlien.checkIfDead(bulletList);
    if (aAlien.isDead == false) {
      aAlien.render();
    }
    player.checkIfIsDead(aAlien);
  }

  // render move and update bullet

  for ( Bullet bullet : bulletList) {
    bullet.render();
    bullet.move();
    bullet.updateHitbox();
  }

  //render and update raindrops
  for (Raindrop raindrop : raindropList) {
    raindrop.checkIfCollected(player);
    if ( raindrop.isCollected == false) {
      raindrop.render();
    }
  }
  boolean winCondition=true;
  
  for (Raindrop aRaindrop : raindropList) {
    winCondition = winCondition && aRaindrop.isCollected;  
  }

  if ( player.y == 0 && winCondition == true ) {
     UpdatedBSound.stop();
    win();
    
    //state ++;
  }  if (key == 'r') {
    
    player.x = 50;
    player.y = 580;
    player.isDead = false;
    for(Alien aAlien : alienList) {
      aAlien.isDead=false;  
      state = 0;
    }
  }
}


void renderAlien() {

  Alien alien1;
  Alien alien2;
  Alien alien3;

  alien1= new Alien( 200, 580 - 20, 40, 40, color(0, 255, 0));
  alien2 = new Alien( 300, 180 - 20, 40, 40, color(0, 255, 0));
  alien3 = new Alien( 500, 280 - 20, 40, 40, color(0, 255, 0));

  alienList = new ArrayList<Alien>();
  alienList.add(alien1);
  alienList.add(alien2);
  alienList.add(alien3);
}

void renderRaindrop() {
  Raindrop raindrop1;
  Raindrop raindrop2;
  Raindrop raindrop3;

  raindrop1 = new Raindrop( 200, platform1.top - platform1.h - 10 , 20, 20, color( 0, 0, 255));
  raindrop2 = new Raindrop( 400, platform2.top - platform2.h - 10, 20, 20, color( 0, 0, 255));
  raindrop3 = new Raindrop( 500, platform5.top - platform5.h - 10, 20, 20, color( 0, 0, 255));

  raindropList = new ArrayList<Raindrop>();
  raindropList.add(raindrop1);
  raindropList.add(raindrop2);
  raindropList.add(raindrop3);
}
//level 3 raindrops
void renderRaindrop3() {
  Raindrop raindrop4;
  Raindrop raindrop5;
  Raindrop raindrop6;

  raindrop4 = new Raindrop( 550, platform5.top - platform5.h - 10, 20, 20, color( 0, 0, 255));
  raindrop5 = new Raindrop( 575, platform1.top - platform1.h - 10, 20, 20, color( 0, 0, 255));
  raindrop6 = new Raindrop( 450, platform2.top - platform1.h - 10, 20, 20, color( 0, 0, 255));

  raindropList = new ArrayList<Raindrop>();
  raindropList.add(raindrop4);
  raindropList.add(raindrop5);
  raindropList.add(raindrop6);
}
//level 3 aliens
void renderAlien3() {
  Alien alien4;
  Alien alien5;
  Alien alien6;

  //aliens
  alien4= new Alien( 580, 580 - 20, 40, 40, color(0, 255, 0));
  alien5 = new Alien( 300, 180 - 20, 40, 40, color(0, 255, 0));
  alien6 = new Alien( 500, 280 - 20, 40, 40, color(0, 255, 0));

  alienList = new ArrayList<Alien>();
  alienList.add(alien4);
  alienList.add(alien5);
  alienList.add(alien6);
}

void lose() {
  if (player.isDead == true) {
    state = 4;
     
 //sound   
    if (loseScreen.isPlaying() == false)
    loseScreen.play();
   shootSound.stop();
   
    background(earth);
    lose = loadImage("lose.png");
    lose.resize(1000, 1100);
    image(lose, 50, -250);

    fill(#6990C1);
    rect(30, 50, 400, 70);
    triangle(300, 120, 360, 150, 350, 120);
    textSize(50);
    fill(#FCC878);
    text(" Not today Human! ", 30, 100);
    
     textSize(30);
    fill(#FCC878);
    text(" To return back to", 75, 170);
    textSize(30);
    fill(#FCC878);
    text(" the main menu press 'r' !", 35, 200);
  }
}
void win() {
  if ( player.y == 0) {
    state = 5;
    background(marsImg);
    
     if (yay.isPlaying() == false)
    yay.play();
    shootSound.stop();
    
// space guy when win
    spaceGuy = loadImage("spaceGuy.png");
    spaceGuy.resize(300, 400);
    image(spaceGuy, 450, 200);

    // plants when completed!
    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 100, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 100, 400);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 300, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 400, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 50, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 50, 400);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 50, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 10, 400);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 10, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 200, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 250, 500);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 300, 400);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 400, 400);

    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 300, 400);

    //plant player is holding
    plantImg = loadImage("plant.png");
    plantImg.resize(100, 100);
    image(plantImg, 640, 150);


    fill(255, 255, 255);
    textSize(70);
    text(" YOU DID IT! ", 75, 115);
    textSize(20);
    text("MISSION COMPLETED", 150, 145);
    
      textSize(20);
    fill(255, 255, 255);
    text(" To return back to the main menu press 'r' !", 75, 175);
  }
}
