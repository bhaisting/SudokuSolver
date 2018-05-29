public class SolveMethods {
  public SolveMethods() {
  }
  public boolean checkBox(int row, int col, Cell[][] board, int num) {
    row=(row/3)*3;
    col=(col/3)*3;
    for (int i=row; i<row+3; i++) {
      for (int j=col; j<col+3; j++) {
        if (board[i][j].getperm()==num) {
          return false;
        }
      }
    }
    return true;
  }
  public boolean checkLines(int row, int col, Cell[][] board, int num) {
    for (int i=0; i<9; i++) {
      if (board[row][i].getperm()==num) {
        return false;
      }
    }
    for (int i=0; i<9; i++) {
      if (board[i][col].getperm()==num) {
        return false;
      }
    }
    return true;
  }
  public int setCheck(int row, int col, Cell[][] board, int num) {
    row=(row/3)*3;
    col=(col/3)*3;
    for (int x=0; x<9; x++) {
      int count=0;
      for (int i=row; i<row+3; i++) {
        for (int j=col; j<col+3; j++) {
          if (board[row][col].getposs()[x]) {
            count++;
          }
        }
      }
      if (count>=num) {
        return x;
      }
    }
    return -1;
  }

  public boolean checkSurr(int row, int col, Cell[][] board) {
    int num=-1;
    for (int i=0; i<9; i++) {
      if (board[row][col].getposs()[i]) {
        num=i;
      }
    }
    if(num==-1){
      return false;
    }
    int count=0;
    row=(row/3)*3;
    col=(col/3)*3;
    for (int i=row; i<row+3; i++) {
      for (int j=col; j<col+3; j++) {
        if(board[i][j].getposs()[num] && boolPeek(board[i][j].getposs())){
          count++;
        }
      }
    }
    return count==1;
  }
  public boolean boolPeek(boolean[] i){
    int count=0;
    for(boolean j:i){
      if(j){
      count++;
      }
    }
  return count==1;
}
}