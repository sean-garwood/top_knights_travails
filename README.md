# top_knights_travails

Solution to <https://www.theodinproject.com/lessons/ruby-knights-travails>

## Assignment

Your task is to build a function knight_moves that shows the shortest possible
way to get from one square to another by outputting all squares the knight will
stop on along the way.

You can think of the board as having 2-dimensional coordinates. Your function
would therefore look like:

`knight_moves([0,0],[1,2]) == [[0,0],[1,2]]`

Sometimes there is more than one fastest path. Any answer is correct as long as
it follows the rules and gives the shortest possible path.

`knight_moves([0,0],[3,3]) == [[0,0],[2,1],[3,3]]`
or `knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]` ...

### Tips

Think about the rules of the board and knight, make sure to follow them. For
every square there is a number of possible moves, choose a data structure that
will allow you to work with them. Don’t allow any moves to go off the board.
Decide which search algorithm is best to use for this case. Hint: one of them
could be a potentially infinite series. Use the chosen search algorithm to find
the shortest path between the starting square (or node) and the ending square.
Output what that full path looks like, e.g.: `knight_moves([3,3],[4,3]) #=> You
made it in 3 moves!  Here's your path: [3,3] [4,5] [2,4] [4,3]`

### Notes

the Board can be thought of as a finite graph.
the set of possible moves are the complete set of edges in this graph
  since the graph is non-directional, and since the number of vertices is
  finite, it follows that there are a finite number of edges.

the chessboard can be further subdivided into equivalent halves or quadrants.
  Initally thought that I would want only to look at a given quadrant, but a
  knight on d4 has diff paths to the diff corners. 2 is shortest if same side,
  but it takes 4 to get to either opposite corner from a central square

one possible approach is to look to go to the square with the "heaviest
children" when given a choice.
  you always want to go in the 'general direction' of the target square,
  but sometimes you have multiple choices
one way to classify potential moves is to look first at the target side and
quadrant
remember, all you need is one function that outputs the correct answer.
  output of this fn is always [first move, ... in-between moves..., last move]

not all eights are equal
  c3 is "worse than" d4, meaning the total weight of its edges is less than
  that of d4's, even though they both have 8 edges that they are incident
  upon. Therefore, it will be easier to get to a random square from d4 than it
  will be for c3.
    interestingly, this isn't true for c4 and d3: they are mirror images of
    one another in terms of the sum of the weights of their destination
    squares.

THINGS I NEED
  some kind of struct to eval candidate moves
    candidate moves

classes
  moves
  board

figure out how to include gemfile, etc
