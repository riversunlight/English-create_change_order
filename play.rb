class Play
  @@examples = []
  
  class << self
    def read
      puts "\e[H\e[2J"
      puts "テストするファイルを入力してください"

      file = 0
      while true
        file = gets.chomp
        break if File.exist?(file)
        puts "ファイルが存在しません。もう一度入力してください"
      end

      File.open(file, "r") do |f|
        while true
          en = f.gets.chomp
          break if en == "-1"
          ja = f.gets.chomp
          @@examples << Example_sentence.new(en, ja)
        end
      end
    end

    def do
      read

      cnt = 1
      while @@examples.size != 0
        num = 1
        @@examples.delete_if do |ex|
          s = ex.en.dup
          last = s[-1]
          s.chop!
          question = s.split
          question.shuffle!

          
          puts "\e[H\e[2J"
          puts "#{cnt}週目 #{num}問目"
          puts "並び変えてください(大文字小文字は判定に含みません)"
          puts
          puts ex.ja
          print "("
          question.each do |word|
            if word == 'I'
              print word
            else
              print word.downcase
            end
            print "/" if word != question[-1]
          end
          puts ")#{last}"

          answer = gets.chop
          num += 1
          if answer.downcase == ex.en.downcase
            puts "正解!"
            STDIN.raw(&:getc)
            true
          else
            puts "不正解"
            puts ex.en
            STDIN.raw(&:getc)
            false
          end
        end
        cnt += 1
      end

      $mode = :open
    end
  end
end