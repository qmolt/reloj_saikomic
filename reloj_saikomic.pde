/**
 * Reloj Saikomic 24 hrs. 
 * 
 * Las horas se leen en modulo 24 en lugar de 12
 * Minutos y segundos se leen como un reloj tradicional
 */
 
PImage bg_img;
PImage cir_img;
PImage mhor_img;
PImage mmin_img;
PImage mseg_img;

int cx, cy;
float ticksRadius;
float numbersRadius;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void settings() {
  size(400, 400, P2D);
  smooth();
  
  PJOGL.setIcon("icon.png");
}

void setup() {
  frameRate(30);
  
  surface.setTitle("Reloj Saikomic 24 Hrs");
  
  int radius = min(width, height) / 2;
  ticksRadius = radius * 0.5;
  numbersRadius = radius * 0.85;
  secondsRadius = radius * 0.8;
  minutesRadius = radius * 0.55;
  hoursRadius = radius * 0.3;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
  
  bg_img = loadImage("bg.png");
  cir_img = loadImage("circulo.png");
  mhor_img = loadImage("mhor.png");
  mmin_img = loadImage("mmin.png");
  mseg_img = loadImage("mseg.png");
  
  imageMode(CENTER);
}

void draw() {
  background(51);
  
  image(bg_img, width/2, height/2, width, height); 
  
  image(cir_img, width/2, height/2, width, height); 
  
  /*
  fill(25,240);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  */ 
  
  float s0 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m0 = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h0 = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI) - HALF_PI;
  
  float s = map(second(), 0, 60, 0, TWO_PI);
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI); 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI);
  
  /*
  //puntos
  stroke(200,150,150);
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 15; a < 360; a+=30) {
    float angle = radians(a);
    float x1 = cx + cos(angle) * ticksRadius;
    float y1 = cy + sin(angle) * ticksRadius;
    vertex(x1, y1);
  }
  endShape();
  //rayas
  stroke(200,150,150);
  strokeWeight(2);
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(a);
    float x1 = cx + cos(angle) * ticksRadius;
    float x2 = cx + cos(angle) * (ticksRadius+10);
    float y1 = cy + sin(angle) * ticksRadius;
    float y2 = cy + sin(angle) * (ticksRadius+10);
    line(x1,y1,x2,y2);
  }

  //circulos
  for (int a = 0; a < 12; a++) {
    float angle = radians(a*30);
    float xn1 = cx + cos(angle) * (numbersRadius-25);
    float yn1 = cy + sin(angle) * (numbersRadius-25);
    float cn = 42.;
    
    fill(40);
    noStroke();
    ellipseMode(CENTER);
    ellipse(xn1, yn1, cn, cn);
  }
 */
 
   //manillas imagenes
   pushMatrix();
   translate(width/2, height/2);
   rotate(m);
   image(mmin_img, 0, 0, width, height);
   popMatrix(); 
 
   pushMatrix();
   translate(width/2, height/2);
   rotate(h);
   image(mhor_img, 0, 0, width, height);
   popMatrix(); 
   
   pushMatrix();
   translate(width/2, height/2);
   rotate(s);
   image(mseg_img, 0, 0, width, height);
   popMatrix(); 
 
   /*
  //manillas 
  stroke(204);
  strokeWeight(1);
  line(cx, cy, cx + cos(s0) * secondsRadius, cy + sin(s0) * secondsRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(m0) * minutesRadius, cy + sin(m0) * minutesRadius);
  strokeWeight(5);
  line(cx, cy, cx + cos(h0) * hoursRadius, cy + sin(h0) * hoursRadius);
   */ 
  
}
