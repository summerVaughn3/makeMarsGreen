class Player {

  //Class variables

  int x;
  int y;
  int w;
  int h;
  color aColor;
  int top;
  int right;
  int left;
  int bottom;

  int xSpeed;

  // do I need Y speed if I am jumping?
  int jSpeed;
  int fSpeed;
  int peakY;



  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isJumping;
  boolean isFalling;
  boolean isDead;


  //Constructor

  Player(int tempX, int tempY, int tempW, int tempH, color tempColor) {

    // initializing vars
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;

    top = y;
    right = x + w;
    left = x;
    bottom = y + h;
    aColor = tempColor;

    xSpeed = 5;
    jSpeed = 10;
    fSpeed = 10;

    // player's vertical

    peakY = y - 150;



    // booleans for moving
    isMovingLeft = false;
    isMovingRight = false;
    isDead = false;
  }

  // declaring vars for player
  Player() {
    x = 100;
    y = 5000;
    w = 50;
    h = 50;
    aColor = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));

    xSpeed = 10;


    if (xSpeed == 0) {
      xSpeed =10;
    }
  }


  //Functions

  void render() {
    fill(aColor);
    //rect(x, y, w, h);
    spaceGuy.resize(40,50);
    image(spaceGuy,x,y);
   
   
  }

  void updateHitbox() {
    top = y;
    bottom = y + h;
    left = x;
    right = x + w;
  }

  void jump() {
    if ( isJumping == true && isFalling == false) {
      y = y - jSpeed;
    }
  }

  void reachTopOfJump() {
    if (y < peakY && isJumping == true) {
      isFalling = true;
      isJumping = false;
    }
  }

  void fall() {
    if ( isFalling == true && isJumping == false) {
      y = y + fSpeed;
    }
  }

  void land() {
    if ( y + h >= height) {
      isFalling = false;
      peakY = y - 150;
    }
  }

  void fallOffPlatform(ArrayList<Platform> platformList) {
    if ( isJumping == false && y + h != height) {
      boolean onPlatform = false;

      for (Platform aPlatform : platformList) {
        if ( left < aPlatform.right && right > aPlatform.left && bottom == aPlatform.top) {
          onPlatform = true;
        }
      }
      if ( onPlatform == false) {
        isFalling = true;
      }
    }
  }


  //This function takes updates the position the ball according to its speed.

  void move() {
    if (isMovingLeft == true && x > 0) {
      x = x - xSpeed;
    }
    if (isMovingRight == true && x + w < width) {
      x = x + xSpeed;
    }
  }
  // hitbox for when alien and player hit
  //player dies

  void checkIfIsDead(Alien aAlien) {
    if ( right > aAlien.left && left < aAlien.right && bottom == aAlien.bottom && aAlien.isDead == false) {
      println("collide");
      isDead = true;
    }
  }
}
