void backcolor(){
    int back = height/2;
    for(int n = 0; n <= height/2; n += 2){
      fill(map(back, 0, height/2, 220, 255), 255, 230, 80);
      rect(0, n, width, n+2); 
      
      back -= 2;
    }
  }
