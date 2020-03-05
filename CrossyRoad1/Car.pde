class Obstacle extends Rectangle {
  float speed;
  boolean localIsCar;
  
  Obstacle(float x, float y, float w, float h, float s, boolean isCar) {
    super(x, y, w, h);
    speed = s;
    localIsCar = isCar;
  }

  void show() {
    if (localIsCar == true) {
      fill(200);
    } else {
      fill(#896408);
    }
    rect(x, y, w, h);
  }

  void act() {
    x = x + speed;

    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (speed < 0 && x < -w-grid) {
      x= width+grid;
    }
  }
}
