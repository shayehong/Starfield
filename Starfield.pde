//your code h
Particle[] starfield;
void setup()
{
	//your code here
	size(500,500);
	//background(0);
	starfield = new Particle[100];
	for(int i = 0; i < starfield.length-1; i++){
		starfield[i] = new NormalParticle();
	}
		starfield[98] = new OddballParticle();
		starfield[99] = new JumboParticle();
}
void draw()
{
	//your code here
	background(0);
	for(int i = 0; i < starfield.length; i++){
		starfield[i].move();
		starfield[i].show();

	}
    

}
class NormalParticle implements Particle 
{
	//your code here
	double x;
	double y;
	double angle;
	double speed;
	int c;

	NormalParticle(){
		x = 250;//(int)(Math.random()*500);
		y = 250;//(int)(Math.random()*500); 
		speed = (Math.random()*5); 
		angle = Math.PI*2*Math.random();
		c = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}

		public void move(){
			x = Math.cos(angle)*speed+ x;
			y = Math.sin(angle)*speed+ y;
		}

		public void show(){
			noStroke();
			fill(c);
			ellipse((float)x,(float)y,4,4);
		}



	

}
interface Particle
{
	//your code here
	public void move();
	public void show();

}
class OddballParticle implements Particle//uses an interface
{
	//your code here
	int x;
	int y;
	int c;

	OddballParticle(){
		x = 250;
		y = 250;/*
		speed = (Math.random()*3); 
		angle = Math.PI*2*Math.random();
		*/
		c = color(255,0,0);

	}
	public void move(){
 		int dir = (int)(Math.random()*4);
 		int dist = (int)(Math.random()*3)+1;
 		
 		if(dir == 0){
 			//moves to the right
 			x += dist;
 		}
 		if(dir == 1){
 			//moves to the left
 			x-= dist;
 		}
 		if(dir ==2){
 			//moves down
 			y += dist;
 		}
 		if(dir == 3){
 			//moves up
 			y -= dist;

 		}

 	}

 	public void show(){
 		fill(c);
 		ellipse(x,y,5,5);
 	}
 }
class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	public void show(){
		fill(255,255,255);
		ellipse((float)x,(float)y,9,9);
	}
}

