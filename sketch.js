/**
 * Reloj Saikomic 24 hrs. 
 * 
 * Las horas se leen en modulo 24 en lugar de 12
 * Minutos y segundos se leen como un reloj tradicional
 */
 
let bg_mode = 0;

let img;
let bg_img;
let cir_img;
let mhor_img;
let mmin_img;
let mseg_img;

let zoom_mas;
let zoom_menos;
let zoom_a;
let zoom_x1;
let zoom_x2;
let zoom_y;

let a;
let c;

let mean = 1;
let w = 0.1;

function preload() {
	bg0_img = loadImage('assets/bg0.png');
	bg1_img = loadImage('assets/bg1.png');
	bg2_img = loadImage('assets/bg2.png');
	cir_img = loadImage('assets/circulo1.png');
	mhor0_img = loadImage('assets/mhor0.png');
	mhor1_img = loadImage('assets/mhor1.png');
	mhor2_img = loadImage('assets/mhor2.png');
	mmin0_img = loadImage('assets/mmin0.png');
	mmin1_img = loadImage('assets/mmin1.png');
	mmin2_img = loadImage('assets/mmin2.png');
	mseg0_img = loadImage('assets/mseg0.png');
	mseg1_img = loadImage('assets/mseg1.png');
	mseg2_img = loadImage('assets/mseg2.png');

	zoom_mas = loadImage('assets/zoommas.png')
	zoom_menos = loadImage('assets/zoommenos.png')
}

function setup() {
	createCanvas(windowWidth, windowHeight);

	zoom_a = 25;
	zoom_x1 = 10;
	zoom_x2 = 40;
	zoom_y = 10;

	a = min(400, width);

	imageMode(CENTER);
}

function draw() {
	background(20);

	s0 = second();
	
 	let bg_img;
 	let mhor_img;
 	let mmin_img;
 	let mseg_img;

	if(bg_mode == 2){ //dj
		bg_img = bg2_img;
		mhor_img = mhor2_img;
		mmin_img = mmin2_img;
		mseg_img = mseg2_img;

		//exponential average		
		s0 = s0 + random(-10, 10);
		mean = w * s0 + (1-w) * mean;
		s0 = mean;
	}
	else if(bg_mode == 1){ //tania
		bg_img = bg1_img;
		mhor_img = mhor1_img;
		mmin_img = mmin1_img;
		mseg_img = mseg1_img;	
	}
	else{ //tago
		bg_img = bg0_img;	
		mhor_img = mhor0_img;
		mmin_img = mmin0_img;
		mseg_img = mseg0_img;	
	}

	let s = map(s0, 0, 60, 0, TWO_PI);
	let m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI); 
  let h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI);

	c = a/2;

	//bg
  image(bg_img, c, c, a, a); 
  //circ
  image(cir_img, c, c, a, a); 
  
	//hr, min, seg img
	push();
	translate(c, c);
	rotate(m);
	image(mmin_img, 0, 0, a, a);
	pop(); 

	push();
	translate(c, c);
	rotate(h);
	image(mhor_img, 0, 0, a, a);
	pop(); 

	push();
	translate(c, c);
	rotate(s);
	image(mseg_img, 0, 0, a, a);
	pop();
  
  //zoom
  image(zoom_menos, zoom_x1+0.5*zoom_a, zoom_y+0.5*zoom_a, zoom_a, zoom_a);
  image(zoom_mas, zoom_x2+0.5*zoom_a, zoom_y+0.5*zoom_a, zoom_a, zoom_a);
}
  
function mousePressed(){
  if((mouseX > zoom_x1) && (mouseX < zoom_x1+zoom_a) && (mouseY > zoom_y) && (mouseY < zoom_y+zoom_a)){
  	a = max(225, 0.9*a);
  }
  else if((mouseX > zoom_x2) && (mouseX < zoom_x2+zoom_a) && (mouseY > zoom_y) && (mouseY < zoom_y+zoom_a)){
  	a *= 1.1;
  }
  else{
  	bg_mode = (bg_mode + 1) % 3; //2 modes in total
	}

	resizeCanvas(width, height);
}
