# Project Title and purpose
# SudokuSolver
One Paragraph of project description goes here
This uses recursive backtracking to bruteforce solve 1465 hard sudoku problems. Commented out is an incorrect implementation of Crook's Algorithm to solve sudoku problems with preemptive sets. In short, the program now takes in the problems, makes a 2d array of sudoku cells, and uses backtracking recursively to sequentially guess what each value in the sudoku should be.
### Difficulties or opportunities you encountered along the way.

The toughest part was...
Implementing Crook's Algorithm, it ended up not working because of some mistakes along the way, but it did work in certain cases. It was the most difficult to accept that I needed to put that aside and work on something where I would get actual results.
### Most interesting piece of your code and explanation for what it does.

```Java
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
        if (backtracker(x)) {
          return true;
        }
        x[row][col].settemp(0);
      }
    }
    return false;
  }
```
This is the code for the backtracking method I use, which will return if there is a solution to the sudoku puzzle. In short, the findplace method finds the first place that doesn't have any value and returns an array of its row and column. It then cycles through each possible number 1-9 that the sudoku cell could be, crosses out the ones that would be immediately incorrect, and puts down a value for that. It then calls backtracker again to repeat the same thing with a new cell.
## Built With

* [Processing](https://processing.org/) - The IDE used

## Authors

**Ben Haisting** 

## Acknowledgments

* James Crook, I failed to implement his algorithm, but it helped me to better understand sudoku.
* Geeksforgeeks.org, provided help when I was researching how to do recursive backtracking.
* Dr. Thomas Reinartz, for encouraging throughout 2016, 2017, and 2018.
