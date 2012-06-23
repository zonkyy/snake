# -*- coding: utf-8 -*-

require 'scene'
require 'snake'
require 'wall'
require 'food'

class GameScene < StarTools::Scene::Base

  DEFAULT_UPDATE_FRAME = 30

  def init(arg)
    stage = arg[0]
    x = stage.find{|s| s.index(START)}.index(START)
    y = stage.index {|s| s.index(START)}
    @snake = Snake.new(x, y)
    @walls = create_walls_ary(stage)
    @food = Food.new(stage[0].length, stage.length)
    @update_frame = DEFAULT_UPDATE_FRAME
    @input = [1, 0]

    put_food
  end

  def update
    @input = [1, 0] if $keys.include?(:right)
    @input = [-1, 0] if $keys.include?(:left)
    @input = [0, -1] if $keys.include?(:up)
    @input = [0, 1]if $keys.include?(:down)

    if @frame_counter % @update_frame == 0
      @snake.lengthen(@input)

      # ゲームオーバーチェック
      @walls.each do |w|
        if [w.x, w.y] == @snake.place[0]
          require 'gameoverscene'
          @next_scene = GameOverScene.new(@snake, @walls, @food)
          @snake.change_to_gameover_color
          return
        end
      end

      if [@food.x, @food.y] == @snake.place[0]
        put_food
        speed_up
      else
        @snake.shorten
      end
    end
  end

  def render
    @snake.render
    @walls.each do |wall|
      wall.render
    end
    @food.render
  end


  private

  def create_walls_ary(stage)
    walls = []
    stage.each_with_index do |s, r|
      s.enum_for(:each_byte).each_with_index do |cell, c|
        if stage[r][c] == WALL
          walls << Wall.new(c, r)
        end
      end
    end
    walls
  end

  def put_food
    found = false
    until found
      found = true
      food_place = @food.put_food
      @walls.each do |w|
        found = false if food_place == [w.x, w.y]
      end
      @snake.place.each do |p|
        found = false if food_place == p
      end
    end
  end

  def speed_up
    if @update_frame > 1
      @update_frame -= 1
      @frame_counter = 0
    end
  end

end
