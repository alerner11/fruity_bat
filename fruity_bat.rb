# TODO: figure out how gemfiles work and get defstruct in there
# up to 18:11 here: https://www.youtube.com/watch?v=QtIlyU2Br3o

require 'gosu'

class GameWindow < Gosu::Window
def initialize(*args)
    super
    @images = {
        background: Gosu::Image.new(self, 'images/background.png', false),
        foreground: Gosu::Image.new(self, 'images/foreground.png', true)    
    }
    @state = {
        
    }
    @scroll_x = 0
end

    def button_down(button)
        close if button == Gosu::KbEscape
    end

    def update
        @scroll_x += 3
        if @scroll_x > @images[:foreground].width
            @scroll_x = 0
        end
    end

    def draw
        @images[:background].draw(0, 0, 0)
        @images[:foreground].draw(-@scroll_x, 0, 0)
        @images[:foreground].draw(-@scroll_x + @images[:foreground].width, 0, 0)
    end
end

window = GameWindow.new(320, 480, false)
window.show