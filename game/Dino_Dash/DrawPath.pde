 //<>//
             int random =0;
           String type = "path";
          IntList pathOptions;
          
  void DrawPath(){
    //println(y);
        //create random tiles
        for (int i = 0; i < test[0].length ; i++) {
        
        type = "path";
        random = int(random(images.length));
        if(random == 1){
            type = "solid";
        }
       
          Tiles fill = new Tiles(images[random], type);
          test[0][i] = fill;
      
        } 
        
        int corectX =  test[0].length - 1;

        //save old ghost positions
        for (int i = ghost.length-1; i > 0; i--) {
            for (int i2 = 0; i2 < ghost[i-1].length ; i2++) {
                ghost[i][i2] = ghost[i-1][i2];
            }
        
        } 

        //test tiles for path
      // println("-------");
          for (int i = 0; i < ghost[0].length ; i++) {
          
            if(test[corectX - i][i].type == "path" && ghost[1][i] == true ){

              ghost[0][i] = true;
              continue;  
              }
              ghost[0][i] = false;
          }
          
          boolean check = false;
          for (int i = 0; i < ghost[0].length ; i++) {
            if(ghost[0][i] == true){
              check = true;
              break;
            }
          }
         
          if(check == false){
             pathOptions = new IntList();
            for (int i = 0; i < ghost[0].length ; i++) {
               println(ghost[1][i] + " " + i );
             if(ghost[1][i] == true){
               
              pathOptions.append(i);
             }
             }
         
           Tiles fill = new Tiles(images[0], "path");
           int fixY = int(random(pathOptions.size()));
          ghost[0][fixY] = true;
           
          test[corectX - y][pathOptions.get(fixY) ] = fill;
         }
  }