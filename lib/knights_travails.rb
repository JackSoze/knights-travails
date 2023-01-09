class Cell
  attr_accessor :x, :y, :dist

  def initialize(x = 0, y = 0, dist = 0)
    @x = x 
    @y = y 
    @dist = dist
  end
end

def is_inside?(x, y, n)
  return true if x > 1 && x <= n && y > 1 && y <= n

  false
end

def min_steps_to_target_pos(knight_pos, target_pos, n)
  # all possible movements for the knight
  dx = [2, 2, -2, -2, 1, 1, -1, -1]
  dy = [1, -1, 1, -1, 2, -2, 2, -2]

  queue = []

  # push the starting position of the knight
  # the distance should be 0
  queue.append(Cell.new(knight_pos[0], knight_pos[1], 0))

  # make all the nodes unvisited
  visited = Array.new(n + 1)

  for i in 0..(n)
    visited[i] = Array.new(n)
    for j in 0..(n)
      visited[i][j] = false
    end
  end
  

  # visit the starting state
  visited[knight_pos[0]][knight_pos[1]] = true

  # loop until we have one node in queue
  while queue.length > 0
    t = queue.shift

    # if current node == target node
    # return its distance
    return t.dist if t.x == target_pos[0] && t.y == target_pos[1]

    # loop for all reachable states, 
    # reachable states are 8 in number
    
    for i in 0..7
      x = t.x + dx[i]
      y = t.y + dy[i]
      
      if (is_inside?(x, y, n) && !visited[x][y])
        visited[x][y] = true
        queue.push(Cell.new(x, y, t.dist + 1)) 
      end
    end
  end
end

n = 30
knight_pos = [1, 1]
target_pos = [30, 30]
puts min_steps_to_target_pos(knight_pos, target_pos, n)
