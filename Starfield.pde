//your code h
Particle[] starfield;
void setup()
{
	//your code here
	size(500,500);
	//background(0);
	starfield = new Particle[150];

	for(int i = 0; i < starfield.length-1; i++){
		starfield[i] = new NormalParticle();
	}
		starfield[148] = new OddballParticle();
		starfield[149] = new JumboParticle();

	
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

void mousePressed(){
	redraw();
}
class NormalParticle implements Particle 
{
	//your code here
	double x;
	double y;
	double angle;
	double speed;
	int cR;
	int cG;
	int cB;

	NormalParticle(){
		x = 250;//(int)(Math.random()*500);
		y = 250;//(int)(Math.random()*500); 
		cR = (int)(Math.random()*186); 
		cG =(int)(Math.random()*136)+112;
		cB = (int)(Math.random()*147)+116;
		speed = (Math.random()*2); 
		angle = Math.PI*2*Math.random();
	}

		public void move(){
			x = Math.cos(angle)*speed+ x;
			y = Math.sin(angle)*speed+ y;
			angle += .0015;

			if(x<0 || x>500 || y<0||y>500){
				x = 250;
				y = 250;
			}
		}

		public void show(){
			noStroke();
			fill(cR,cG,cB);
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
		y = 250;
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
 		ellipse(x,y,7,7);
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

