class Raindrop {

  // class variables

  int x;
  int y;
  int h;
  int w;
  color aColor;
  int top;
  int bottom;
  int right;
  int left;
  boolean isCollected;


  Raindrop( int tempX, int tempY, int tempW, int tempH, color tempColor) {

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

    isCollected = false;
  }

  void render() {
    fill(aColor);
    //rect(x, y, w, h);
    water.resize(20,20);
    image(water, x, y); 
  }

  void checkIfCollected( Player player) {
    if (player.left < right && player.right > left && player.bottom > top && player.top < bottom) {
      isCollected = true;
    }
  }
}
