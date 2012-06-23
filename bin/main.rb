# -*- coding: utf-8 -*-

require 'starruby'
include StarRuby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'extensions/starruby'
require 'gamescene'


# ステージ構成
# '#' が壁，S が初期位置，右に向かってスタート
WALL = '#'
START = 'S'
stage =
  [
   "####################",
   "#                  #",
   "# S                #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "#                  #",
   "####################"
  ]

# セルの1辺の大きさ
CELL = 16

StarTools::Scene.run(GameScene.new(stage),
                     fps: 60,
                     window_size: [stage[0].size * CELL, stage.size * CELL])
