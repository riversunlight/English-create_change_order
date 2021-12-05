class Opening
  @@sel = 0
  @@next_scene = [:play, :data]
  class << self
    def show
      puts "\e[H\e[2J"
      puts "===並び替え==="
      print "   ", (@@sel == 0)? "◎ ": "  ", "解答\n"
      print "   ", (@@sel == 1)? "◎ ": "  ", "登録\n"
    end

    def operate
      if (key = STDIN.raw(&:getc))
        $mode = :quit if key == "\C-c"
        $mode = @@next_scene[@@sel] if key == "\r"

        case key.intern
        when :w
          @@sel -= 1
        when :s
          @@sel += 1
        end
        @@sel = (@@sel + 2) % 2
      end
    end

    def do
      show
      operate
    end
  end
end
