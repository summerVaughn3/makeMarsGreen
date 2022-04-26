class Platform {

  //decalring vars

  int x;
  int y;
  int w;
  int h;
  color pColor;
  int top;
  int bottom;
  int right;
  int left;


  //constructor
  Platform(int tempX , int tempY) {
    x = tempX;
    y = tempY;
    w = 200;
    h = 15;
    pColor = color(198, 168, 102);

    top = y;
    bottom = y + h;
    left = x;
    right = x + w;
  }

  void render() {
    fill(pColor);
    noStroke();
    rect(x, y, w, h);
  }

  void updateHitbox() {
    top = y;
    bottom = y + h;
    left = x;
    right = x + w;
  }

  void landedOn(Player player) {
    if ( player.isFalling == true && player.left < right && player.right > left && player.bottom == top) {
      player.isFalling = false;
      player.peakY = player.y - 150;
      player.y = y - player.h;
    }
  }
}
