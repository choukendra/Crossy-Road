class Frog extends Rectangle {

  Obstacle attached = null;

  Frog(float x, float y, float w) {
    super(x, y, w, w);
  }

  void attach(Obstacle log) {
    attached = log;
  }

  void show() {
    fill(255);
    rect(x, y, w, w);
  }

  void update() {
    if (attached !=null) {
      frog.x += attached.speed;
    }
    if (frog.x < -grid/2 && attached != null || frog.x > width + grid/2 && attached != null) {
      resetGame();
    }
    if (frog.x < -grid/2) {
      frog.x = width;
    }
    if (frog.x > width + grid/2) {
      frog.x = 0;
    }
  }


  void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
  }
}
