public class Cell{
  int perm;
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
  public void setposs(int x, boolean result){
    poss[x-1]=result;
  }
  public boolean[] getposs(){
   return poss; 
  }
}