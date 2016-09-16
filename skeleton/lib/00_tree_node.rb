class PolyTreeNode
  attr_accessor :parent, :children, :value

  def initialize(value, parent=nil)
    @value = value
    @parent = parent
    @children = []
  end

  def parent=(parent)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent
    parent.children << self unless @parent.nil? 
  end

  def add_child(child)
    child.parent=self
  end

  def remove_child(child)
    raise "not a child" unless @children.include?(child)

    @children.delete(child)
    child.parent= nil
  end

  def dfs (target)
    return self if @value == target

    @children.each do |child|
      value = child.dfs(target)
      return value if value
    end
    nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      current = queue.shift
      return current if current.value == target
      current.children.each do |child|
        queue << child
      end
    end
    nil
  end


end
