# -*- coding: utf-8 -*-

class Wall

  WALL_COLOR = Color.new(200, 200, 200)

  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
    @texture = Texture.new(CELL, CELL)
    @texture.fill(WALL_COLOR)
  end

  def render
    $screen.render(@texture, @x*CELL, @y*CELL)
  end

end
