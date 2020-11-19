int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  size(1080, 720);
  stroke(255);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  
  cx = width / 2;
  cy = height / 2;

  

}

void draw() {
  background(201, 255, 240);
  fill(255);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
//  background(0);
//  strokeWeight(2);
  
  fill(0);
  noStroke();
  point(cx, cy); //draw center circle 

  textSize(20);
  int hour = 2;
  for (int a = 0; a < 360; a+=30) {
    hour++;
    float angle = radians(a);
    float x = cx + cos(angle) * (secondsRadius + 30);
    float y = cy + sin(angle) * (secondsRadius + 30);
//    rotate(angle);
    text(hour, x, y);
    if(hour == 12) hour = 0;
  }
}

void drawHour()
{
  
}
