class Lane extends Rectangle {
  Obstacle[] obstacles;
  //int col;
  float speed;
  float spacing;  
  boolean isCar = (random(0, 100) > 50);
  //Lane(int index, color c) {
  //  super(0, index*grid, width, grid);
  //  obstacles = new Obstacle[0];
  //  col = c;
  //}

  Lane(int index, int n, float len, float spacing, float speed) {
    super(0, index*grid, width, grid);

    if (index >= 6) {
      isCar = true;
    } 
    if (index== 1) {
      isCar = false;
    }

    obstacles = new Obstacle[n];
    float offset = random(0, 200);
    for (int i = 0; i < n; i++) {
      obstacles[i] = new Obstacle(offset + spacing*i, index*grid, grid*len, grid, speed, isCar);
    }
    //if (isCar){
    //  fill(0);
    //  rect(x, y, w, h);
    //}else{
    // fill(0,0,255); 
    //  rect(x, y, w, h);
    //}

    //col = color(0);
  }



  void check(Frog frog) {

    if (isCar == true) {
      for (Obstacle o : obstacles) {
        if (frog.intersects(o)) {
          resetGame();
        }
      }
    } else if (isCar == false) {
      boolean ok = false;
      for (Obstacle o : obstacles) {
        if (frog.intersects(o)) {
          ok = true;
          frog.attach(o);
        }
      }
      if (!ok ||frog.x < -grid || frog.x>width + grid) {
        resetGame();
      }
    }
  }

  void run() {
    //  type = int(random(0, 1));
    for (Obstacle o : obstacles) {
      //   fill(col);
      //   rect(x, y, w, h);

      //if (isCar){
      //  fill(0);
      //  rect(x, y, w, h);
      //}else{
      // fill(0,0,255); 
      //}

      o.show();
      o.act();
    }
  }
}
