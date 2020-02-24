//Crossy Road
//Based off of Coding Challenge Frogger https://www.youtube.com/watch?v=c6WdJltqEtM
int points;
int row;
int end=0;
Car[] cars;
Log[] logs;
Frog frog;
float grid = 50;

void resetGame() {
  points = 0;
  frog = new Frog(width/2-grid/2, height-grid, grid);
  frog.attach(null);
}

void setup() {
  size(1000, 800, P3D);
  textAlign(CENTER, CENTER);
  //fullScreen(FX2D);
  cars = new Car[14];
  int index = 0;
  row = 0;
  //row 1
  for (int i = 0; i < 5; i++) {
    float x = i * 200; 
    cars[index] = new Car(x, height-grid*2, grid*2, grid, 2);
    index++;
  }
  //row 2
  for (int i = 0; i < 5; i++) {
    float x = i * 200 + grid*3; 
    cars[index] = new Car(x, height-grid*3, grid, grid, 1.2);
    index++;
  }
  //row 4
  for (int i = 0; i < 4; i++) {
    float x = i * 300; 
    cars[index] = new Car(x, height-grid*4, grid*1.4, grid, 4);
    index++;
  }

  logs = new Log[4];
  //row 5
  index = 0;
  for (int i = 0; i < 4; i++) {
    float x = i * 250; 
    //river.add();
    logs[index] = new Log(x, height-grid*6, grid*2.5, grid, -1.2);
    index++;
  }

  resetGame();
}



void draw() {
  background(0);

  float yoff = end; 
  yoff += 0.2;

  //if(row <= end){
  //resetGame(); 
  //} else{
  //end -+= 0.15;}
  textSize(50);
  text(""+points, width/2, 50);
  frog.show();
  for (Car car : cars) {
    car.show();
    car.act();
    if (frog.intersects(car)) {
      resetGame();
      println("GAME OVER");
    }
  }

  for (Log log : logs) {
    log.show();
    log.act();
  }
  if (frog.y == height-grid*6) {
    boolean ok = false;
    for (Log log : logs) {
      if (frog.intersects(log)) {
        ok = true;
        frog.attach(log);
      }
    }
    if (!ok ||frog.x < -grid || frog.x>width + grid) {
      resetGame();
    }
  } else {
    frog.attach(null);
  }
  frog.update();
  frog.show();
}



void keyPressed() {
  if (keyCode == UP) { 
    frog.move(0, -1);
    points++;
    row++;
  }
  // else if (keyCode == DOWN) frog.move(0, 1);
  else if (keyCode == RIGHT) frog.move(1, 0);
  else if (keyCode == LEFT) frog.move(-1, 0);
}
