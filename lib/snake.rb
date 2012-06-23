# -*- coding: utf-8 -*-

class Snake

  SNAKE_COLOR = Color.new(255, 255, 255)
  SNAKE_GAMEOVER_COLOR = Color.new(200, 200, 200)

  attr_reader :place

  def initialize(x, y)
    @place = [[x, y]]
    @texture = Texture.new(CELL, CELL)
    @texture.fill(SNAKE_COLOR)
    @pre_input = [0, 0]
  end

  def lengthen(input)
    next_move = nil
    if @pre_input.zip(input).map {|a, b| a + b} == [0, 0]
      # 反対方向への入力は無視
      next_move = @pre_input
    else
      next_move = input
      @pre_input = input
    end

    @place.unshift([@place[0][0] + next_move[0], @place[0][1] + next_move[1]])
  end

  def shorten
    @place.pop
  end

  def change_to_gameover_color
    @texture.fill(SNAKE_GAMEOVER_COLOR)
  end

  def render
    @place.each do |p|
      $screen.render(@texture, p[0]*CELL, p[1]*CELL)
    end
  end

end
