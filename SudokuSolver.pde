ArrayList<Cell[][]> boardList;
String[] dataset;
boolean click=false;
SolveMethods solve;
Cell[][] newsol;
void setup() {
  size(900, 900);
  frameRate(30);
  dataset = loadStrings("http://magictour.free.fr/top1465");
  boardList= new ArrayList<Cell[][]>();
  solve=new SolveMethods();
  //System.out.println(dataset[0]);
  for (int i = 0; i<1465; i++) {
    String[] str=dataset[i].split("");
    Cell[][] board= new Cell[9][9];
    for (int row=0; row<board.length; row++) {
      for (int col=0; col<board[row].length; col++) {
        if (str[row*9+col].equals(".")) {
          board[row][col]=new Cell(0);
        } else {
          board[row][col]=new Cell(parseInt(str[row*9+col]));
        }
      }
    }
    boardList.add(board);
  }
  newsol= boardList.get(0);
  /*for(int[] s: boardList.get(0)){
   for(int i: s){
   System.out.print(i);
   }
   System.out.println();
   }*/
}
void draw() {
  background(255);

  solve.display(newsol);

if (click&&mouseY<315) {
    click=false;
    newsol = boardList.get((int)random(0, boardList.size()));
  } else if (click&&mouseY<630&&mouseY>315) {
    click=false;
    solve.backtracker(newsol);
    solve.display(newsol);
  } else if (click&&mouseY>630) {
    click=false;
    for (int big=0; big<boardList.size(); big++) {

      Cell[][] sol = boardList.get(big);
      solve.display(sol);
      /*
  for (int row=0; row<sol.length; row++) {
       for (int col=0; col<sol[row].length; col++) {
       if (sol[row][col].getperm()==0) {
       for (int i=1; i<=9; i++) {
       sol[row][col].setposs(i, solve.checkBox(row, col, sol, i) && solve.checkLines(row, col, sol, i));
       }
       }
       }
       }*/
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /*for (int row=0; row<sol.length; row++) {
       for (int col=0; col<sol[row].length; col++) {
       int count=0;
       for ( boolean i : sol[row][col].getposs()) {
       if (i) {
       count++;
       }
       }
       if (count==1) {
       for (int i=0; i<9; i++) {
       if (sol[row][col].getposs()[i]) {
       sol[row][col].settemp(i+1);
       }
       }
       }
       }
       }*/
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //boardList.set(1463, sol);
      System.out.println("Start");
      for (Cell[] i : boardList.get(big)) {
        for (Cell j : i) {
          if (j.getperm()!=0) {
            System.out.print(j.getperm());
          } else {
            print(j.gettemp());
          }
        }
        System.out.println();
      }
      System.out.println();

      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      if (!solve.backtracker(sol)) {
        System.out.println("nop");
      }
      solve.display(sol);
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /*for (int num=9; num>=1; num--) {
       boolean breaker=true;
       if (breaker) {
       for (int row=0; row<sol.length; row++) {
       for (int col=0; col<sol[row].length; col++) {
       int x=solve.setCheck(row, col, sol, num);
       if (x>-1) {
       for (int i=(row/3)*3; i<(row/3)*3+3; i++) {
       for (int j=(col/3)*3; j<(col/3)*3+3; j++) {
       sol[i][j].setposs(x+1, false);
       }
       }
       }
       }
       }
       for (int row=0; row<sol.length; row++) {
       for (int col=0; col<sol[row].length; col++) {
       int count=0;
       for ( boolean i : sol[row][col].getposs()) {
       if (i) {
       count++;
       }
       }
       if (count==1 && solve.checkSurr(row,col,sol)) {
       for (int i=0; i<9; i++) {
       if (sol[row][col].getposs()[i] && solve.checkBox(row,col,sol,i+1) && solve.checkLines(row,col,sol,i+1)) {
       sol[row][col].setperm(i+1);
       System.out.println("kachow "+num);
       breaker=false;
       }
       }
       }
       }
       }
       }
       }*/
      ///////////////////////////////////////////////////////////////////////////////////////////////
      boardList.set(big, sol); 
      for (Cell[] i : boardList.get(big)) {
        for (Cell j : i) {
          if (j.getperm()!=0) {
            System.out.print(j.getperm());
          } else {
            print(j.gettemp());
          }
        }
        System.out.println();
      }
      System.out.println();
    }
  }
}
void mouseClicked() {
  click=true;
}