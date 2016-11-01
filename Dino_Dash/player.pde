class Player {
  boolean[] keyarr = new boolean[2];
  int y = 0;
  void update(){
    
   
  }
  
  void drill(){
    
  }
  
  boolean action(int Px,int Py){
//println(tileOn[y+1].type);
    //println(tileOn[y-1].type);
     if(keyarr[0] == true){
      keyarr[0] = false;
      if( Py+1 < test[0].length && test[Px-1][Py +1].type != "solid")y++; 
    }
    if(keyarr[1] == true){
      keyarr[1] = false;
      if(Py -1 >=0 && test[Px+1][Py -1].type != "solid")y--; 
    }
    
   
    
   if(test[Px-1][Py].type != "solid")return true;
   else return false;
//return true;  
}
}