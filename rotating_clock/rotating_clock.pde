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
//  background(201, 255, 240);
  background(0);
  strokeWeight(2);
  
//  beginShape(POINTS);
  int hour = 2;
  for (int a = 0; a < 360; a+=30) {
    hour++;
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
//    rotate(angle);
    text(hour%12, x, y);
  }
//  endShape();
}
