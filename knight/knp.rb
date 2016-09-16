require 'byebug'
class KnightPathFinder
  DIRECTIONS = [[2,1], [2,-1], [-2, 1], [-2, -1],
                [1,2], [1, -2], [-1, 2], [-1,-2]]

  def initialize(pos)

    @position = pos
  end

  def find_path(target)
    # return pos if pos == target
    queue = [@position]
    path = {}
 # byebug
    visited_places = [@position]

    until queue.empty?
      current = queue.shift

      DIRECTIONS.each do |dir|
        child = [dir[0] + current[0], dir[1] + current[1]]
        unless child[0] < 0 || child[1] < 0 || child[0] > 7 || child[1] > 7 || visited_places.include?(child)
          path[child] = current
          return unpack_path(path, target) if child == target

          queue << child #unless path.include?(child)
          visited_places << child
        end
      end
    end

    nil
  end

  def unpack_path(path, target)

    # byebug
    result = [target]
    current = target

    until path[current] == @position
      result << path[current]
      current = path[current]
    end

    return result + [@position]
  end
end

k = KnightPathFinder.new([0,0])
p k.find_path([7,6])
