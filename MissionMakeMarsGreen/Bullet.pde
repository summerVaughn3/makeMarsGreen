class Bullet {

  // deaclaring vars
  int x;
  int y;
  int d;
  color bColor;
  int speed;
  int top;
  int right;
  int left;
  int bottom;
  boolean isRight;


  // constructor
  Bullet( int tempX, int tempY, boolean direction) {
    //intializing vars
    x = tempX;
    y = tempY;
    d = 10;
    isRight = direction;
    bColor = color(0, 0, 0);
    if(isRight==true) {
      speed = 10;
    }
    else {
      speed=-10;
    }
    top = y - d/2;
    bottom = y + d/2;
    right = x + d/2;
    left = x - d/2;
  }
  void render() {
    fill(bColor);
    circle(x, y, d);
  }
  void move() {
    x =  x + speed;
  }
  void updateHitbox() {
    top = y - d/2;
    bottom = y + d/2;
    right = x + d/2;
    left = x - d/2;
  }
}
