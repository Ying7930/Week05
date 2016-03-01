float[] values;
int index;
int x = 0;
int y = 150;

void setup() {
  size(600, 300);
  background(0);

  values = new float[width/3];
  index = 0;
}

float maybeRandomHeight() {
  if (random(15) < 1) {
    return random(height/5, 2*height/5);
  } else {
    return 0;
  }
}

void draw() {
  background(255);

  values[index] = maybeRandomHeight();
  index = index + 1;
  if (index >= values.length) {//>=200
    index = 0;
  }

  for (int i = 0; i < values.length; ++i) {
    int realIndex = index + i;
    if (realIndex >= values.length) {
      realIndex -= values.length;
    }
    line(i*3, height-values[realIndex]/3, i*3, height);
    line(i*3, height*0, i*3, values[realIndex]);
  }
  fill(0);
  ellipse(100, y, 35, 28);
  ellipse(115, y, 10, 5);
  rect(77, y-3, 10, 5);
  fill(255);
  ellipse(110, y-5, 10, 10);
  if (keyPressed == true) {
    y -= 8;
  } else {
    y += 3;
  }
  if(y <= 0 || y>=300) {//when the bird is out of the screen
    background(0);
    fill(255, 50, 80);
    noStroke();
    rect(200, 100, 10, 100);//B
    rect(200, 100, 80, 10);
    rect(200, 140, 70, 10);
    rect(270, 100, 10, 50);
    rect(200, 160, 70, 10);
    rect(200, 200, 70, 10);
    rect(270, 160, 10, 50);
    rect(200, 150, 45, 15);
    rect(300, 100, 10, 100);//E
    rect(300, 200, 80, 10);
    rect(300, 150, 60, 15);
    rect(300, 100, 80, 10);
  }
  println(y);
}
