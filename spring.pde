Spring spring;
int sub_jud = 0;


void setup(){
  spring = new Spring();
  size(800, 600);
  colorMode(RGB, 256, 256, 256, 100);
  smooth();
  frameRate(60);
  

  spring.sakura();
  spring.nanoha();
  spring.hira_sakura();
  spring.maru();

  
}

void draw(){
    int jud = (sub_jud / 60) % 2;
    backcolor();    
    spring.branch();
    
    noStroke();
    
    
    for(int a = 0; a < spring.sakura_num / 2 ; a += 2){
      if(jud == 0 ){
        for(int o = 0; o < 3; o++){
          spring.sakura_box[a][o] += 0.25;
          spring.sakura_box[a+1][o] -= 0.25;
        }
      
      }else{
         for(int o = 0; o < 3; o++){
          spring.sakura_box[a][o] -= 0.25;
          spring.sakura_box[a+1][o] += 0.25;
         } 
      }      
    } 
    
  
  for(int a = 0; a < spring.nanoha_num / 2 ; a += 2){
      if(jud == 0 ){
        for(int o = 0; o < 3; o++){
          spring.nanoha_box[a][o] += 0.25;
          spring.nanoha_box[a+1][o] -= 0.25;
        }
      }else{
         for(int o = 0; o < 3; o++){
          spring.nanoha_box[a][o] -= 0.25;
          spring.nanoha_box[a+1][o] += 0.25;
        } 
       }
   }
   
   for(int a = 0; a < spring.hira_sakura_num / 2 ; a += 2){
      if(jud == 0 ){
        for(int o = 0; o < 3; o++){
          spring.hira_sakura_box[a][o] += 0.5;
          spring.hira_sakura_box[a+1][o] -= 0.5;
        }
      }else{
         for(int o = 0; o < 3; o++){
          spring.hira_sakura_box[a][o] -= 0.5;
          spring.hira_sakura_box[a+1][o] += 0.5;
        } 
       }
   }
   
   //hira_sakura_座標
   for(int b = 0; b < spring.hira_sakura_num; b++){
     for(int c = 3; c < 6; c++){ 
       spring.hira_sakura_box[b][c] += 1;
       
       if(spring.hira_sakura_box[b][c] > height){
            spring.hira_sakura_box[b][3] = -5;
            spring.hira_sakura_box[b][4] = random(spring.hira_sakura_box[b][3]-30, spring.hira_sakura_box[b][3]+30);
            spring.hira_sakura_box[b][5] = random(spring.hira_sakura_box[b][3]-30, spring.hira_sakura_box[b][3]+30);
     }
   }
 }
        
  if(sub_jud == 1200){
        sub_jud = 0;
  }
  sub_jud += 1;
  
  //sakura
  for(int k=0; k< spring.sakura_num; k++){
    fill(255, 167, spring.sakura_box[k][6], 80);
    
    triangle(spring.sakura_box[k][0],spring.sakura_box[k][3],spring.sakura_box[k][1],
    spring.sakura_box[k][4],spring.sakura_box[k][2],spring.sakura_box[k][5]);
    
  }
  
  //nanoha
  for(int k=0; k< spring.nanoha_num; k++){
    fill(spring.nanoha_box[k][6], 250, 75, 50);
    
    triangle(spring.nanoha_box[k][0],spring.nanoha_box[k][3],spring.nanoha_box[k][1],
    spring.nanoha_box[k][4],spring.nanoha_box[k][2],spring.nanoha_box[k][5]);
  }
  
  //maru
  for(int k=0; k< spring.maru_num; k++){
    fill(250, 250, spring.maru_box[k][3]);
    
    ellipse(spring.maru_box[k][0], spring.maru_box[k][1], spring.maru_box[k][2], spring.maru_box[k][2]);
  }
  
  //hira_sakura
  for(int k=0; k< spring.hira_sakura_num; k++){
    fill(255, 167, spring.hira_sakura_box[k][6], 80);
    
    triangle(spring.hira_sakura_box[k][0],spring.hira_sakura_box[k][3],spring.hira_sakura_box[k][1],
      spring.hira_sakura_box[k][4],spring.hira_sakura_box[k][2],spring.hira_sakura_box[k][5]);
  }
}  


