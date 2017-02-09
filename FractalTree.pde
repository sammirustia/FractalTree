private double fractionLength = .8; 
private int smallestBranch = 20; 
private double branchAngle = .5;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(214, 244, 244);   
	stroke(96, 163, 20);   
	strokeWeight(2);
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here 
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;  
	branchLength = branchLength * fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	if (branchLength < smallestBranch)
	{
		fill(150, 0, 255);
		ellipse(endX1,endY1,5,15);
		ellipse(endX1,endY1,15,5);

		fill(225, 73, 120);
		ellipse(endX2,endY2,5,15);
		ellipse(endX2,endY2,15,5);

		fill(248, 255, 0);
		ellipse(endX1,endY1,5,5);
		ellipse(endX2,endY2,5,5);
	}
	else
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 
