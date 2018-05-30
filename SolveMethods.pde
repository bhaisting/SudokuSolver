public class SolveMethods {
  public SolveMethods() {
  }
  public boolean checkBox(int row, int col, Cell[][] board, int num) {
    int x=(row/3)*3;
    int y=(col/3)*3;
    for (int i=x; i<x+3; i++) {
      for (int j=y; j<y+3; j++) {
        if ((i!=row || j!=col)&&(board[i][j].getperm()==num || board[i][j].gettemp()==num)) {
          return false;
        }
      }
    }
    return true;
  }
  public boolean checkLines(int row, int col, Cell[][] board, int num) {
    for (int i=0; i<9; i++) {
      if ((i!=col)&&(board[row][i].getperm()==num || board[row][i].gettemp()==num)) {
        return false;
      }
    }
    for (int i=0; i<9; i++) {
      if ((i!=row)&&(board[i][col].getperm()==num || board[i][col].gettemp()==num)) {
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
    if (num==-1) {
      return false;
    }
    int count=0;
    row=(row/3)*3;
    col=(col/3)*3;
    for (int i=row; i<row+3; i++) {
      for (int j=col; j<col+3; j++) {
        if (board[i][j].getposs()[num] && boolPeek(board[i][j].getposs())) {
          count++;
        }
      }
    }
    return count==1;
  }
  public boolean boolPeek(boolean[] i) {
    int count=0;
    for (boolean j : i) {
      if (j) {
        count++;
      }
    }
    return count==1;
  }
  public int[] findplace(Cell[][] sol) {
    for (int row=0; row<sol.length; row++) {
      for (int col=0; col<sol[row].length; col++) {
        if (sol[row][col].getperm()==0 && sol[row][col].gettemp()==0) {
          int[] i={row, col};
          return i;
        }
      }
    }
    return null;
  }
  public boolean backtracker(Cell[][] x) {
    int[] spot = findplace(x);
    if (spot==null) {
      return true;
    }
    int row=spot[0];
    int col=spot[1];
    for (int i=1; i<=9; i++) {
      if (checkBox(row, col, x, i)&&checkLines(row, col, x, i)) {
        x[row][col].settemp(i);
        /*for (Cell[] y : x) {
          for (Cell j : y) {
            if (j.getperm()!=0) {
              System.out.print(j.getperm());
            } else {
              print(j.gettemp());
            }
          }
          System.out.println();
        }
        System.out.println();*/
        if (backtracker(x)) {
          return true;
        }
        x[row][col].settemp(0);
      }
    }
    return false;
  }
  public void display(Cell[][] x) {
    background(255);
    for (int i=1; i<9; i++) {
      if (i%3==0) {
        strokeWeight(5);
      } else {
        strokeWeight(2);
      }
      line(i*70, 0, i*70, 630);
      line(0, i*70, 630, i*70);
    }

    for (int row=0; row<x.length; row++) {
      for (int col=0; col<x[row].length; col++) {
        fill(0);
        textSize(32);
        if (x[row][col].getperm()==0) {
          text(x[row][col].gettemp(), 70*row+28, 70*col+50);
        } else {
          text(x[row][col].getperm(), 70*row+28, 70*col+50);
        }
      }
    }
    line(0,630,900,630);
    textSize(42);
    text("Solve All (too processing heavy \nfor display, in console)",50,750);
    line(630,0,630,630);
    line(630,315,900,315);
    textSize(42);
    text("Show\nRandom\nSudoku",680,110);
    text("Solve \nthat\nSudoku",680,410);
  }
  public void startscreen(){
    strokeWeight(5);
    fill(255);
    
    
    fill(0);
    
    
    
  }
}