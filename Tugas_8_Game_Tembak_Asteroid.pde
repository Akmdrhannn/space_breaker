PFont fontA;
  int spherediameter = 20;
  boolean tembak = false;
  
//Untuk spawn asteroid secara random
int randomx()
{
  return int(random(900));
}

//Koordinat x dan y dari spawn random asteroid
int[] sphereXkoordinat = {randomx(),randomx(),randomx(),randomx()};
int[] sphereYkoordinat = {0,0,0,0};

void setup()
{
  size(900,650);
  }
void draw()
{
  background(#000000);
  
  //pesawat
  fill(color(#D6CBCB));
  stroke(#060DC1);
  strokeWeight(4);
  triangle(mouseX-16,645,mouseX+16,645,mouseX,615);
  
  //tembak
  fill(#FF0A0E);
  stroke(#FF0A0E);
  
  //kondisi apabila nilai tembak true
  if(tembak == true)
  {
    sphereMati(mouseX);
    tembak = false;
  }
  
  sphereDrop();
  gameselesai();
}

//Kondisi apabila mouse dipencet
void mousePressed()
{
  tembak = true;
}
//Memunculkan ellipse/asteroid yg sebelumnya telah drop 
void sphereDrop(){
 stroke(#188332);
 fill(#188332);
 for (int i = 0;i<4;i++){
   ellipse(sphereXkoordinat[i],sphereYkoordinat[i]++,spherediameter,spherediameter);
 }
}
 //fungsi untuk mengdropkan sphere atau asteroid
 void sphereMati(int tembakx){
   boolean hit = false;
   for (int i = 0 ; i < 4 ; i++){
     if((tembakx >= (sphereXkoordinat[i] - spherediameter/2)) && 
     (tembakx <= (sphereXkoordinat[i] + spherediameter/2))){
       hit = true;
       line(mouseX,615,mouseX,sphereYkoordinat[i]);
       ellipse(sphereXkoordinat[i],sphereYkoordinat[i],spherediameter+25,spherediameter+25);
       sphereXkoordinat[i] = randomx();
       sphereYkoordinat[i] = 0;
     }
   }
   
   if(hit == false){
     line(mouseX,615,mouseX,0);
   }
 }
 
 void gameselesai(){
  for(int i = 0 ; i < 4; i++){
    if(sphereYkoordinat[i] == 650){
      fill(color(255,0,0));
      noLoop();
      textSize(80);
      text("Silahkan coba lagi",100,325);
    }
  }
}
