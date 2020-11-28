int cx, cy;
int radius;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float hourHand;
float InClockDiameter;
float OutClockDiameter;

float speed;
float time = 0;
float minAng;
float hourAng;


void setup() {
  size(1080, 720);
  stroke(255);

  radius = min(width, height) / 2;
  minutesRadius = radius * 0.8;
  hoursRadius = radius * 0.6;
  InClockDiameter = radius * 0.7;
  OutClockDiameter = radius * 0.9;
  hourHand = radius * 0.54;

  cx = width / 2;
  cy = height / 2;

  minAng = -90;
  hourAng = 0;
  speed = 0.1;
}


void draw() {
  background(255);
  minAng -= 6 * speed;
  hourAng -= 0.5 * speed;

  //OutClock
  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(cx, cy, OutClockDiameter*2, OutClockDiameter*2);

  //InClock
  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(cx, cy, InClockDiameter*2, InClockDiameter*2);

  float m = radians(minAng);
  float h = radians(hourAng);

  stroke(0, 255, 0);
  strokeWeight(2);
  line(cx, cy + -InClockDiameter, cx, cy + -0.75 * radius);  

  stroke(0);
  strokeWeight(2);
  line(cx, cy, cx + cos(m-h)*hourHand, cy + sin(m-h)*hourHand);

  displayInside();
  displayOutside();
  
  time += 0.1;
  
  textSize(50);
  text(int(time/60) + ":" + int(time%60), 10, 50);
//  text(int(time/60), 10, 50);
//  text(int(time%60), 10, 100);
}


void displayInside()
{
  fill(255, 0, 0);
  textSize(20);
  int hour = 12;
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(minAng+a);
    float x = cx + cos(angle) * hoursRadius;
    float y = cy + sin(angle) * hoursRadius;
    text(hour, x, y);
    if (hour == 12) hour = 0;
    hour++;
  }
}

void displayOutside()
{
  fill(0, 0, 255);
  textSize(10);
  int min = 60;
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(minAng+a);
    float x = cx + cos(angle) * minutesRadius;
    float y = cy + sin(angle) * minutesRadius;
    text(min, x, y);
    if (min == 60) min = 0;
    min += 5;
  }
}
