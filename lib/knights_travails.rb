class Cell
  def initialize(x = 0, y = 0, dist = 0)
    @x = x
    @y = y
    @dist = dist
  end
end

def min_steps_to_target_pos(knight_pos, target_pos, N)

  #all possible movements for the knight
  dx = [2, 2, -2, -2, 1, 1, -1, -1]
  dy = [1, -1, 1, -1, 2, -2, 2, -2]

  queue = []

  #push the starting position of the knight
  #the distance should be 0
  queue.append(cell(knight_pos[0], knight_pos[1], 0))

  #mark all the nodes unvisited
  visit = Array.new(N)

  for i in 0..(N-1)
    visit[i] = Array.new(N)
    for j in 0..(N-1)
      visit[i][j] = false
    end
  end

  
end