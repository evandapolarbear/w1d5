class PolyTreeNode
  attr_accessor :parent, :children, :value

  def initialize(value,parent=nil)
    @value = value
    @parent = parent
    @chilren = []
  end

  def parent=(parent)
    @parent = parent
    parent.children << self
  end


end
