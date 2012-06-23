# -*- coding: utf-8 -*-

require 'gamescene'

class GameOverScene < GameScene

  def init(arg)
    @snake, @walls, @food = *arg
  end

  def update
  end

  def render
    super
  end

end
