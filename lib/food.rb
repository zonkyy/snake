# -*- coding: utf-8 -*-

class Food

  FOOD_COLOR = Color.new(0, 255, 255)

  attr_reader :x, :y

  def initialize(field_x, field_y)
    @x_limit, @y_limit = field_x, field_y
    @texture = Texture.new(CELL, CELL)
    @texture.fill(FOOD_COLOR)
  end

  def put_food
    @x = rand(@x_limit)
    @y = rand(@y_limit)
    [@x, @y]
  end

  def render
    $screen.render(@texture, @x*CELL, @y*CELL)
  end

end
