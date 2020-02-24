class Log extends Car {
  Log(float x, float y, float w, float h, float s) {
    super(x, y, w, h, s);
    speed = s;
  }

  void show() {
    fill(200);
    rect(x, y, w, h);
  }
}
