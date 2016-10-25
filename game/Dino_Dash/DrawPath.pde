int random =0;
String type = "path";
String upgrade = "";
IntList pathOptions;

void DrawPath() {

  //create random tiles
  for (int i = 0; i < test[0].length; i++) {

    type = "path";
    upgrade = "";
    random = int(random(images.length));
    if (random == 7 ) {
      type = "solid";
    }else{
      if(random(100) >99){
       upgrade = "drill";
      }
    }

    Tiles fill = new Tiles(images[random], type);
    test[0][i] = fill;
  } 

  int corectX =  test[0].length - 1;

  //save old ghost positions

  for (int i = ghost[0].length -1; i >= 0; i--) {

    ghost[1][i] = ghost[0][i];
  } 

  //test tiles for path
  //kill ghost that are not on path or dit not exist
  for (int i = 0; i < ghost[0].length; i++) {

    if (test[corectX - i][i].type == "path" && ghost[0][i] == true ) {

      ghost[0][i] = true;
    } else {
      ghost[0][i] = false;
    }
  }
  //test for living ghosts
  boolean check = false;
  for (int i = 0; i < ghost[0].length; i++) {
    if (ghost[0][i] == true) {
      check = true;
      break;
    }
  }
  //if there are no living ghost
  //add all old living ghost to possible path positions
  if (check == false) {

    pathOptions = new IntList();
    for (int i = 0; i < ghost[1].length; i++) {

      if (ghost[1][i] == true) {

        pathOptions.append(i);
      }
    }

    Tiles fill = new Tiles(images[0], "path");
    int fixY = int(random(pathOptions.size()));
    ghost[0][pathOptions.get(fixY)] = true;

    test[corectX - pathOptions.get(fixY)][pathOptions.get(fixY) ] = fill;
  }
  //move current ghost to old
  for (int i = ghost[0].length -1; i >= 0; i--) {
    ghost[1][i] = ghost[0][i];
  } 
  //if pos next to ghost is free add ghost
  for (int i = 0; i < ghost[1].length; i++) {
    if (ghost[1][i] == true) {

      if (i+1 < ghost[0].length  && test[(corectX - i )- 1][i + 1].type == "path" && test[(corectX - i )][i + 1].type == "path") {
        ghost[0][i + 1] = true;
      }
      if (i-1 >= 0 && (corectX - i) + 1 >=0 && test[corectX - i + 1][i - 1].type == "path"&& test[corectX - i + 2][i - 1].type == "path") {
        ghost[0][i-1] = true;
      }
    }
  }

}
  // werkt nog niet, checkt meer plaatsen
  boolean checkPath(int posY, int checklenght, String type){
    int corectX =  test[0].length - 1;
    for(int i =0; i < checklenght; i++){
        if(test[(corectX - posY + i)- 1][posY + 1].type != type){
          return false;
        }
    }
    
    return true;
  }
