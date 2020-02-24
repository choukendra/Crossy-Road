class River extends Rectangle {
  River(float x, float y, float w, float h) {
    super(x, y, w, h);
  }

  void show() {
    fill(0,0,255);
    rect(x, y, width, grid);
  }
}
