  PImage [] upgradeImages = new PImage[8];

class Upgrades{
  String[] types = {
   "drill",
   "boat"
  }; 
  String type = "";

  

  Upgrades(String type){
    this.type = type;

 
    if (type == ""){
    type = ""; 
    type = types[int(random(types.length ))];
  }
  

}
  
  void read(){
    
  }
  
  
}