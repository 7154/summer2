import controlP5.*;
 
ControlP5 cp5;
Slider2D ui;
 
float x1,y1,x2,y2,xe,ye;
float angle1;
float angle2;
float angle1_;
float angle2_;
float the1;
float the2;
final float l1 = 100;
final float l2 = 80;
final int r = 20;
int dir = 1;
 
void setup(){
  size(640,640);
  stroke(255,255,255);
  fill(255,255,255);
  //set to origin.
  x1 = 300;
  y1 = 350;
  cp5 = new ControlP5(this);
   
  ui = cp5.addSlider2D("Position")
    .setPosition(30,40)
    .setSize(200,200)
    .setArrayValue(new float[] {15, 30})
    ;
}
 
void draw()
{ 
  background(0);
  angle1_ = acos((pow(l1,2)-pow(l2,2)+(pow(ui.getArrayValue()[0],2)+pow(ui.getArrayValue()[1],2)))/((2*l1)*sqrt(pow(ui.getArrayValue()[0],2)+pow(ui.getArrayValue()[1],2))));
  angle1 = atan2(ui.getArrayValue()[1],ui.getArrayValue()[0])-angle1_;
  angle2_ = acos((pow(l2,2)-pow(l1,2)+(pow(ui.getArrayValue()[0],2)+pow(ui.getArrayValue()[1],2)))/((2*l2)*sqrt(pow(ui.getArrayValue()[0],2)+pow(ui.getArrayValue()[1],2))));
  angle2 = angle1_ + angle2_;
  the1 = angle1*PI/180;
  the2 = angle2*PI/180;
  print(angle1);print(":");println(angle2);
  x2 = x1+l1*cos(angle1);
  y2 = y1+l1*sin(angle1);
  xe = x2+l2*cos(angle1+angle2);
  ye = y2+l2*sin(angle1+angle2);
  ellipse(x1,y1,r,r);
  ellipse(x2,y2,r,r);
  fill(255,0,0);
  ellipse(xe,ye,r,r);
  fill(255);
  line(x1,y1,x2,y2);
  line(x2,y2,xe,ye);
}