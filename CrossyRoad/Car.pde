class Car extends Rectangle {
  float speed;
  Car(float x, float y, float w, float h, float s) {
    super(x, y, w, h);
    speed = s;
  }

  void show() {
    fill(150);
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
