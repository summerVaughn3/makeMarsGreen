class Alien {

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
  boolean isDead;

  //Constructor

  Alien( int tempX, int tempY, int tempW, int tempH, color tempColor) {

    //intializing
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;

    top = y;
    right = x + w;
    left = x;
    bottom = y + h;
    aColor = tempColor;
    isDead = false;
  }

  void render() {
    fill(aColor);
    //rect(x, y, w, h);
     enemy.resize(40,40);
    image(enemy, x, y); 
  }

  void checkIfDead(ArrayList<Bullet> bulletList) {
    for (Bullet bullet : bulletList) {
      if ( bullet.top < bottom && bullet.bottom > top &&  bullet.right > left && bullet.left < right) {
        isDead = true;
        //println("Hi");
      }
    }
  }
}
