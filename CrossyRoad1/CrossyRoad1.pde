//Crossy Road
//Based off of Coding Challenge Frogger https://www.youtube.com/watch?v=c6WdJltqEtM
int points;
int row;
int end=0;
boolean type;
int s;
int size;
int quantity;
int space;
float laneType;
Frog frog;
Lane lanes[];
//Obstacle obstacles[];

float grid = 50;

void resetGame() {
  points = 0;
  frog = new Frog(width/2-grid/2, height-grid, grid);
  frog.attach(null);
}

void setup() {
  size(1000, 550, P3D);
  textAlign(CENTER, CENTER);
  //fullScreen(FX2D);

  //might change total lanes #
  int totalLanes = int (height/grid);
  lanes = new Lane[totalLanes];
  lanes[10] = new Lane(0, 0, 0, 0, 0);
  s = int(random(-3, 3));  
  if (s == 0) {
    s++;
  }  
  size = int(random(1, 3));
  quantity = int(random(1, 7));
  space = int(random(150, 200));

  for (int i = 0; i < lanes.length -1; i++) {

    type = (random(0, 100) > 50);
    //laneType = random(0, 3);
    println("type is " + type);
    s = int(random(-3, 3));
    if (s == 0) {
      s++;
    }
    size = int(random(1, 3));
    quantity = int(random(0, 7));
    space = int(random(150, 200));
    lanes [i] = new Lane(i, quantity, size, space, s);
  }




  //lanes[] = new Lane(index, quantity, width of 1, offset/spaced out by, speed)
  //lanes[0] = new Lane(0, color(100));

  ////cars = new Obstacle[14];
  //int index = 0;
  //row = 0;
  ////row 1
  //for (int i = 0; i < 5; i++) {
  //  float x = i * 200; 
  //  cars[index] = new Obstacle(x, height-grid*2, grid*2, grid, 2);
  //  index++;
  //}

  resetGame();
}



void draw() {
  background(0);
  for (Lane lane : lanes) {
    lane.run();
  }  
  int laneIndex = int(frog.y/grid);
  lanes[laneIndex].check(frog);


  //float yoff = end; 
  //yoff += 0.2;

  //if(row <= end){
  //resetGame(); 
  //} else{
  //end -+= 0.15;}
  textSize(50);
  fill(255);
  text(""+points, width/2, 50);

  //for (Log log : logs) {
  //  log.show();
  //  log.act();
  //}
  //if (frog.y == height-grid*6) {
  //  boolean ok = false;
  //  for (Log log : logs) {
  //    if (frog.intersects(log)) {
  //      ok = true;
  //      frog.attach(log);
  //    }
  //  }
  //  if (!ok ||frog.x < -grid || frog.x>width + grid) {
  //    resetGame();
  //  }
  //} else {
  //  frog.attach(null);
  //}
  frog.update();
  frog.show();
}



void keyPressed() {
  frog.attach(null);
  if (keyCode == UP) { 
    frog.move(0, -1);
    points++;
    row++;
  }
  // else if (keyCode == DOWN) frog.move(0, 1);
  else if (keyCode == RIGHT) frog.move(1, 0);
  else if (keyCode == LEFT) frog.move(-1, 0);
}
