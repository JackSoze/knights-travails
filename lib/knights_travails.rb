class Cell
  attr_accessor :x, :y, :dist, :previous_cell

  def initialize(x = 0, y = 0, dist = 0)
    @x = x
    @y = y
    @dist = dist
    @previous_cell = nil
  end

  # save each cell path as a node in
  #  in a linked list to show final
  #   cell path to target location
  def cell_path
    temp = @previous_cell
    list = []
    until temp.nil?
      list << [temp.x, temp.y]
      temp = temp.previous_cell
    end
    list.reverse.append([@x, @y])
  end
end

def is_inside?(x, y, n)
  return true if x >= 1 && x <= n && y >= 1 && y <= n

  false
end

def min_steps_to_target_pos(knight_pos, target_pos, n)
  # all possible movements for the knight
  dx = [2, 2, -2, -2, 1, 1, -1, -1]
  dy = [1, -1, 1, -1, 2, -2, 2, -2]

  queue = []

  # push the starting position of the knight
  queue.append(Cell.new(knight_pos[0], knight_pos[1], 0))

  # make all the nodes unvisited
  visited = Array.new(n + 1)

  for i in 0..n
    visited[i] = Array.new(n)
    for j in 0..n
      visited[i][j] = false
    end
  end

  visited[knight_pos[0]][knight_pos[1]] = true

  # loop until we have one node in queue
  while queue.length > 0
    t = queue.shift

    if t.x == target_pos[0] && t.y == target_pos[1]
      @target_pos_cell = t
      return t.dist
    end

    # loop for all reachable states,
    for i in 0..7
      x = t.x + dx[i]
      y = t.y + dy[i]

      next unless is_inside?(x, y, n) && !visited[x][y]

      visited[x][y] = true
      new_cell = Cell.new(x, y, t.dist + 1)
      new_cell.previous_cell = t
      queue.push(new_cell)

        end

  end
end

def shortest_path_to_target_pos
  @target_pos_cell.cell_path
end

def knight_moves(knight_pos, target_pos, n = 8)
  min_steps_to_target_pos(knight_pos, target_pos, n)
  pdra shortest_path_to_target_pos
end

# driver code
n = 6
knight_pos = [4, 5]
target_pos = [1, 1]
puts min_steps_to_target_pos(knight_pos, target_pos, n)
knight_moves(knight_pos, target_pos)
