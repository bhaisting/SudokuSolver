public class Cell{
  int perm;
  int temp=0;
  boolean[] poss;
  public Cell(int x){
    poss=new boolean[9];
    for(int i=0; i<poss.length; i++){
      poss[i]=false;
    }
    if(x>0){
      perm=x;
    }else{
      perm=0;
    }
  }
  public void setperm(int x){
    perm=x;
  }
  public int getperm(){
   return perm; 
  }
  public void settemp(int x){
    temp=x;
  }
  public void resettemp(){
    temp=0;
  }
  public int gettemp(){
    return temp;
  }
  public void setposs(int x, boolean result){
    poss[x-1]=result;
  }
  public boolean[] getposs(){
   return poss; 
  }
}