# -*- coding: utf-8 -*-
require 'starruby'

module StarTools

  # シーンを管理するモジュール
  module Scene
    class Exit
    end

    class Base
      attr_accessor :next_scene
      attr_reader :frame_counter

      def initialize(*arg)
        @next_scene = nil
        @frame_counter = 0
        init(arg)
      end

      def __update
        @frame_counter += 1
        update
      end
      private :__update

      def init(*arg)
      end

      def quit
      end

      def update
      end

      def render
      end
    end

    # window_size も options 内で設定
    # 例: Scene.run(MyScene, fps: 60, window_size: [640, 480])
    def self.run(scene, options = {})
      window_size = (options[:window_size]) ? options[:window_size] : [320, 240]
      step = 1

      StarRuby::Game.run(*window_size, options) do |game|
        $keys = Input.keys(:keyboard)
        break if $keys.include?(:escape)

        $screen = game.screen
        $screen.clear

        step.times do
          break if scene.next_scene
          scene.__send__ :__update
        end

        scene.render

        if scene.next_scene
          scene.quit
          break if Exit == scene.next_scene
          scene = scene.next_scene
        end
      end
    end
  end
end
