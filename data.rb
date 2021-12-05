class Data
  @@cnt = 0
  class << self
    def do
      puts "\e[H\e[2J"
      puts "描き込みたいファイル名を入力してください"
      file = gets.chop

      File.open(file, "w") do |f|
        while true
          puts "\e[H\e[2J"
          @@cnt += 1
          puts "#{@@cnt}つ目"
          puts "例文を入力してください(空白区切り -1で終了)"
          en = gets.chomp
          f.puts(en)
          break if en == "-1"
          #puts "日本語を入力してください"
          #ja = gets.chomp
          #puts ja
          #f.puts(ja)
        end
      end

      @@cnt = 0
      $mode = :open
    end
  end
end