class Spring{
  int sakura_num = 400;
  int nanoha_num = 500;
  int hira_sakura_num = 20;
  int maru_num = 80;
  float[][] sakura_box = new float[sakura_num][7];
  float[][] nanoha_box = new float[nanoha_num][7];
  float[][] hira_sakura_box = new float[hira_sakura_num][7];
  float[][] maru_box = new float[maru_num][4];
  
  
  
  
  void sakura(){
     
    for(int i=1; i<sakura_num; i++){  
      sakura_box[i][0] = random(width - width/2, width);
      sakura_box[i][1] = random(sakura_box[i][0]-70, sakura_box[i][0]+70);
      sakura_box[i][2] = random(sakura_box[i][0]-70, sakura_box[i][0]+70);
      
      sakura_box[i][3] = random(0, height/2);
      sakura_box[i][4] = random(sakura_box[i][3]-30, sakura_box[i][3]+30);
      sakura_box[i][5] = random(sakura_box[i][3]-30, sakura_box[i][3]+30);
      
      sakura_box[i][6] = random(200, 240);
    }
  }
  
  void hira_sakura(){
    for(int i=0; i < hira_sakura_num; i++){
      hira_sakura_box[i][0] = random(width-(width-10), width/3);
      hira_sakura_box[i][1] = random(hira_sakura_box[i][0]-50, hira_sakura_box[i][0]+50);
      hira_sakura_box[i][2] = random(hira_sakura_box[i][0]-50, hira_sakura_box[i][0]+50);
      
      hira_sakura_box[i][3] = random(0, height);
      hira_sakura_box[i][4] = random(hira_sakura_box[i][3]-30, hira_sakura_box[i][3]+30);
      hira_sakura_box[i][5] = random(hira_sakura_box[i][3]-30, hira_sakura_box[i][3]+30);
      hira_sakura_box[i][6] = random(230, 255);
    }
  }
  
  void nanoha(){
     
    for(int i=1; i<nanoha_num; i++){       
      nanoha_box[i][0] = random(0, width);
      nanoha_box[i][1] = random(nanoha_box[i][0]-70, nanoha_box[i][0]+70);
      nanoha_box[i][2] = random(nanoha_box[i][0]-70, nanoha_box[i][0]+70);
      
      nanoha_box[i][3] = random(height - (height/3), height);
      nanoha_box[i][4] = random(nanoha_box[i][3]-30, nanoha_box[i][3]+30);
      nanoha_box[i][5] = random(nanoha_box[i][3]-30, nanoha_box[i][3]+30);
      nanoha_box[i][6] = random(200, 240);
    }
  }
  
  void maru(){
    for(int i=1; i<maru_num; i++){
      maru_box[i][0] = random(0, width);
      maru_box[i][1] = random(height - (height/3), height-30);
      maru_box[i][2] = random(10, 30);
      maru_box[i][3] = random(0, 250);
      
    }
  }
  
 void branch(){
  stroke(133, 101, 41);
  
  strokeWeight(1);
  line(500, 200, 600, 250);
  line(530, 240, 600, 250);
  strokeWeight(2);
  line(600, 250, 700, 270);
  strokeWeight(3);
  line(700, 270, width, 300);
  
  strokeWeight(1);
  line(600, 100, 620, 150);
  line(560, 150, 620, 150);
  strokeWeight(2);
  line(620, 150, 700, 270);
  strokeWeight(3);
  line(700, 270, width, 300);
  
  strokeWeight(1);
  line(650, 70, 680, 120);
  line(580, 40, 680, 120);
  strokeWeight(2);
  line(680, 120, width, 100);
 }
    
}
